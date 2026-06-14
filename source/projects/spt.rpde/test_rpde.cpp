#include <iostream>
#include <vector>
#include <cmath>
#include <algorithm>
#include <limits>
#include <random>
#include <iomanip>
#include <fstream>
#include <cstdint>
#include <set>
#include <filesystem>
#include <cstdlib>

// Copy of the RpdeResult struct and compute_rpde function for testing
struct RpdeResult {
    float rpde;
    float period;
    int total_recurrences;
    int N;
    int dmin_used;
    int dmax_used;
    int nonzero_bins;
    float raw_entropy;
};

struct AiffData {
    int channels = 0;
    int sample_rate = 0;
    int bit_depth = 0;
    std::vector<float> samples;
};

static uint16_t read_be_u16(std::istream& in) {
    uint8_t b[2] = {0, 0};
    in.read(reinterpret_cast<char*>(b), 2);
    return static_cast<uint16_t>((b[0] << 8) | b[1]);
}

static uint32_t read_be_u32(std::istream& in) {
    uint8_t b[4] = {0, 0, 0, 0};
    in.read(reinterpret_cast<char*>(b), 4);
    return (static_cast<uint32_t>(b[0]) << 24) |
           (static_cast<uint32_t>(b[1]) << 16) |
           (static_cast<uint32_t>(b[2]) << 8) |
           static_cast<uint32_t>(b[3]);
}

static double parse_extended_80(const uint8_t* bytes) {
    int sign = (bytes[0] & 0x80) ? -1 : 1;
    int exp = ((bytes[0] & 0x7F) << 8) | bytes[1];
    uint64_t mantissa = 0;
    for (int i = 0; i < 8; ++i)
        mantissa = (mantissa << 8) | bytes[2 + i];

    if (exp == 0 && mantissa == 0)
        return 0.0;

    exp -= 16383;
    long double fraction = static_cast<long double>(mantissa) / static_cast<long double>(1ULL << 63);
    return static_cast<double>(sign * std::ldexp(fraction, exp));
}

static float clamp_unit(float v) {
    if (v > 1.0f) return 1.0f;
    if (v < -1.0f) return -1.0f;
    return v;
}

static bool read_aiff_mono(const std::string& path, AiffData& out, std::string& err) {
    std::ifstream in(path, std::ios::binary);
    if (!in) {
        err = "failed to open file";
        return false;
    }

    char form_id[4] = {0};
    in.read(form_id, 4);
    if (std::string(form_id, 4) != "FORM") {
        err = "not a FORM container";
        return false;
    }
    (void)read_be_u32(in);  // form size

    char form_type[4] = {0};
    in.read(form_type, 4);
    std::string form_type_str(form_type, 4);
    if (form_type_str != "AIFF" && form_type_str != "AIFC") {
        err = "unsupported FORM type";
        return false;
    }

    bool is_aifc = (form_type_str == "AIFC");
    bool have_comm = false;
    bool have_ssnd = false;
    uint32_t comm_frames = 0;
    std::vector<uint8_t> ssnd_data;

    while (in && (!have_comm || !have_ssnd)) {
        char chunk_id[4] = {0};
        if (!in.read(chunk_id, 4))
            break;
        uint32_t chunk_size = read_be_u32(in);
        std::string id(chunk_id, 4);

        if (id == "COMM") {
            uint32_t bytes_read = 0;
            out.channels = static_cast<int>(read_be_u16(in));
            comm_frames = read_be_u32(in);
            out.bit_depth = static_cast<int>(read_be_u16(in));
            uint8_t rate_bytes[10] = {0};
            in.read(reinterpret_cast<char*>(rate_bytes), 10);
            bytes_read += 18;
            out.sample_rate = static_cast<int>(std::round(parse_extended_80(rate_bytes)));

            if (is_aifc) {
                char comp_type[4] = {0};
                in.read(comp_type, 4);
                bytes_read += 4;
                std::string comp(comp_type, 4);
                if (comp != "NONE") {
                    err = "unsupported AIFC compression";
                    return false;
                }
                uint8_t name_len = 0;
                in.read(reinterpret_cast<char*>(&name_len), 1);
                bytes_read += 1;
                if (name_len > 0) {
                    in.ignore(name_len + (name_len % 2));
                    bytes_read += name_len + (name_len % 2);
                }
            }

            have_comm = true;
            if (chunk_size > bytes_read)
                in.ignore(chunk_size - bytes_read);
        } else if (id == "SSND") {
            uint32_t offset = read_be_u32(in);
            (void)read_be_u32(in);  // block size
            if (offset > 0)
                in.ignore(offset);
            uint32_t data_bytes = chunk_size >= 8 ? (chunk_size - 8 - offset) : 0;
            ssnd_data.resize(data_bytes);
            in.read(reinterpret_cast<char*>(ssnd_data.data()), data_bytes);
            have_ssnd = true;
        } else {
            in.ignore(chunk_size + (chunk_size % 2));
        }
    }

    if (!have_comm || !have_ssnd) {
        err = "missing COMM or SSND chunk";
        return false;
    }
    if (out.channels <= 0 || out.bit_depth <= 0) {
        err = "invalid channel count or bit depth";
        return false;
    }

    int bytes_per_sample = (out.bit_depth + 7) / 8;
    if (bytes_per_sample < 1 || bytes_per_sample > 4) {
        err = "unsupported bit depth";
        return false;
    }

    size_t frame_count = ssnd_data.size() / (bytes_per_sample * static_cast<size_t>(out.channels));
    if (comm_frames > 0 && comm_frames < frame_count)
        frame_count = comm_frames;

    out.samples.resize(frame_count);
    size_t idx = 0;
    double denom = static_cast<double>((1ULL << (out.bit_depth - 1)) - 1);
    if (denom <= 0.0)
        denom = 1.0;

    for (size_t frame = 0; frame < frame_count; ++frame) {
        double acc = 0.0;
        for (int ch = 0; ch < out.channels; ++ch) {
            int32_t sample = 0;
            const uint8_t* p = ssnd_data.data() + idx;
            if (bytes_per_sample == 1) {
                sample = static_cast<int8_t>(p[0]);
            } else if (bytes_per_sample == 2) {
                sample = static_cast<int16_t>((p[0] << 8) | p[1]);
            } else if (bytes_per_sample == 3) {
                sample = (p[0] << 16) | (p[1] << 8) | p[2];
                if (sample & 0x800000)
                    sample |= 0xFF000000;
            } else {
                sample = (static_cast<int32_t>(p[0]) << 24) |
                         (static_cast<int32_t>(p[1]) << 16) |
                         (static_cast<int32_t>(p[2]) << 8) |
                         static_cast<int32_t>(p[3]);
            }
            idx += bytes_per_sample;
            acc += static_cast<double>(sample) / denom;
        }
        out.samples[frame] = clamp_unit(static_cast<float>(acc / out.channels));
    }

    return true;
}

