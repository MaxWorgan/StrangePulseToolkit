// speed_test.cpp
// Test dt/speed combinations to find rhythm vs audio-rate behavior
// Simulates the exact logic from attractor_base.h
//
// Compile: clang++ -std=c++17 -O2 speed_test.cpp -o speed_test
// Run: ./speed_test

#include <iostream>
#include <cmath>
#include <iomanip>
#include <vector>
#include <algorithm>

constexpr double SAMPLERATE = 44100.0;

struct Vec3 { double x, y, z; };

// ============================================================================
// ATTRACTORS (same as attractor_test.cpp)
// ============================================================================

struct Halvorsen {
    double a = 1.89;
    static const char* name() { return "halvorsen"; }
    Vec3 init(double p) { return {-5.0 * p, p, -p}; }
    Vec3 compute(double x, double y, double z) {
        return {
            -a * x - 4.0 * y - 4.0 * z - y * y,
            -a * y - 4.0 * z - 4.0 * x - z * z,
            -a * z - 4.0 * x - 4.0 * y - x * x
        };
    }
};

struct Aizawa {
    double a=0.95, b=0.7, c=0.6, d=3.5, e=0.25, f=0.1;
    static const char* name() { return "aizawa"; }
    Vec3 init(double p) { return {p, p, p}; }
    Vec3 compute(double x, double y, double z) {
        double x2=x*x, y2=y*y, z3=z*z*z;
        return {
            (z - b) * x - d * y,
            d * x + (z - b) * y,
            c + a * z - (z3/3.0) - (x2 + y2)*(1.0 + e*z) + f*z*x*x2
        };
    }
};

struct Rabinovich {
    double gamma = 0.14, alpha = 0.98;
    static const char* name() { return "rabinovich"; }
    Vec3 init(double p) { return {-p, p, p*0.5}; }
    Vec3 compute(double x, double y, double z) {
        double x2 = x * x;
        return {
            y * (z - 1.0 + x2) + gamma * x,
            x * (3.0 * z + 1.0 - x2) + gamma * y,
            -2.0 * z * (alpha + x * y)
        };
    }
};

struct Dadras {
    double a=3.0, b=2.7, c=1.7, d=2.0, e=9.0;
    static const char* name() { return "dadras"; }
    Vec3 init(double p) { return {p, p, p}; }
    Vec3 compute(double x, double y, double z) {
        return {
            y - a*x + b*y*z,
            c*y - x*z + z,
            d*x*y - e*z
        };
    }
};

struct Lorenz {
    double sigma=10.0, rho=28.0, beta=8.0/3.0;
    static const char* name() { return "lorenz"; }
    Vec3 init(double p) { return {-p, p, p}; }
    Vec3 compute(double x, double y, double z) {
        return {
            sigma * (y - x),
            x * (rho - z) - y,
            x * y - beta * z
        };
    }
};

struct Thomas {
    double b = 0.208186;
    static const char* name() { return "thomas"; }
    Vec3 init(double p) { return {-p, p, p}; }
    Vec3 compute(double x, double y, double z) {
        return {
            std::sin(y) - b * x,
            std::sin(z) - b * y,
            std::sin(x) - b * z
        };
    }
};

// ============================================================================
// SIMULATION (mirrors attractor_base.h logic)
// ============================================================================

template<typename Attractor>
void rk4_step(Attractor& att, double& x, double& y, double& z, double dt) {
    Vec3 k1 = att.compute(x, y, z);
    Vec3 k2 = att.compute(x+0.5*dt*k1.x, y+0.5*dt*k1.y, z+0.5*dt*k1.z);
    Vec3 k3 = att.compute(x+0.5*dt*k2.x, y+0.5*dt*k2.y, z+0.5*dt*k2.z);
    Vec3 k4 = att.compute(x+dt*k3.x, y+dt*k3.y, z+dt*k3.z);
    x += (dt/6.0)*(k1.x + 2*k2.x + 2*k3.x + k4.x);
    y += (dt/6.0)*(k1.y + 2*k2.y + 2*k3.y + k4.y);
    z += (dt/6.0)*(k1.z + 2*k2.z + 2*k3.z + k4.z);
}

struct SpeedConfig {
    bool skip_mode;
    int substeps;
    size_t skip_interval;
};

SpeedConfig configure_speed(double speed) {
    SpeedConfig cfg;
    if (speed <= 0.0) {
        cfg.skip_mode = false;
        cfg.substeps = 0;
        cfg.skip_interval = 1;
    } else if (speed < 1.0) {
        cfg.skip_mode = true;
        cfg.substeps = 1;
        double inv = 1.0 / speed;
        cfg.skip_interval = std::max(1UL, static_cast<size_t>(std::llround(inv)));
    } else {
        cfg.skip_mode = false;
        cfg.substeps = std::max(1, static_cast<int>(std::lround(speed)));
        cfg.skip_interval = 1;
    }
    return cfg;
}

