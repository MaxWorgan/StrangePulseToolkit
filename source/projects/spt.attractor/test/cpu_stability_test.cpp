// cpu_stability_test.cpp
// Analyze CPU vs stability tradeoffs for dt/speed settings
// Key insight: frequency ∝ dt * speed, so we can trade off between them
//
// Compile: clang++ -std=c++17 -O2 cpu_stability_test.cpp -o cpu_stability_test
// Run: ./cpu_stability_test

#include <iostream>
#include <cmath>
#include <iomanip>
#include <chrono>
#include <vector>

constexpr double SAMPLERATE = 44100.0;
constexpr int BENCHMARK_SAMPLES = 441000; // 10 seconds

struct Vec3 { double x, y, z; };

// ============================================================================
// ATTRACTORS
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
// INTEGRATION
// ============================================================================

template<typename Attractor>
inline void euler_step(Attractor& att, double& x, double& y, double& z, double dt) {
    Vec3 d = att.compute(x, y, z);
    x += d.x * dt;
    y += d.y * dt;
    z += d.z * dt;
}

template<typename Attractor>
inline void rk4_step(Attractor& att, double& x, double& y, double& z, double dt) {
    Vec3 k1 = att.compute(x, y, z);
    Vec3 k2 = att.compute(x+0.5*dt*k1.x, y+0.5*dt*k1.y, z+0.5*dt*k1.z);
    Vec3 k3 = att.compute(x+0.5*dt*k2.x, y+0.5*dt*k2.y, z+0.5*dt*k2.z);
    Vec3 k4 = att.compute(x+dt*k3.x, y+dt*k3.y, z+dt*k3.z);
    x += (dt/6.0)*(k1.x + 2*k2.x + 2*k3.x + k4.x);
    y += (dt/6.0)*(k1.y + 2*k2.y + 2*k3.y + k4.y);
    z += (dt/6.0)*(k1.z + 2*k2.z + 2*k3.z + k4.z);
}

// ============================================================================
// ANALYSIS
// ============================================================================

template<typename Attractor>
bool test_stability(Attractor att, double dt_param, double speed, int duration_samples) {
    Vec3 init = att.init(0.1);
    double x = init.x, y = init.y, z = init.z;
    double dt_base = (dt_param / SAMPLERATE) * 100.0;

    // Configure speed
    bool skip_mode = false;
    int substeps = 1;
    size_t skip_interval = 1;

    if (speed <= 0) return true; // frozen
    else if (speed < 1.0) {
        skip_mode = true;
        substeps = 1;
        skip_interval = std::max(1UL, static_cast<size_t>(std::llround(1.0 / speed)));
    } else {
        skip_mode = false;
        substeps = std::max(1, static_cast<int>(std::lround(speed)));
        skip_interval = 1;
    }

    size_t sample_counter = 0;
    for (int i = 0; i < duration_samples; i++) {
        bool do_step = !skip_mode || (sample_counter % skip_interval) == 0;
        if (do_step) {
            for (int s = 0; s < substeps; s++) {
                rk4_step(att, x, y, z, dt_base);
            }
        }
        sample_counter++;

        if (!std::isfinite(x) || std::abs(x) > 1e6) {
            return false; // diverged
        }
    }
    return true;
}

template<typename Attractor>
double benchmark_cpu(Attractor att, double dt_param, double speed, int samples) {
    Vec3 init = att.init(0.1);
    double x = init.x, y = init.y, z = init.z;
    double dt_base = (dt_param / SAMPLERATE) * 100.0;

    bool skip_mode = false;
    int substeps = 1;
    size_t skip_interval = 1;

    if (speed < 1.0) {
        skip_mode = true;
        substeps = 1;
        skip_interval = std::max(1UL, static_cast<size_t>(std::llround(1.0 / speed)));
    } else {
        skip_mode = false;
        substeps = std::max(1, static_cast<int>(std::lround(speed)));
        skip_interval = 1;
    }

    auto start = std::chrono::high_resolution_clock::now();

    size_t sample_counter = 0;
    volatile double sink = 0; // prevent optimization
    for (int i = 0; i < samples; i++) {
        bool do_step = !skip_mode || (sample_counter % skip_interval) == 0;
        if (do_step) {
            for (int s = 0; s < substeps; s++) {
                rk4_step(att, x, y, z, dt_base);
            }
        }
        sample_counter++;
        sink = x;
    }

    auto end = std::chrono::high_resolution_clock::now();
    double elapsed_ms = std::chrono::duration<double, std::milli>(end - start).count();

    // Return CPU % (relative to real-time)
    double realtime_ms = (samples / SAMPLERATE) * 1000.0;
    return (elapsed_ms / realtime_ms) * 100.0;
}