// Normalize to [-1, 1]
bool normalizeMinMax(std::vector<float>& v) {
    if (v.empty()) return false;
    auto mm = std::minmax_element(v.begin(), v.end());
    float minV = *mm.first;
    float maxV = *mm.second;
    float range = maxV - minV;
    if (range <= std::numeric_limits<float>::epsilon())
        return false;
    std::transform(v.begin(), v.end(), v.begin(),
        [minV, range](float x) {
            return ((x - minV) / range) * 2.0f - 1.0f;
        });
    return true;
}

RpdeResult compute_rpde(const float* window_data, int ws, int dim, int tau,
                        float epsilon, int tmax, int theiler) {
    const int N = ws - (dim - 1) * tau;
    if (N <= 0)
        return {0.0f, 0.0f, 0, N, 0, 0, 0, 0.0f};

    int dmin = theiler > 0 ? theiler : dim * tau;
    if (dmin < 1) dmin = 1;

    int dmax = (tmax > 0) ? std::min(tmax, N - 1) : (N - 1);
    if (dmax <= dmin)
        return {0.0f, 0.0f, 0, N, dmin, dmax, 0, 0.0f};

    std::vector<int> histogram(dmax + 1, 0);
    if (epsilon <= std::numeric_limits<float>::epsilon())
        return {0.0f, 0.0f, 0, N, dmin, dmax, 0, 0.0f};
    const float eps2 = epsilon * epsilon;

    for (int i = 0; i < N; ++i) {
        int jstart = i + dmin;
        if (jstart >= N) continue;

        float init_dist2 = 0.0f;
        for (int k = 0; k < dim; ++k) {
            float diff = window_data[i + k * tau] - window_data[jstart + k * tau];
            init_dist2 += diff * diff;
        }
        bool inside = (init_dist2 < eps2);
        bool has_exited = !inside;

        for (int j = jstart + 1; j < N; ++j) {
            int lag = j - i;
            if (lag > dmax) break;

            float dist2 = 0.0f;
            for (int k = 0; k < dim; ++k) {
                float diff = window_data[i + k * tau] - window_data[j + k * tau];
                dist2 += diff * diff;
            }

            bool now_inside = (dist2 < eps2);

            if (inside && !now_inside) {
                has_exited = true;
            }
            else if (!inside && now_inside && has_exited) {
                if (lag > dmin && lag <= dmax)
                    histogram[lag] += 1;
                has_exited = false;
            }
            inside = now_inside;
        }
    }

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

    const int considered = (dmax - (dmin + 1) + 1);
    if (considered <= 1)
        return {0.0f, 0.0f, total, N, dmin, dmax, nonzero_bins, static_cast<float>(H)};

    const double rpde_value = H / std::log(static_cast<double>(considered));
    return {static_cast<float>(rpde_value), T_est, total, N, dmin, dmax, nonzero_bins, static_cast<float>(H)};
}

