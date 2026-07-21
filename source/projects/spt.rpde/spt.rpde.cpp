#include "c74_min.h"
#include <vector>
#include <atomic>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <cmath>
#include <algorithm>

#define DEFAULT_SIZE 5000

using namespace c74::min;

class rpde : public object<rpde>, public vector_operator<> {
public:
    MIN_DESCRIPTION { "Recurrence period density entropy" };
    MIN_TAGS { "analysis, nonlinear" };
    MIN_AUTHOR { "Max Worgan" };
    MIN_RELATED { "spt.rqa"};

    // Signal inlet and outlet.
    inlet<>  input  { this, "(signal) input" };
    outlet<> output { this, "(signal) RPDE output", "signal" };
    outlet<> period_out { this, "(signal) mode of recurrence periods (samples)", "signal" };
    outlet<> diag_out { this, "(signal) status: 0=ok, 1=norm_fail, 2=no_recurrence, 3=invalid_params", "signal" };

    // window_size is fixed once the object is created; we expose it read-only.
    attribute<int> window_size_attr { this, "window_size", 5000,
        description { "Fixed analysis window size (samples)" },
        readonly { true }
    };

    // The following attributes are modifiable at runtime.
    attribute<int> hop_size { this, "hop_size", 2500,
        description { "Hop size (samples) for overlapping windows. If > 0, overlap is retained." }
    };

    attribute<int, threadsafe::no,limit::clamp> dim { this, "dim", 3,
        range{ 1, 20 },
        description { "Embedding dimension" }
    };

    attribute<int, threadsafe::no, limit::clamp> tau { this, "tau", 16,
        range { 1, 200 },
        description { "Time delay for embedding. Rule of thumb: period/4" }
    };

    attribute<number, threadsafe::no, limit::clamp> epsilon { this, "epsilon", 0.1,
        range { 0.0001, 1.0 },
        description { "Recurrence ball radius (0.08-0.12 works well for normalized data)" }
    };

    attribute<int> tmax { this, "tmax", 200,
        description { "Maximum lag for recurrence search. Rule of thumb: period*3. Critical for good separation." }
    };

    attribute<number, threadsafe::no, limit::clamp> subsample_factor { this, "subsample_factor", 5,
        range{ 1, 100 },
        description { "Subsampling rate" },
    };

    attribute<int> theiler { this, "theiler", 0,
        description { "Theiler window (Δmin) in samples: ignore recurrences with lag ≤ Δmin. "
                      "If 0, a sensible default is used internally (dim*tau)." }
    };

    attribute<bool> verbose { this, "verbose", false,
        description { "When enabled, prints diagnostic info to Max console" }
    };

    rpde(const atoms& args = {}) {
        if (!args.empty())
            fixed_window_size = static_cast<int>(args[0]);
        else
            fixed_window_size = DEFAULT_SIZE;

        if (fixed_window_size <= 0) {
            error("window_size must be positive; defaulting to DEFAULT_SIZE");
            fixed_window_size = DEFAULT_SIZE;
        }
        // Update the read-only attribute so that the inspector shows the actual value.
        window_size_attr = fixed_window_size;

        // Allocate the ring buffer once; capacity is fixed for the object's life.
        ring_buffer.assign(static_cast<size_t>(fixed_window_size), 0.0f);
        ring_head = 0;
        ring_available = 0;

        // Double-buffering: two processing buffers
        processing_buffer_a.resize(fixed_window_size, 0.0f);
        processing_buffer_b.resize(fixed_window_size, 0.0f);
        active_buffer.store(0);  // Start with buffer A active for writing

        current_rpde.store(0.0f);
        current_period.store(0.0f);
        worker_busy.store(false);
        new_window_ready.store(false);
        stop_worker.store(false);

        // Worker thread go
        worker_thread = std::thread(&rpde::worker_loop, this);
    }

    ~rpde() {
        stop_worker.store(true);
        worker_cv.notify_one();
        if (worker_thread.joinable())
            worker_thread.join();
    }