template<typename Attractor>
struct SimResult {
    double zero_crossings_per_sec;  // Estimated "frequency" based on X zero crossings
    double peaks_per_sec;           // Peak count per second
    double min_x, max_x;
    double period_estimate_ms;      // Rough period estimate
    bool diverged;
};

template<typename Attractor>
SimResult<Attractor> simulate_audio_rate(Attractor att, double dt_param, double speed,
                                          double duration_sec = 5.0) {
    SimResult<Attractor> result = {};

    // Initialize
    Vec3 init = att.init(0.1);
    double x = init.x, y = init.y, z = init.z;

    // dt_base calculation from attractor_base.h
    double dt_base = (dt_param / SAMPLERATE) * 100.0;

    SpeedConfig cfg = configure_speed(speed);

    size_t total_samples = static_cast<size_t>(SAMPLERATE * duration_sec);
    size_t warmup_samples = static_cast<size_t>(SAMPLERATE * 0.5); // 0.5s warmup

    int zero_crossings = 0;
    int peaks = 0;
    double prev_x = x;
    double prev_dx = 0;
    result.min_x = 1e9;
    result.max_x = -1e9;

    size_t sample_counter = 0;

    for (size_t i = 0; i < total_samples; i++) {
        bool do_step = true;
        if (cfg.skip_mode) {
            do_step = (sample_counter % cfg.skip_interval) == 0;
        }

        if (do_step) {
            for (int s = 0; s < cfg.substeps; s++) {
                rk4_step(att, x, y, z, dt_base);
            }
        }
        sample_counter++;

        // Check for divergence
        if (!std::isfinite(x) || std::abs(x) > 1e6) {
            result.diverged = true;
            return result;
        }

        // Stats after warmup
        if (i >= warmup_samples) {
            if (x < result.min_x) result.min_x = x;
            if (x > result.max_x) result.max_x = x;

            // Count zero crossings (sign changes)
            if ((prev_x < 0 && x >= 0) || (prev_x >= 0 && x < 0)) {
                zero_crossings++;
            }

            // Count peaks (direction changes)
            double dx = x - prev_x;
            if ((prev_dx > 0 && dx <= 0) || (prev_dx < 0 && dx >= 0)) {
                if (std::abs(dx) > 1e-10 || std::abs(prev_dx) > 1e-10) {
                    peaks++;
                }
            }
            prev_dx = dx;
        }
        prev_x = x;
    }

    double analysis_duration = duration_sec - 0.5; // subtract warmup
    result.zero_crossings_per_sec = zero_crossings / analysis_duration;
    result.peaks_per_sec = peaks / analysis_duration;

    // Frequency estimate: zero crossings / 2 = full cycles
    double freq_estimate = result.zero_crossings_per_sec / 2.0;
    result.period_estimate_ms = (freq_estimate > 0) ? 1000.0 / freq_estimate : 0;

    return result;
}

// ============================================================================
// MAIN
// ============================================================================

template<typename Attractor>
void test_attractor_speeds(Attractor att) {
    std::cout << "\n" << std::string(70, '=') << "\n";
    std::cout << "  " << Attractor::name() << " attractor\n";
    std::cout << std::string(70, '=') << "\n\n";

    // Test various dt and speed combinations
    double dts[] = {0.5, 1.0, 2.0};
    double speeds[] = {0.005, 0.01, 0.02, 0.05, 0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0, 50.0};

    std::cout << std::fixed << std::setprecision(2);
    std::cout << "Speed settings and resulting frequencies:\n";
    std::cout << "(Rhythm range: 0.5-10 Hz, Low audio: 20-100 Hz, Audio: 100+ Hz)\n\n";

    std::cout << std::setw(8) << "dt"
              << std::setw(10) << "speed"
              << std::setw(12) << "freq (Hz)"
              << std::setw(14) << "period (ms)"
              << std::setw(12) << "range"
              << std::setw(15) << "category" << "\n";
    std::cout << std::string(70, '-') << "\n";

    for (double dt : dts) {
        for (double speed : speeds) {
            auto result = simulate_audio_rate(att, dt, speed, 3.0);

            if (result.diverged) {
                std::cout << std::setw(8) << dt
                          << std::setw(10) << speed
                          << "  ** DIVERGED **\n";
                continue;
            }

            double freq = result.zero_crossings_per_sec / 2.0;
            std::string category;
            if (freq < 0.5) category = "very slow";
            else if (freq < 2) category = "slow LFO";
            else if (freq < 10) category = "RHYTHM";
            else if (freq < 20) category = "fast LFO";
            else if (freq < 100) category = "LOW AUDIO";
            else if (freq < 500) category = "audio";
            else category = "high audio";

            std::cout << std::setw(8) << dt
                      << std::setw(10) << speed
                      << std::setw(12) << freq
                      << std::setw(14) << result.period_estimate_ms
                      << std::setw(12) << (result.max_x - result.min_x)
                      << std::setw(15) << category << "\n";
        }
        std::cout << "\n";
    }
}