struct SearchResult {
    RpdeResult result;
    int dim = 0;
    int tau = 0;
    float epsilon = 0.0f;
    bool valid = false;
};

struct SeparationResult {
    RpdeResult periodic_result;
    RpdeResult chaotic_result;
    int dim = 0;
    int tau = 0;
    float epsilon = 0.0f;
    bool valid = false;
    float score = 0.0f;
};

struct SeparationCandidate {
    RpdeResult periodic_result;
    RpdeResult chaotic_result;
    int dim = 0;
    int tau = 0;
    float epsilon = 0.0f;
    float score = 0.0f;
};

std::vector<int> build_tau_candidates(int est_period, int window_size) {
    std::set<int> taus;
    int max_tau = std::min(200, window_size / 4);

    for (int t : {1, 2, 3, 4, 5, 8, 10, 12, 15, 20, 25, 30, 40, 50}) {
        if (t <= max_tau)
            taus.insert(t);
    }

    if (est_period > 0) {
        int base = std::max(1, est_period / 4);
        for (int t : {base / 2, base, base * 2, base * 3 / 2}) {
            if (t > 0 && t <= max_tau)
                taus.insert(t);
        }
    }

    if (taus.empty())
        taus.insert(1);

    return std::vector<int>(taus.begin(), taus.end());
}

SearchResult find_best_rpde(const std::vector<float>& signal,
                            const std::vector<int>& dims,
                            const std::vector<int>& taus,
                            const std::vector<float>& epsilons) {
    SearchResult best;
    std::vector<float> normalized = signal;
    if (!normalizeMinMax(normalized))
        return best;

    for (int dim : dims) {
        for (int tau : taus) {
            if ((dim - 1) * tau >= static_cast<int>(normalized.size()))
                continue;
            for (float eps : epsilons) {
                auto result = compute_rpde(normalized.data(), normalized.size(), dim, tau, eps, -1, 0);
                if (result.total_recurrences == 0)
                    continue;
                if (!best.valid || result.rpde < best.result.rpde ||
                    (result.rpde == best.result.rpde && result.total_recurrences > best.result.total_recurrences)) {
                    best.valid = true;
                    best.result = result;
                    best.dim = dim;
                    best.tau = tau;
                    best.epsilon = eps;
                }
            }
        }
    }

    return best;
}

SeparationResult find_best_low_periodic(const std::vector<float>& periodic,
                                        const std::vector<float>& chaotic,
                                        const std::vector<int>& dims,
                                        const std::vector<int>& taus,
                                        const std::vector<float>& epsilons,
                                        int min_recurrences,
                                        float min_delta) {
    SeparationResult best;
    std::vector<float> periodic_norm = periodic;
    std::vector<float> chaotic_norm = chaotic;
    if (!normalizeMinMax(periodic_norm) || !normalizeMinMax(chaotic_norm))
        return best;

    for (int dim : dims) {
        for (int tau : taus) {
            if ((dim - 1) * tau >= static_cast<int>(periodic_norm.size()))
                continue;
            for (float eps : epsilons) {
                auto periodic_res = compute_rpde(periodic_norm.data(), periodic_norm.size(), dim, tau, eps, -1, 0);
                auto chaotic_res = compute_rpde(chaotic_norm.data(), chaotic_norm.size(), dim, tau, eps, -1, 0);
                if (periodic_res.total_recurrences < min_recurrences ||
                    chaotic_res.total_recurrences < min_recurrences)
                    continue;
                float delta = chaotic_res.rpde - periodic_res.rpde;
                if (delta < min_delta)
                    continue;
                if (!best.valid || periodic_res.rpde < best.periodic_result.rpde ||
                    (periodic_res.rpde == best.periodic_result.rpde && delta > best.score)) {
                    best.valid = true;
                    best.score = delta;
                    best.dim = dim;
                    best.tau = tau;
                    best.epsilon = eps;
                    best.periodic_result = periodic_res;
                    best.chaotic_result = chaotic_res;
                }
            }
        }
    }

    return best;
}

SeparationResult find_best_separation(const std::vector<float>& periodic,
                                      const std::vector<float>& chaotic,
                                      const std::vector<int>& dims,
                                      const std::vector<int>& taus,
                                      const std::vector<float>& epsilons,
                                      int min_recurrences,
                                      float max_periodic_rpde,
                                      float min_chaotic_rpde) {
    SeparationResult best;
    std::vector<float> periodic_norm = periodic;
    std::vector<float> chaotic_norm = chaotic;
    if (!normalizeMinMax(periodic_norm) || !normalizeMinMax(chaotic_norm))
        return best;

    for (int dim : dims) {
        for (int tau : taus) {
            if ((dim - 1) * tau >= static_cast<int>(periodic_norm.size()))
                continue;
            for (float eps : epsilons) {
                auto periodic_res = compute_rpde(periodic_norm.data(), periodic_norm.size(), dim, tau, eps, -1, 0);
                auto chaotic_res = compute_rpde(chaotic_norm.data(), chaotic_norm.size(), dim, tau, eps, -1, 0);
                if (periodic_res.total_recurrences < min_recurrences ||
                    chaotic_res.total_recurrences < min_recurrences)
                    continue;
                if (periodic_res.rpde > max_periodic_rpde)
                    continue;
                if (chaotic_res.rpde < min_chaotic_rpde)
                    continue;
                float score = chaotic_res.rpde - periodic_res.rpde;
                if (!best.valid || score > best.score) {
                    best.valid = true;
                    best.score = score;
                    best.dim = dim;
                    best.tau = tau;
                    best.epsilon = eps;
                    best.periodic_result = periodic_res;
                    best.chaotic_result = chaotic_res;
                }
            }
        }
    }

    return best;
}