    // DSP perform method.
    void operator()(audio_bundle input_bundle, audio_bundle output_bundle) {
        auto in = input_bundle.samples(0);
        auto out = output_bundle.samples(0);
        auto p_out = output_bundle.samples(1);
        size_t n = output_bundle.frame_count();

        int subsamp = static_cast<int>(subsample_factor);
        if (subsamp < 1) subsamp = 1;  // Safety check

        // Append the incoming (subsampled) samples into the ring buffer.
        // O(1) per sample: overwrite the oldest slot, never allocate or shift.
        const size_t cap = ring_buffer.size();  // == fixed_window_size, fixed for the object's life
        for (size_t i = 0; i < n; i++) {
            counter++;
            if (counter % subsamp == 0) {
                ring_buffer[ring_head] = static_cast<float>(in[i]);
                if (++ring_head == cap) ring_head = 0;
                if (ring_available < static_cast<int>(cap)) ring_available++;
            }
        }

        // When a full window has accumulated and the worker is idle…
        if (ring_available >= fixed_window_size &&
            !worker_busy.load(std::memory_order_acquire))
        {
            // The ring is full, so ring_head points at the oldest sample. Copy the
            // window oldest→newest into the inactive buffer as two contiguous spans.
            int active = active_buffer.load(std::memory_order_acquire);
            std::vector<float>& target_buffer = (active == 0) ? processing_buffer_b : processing_buffer_a;
            std::copy(ring_buffer.begin() + ring_head, ring_buffer.end(), target_buffer.begin());
            std::copy(ring_buffer.begin(), ring_buffer.begin() + ring_head,
                      target_buffer.begin() + (cap - ring_head));

            // Mark worker busy and signal new window ready.
            worker_busy.store(true, std::memory_order_release);
            new_window_ready.store(true, std::memory_order_release);
            worker_cv.notify_one();

            // Advance the window by hop_size samples, retaining overlap = window_size - hop_size.
            // The ring already holds the freshest window; we only adjust how many more
            // fresh samples are required before the next window fires.
            int hs = static_cast<int>(hop_size);
            if (hs > 0 && hs < fixed_window_size)
                ring_available = fixed_window_size - hs;  // retain overlap
            else
                ring_available = 0;  // no overlap or invalid hop_size: start fresh
        }

        // Fill the output block with the current RPDE value.
        float rpde_val = current_rpde.load(std::memory_order_acquire);
        float period_out_val = current_period.load(std::memory_order_acquire);
        float diag_val = current_diag.load(std::memory_order_acquire);
        auto d_out = output_bundle.samples(2);
        for (size_t i = 0; i < n; i++) {
            out[i] = rpde_val;
            p_out[i] = period_out_val;
            d_out[i] = diag_val;
        }
    }

private:
    // Fixed analysis window size (set at object creation; not modifiable thereafter).
    int fixed_window_size;

    size_t counter = 0;

    // Fixed-capacity ring buffer holding the most recent window_size incoming
    // samples. Allocated once at construction (capacity == fixed_window_size),
    // so the audio thread never reallocates or shifts memory.
    std::vector<float> ring_buffer;
    size_t ring_head = 0;    // index of the next write slot; when full, also the oldest sample
    int    ring_available = 0;  // logical unconsumed sample count, clamped to [0, fixed_window_size]

    // Double-buffered processing buffers
    std::vector<float> processing_buffer_a;
    std::vector<float> processing_buffer_b;
    std::atomic<int> active_buffer;  // Which buffer the worker is currently using

    // The most recently computed RPDE value.
    std::atomic<float> current_rpde {0.0f};
    // The most recently computed RPDE mode value
    std::atomic<float> current_period {0.0f};
    // Diagnostic status: 0=ok, 1=normalization_failed, 2=no_recurrences_found, 3=invalid_params
    std::atomic<float> current_diag {0.0f};
    // Total recurrence count from last computation
    std::atomic<int> current_recurrence_count {0};

    // Worker thread control flags.
    std::atomic<bool> worker_busy;        // True while the worker is processing a window.
    std::atomic<bool> new_window_ready;   // True when a new window is available.
    std::atomic<bool> stop_worker;        // True when the object is being destroyed.
    std::mutex worker_mutex;
    std::condition_variable worker_cv;
    std::thread worker_thread;

    // Deferred verbose logging. The worker thread must not call cout (Max console
    // output is only safe on the main thread). It stashes a snapshot of the last
    // computation here and asks the main thread to print it via diag_queue.set()
    // (qelem_set is thread-safe).
    struct DiagSnapshot {
        int N{0}, dim{0}, tau{0}, tmax{0};
        float epsilon{0.0f};
        int total_recurrences{0}, nonzero_bins{0}, num_bins{0};
        float raw_entropy{0.0f}, max_entropy{0.0f}, rpde{0.0f}, period{0.0f};
    };
    std::mutex diag_mutex;
    DiagSnapshot diag_snapshot;
    bool diag_pending{false};

    queue<> diag_queue { this, MIN_FUNCTION {
        DiagSnapshot s;
        {
            std::lock_guard<std::mutex> lk(diag_mutex);
            if (!diag_pending)
                return {};
            diag_pending = false;
            s = diag_snapshot;
        }
        cout << "spt.rpde: N=" << s.N
             << " dim=" << s.dim
             << " tau=" << s.tau
             << " tmax=" << s.tmax
             << " eps=" << s.epsilon
             << " recurrences=" << s.total_recurrences
             << " bins=" << s.nonzero_bins << "/" << s.num_bins
             << " H=" << s.raw_entropy << "/" << s.max_entropy
             << " RPDE=" << s.rpde
             << " T=" << s.period << endl;
        return {};
    }};