void find_optimal_settings() {
    std::cout << "\n" << std::string(70, '=') << "\n";
    std::cout << "  RECOMMENDED SETTINGS FINDER\n";
    std::cout << std::string(70, '=') << "\n\n";

    std::cout << "Target: primary=rhythm (2-8 Hz), secondary=low audio (30-80 Hz)\n\n";

    // Test all attractors and find settings that give rhythm + low audio
    auto test_and_recommend = [](auto att) {
        std::cout << "\n--- " << decltype(att)::name() << " ---\n";

        double best_rhythm_dt = 1.0, best_rhythm_speed = 0.02;
        double best_audio_dt = 1.0, best_audio_speed = 1.0;
        double best_rhythm_freq = 0, best_audio_freq = 0;

        double dts[] = {0.5, 1.0, 1.5, 2.0};
        double speeds[] = {0.005, 0.01, 0.015, 0.02, 0.03, 0.05, 0.1, 0.2, 0.5,
                          1.0, 2.0, 3.0, 5.0, 10.0, 15.0, 20.0, 30.0, 50.0};

        for (double dt : dts) {
            for (double speed : speeds) {
                auto result = simulate_audio_rate(att, dt, speed, 2.0);
                if (result.diverged) continue;

                double freq = result.zero_crossings_per_sec / 2.0;

                // Best rhythm: closest to 4 Hz
                if (freq >= 1.0 && freq <= 15.0) {
                    double dist = std::abs(freq - 4.0);
                    double best_dist = std::abs(best_rhythm_freq - 4.0);
                    if (best_rhythm_freq == 0 || dist < best_dist) {
                        best_rhythm_freq = freq;
                        best_rhythm_dt = dt;
                        best_rhythm_speed = speed;
                    }
                }

                // Best low audio: closest to 50 Hz
                if (freq >= 20.0 && freq <= 150.0) {
                    double dist = std::abs(freq - 50.0);
                    double best_dist = std::abs(best_audio_freq - 50.0);
                    if (best_audio_freq == 0 || dist < best_dist) {
                        best_audio_freq = freq;
                        best_audio_dt = dt;
                        best_audio_speed = speed;
                    }
                }
            }
        }

        std::cout << std::fixed << std::setprecision(3);
        std::cout << "  Rhythm:    dt=" << best_rhythm_dt << ", speed=" << best_rhythm_speed
                  << " => " << best_rhythm_freq << " Hz\n";
        std::cout << "  Low audio: dt=" << best_audio_dt << ", speed=" << best_audio_speed
                  << " => " << best_audio_freq << " Hz\n";

        // Check if we can use same dt for both
        std::cout << "\n  With dt=" << best_rhythm_dt << ":\n";
        for (double speed : speeds) {
            auto result = simulate_audio_rate(att, best_rhythm_dt, speed, 2.0);
            if (result.diverged) continue;
            double freq = result.zero_crossings_per_sec / 2.0;
            if ((freq >= 1 && freq <= 15) || (freq >= 20 && freq <= 150)) {
                std::string cat = (freq < 20) ? "rhythm" : "low audio";
                std::cout << "    speed=" << std::setw(6) << speed
                          << " => " << std::setw(7) << freq << " Hz (" << cat << ")\n";
            }
        }
    };

    test_and_recommend(Halvorsen{});
    test_and_recommend(Aizawa{});
    test_and_recommend(Rabinovich{});
    test_and_recommend(Dadras{});
    test_and_recommend(Lorenz{});
    test_and_recommend(Thomas{});
}

int main(int argc, char* argv[]) {
    std::cout << "========================================\n";
    std::cout << "  Attractor Speed/DT Analysis\n";
    std::cout << "  Samplerate: " << SAMPLERATE << " Hz\n";
    std::cout << "========================================\n";

    if (argc > 1 && std::string(argv[1]) == "-find") {
        find_optimal_settings();
        return 0;
    }

    // Full test for each attractor
    test_attractor_speeds(Halvorsen{});
    test_attractor_speeds(Aizawa{});
    test_attractor_speeds(Rabinovich{});
    test_attractor_speeds(Dadras{});
    test_attractor_speeds(Lorenz{});
    test_attractor_speeds(Thomas{});

    std::cout << "\n\nRun with -find flag for recommended settings.\n";

    return 0;
}