std::vector<SeparationCandidate> find_top_separations(const std::vector<float>& periodic,
                                                      const std::vector<float>& chaotic,
                                                      const std::vector<int>& dims,
                                                      const std::vector<int>& taus,
                                                      const std::vector<float>& epsilons,
                                                      int min_recurrences,
                                                      int top_n) {
    std::vector<SeparationCandidate> best;
    std::vector<float> periodic_norm = periodic;
    std::vector<float> chaotic_norm = chaotic;
    if (!normalizeMinMax(periodic_norm) || !normalizeMinMax(chaotic_norm))
        return best;

    for (int dim : dims) {
        for (int tau : taus) {
            if ((dim - 1) * tau >= static_cast<int>(periodic_norm.size()))
                continue;
            for (float eps : epsilons) {
                auto periodic_res = compute_rpde(periodic_norm.data(), periodic_norm.size(), dim, tau, eps, -1, 0);
                auto chaotic_res = compute_rpde(chaotic_norm.data(), chaotic_norm.size(), dim, tau, eps, -1, 0);
                if (periodic_res.total_recurrences < min_recurrences ||
                    chaotic_res.total_recurrences < min_recurrences)
                    continue;
                float score = chaotic_res.rpde - periodic_res.rpde;
                SeparationCandidate cand {periodic_res, chaotic_res, dim, tau, eps, score};
                best.push_back(cand);
            }
        }
    }

    std::sort(best.begin(), best.end(),
              [](const SeparationCandidate& a, const SeparationCandidate& b) {
                  return a.score > b.score;
              });
    if (static_cast<int>(best.size()) > top_n)
        best.resize(top_n);
    return best;
}

// Signal generators
std::vector<float> generate_sine(int length, float period, float amplitude = 1.0f) {
    std::vector<float> signal(length);
    for (int i = 0; i < length; i++) {
        signal[i] = amplitude * std::sin(2.0f * M_PI * i / period);
    }
    return signal;
}

std::vector<float> generate_noise(int length, float amplitude = 1.0f) {
    std::vector<float> signal(length);
    std::mt19937 gen(42);
    std::uniform_real_distribution<float> dist(-amplitude, amplitude);
    for (int i = 0; i < length; i++) {
        signal[i] = dist(gen);
    }
    return signal;
}

std::vector<float> generate_sine_with_noise(int length, float period, float noise_level = 0.1f) {
    auto signal = generate_sine(length, period);
    std::mt19937 gen(42);
    std::normal_distribution<float> dist(0.0f, noise_level);
    for (int i = 0; i < length; i++) {
        signal[i] += dist(gen);
    }
    return signal;
}

std::vector<float> generate_lorenz(int length, float dt = 0.01f) {
    std::vector<float> signal(length);
    float x = 1.0f, y = 1.0f, z = 1.0f;
    const float sigma = 10.0f, rho = 28.0f, beta = 8.0f/3.0f;

    for (int i = 0; i < length; i++) {
        float dx = sigma * (y - x);
        float dy = x * (rho - z) - y;
        float dz = x * y - beta * z;
        x += dx * dt;
        y += dy * dt;
        z += dz * dt;
        signal[i] = x;
    }
    return signal;
}

std::vector<float> generate_dadras(int length, float speed = 1.0f, float a = 9.0f) {
    std::vector<float> signal(length);
    double x = 0.001, y = 0.05, z = 0.001;  // Match dadras default_position
    // Dadras attractor parameters: a, b=2.7, c=1.7, d=2, e=9
    const double b = 2.7, c = 1.7, d = 2.0, e = 9.0;
    // Match dadras: default_dt = 3.0, so dt_base = (3.0 / 44100) * 100.0 = 0.0068
    const double dt_base = (3.0 / 44100.0) * 100.0;  // = 0.0068
    const int substeps = std::max(1, (int)std::round(speed));

    // Discard initial transient (1000 steps)
    for (int i = 0; i < 1000; i++) {
        for (int s = 0; s < substeps; s++) {
            double dx = y - a * x + b * y * z;
            double dy = c * y - x * z + z;
            double dz = d * x * y - e * z;
            x += dx * dt_base;
            y += dy * dt_base;
            z += dz * dt_base;
        }
    }

    for (int i = 0; i < length; i++) {
        for (int s = 0; s < substeps; s++) {
            double dx = y - a * x + b * y * z;
            double dy = c * y - x * z + z;
            double dz = d * x * y - e * z;
            x += dx * dt_base;
            y += dy * dt_base;
            z += dz * dt_base;
        }
        signal[i] = static_cast<float>(x);
    }
    return signal;
}