    // The worker thread loop waits until new_window_ready is true, then processes
    // the samples in the inactive processing_buffer.
    void worker_loop() {
        while (!stop_worker.load(std::memory_order_acquire)) {
            std::unique_lock<std::mutex> lock(worker_mutex);
            worker_cv.wait(lock, [this]() {
                return new_window_ready.load(std::memory_order_acquire) ||
                       stop_worker.load(std::memory_order_acquire);
            });
            if (stop_worker.load(std::memory_order_acquire))
                break;

            // Reset the flag and swap buffers
            new_window_ready.store(false, std::memory_order_release);
            int active = active_buffer.load(std::memory_order_acquire);
            int new_active = (active == 0) ? 1 : 0;
            active_buffer.store(new_active, std::memory_order_release);
            lock.unlock();

            // Work on the now-active buffer (which was just written by audio thread)
            std::vector<float>& working_buffer = (new_active == 0) ? processing_buffer_a : processing_buffer_b;

            
            // Normalize to [-1, 1]
            bool norm_ok = normalizeMinMax(working_buffer);
            if (!norm_ok) {
                // Normalization failed (constant input)
                current_rpde.store(0.0f, std::memory_order_release);
                current_period.store(0.0f, std::memory_order_release);
                current_diag.store(1.0f, std::memory_order_release);  // 1 = norm failed
                worker_busy.store(false, std::memory_order_release);
                continue;
            }

            // Get current parameters
            int current_dim = dim;
            int current_tau = tau;
            int current_tmax = tmax;
            float current_epsilon = static_cast<float>(epsilon.get());

            // Validate parameters
            int embedding_span = (current_dim - 1) * current_tau;
            if (embedding_span >= fixed_window_size) {
                // Invalid parameters - skip this window
                current_diag.store(3.0f, std::memory_order_release);  // 3 = invalid params
                worker_busy.store(false, std::memory_order_release);
                continue;
            }

            // Compute RPDE
            RpdeResult result = compute_rpde(
                working_buffer.data(),
                fixed_window_size,
                current_dim,
                current_tau,
                current_epsilon,
                current_tmax,
                theiler
            );

            // Verbose logging if enabled. Stash a snapshot and defer the actual
            // console print to the main thread (never call cout from here).
            if (verbose) {
                int num_bins = result.dmax_used - result.dmin_used;
                float max_entropy = (num_bins > 0) ? std::log(static_cast<float>(num_bins)) : 0.0f;
                {
                    std::lock_guard<std::mutex> lk(diag_mutex);
                    diag_snapshot = DiagSnapshot{
                        result.N, current_dim, current_tau, current_tmax,
                        current_epsilon, result.total_recurrences,
                        result.nonzero_bins, num_bins,
                        result.raw_entropy, max_entropy, result.rpde, result.period
                    };
                    diag_pending = true;
                }
                diag_queue.set();
            }

            // Set diagnostic based on result
            if (result.total_recurrences == 0) {
                current_diag.store(2.0f, std::memory_order_release);  // 2 = no recurrences
            } else {
                current_diag.store(0.0f, std::memory_order_release);  // 0 = ok
            }

            current_rpde.store(result.rpde, std::memory_order_release);
            current_period.store(result.period, std::memory_order_release);
            current_recurrence_count.store(result.total_recurrences, std::memory_order_release);

            // Mark the worker as idle.
            worker_busy.store(false, std::memory_order_release);
        }
    }

    // Returns true on success, false if normalization failed (constant input)
    bool normalizeMinMax(std::vector<float>& v) {
        if (v.empty()) return false;

        // Find min and max elements
        auto mm = std::minmax_element(v.begin(), v.end());
        float minV = *mm.first;
        float maxV = *mm.second;
        float range = maxV - minV;

        // Avoid division by zero (constant vector)
        if (range <= std::numeric_limits<float>::epsilon())
            return false;

        // Map [minV, maxV] → [–1, +1]
        std::transform(
            v.begin(), v.end(), v.begin(),
            [minV, range](float x) {
                return ((x - minV) / range) * 2.0f - 1.0f;
            }
        );
        return true;
    }

    struct RpdeResult {
        float rpde;
        float period;
        int total_recurrences;
        int N;           // number of embedded vectors
        int dmin_used;   // actual theiler window used
        int dmax_used;   // actual max lag used
        int nonzero_bins; // number of histogram bins with recurrences
        float raw_entropy; // H before normalization
    };