template<typename Attractor>
double estimate_frequency(Attractor att, double dt_param, double speed) {
    Vec3 init = att.init(0.1);
    double x = init.x, y = init.y, z = init.z;
    double dt_base = (dt_param / SAMPLERATE) * 100.0;

    bool skip_mode = speed < 1.0;
    int substeps = skip_mode ? 1 : std::max(1, static_cast<int>(std::lround(speed)));
    size_t skip_interval = skip_mode ? std::max(1UL, static_cast<size_t>(std::llround(1.0 / speed))) : 1;

    int samples = 88200; // 2 sec
    int warmup = 22050;
    int zero_crossings = 0;
    double prev_x = x;
    size_t sample_counter = 0;

    for (int i = 0; i < samples; i++) {
        bool do_step = !skip_mode || (sample_counter % skip_interval) == 0;
        if (do_step) {
            for (int s = 0; s < substeps; s++) {
                rk4_step(att, x, y, z, dt_base);
            }
        }
        sample_counter++;

        if (i >= warmup) {
            if ((prev_x < 0 && x >= 0) || (prev_x >= 0 && x < 0)) {
                zero_crossings++;
            }
        }
        prev_x = x;

        if (!std::isfinite(x)) return -1;
    }

    double analysis_sec = (samples - warmup) / SAMPLERATE;
    return (zero_crossings / 2.0) / analysis_sec;
}

template<typename Attractor>
void find_max_stable_dt(Attractor att, double target_freq, const char* mode) {
    std::cout << "\n--- " << Attractor::name() << " (target: " << target_freq << " Hz, " << mode << ") ---\n";

    // Strategy: find max dt that's stable, then find speed that gives target freq
    double dts[] = {0.25, 0.5, 0.75, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0};

    double best_dt = 0, best_speed = 0, best_cpu = 1000;
    double best_freq = 0;

    for (double dt : dts) {
        // Find speed that gives target frequency at this dt
        // freq ∝ dt * speed (approximately)
        // Start with a guess and refine

        double speeds[] = {0.005, 0.01, 0.02, 0.03, 0.05, 0.1, 0.2, 0.5,
                          1.0, 2.0, 3.0, 5.0, 10.0, 20.0, 30.0, 50.0};

        for (double speed : speeds) {
            // Quick stability check
            if (!test_stability(att, dt, speed, 44100)) continue;

            double freq = estimate_frequency(att, dt, speed);
            if (freq < 0) continue; // diverged

            // Is this close to target?
            if (std::abs(freq - target_freq) / target_freq < 0.3) { // within 30%
                double cpu = benchmark_cpu(att, dt, speed, 44100);

                if (cpu < best_cpu) {
                    best_cpu = cpu;
                    best_dt = dt;
                    best_speed = speed;
                    best_freq = freq;
                }
            }
        }
    }

    if (best_dt > 0) {
        std::cout << std::fixed << std::setprecision(3);
        std::cout << "  OPTIMAL: dt=" << best_dt << ", speed=" << best_speed
                  << " => " << best_freq << " Hz, CPU=" << best_cpu << "%\n";
    } else {
        std::cout << "  No stable configuration found for target frequency\n";
    }
}

template<typename Attractor>
void analyze_attractor(Attractor att) {
    std::cout << "\n" << std::string(70, '=') << "\n";
    std::cout << "  " << Attractor::name() << " - Stability & CPU Analysis\n";
    std::cout << std::string(70, '=') << "\n";

    // Find max stable dt at various speeds
    std::cout << "\nMax stable dt by speed:\n";
    std::cout << std::setw(10) << "speed" << std::setw(12) << "max_dt"
              << std::setw(12) << "freq (Hz)" << std::setw(10) << "CPU %\n";
    std::cout << std::string(44, '-') << "\n";

    double speeds[] = {0.01, 0.02, 0.05, 0.1, 0.5, 1.0, 2.0, 5.0, 10.0, 30.0};

    for (double speed : speeds) {
        double max_stable_dt = 0;
        double freq_at_max = 0;
        double cpu_at_max = 0;

        for (double dt = 0.25; dt <= 10.0; dt += 0.25) {
            if (test_stability(att, dt, speed, 88200)) { // 2 sec test
                double freq = estimate_frequency(att, dt, speed);
                if (freq > 0) {
                    max_stable_dt = dt;
                    freq_at_max = freq;
                    cpu_at_max = benchmark_cpu(att, dt, speed, 44100);
                }
            } else {
                break; // unstable, don't try higher dt
            }
        }

        if (max_stable_dt > 0) {
            std::cout << std::fixed << std::setprecision(3);
            std::cout << std::setw(10) << speed
                      << std::setw(12) << max_stable_dt
                      << std::setw(12) << freq_at_max
                      << std::setw(10) << cpu_at_max << "\n";
        } else {
            std::cout << std::setw(10) << speed << "  unstable at all dt\n";
        }
    }

    // Find optimal settings for target frequencies
    find_max_stable_dt(att, 3.0, "rhythm");
    find_max_stable_dt(att, 40.0, "low audio");
}

int main() {
    std::cout << "================================================================\n";
    std::cout << "  CPU & Stability Analysis for Attractor Settings\n";
    std::cout << "  Goal: Maximize dt (fewer steps) while maintaining stability\n";
    std::cout << "================================================================\n";

    analyze_attractor(Halvorsen{});
    analyze_attractor(Aizawa{});
    analyze_attractor(Rabinovich{});
    analyze_attractor(Dadras{});
    analyze_attractor(Lorenz{});
    analyze_attractor(Thomas{});

    std::cout << "\n\n=== SUMMARY ===\n";
    std::cout << "CPU cost is proportional to: speed * (4 if RK4, 1 if Euler)\n";
    std::cout << "Frequency is proportional to: dt * speed\n";
    std::cout << "Strategy: Use highest stable dt, lowest speed for target freq\n";

    return 0;
}