// Estimate period using autocorrelation
int estimate_period_autocorr(const std::vector<float>& signal, int min_lag = 2, int max_lag = -1) {
    int n = signal.size();
    if (max_lag < 0) max_lag = n / 2;

    // Compute mean
    float mean = 0;
    for (float s : signal) mean += s;
    mean /= n;

    // Compute variance
    float var = 0;
    for (float s : signal) var += (s - mean) * (s - mean);
    if (var <= std::numeric_limits<float>::epsilon())
        return -1;

    // Find first peak in autocorrelation after initial decay
    float prev_corr = 1.0f;
    float prev_prev_corr = 1.0f;
    bool found_trough = false;

    for (int lag = min_lag; lag < max_lag; lag++) {
        float corr = 0;
        for (int i = 0; i < n - lag; i++) {
            corr += (signal[i] - mean) * (signal[i + lag] - mean);
        }
        corr /= var;

        // Look for first peak after a trough
        if (!found_trough && corr < prev_corr) {
            // Still descending
        } else if (!found_trough && corr > prev_corr) {
            found_trough = true;
        } else if (found_trough && prev_corr > corr && prev_corr > prev_prev_corr) {
            // Found peak
            return lag - 1;
        }

        prev_prev_corr = prev_corr;
        prev_corr = corr;
    }
    return -1;  // No period found
}

void print_result(const std::string& name, const RpdeResult& r, int total_bins) {
    std::cout << std::fixed << std::setprecision(3);
    std::cout << "  " << std::left << std::setw(25) << name
              << " RPDE=" << std::setw(6) << r.rpde
              << " T=" << std::setw(6) << (int)r.period
              << " recur=" << std::setw(7) << r.total_recurrences
              << " bins=" << r.nonzero_bins << "/" << total_bins
              << " H=" << r.raw_entropy << "/" << std::log((float)total_bins)
              << std::endl;
}

void test_signal(const std::string& name, std::vector<float> signal,
                 int dim, int tau, float epsilon, int theiler = 0) {
    normalizeMinMax(signal);
    auto result = compute_rpde(signal.data(), signal.size(), dim, tau, epsilon, -1, theiler);
    int total_bins = result.dmax_used - result.dmin_used;
    print_result(name, result, total_bins);
}

bool write_csv(const std::string& path, const std::vector<float>& data) {
    std::ofstream out(path);
    if (!out) return false;
    out << std::fixed << std::setprecision(8);
    for (size_t i = 0; i < data.size(); ++i) {
        out << data[i] << "\n";
    }
    return true;
}

