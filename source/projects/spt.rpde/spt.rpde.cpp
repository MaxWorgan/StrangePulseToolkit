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
    outlet<> period_out { this, "(signal) estimated period (samples)", "signal" };

    // window_size is fixed once the object is created; we expose it read-only.
    attribute<int> window_size_attr { this, "window_size", 5000,
        description { "Fixed analysis window size (samples)" },
        readonly { true }
    };

    // The following attributes are modifiable at runtime.
    attribute<int> hop_size { this, "hop_size", 2500,
        description { "Hop size (samples) for overlapping windows. If > 0, overlap is retained." }
    };

    attribute<int> dim { this, "dim", 3,
        description { "Embedding dimension" },
        setter { MIN_FUNCTION {
            int val = args[0];
            if (val < 1) val = 1;
            if (val > 20) val = 20;  // Reasonable upper limit
            return { val };
        }}
    };

    attribute<int> tau { this, "tau", 5,
        description { "Time delay for embedding" },
        setter { MIN_FUNCTION {
            int val = args[0];
            if (val < 1) val = 1;
            return { val };
        }}
    };

    attribute<number> epsilon { this, "epsilon", 0.001,
        description { "Recurrence ball radius (input should be normalized to [-1,1])" },
        setter { MIN_FUNCTION {
            double val = args[0];
            if (val < 0.0001) val = 0.0001;  // Minimum sensible value
            if (val > 1.0) val = 1.0;        // Maximum for normalized data
            return { val };
        }}
    };

    attribute<int> tmax { this, "tmax", -1,
        description { "Maximum return distance (-1 for no limit)" }
    };

    attribute<number> subsample_factor { this, "subsample_factor", 5,
        description { "Subsampling rate" },
        setter { MIN_FUNCTION {
            double val = args[0];
            if (val < 1.0) val = 1.0;  // Prevent division by zero
            return { val };
        }}
    };

    attribute<int> theiler { this, "theiler", 0,
        description { "Theiler window (Δmin) in samples: ignore recurrences with lag ≤ Δmin. "
                      "If 0, a sensible default is used internally (dim*tau)." }
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

        accum_buffer.reserve(fixed_window_size * 2);

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

        // Append the incoming samples.
        for (size_t i = 0; i < n; i++) {
            counter++;
            if (counter % subsamp == 0) {
                accum_buffer.push_back(static_cast<float>(in[i]));
            }
        }

        // When enough samples have been accumulated and the worker is idle…
        if (accum_buffer.size() >= static_cast<size_t>(fixed_window_size) &&
            !worker_busy.load(std::memory_order_acquire))
        {
            // Use the most recent fixed_window_size samples.
            auto start = (accum_buffer.size() > static_cast<size_t>(fixed_window_size))
                         ? accum_buffer.end() - fixed_window_size
                         : accum_buffer.begin();

            // Write to the inactive buffer
            int active = active_buffer.load(std::memory_order_acquire);
            std::vector<float>& target_buffer = (active == 0) ? processing_buffer_b : processing_buffer_a;
            std::copy(start, accum_buffer.end(), target_buffer.begin());

            // Mark worker busy and signal new window ready.
            worker_busy.store(true, std::memory_order_release);
            new_window_ready.store(true, std::memory_order_release);
            worker_cv.notify_one();

            // Advance the window by hop_size samples, retaining overlap = window_size - hop_size
            int hs = static_cast<int>(hop_size);
            if (hs > 0 && hs < fixed_window_size) {
                size_t overlap = static_cast<size_t>(fixed_window_size - hs);
                if (accum_buffer.size() > overlap)
                    accum_buffer.erase(accum_buffer.begin(),
                                       accum_buffer.end() - overlap);
                else
                    accum_buffer.clear();
            }
            else {
                // No overlap or invalid hop_size: start fresh
                accum_buffer.clear();
            }
        }

        // Additionally, if the accumulation buffer grows too large, trim it.
        if (accum_buffer.size() > static_cast<size_t>(fixed_window_size * 2))
            accum_buffer.erase(accum_buffer.begin(), accum_buffer.end() - fixed_window_size);

        // Fill the output block with the current RPDE value.
        float rpde_val = current_rpde.load(std::memory_order_acquire);
        float period_out_val = current_period.load(std::memory_order_acquire);
        for (size_t i = 0; i < n; i++) {
            out[i] = rpde_val;
            p_out[i] = period_out_val;
        }
    }