    static RpdeResult compute_rpde(const float* window_data,
                              int ws,          // window size (samples)
                              int dim,         // embedding dimension
                              int tau,         // time delay
                              float epsilon,   // recurrence radius (on normalized data)
                              int tmax,        // max lag (samples), -1 means no explicit cap
                              int theiler)     // Theiler window Δmin (samples)
    {
        // Number of valid embedded vectors y_i = [x_i, x_{i+tau}, ...]
        const int N = ws - (dim - 1) * tau;
        if (N <= 0)
            return {0.0f, 0.0f, 0, N, 0, 0, 0, 0.0f};

        // --- Choose Δmin ---
        // If user didn't set a value, pick a sensible default:
        // use dim*tau (common rule of thumb), but at least 1.
        int dmin = theiler > 0 ? theiler : dim * tau;
        if (dmin < 1)
            dmin = 1;

        // Effective Δmax (cap the search); cannot be less than dmin+1
        int dmax = (tmax > 0) ? std::min(tmax, N - 1) : (N - 1);
        if (dmax <= dmin)
            return {0.0f, 0.0f, 0, N, dmin, dmax, 0, 0.0f};

        std::vector<int> histogram(dmax + 1, 0);
        if (epsilon <= std::numeric_limits<float>::epsilon())
            return {0.0f, 0.0f, 0, N, dmin, dmax, 0, 0.0f};
        const float eps2 = epsilon * epsilon;

        // Standard RPDE: For each embedded vector index i, track ALL exits and returns
        // (not just the first). This counts every recurrence period.
        constexpr int kMaxDim = 20;  // matches the dim attribute's upper clamp
        float yi[kMaxDim];
        for (int i = 0; i < N; ++i) {
            // Start j at i + dmin (we require j - i > dmin for returns)
            int jstart = i + dmin;
            if (jstart >= N)
                continue;

            // Hoist the reference vector y_i: the inner scan otherwise re-reads
            // its strided components from the window on every j.
            for (int k = 0; k < dim; ++k)
                yi[k] = window_data[i + k * tau];

            // Track state: are we currently inside or outside the epsilon-ball?
            // We need to determine initial state at jstart
            float init_dist2 = 0.0f;
            for (int k = 0; k < dim; ++k) {
                float diff = yi[k] - window_data[jstart + k * tau];
                init_dist2 += diff * diff;
            }
            bool inside = (init_dist2 < eps2);
            bool has_exited = !inside;  // If we start outside, we've already "exited"

            // Scan forward looking for exits and returns
            const int jend = std::min(N, i + dmax + 1);  // hoist the lag>dmax break
            for (int j = jstart + 1; j < jend; ++j) {
                float dist2 = 0.0f;
                for (int k = 0; k < dim; ++k) {
                    float diff = yi[k] - window_data[j + k * tau];
                    dist2 += diff * diff;
                }

                bool now_inside = (dist2 < eps2);

                if (inside && !now_inside) {
                    // Transition: inside -> outside (exit)
                    has_exited = true;
                }
                else if (!inside && now_inside && has_exited) {
                    // Transition: outside -> inside (return) after having exited
                    // Record this recurrence period. j < jend caps lag at dmax;
                    // j > jstart guarantees lag > dmin.
                    histogram[j - i] += 1;
                    // Reset has_exited - need a fresh exit before counting next return
                    has_exited = false;
                }

                inside = now_inside;
            }
        }

        // Mode: lag with max count, and count non-zero bins
        int mode_index = -1, max_count = 0, nonzero_bins = 0;
        for (int i = dmin + 1; i <= dmax; ++i) {
            if (histogram[i] > 0) {
                nonzero_bins++;
                if (histogram[i] > max_count) {
                    max_count = histogram[i];
                    mode_index = i;
                }
            }
        }
        float T_est = (mode_index > 0) ? static_cast<float>(mode_index) : 0.0f;

        // Build entropy over bins strictly greater than dmin
        int total = 0;
        for (int lag = dmin + 1; lag <= dmax; ++lag)
            total += histogram[lag];

        if (total == 0)
            return {0.0f, 0.0f, 0, N, dmin, dmax, 0, 0.0f};

        double H = 0.0;
        for (int lag = dmin + 1; lag <= dmax; ++lag) {
            if (histogram[lag] == 0) continue;
            double p = static_cast<double>(histogram[lag]) / static_cast<double>(total);
            H -= p * std::log(p);
        }

        // Normalize by log(number_of_considered_bins)
        const int considered = (dmax - (dmin + 1) + 1); // inclusive range
        if (considered <= 1)
            return {0.0f, 0.0f, total, N, dmin, dmax, nonzero_bins, static_cast<float>(H)};

        const double rpde_value = H / std::log(static_cast<double>(considered));
        return {static_cast<float>(rpde_value), T_est, total, N, dmin, dmax, nonzero_bins, static_cast<float>(H)};
    }
};

MIN_EXTERNAL(rpde);