int main() {
    const int window_size = 5000;
    bool dadras_only = (std::getenv("SPT_RPDE_DADRAS_ONLY") != nullptr);

    std::cout << "=== RPDE Test Harness ===" << std::endl;
    std::cout << "Window size: " << window_size << std::endl;

    if (!dadras_only) {
    // Test 1: Effect of epsilon on a sine wave
    std::cout << "\n--- Test 1: Sine wave (period=100), varying epsilon ---" << std::endl;
    std::cout << "    dim=3, tau=25 (T/4)" << std::endl;
    for (float eps : {0.001f, 0.01f, 0.02f, 0.05f, 0.1f, 0.2f}) {
        auto signal = generate_sine(window_size, 100);
        std::string name = "eps=" + std::to_string(eps).substr(0,5);
        test_signal(name, signal, 3, 25, eps);
    }

    // Test 2: Effect of tau on a sine wave
    std::cout << "\n--- Test 2: Sine wave (period=100), varying tau ---" << std::endl;
    std::cout << "    dim=3, epsilon=0.05" << std::endl;
    for (int tau : {5, 10, 25, 50, 100}) {
        auto signal = generate_sine(window_size, 100);
        std::string name = "tau=" + std::to_string(tau);
        test_signal(name, signal, 3, tau, 0.05f);
    }

    // Test 3: Effect of dim
    std::cout << "\n--- Test 3: Sine wave (period=100), varying dim ---" << std::endl;
    std::cout << "    tau=25, epsilon=0.05" << std::endl;
    for (int dim : {2, 3, 4, 5, 7}) {
        auto signal = generate_sine(window_size, 100);
        std::string name = "dim=" + std::to_string(dim);
        test_signal(name, signal, dim, 25, 0.05f);
    }

    // Test 4: Different signal types with optimal settings
    std::cout << "\n--- Test 4: Different signals (dim=3, tau=25, eps=0.05) ---" << std::endl;
    {
        auto signal = generate_sine(window_size, 100);
        test_signal("Pure sine (T=100)", signal, 3, 25, 0.05f);
    }
    {
        auto signal = generate_sine(window_size, 200);
        test_signal("Pure sine (T=200)", signal, 3, 50, 0.05f);
    }
    {
        auto signal = generate_sine_with_noise(window_size, 100, 0.05f);
        test_signal("Sine + 5% noise", signal, 3, 25, 0.05f);
    }
    {
        auto signal = generate_sine_with_noise(window_size, 100, 0.1f);
        test_signal("Sine + 10% noise", signal, 3, 25, 0.05f);
    }
    {
        auto signal = generate_sine_with_noise(window_size, 100, 0.2f);
        test_signal("Sine + 20% noise", signal, 3, 25, 0.05f);
    }
    {
        auto signal = generate_noise(window_size);
        test_signal("Pure noise", signal, 3, 25, 0.05f);
    }
    {
        auto signal = generate_lorenz(window_size);
        test_signal("Lorenz attractor", signal, 3, 25, 0.05f);
    }

    // Test 5: Finding optimal epsilon for period detection
    std::cout << "\n--- Test 5: Period detection accuracy ---" << std::endl;
    std::cout << "    Testing if detected T matches actual period" << std::endl;
    for (int actual_period : {50, 100, 200, 500}) {
        int tau = actual_period / 4;
        auto signal = generate_sine(window_size, actual_period);
        normalizeMinMax(signal);

        std::cout << "  Actual period=" << actual_period << " (tau=" << tau << "):" << std::endl;
        for (float eps : {0.01f, 0.02f, 0.05f, 0.1f}) {
            auto result = compute_rpde(signal.data(), signal.size(), 3, tau, eps, -1, 0);
            std::cout << "    eps=" << eps << " -> T=" << (int)result.period
                      << " RPDE=" << std::fixed << std::setprecision(3) << result.rpde
                      << (std::abs(result.period - actual_period) < 3 ? " ✓" : " ✗")
                      << std::endl;
        }
    }

    // Test 6: Theiler window effect
    std::cout << "\n--- Test 6: Theiler window effect (sine T=100, tau=25, eps=0.05) ---" << std::endl;
    for (int theiler : {0, 25, 50, 75, 100, 150}) {
        auto signal = generate_sine(window_size, 100);
        std::string name = "theiler=" + std::to_string(theiler);
        test_signal(name, signal, 3, 25, 0.05f, theiler);
    }

    // Test 7: Dadras attractor with user's parameters
    std::cout << "\n--- Test 7: Dadras attractor (speed=1.0, a=9) ---" << std::endl;
    {
        // Generate at 44100 Hz, then subsample by 5 (like the Max object does)
        auto full_signal = generate_dadras(window_size * 5, 1.0f, 9.0f);
        std::vector<float> signal(window_size);
        for (int i = 0; i < window_size; i++) {
            signal[i] = full_signal[i * 5];  // Subsample by 5
        }

        // Look at signal statistics
        auto minmax = std::minmax_element(signal.begin(), signal.end());
        std::cout << "  Signal range: [" << *minmax.first << ", " << *minmax.second << "]" << std::endl;

        // Count zero crossings to estimate frequency
        int zero_crossings = 0;
        float mean = 0;
        for (float s : signal) mean += s;
        mean /= signal.size();
        for (size_t i = 1; i < signal.size(); i++) {
            if ((signal[i-1] - mean) * (signal[i] - mean) < 0) zero_crossings++;
        }
        float est_freq_hz = (zero_crossings / 2.0f) / (signal.size() * 5.0f / 44100.0f);
        int est_period = (zero_crossings > 0) ? (signal.size() * 2 / zero_crossings) : -1;
        std::cout << "  Zero crossings: " << zero_crossings << std::endl;
        std::cout << "  Estimated freq: ~" << est_freq_hz << " Hz" << std::endl;
        std::cout << "  Estimated period: ~" << est_period << " subsampled samples" << std::endl;

        // Also try autocorrelation with different min_lag
        int period_ac = estimate_period_autocorr(signal, 2, 500);
        std::cout << "  Autocorr period: " << period_ac << std::endl;

        // Test with various tau values regardless
        std::cout << "\n  Testing with various tau values (eps=0.05):" << std::endl;
        for (int tau : {1, 2, 3, 5, 10, 15, 20, 30, 50}) {
            auto sig_copy = signal;
            normalizeMinMax(sig_copy);
            auto result = compute_rpde(sig_copy.data(), sig_copy.size(), 3, tau, 0.05f, -1, 0);
            int total_bins = result.dmax_used - result.dmin_used;
            std::string name = "tau=" + std::to_string(tau);
            print_result(name, result, total_bins);
        }

        std::cout << "\n  Testing with tau=5, varying epsilon:" << std::endl;
        for (float eps : {0.001f, 0.01f, 0.02f, 0.05f, 0.1f, 0.2f}) {
            auto sig_copy = signal;
            normalizeMinMax(sig_copy);
            auto result = compute_rpde(sig_copy.data(), sig_copy.size(), 3, 5, eps, -1, 0);
            int total_bins = result.dmax_used - result.dmin_used;
            std::string name = "eps=" + std::to_string(eps).substr(0,5);
            print_result(name, result, total_bins);
        }
    }

    // Test 7b: Compare different 'a' values for Dadras
    std::cout << "\n--- Test 7b: Dadras attractor with different 'a' values ---" << std::endl;
    for (float a : {3.0f, 5.0f, 7.0f, 9.0f, 11.0f}) {
        auto full_signal = generate_dadras(window_size * 5, 1.0f, a);
        std::vector<float> signal(window_size);
        for (int i = 0; i < window_size; i++) {
            signal[i] = full_signal[i * 5];
        }
        normalizeMinMax(signal);
        auto result = compute_rpde(signal.data(), signal.size(), 3, 5, 0.05f, -1, 0);
        int total_bins = result.dmax_used - result.dmin_used;
        std::string name = "a=" + std::to_string((int)a);
        print_result(name, result, total_bins);
    }

    // Test 8: What if period is very short?
    std::cout << "\n--- Test 8: Very short period signals ---" << std::endl;
    for (int T : {10, 20, 30, 50}) {
        int tau = std::max(1, T / 4);
        auto signal = generate_sine(window_size, T);
        normalizeMinMax(signal);
        auto result = compute_rpde(signal.data(), signal.size(), 3, tau, 0.05f, -1, 0);
        int total_bins = result.dmax_used - result.dmin_used;
        std::string name = "T=" + std::to_string(T) + " tau=" + std::to_string(tau);
        print_result(name, result, total_bins);
    }

    // Test 9: AIFF file search for low RPDE
    std::cout << "\n--- Test 9: AIFF file parameter search (patchers/test.aiff) ---" << std::endl;
    {
        AiffData aiff;
        std::string error;
        if (!read_aiff_mono("patchers/test.aiff", aiff, error)) {
            std::cout << "  AIFF read failed: " << error << std::endl;
        } else {
            std::cout << "  channels=" << aiff.channels
                      << " sr=" << aiff.sample_rate
                      << " bits=" << aiff.bit_depth
                      << " frames=" << aiff.samples.size() << std::endl;

            int use_window = std::min(window_size, static_cast<int>(aiff.samples.size()));
            if (use_window < 200) {
                std::cout << "  Not enough samples for RPDE analysis." << std::endl;
            } else {
                std::vector<float> window(aiff.samples.begin(), aiff.samples.begin() + use_window);
                int est_period = estimate_period_autocorr(window, 2, std::min(2000, use_window / 2));
                std::cout << "  Estimated period (samples): " << est_period << std::endl;

                auto tau_candidates = build_tau_candidates(est_period, use_window);
                std::vector<int> dims = {2, 3, 4, 5};
                std::vector<float> epsilons = {0.005f, 0.01f, 0.02f, 0.05f, 0.1f, 0.2f};

                auto best = find_best_rpde(window, dims, tau_candidates, epsilons);
                if (!best.valid) {
                    std::cout << "  No valid recurrence settings found." << std::endl;
                } else {
                    int total_bins = best.result.dmax_used - best.result.dmin_used;
                    std::cout << "  Best parameters: dim=" << best.dim
                              << " tau=" << best.tau
                              << " eps=" << best.epsilon << std::endl;
                    print_result("AIFF best", best.result, total_bins);
                }
            }
        }
    }
    }

    // Test 10: Dadras attractor capture + RPDE tuning (limit cycle vs chaotic)
    std::cout << "\n--- Test 10: Dadras capture + RPDE tuning ---" << std::endl;
    {
        const int subsample = 5;
        std::filesystem::create_directories("source/projects/spt.rpde/test_output");
        std::vector<int> window_sizes = {2000, 3000, 5000, 8000, 12000};

        for (int ws : window_sizes) {
            const int full_len = ws * subsample;
            auto make_subsampled = [&](float a_value) {
                auto full_signal = generate_dadras(full_len, 1.0f, a_value);
                std::vector<float> signal(ws);
                for (int i = 0; i < ws; ++i)
                    signal[i] = full_signal[i * subsample];
                return signal;
            };

            std::vector<float> periodic = make_subsampled(9.0f);
            std::vector<float> chaotic = make_subsampled(3.0f);

            if (ws == 5000) {
                write_csv("source/projects/spt.rpde/test_output/dadras_a9_periodic.csv", periodic);
                write_csv("source/projects/spt.rpde/test_output/dadras_a3_chaotic.csv", chaotic);
            }

            const int search_window = std::min(2000, ws);
            std::vector<float> periodic_search(periodic.begin(), periodic.begin() + search_window);
            std::vector<float> chaotic_search(chaotic.begin(), chaotic.begin() + search_window);

            int periodic_est = estimate_period_autocorr(periodic_search, 2, std::min(2000, search_window / 2));
            int chaotic_est = estimate_period_autocorr(chaotic_search, 2, std::min(2000, search_window / 2));

            std::vector<int> dims = {2, 3, 4, 5, 6};
            std::vector<float> epsilons = {0.002f, 0.003f, 0.005f, 0.01f, 0.02f, 0.03f, 0.05f, 0.08f, 0.1f, 0.12f, 0.15f, 0.2f};
            auto taus_periodic = build_tau_candidates(periodic_est, search_window);
            auto taus_chaotic = build_tau_candidates(chaotic_est, search_window);
            std::set<int> tau_set(taus_periodic.begin(), taus_periodic.end());
            tau_set.insert(taus_chaotic.begin(), taus_chaotic.end());
            std::vector<int> taus(tau_set.begin(), tau_set.end());

            std::cout << "\n  Window size: " << ws
                      << " (est periods p=" << periodic_est
                      << ", c=" << chaotic_est << ")" << std::endl;

            auto best_sep = find_best_separation(periodic_search, chaotic_search, dims, taus, epsilons, 200, 0.35f, 0.5f);
            if (best_sep.valid) {
                std::cout << "  Best strict separation params: dim=" << best_sep.dim
                          << " tau=" << best_sep.tau
                          << " eps=" << best_sep.epsilon
                          << " delta=" << best_sep.score << std::endl;

                auto periodic_norm = periodic;
                auto chaotic_norm = chaotic;
                normalizeMinMax(periodic_norm);
                normalizeMinMax(chaotic_norm);
                auto periodic_full = compute_rpde(periodic_norm.data(), periodic_norm.size(), best_sep.dim, best_sep.tau, best_sep.epsilon, -1, 0);
                auto chaotic_full = compute_rpde(chaotic_norm.data(), chaotic_norm.size(), best_sep.dim, best_sep.tau, best_sep.epsilon, -1, 0);
                int total_bins_p = periodic_full.dmax_used - periodic_full.dmin_used;
                int total_bins_c = chaotic_full.dmax_used - chaotic_full.dmin_used;
                print_result("Dadras a=9", periodic_full, total_bins_p);
                print_result("Dadras a=3", chaotic_full, total_bins_c);
            } else {
                std::cout << "  No shared params met strict separation criteria." << std::endl;
            }

            auto best_low = find_best_low_periodic(periodic_search, chaotic_search, dims, taus, epsilons, 200, 0.2f);
            if (best_low.valid) {
                std::cout << "  Best low periodic params: dim=" << best_low.dim
                          << " tau=" << best_low.tau
                          << " eps=" << best_low.epsilon
                          << " delta=" << best_low.score << std::endl;

                auto periodic_norm = periodic;
                auto chaotic_norm = chaotic;
                normalizeMinMax(periodic_norm);
                normalizeMinMax(chaotic_norm);
                auto periodic_full = compute_rpde(periodic_norm.data(), periodic_norm.size(), best_low.dim, best_low.tau, best_low.epsilon, -1, 0);
                auto chaotic_full = compute_rpde(chaotic_norm.data(), chaotic_norm.size(), best_low.dim, best_low.tau, best_low.epsilon, -1, 0);
                int total_bins_p = periodic_full.dmax_used - periodic_full.dmin_used;
                int total_bins_c = chaotic_full.dmax_used - chaotic_full.dmin_used;
                print_result("Dadras a=9", periodic_full, total_bins_p);
                print_result("Dadras a=3", chaotic_full, total_bins_c);
            } else {
                std::cout << "  No low-periodic params met separation criteria." << std::endl;
            }

            auto top = find_top_separations(periodic_search, chaotic_search, dims, taus, epsilons, 100, 3);
            if (!top.empty()) {
                std::cout << "  Top separation candidates (looser):" << std::endl;
                for (const auto& cand : top) {
                    std::cout << "    dim=" << cand.dim
                              << " tau=" << cand.tau
                              << " eps=" << cand.epsilon
                              << " delta=" << cand.score
                              << " (p=" << cand.periodic_result.rpde
                              << ", c=" << cand.chaotic_result.rpde << ")"
                              << std::endl;
                }
            }
        }
    }

    std::cout << "\n=== Summary ===" << std::endl;
    std::cout << "For periodic signals:" << std::endl;
    std::cout << "  - tau should be ~T/4 (quarter period)" << std::endl;
    std::cout << "  - epsilon 0.02-0.05 works well for normalized data" << std::endl;
    std::cout << "  - dim=3 is usually sufficient" << std::endl;
    std::cout << "  - theiler=dim*tau (default) is reasonable" << std::endl;
    std::cout << "\nExpected RPDE ranges:" << std::endl;
    std::cout << "  - Pure periodic: < 0.1" << std::endl;
    std::cout << "  - Quasi-periodic/noisy: 0.1 - 0.4" << std::endl;
    std::cout << "  - Chaotic: 0.4 - 0.7" << std::endl;
    std::cout << "  - Random noise: > 0.7" << std::endl;

    return 0;
}