private:
    // Fixed analysis window size (set at object creation; not modifiable thereafter).
    int fixed_window_size;

    size_t counter = 0;

    // The accumulation buffer holds incoming audio samples.
    std::vector<float> accum_buffer;

    // Double-buffered processing buffers
    std::vector<float> processing_buffer_a;
    std::vector<float> processing_buffer_b;
    std::atomic<int> active_buffer;  // Which buffer the worker is currently using

    // The most recently computed RPDE value.
    std::atomic<float> current_rpde {0.0f};
    // The most recently computed RPDE mode value
    std::atomic<float> current_period {0.0f};

    // Worker thread control flags.
    std::atomic<bool> worker_busy;        // True while the worker is processing a window.
    std::atomic<bool> new_window_ready;   // True when a new window is available.
    std::atomic<bool> stop_worker;        // True when the object is being destroyed.
    std::mutex worker_mutex;
    std::condition_variable worker_cv;
    std::thread worker_thread;

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
            normalizeMinMax(working_buffer);

            // Validate parameters
            int current_dim = dim;
            int current_tau = tau;
            int embedding_span = (current_dim - 1) * current_tau;
            if (embedding_span >= fixed_window_size) {
                // Invalid parameters - skip this window
                worker_busy.store(false, std::memory_order_release);
                continue;
            }

            // Compute RPDE using the current parameters.
            auto [rpde_value, mode_value] = compute_rpde(
                working_buffer.data(),
                fixed_window_size,
                current_dim,
                current_tau,
                static_cast<float>(epsilon),
                tmax,
                theiler
            );
            current_rpde.store(rpde_value, std::memory_order_release);
            current_period.store(mode_value, std::memory_order_release);

            // Mark the worker as idle.
            worker_busy.store(false, std::memory_order_release);
        }
    }

    void normalizeMinMax(std::vector<float>& v) {
        if (v.empty()) return;

        // Find min and max elements
        auto mm = std::minmax_element(v.begin(), v.end());
        float minV = *mm.first;
        float maxV = *mm.second;
        float range = maxV - minV;

        // Avoid division by zero (constant vector)
        if (range <= std::numeric_limits<float>::epsilon())
            return;

        // Map [minV, maxV] → [–1, +1]
        std::transform(
            v.begin(), v.end(), v.begin(),
            [minV, range](float x) {
                return ((x - minV) / range) * 2.0f - 1.0f;
            }
        );
    }

    static std::pair<float,float> compute_rpde(const float* window_data,
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
            return {0.0f, 0.0f};

        // --- Choose Δmin ---
        // If user didn't set a value, pick a sensible default:
        // use dim*tau (common rule of thumb), but at least 1.
        int dmin = theiler > 0 ? theiler : dim * tau;
        if (dmin < 1)
            dmin = 1;

        // Effective Δmax (cap the search); cannot be less than dmin+1
        int dmax = (tmax > 0) ? std::min(tmax, N - 1) : (N - 1);
        if (dmax <= dmin)
            return {0.0f, 0.0f};

        std::vector<int> histogram(dmax + 1, 0);
        if (epsilon <= std::numeric_limits<float>::epsilon())
            return {0.0f,0.0f};
        const float eps2 = epsilon * epsilon;

        // For each embedded vector index i, find the FIRST
        //   (1) 'exit' from epsilon-ball (distance > eps),
        //   then (2) FIRST 'return' (distance < eps) AFTER that exit,
        // while enforcing lag >= dmin
        for (int i = 0; i < N; ++i) {
            // Start j at i + dmin (we require j - i >= dmin+1 for returns anyway)
            int jstart = i + dmin;
            if (jstart + 1 >= N)
                continue;

            // 1) find first-out index (distance > eps) after jstart
            int first_out = -1;
            for (int j = jstart; j < N; ++j) {
                int lag = j - i;
                if (lag > dmax) break;

                float dist2 = 0.0f;
                // distance between embeddings y_i and y_j
                for (int k = 0; k < dim; ++k) {
                    float diff = window_data[i + k * tau] - window_data[j + k * tau];
                    dist2 += diff * diff;
                }
                if (dist2 > eps2) {
                    first_out = j;
                    break;
                }
            }
            if (first_out < 0)
                continue;

            // 2) find first return (distance < eps) after 'first_out'
            for (int j = first_out + 1; j < N; ++j) {
                int lag = j - i;
                if (lag > dmax) break;

                float dist2 = 0.0f;
                for (int k = 0; k < dim; ++k) {
                    float diff = window_data[i + k * tau] - window_data[j + k * tau];
                    dist2 += diff * diff;
                }
                if (dist2 < eps2) {
                    // Only count returns with lag > dmin
                    if (lag > dmin && lag <= dmax)
                        histogram[lag] += 1;
                    break;
                }
            }
        }

        // Mode: lag with max count
        int mode_index = -1, max_count = 0;
        for (int i = dmin + 1; i <= dmax; ++i) {
            if (histogram[i] > max_count) {
                max_count = histogram[i];
                mode_index = i;
            }
        }
        float T_est = (mode_index > 0) ? static_cast<float>(mode_index) : 0.0f;

        // Build entropy over bins strictly greater than dmin
        int total = 0;
        for (int lag = dmin + 1; lag <= dmax; ++lag)
            total += histogram[lag];

        if (total == 0)
            return {0.0f, 0.0f};

        double H = 0.0;
        for (int lag = dmin + 1; lag <= dmax; ++lag) {
            if (histogram[lag] == 0) continue;
            double p = static_cast<double>(histogram[lag]) / static_cast<double>(total);
            H -= p * std::log(p);
        }

        // Normalize by log(number_of_considered_bins)
        const int considered = (dmax - (dmin + 1) + 1); // inclusive range
        if (considered <= 1)
            return {0.0f,0.0f};

        const double rpde_value = H / std::log(static_cast<double>(considered));
        return {static_cast<float>(rpde_value), T_est};
    }
};

MIN_EXTERNAL(rpde);
