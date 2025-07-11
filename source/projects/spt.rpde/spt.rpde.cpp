#include "c74_min.h"
#include <vector>
#include <atomic>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <cmath>
#include <algorithm>
#include <fstream>



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

    // window_size is fixed once the object is created; we expose it read-only.
    attribute<int> window_size_attr { this, "window_size", 2048,
        description { "Fixed analysis window size (samples)" },
        readonly { true }
    };

    // The following attributes are modifiable at runtime.
    attribute<int> hop_size { this, "hop_size", 512,
        description { "Hop size (samples) for overlapping windows. If > 0, overlap is retained." }
    };

    attribute<int> dim { this, "dim", 3,
        description { "Embedding dimension" }
    };

    attribute<int> tau { this, "tau", 50,
        description { "Time delay for embedding" }
    };

    attribute<number> epsilon { this, "epsilon", 0.001f,
        description { "Recurrence ball radius (input should be normalized to [-1,1])" },
             setter { MIN_FUNCTION {
                 float val = static_cast<float>(args[0]);
                 return atoms{ val };
             }}
    };

    attribute<int> tmax { this, "tmax", -1,
        description { "Maximum return distance (-1 for no limit)" }
    };
    
    attribute<number> subsample_factor { this, "subsample_factor", 5,
        description { "Subsampling rate" } };
    
    rpde(const atoms& args = {}) {
        if (!args.empty())
            fixed_window_size = static_cast<int>(args[0]);
        else
            fixed_window_size = 2048;

        if (fixed_window_size <= 0) {
            error("window_size must be positive; defaulting to 2048");
            fixed_window_size = 2048;
        }
        // Update the read-only attribute so that the inspector shows the actual value.
        window_size_attr = fixed_window_size;

        accum_buffer.reserve(fixed_window_size * 2);

        processing_buffer.resize(fixed_window_size, 0.0f);

        current_rpde.store(0.0f);
        worker_busy.store(false);
        new_window_ready.store(false);
        stop_worker.store(false);

        //worker thread go
        worker_thread = std::thread(&rpde::worker_loop, this);
    }

    ~rpde() {
        stop_worker.store(true);
        worker_cv.notify_one();
        if (worker_thread.joinable())
            worker_thread.join();
    }

    // DSP perform method.
    // The audio thread appends incoming samples into accum_buffer.
    // When at least fixed_window_size samples are available and the worker is idle,
    // we take the most recent fixed_window_size samples (or, if hop_size > 0, leave the
    // last hop_size samples for overlap), copy them into processing_buffer, and notify
    // the worker thread.
    // The output is filled with the most recently computed RPDE value.
    void operator()(audio_bundle input_bundle, audio_bundle output_bundle) {
        auto in = input_bundle.samples(0);
        auto out = output_bundle.samples(0);
        size_t n = output_bundle.frame_count();

        // Append the incoming samples.
        for (size_t i = 0; i < n; i++) {
            counter++;
            if(counter % static_cast<int>(subsample_factor) == 0){
                accum_buffer.push_back(in[i]);
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
            std::copy(start, accum_buffer.end(), processing_buffer.begin());
//            std::ofstream debug_out("/Users/mw469/Documents/dump_data.txt");
//            for (auto s : processing_buffer)
//                debug_out << s << "\n"; 
//
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
        float out_val = current_rpde.load(std::memory_order_acquire);
        for (size_t i = 0; i < n; i++) {
            out[i] = out_val;
        }
    }

private:
    // Fixed analysis window size (set at object creation; not modifiable thereafter).
    int fixed_window_size;
   
    size_t counter;

    // The accumulation buffer holds incoming audio samples.
    std::vector<float> accum_buffer;
    // The processing buffer holds one full window of samples.
    std::vector<float> processing_buffer;

    // The most recently computed RPDE value.
    std::atomic<float> current_rpde;

    // Worker thread control flags.
    std::atomic<bool> worker_busy;      // True while the worker is processing a window.
    std::atomic<bool> new_window_ready;   // True when a new window is available.
    std::atomic<bool> stop_worker;        // True when the object is being destroyed.
    std::mutex worker_mutex;
    std::condition_variable worker_cv;
    std::thread worker_thread;

    // The worker thread loop waits until new_window_ready is true, then processes
    // the samples in processing_buffer.
    void worker_loop() {
        while (!stop_worker.load(std::memory_order_acquire)) {
            std::unique_lock<std::mutex> lock(worker_mutex);
            worker_cv.wait(lock, [this]() {
                return new_window_ready.load(std::memory_order_acquire) ||
                       stop_worker.load(std::memory_order_acquire);
            });
            if (stop_worker.load(std::memory_order_acquire))
                break;

            // Reset the flag.
            new_window_ready.store(false, std::memory_order_release);
            lock.unlock();

            normalizeMinMax(processing_buffer);
            // Compute RPDE using the current parameters.
            float rpde_value = compute_rpde(
                processing_buffer.data(),
                fixed_window_size,
                dim,          // Attribute: embedding dimension.
                tau,          // Attribute: time delay.
                epsilon,      // Attribute: recurrence ball radius.
                tmax          // Attribute: maximum return distance.
            );
            current_rpde.store(rpde_value, std::memory_order_release);

            // Mark the worker as idle.
            worker_busy.store(false, std::memory_order_release);
        }
    }

    void normalizeMinMax(std::vector<float>& v) {
        if (v.empty()) return;

        // 1) find min and max elements
        auto mm = std::minmax_element(v.begin(), v.end());
        float minV = *mm.first;
        float maxV = *mm.second;
        float range = maxV - minV;

        // 2) avoid division by zero (constant vector)
        if (range <= std::numeric_limits<float>::epsilon())
            return;

        // 3) map [minV, maxV] → [–1, +1]
        std::transform(
            v.begin(), v.end(), v.begin(),
            [minV, range](float x) {
                return ((x - minV) / range) * 2.0f - 1.0f;
            }
        );
    }

    // Compute the RPDE value for a window of data using a recurrence histogram method.
    static float compute_rpde(const float* window_data,
                              int ws,    // window size (samples)
                              int dim,   // embedding dimension
                              int tau,   // time delay
                              float epsilon,
                              int tmax) {
        int N = ws - (dim - 1) * tau;
        if (N <= 0)
            return 0.0f;

        std::vector<int> histogram(N, 0);
        float epsilon_sq = epsilon * epsilon;

        // For each embedded vector…
        for (int i = 0; i < N; i++) {
            int first_out = N;
            // Find the first index j > i where the distance exceeds epsilon.
            for (int j = i + 1; j < N; j++) {
                if (tmax > 0 && (j - i) > tmax)
                    break;
                float dist_sq = 0.0f;
                for (int k = 0; k < dim; k++) {
                    float diff = window_data[i + k * tau] - window_data[j + k * tau];
                    dist_sq += diff * diff;
                }
                if (dist_sq > epsilon_sq) {
                    first_out = j;
                    break;
                }
            }
            // Find the first index after first_out that returns inside the epsilon ball.
            for (int j = first_out + 1; j < N; j++) {
                if (tmax > 0 && (j - i) > tmax)
                    break;
                float dist_sq = 0.0f;
                for (int k = 0; k < dim; k++) {
                    float diff = window_data[i + k * tau] - window_data[j + k * tau];
                    dist_sq += diff * diff;
                }
                if (dist_sq < epsilon_sq) {
                    int index = j - i;
                    if (index < N)
                        histogram[index] += 1;
                    break;
                }
            }
        }

        // Determine the number of histogram bins to use.
        int hist_size = 0;
        if (tmax > 0)
            hist_size = std::min(tmax, N);
        else {
            for (int i = N - 1; i >= 1; i--) {
                if (histogram[i] != 0) {
                    hist_size = i;
                    break;
                }
            }
        }
        if (hist_size <= 1)
            return 0.0f;  // No valid recurrence times recorded.

        // Sum the histogram counts (ignoring index 0).
        int total = 0;
        for (int i = 1; i < hist_size; i++) {
            total += histogram[i];
        }
        if (total == 0)
            return 0.0f;

        // Compute the normalized entropy.
        double entropy = 0.0;
        for (int i = 1; i < hist_size; i++) {
            double p = histogram[i] / static_cast<double>(total);
            if (p > 0)
                entropy -= p * std::log(p);
        }
        double rpde_value = entropy / std::log(hist_size);
        return static_cast<float>(rpde_value);
    }
};

MIN_EXTERNAL(rpde);
