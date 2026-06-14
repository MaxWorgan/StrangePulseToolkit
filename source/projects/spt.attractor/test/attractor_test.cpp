// attractor_test.cpp
// Standalone test harness for attractor dynamics - no Max/Min-API dependencies
// Compile: clang++ -std=c++17 -O2 attractor_test.cpp -o attractor_test
// Run: ./attractor_test [attractor_name] [num_steps] [dt]

#include <iostream>
#include <fstream>
#include <cmath>
#include <string>
#include <vector>
#include <limits>
#include <iomanip>

struct Vec3 {
    double x, y, z;
    Vec3(double x_ = 0, double y_ = 0, double z_ = 0) : x(x_), y(y_), z(z_) {}
};

struct Stats {
    double min_val = std::numeric_limits<double>::max();
    double max_val = std::numeric_limits<double>::lowest();
    double sum = 0;
    double sum_sq = 0;
    size_t count = 0;

    void update(double v) {
        if (v < min_val) min_val = v;
        if (v > max_val) max_val = v;
        sum += v;
        sum_sq += v * v;
        count++;
    }

    double mean() const { return count > 0 ? sum / count : 0; }
    double variance() const {
        if (count < 2) return 0;
        double m = mean();
        return (sum_sq / count) - m * m;
    }
    double stddev() const { return std::sqrt(variance()); }
    double range() const { return max_val - min_val; }
};

// ============================================================================
// ATTRACTOR DEFINITIONS
// ============================================================================

// Lorenz Attractor
struct Lorenz {
    double sigma = 10.0;
    double rho = 28.0;
    double beta = 8.0 / 3.0;

    static const char* name() { return "lorenz"; }

    Vec3 init(double p) { return Vec3(-p, p, p); }

    Vec3 compute(double x, double y, double z) {
        return Vec3(
            sigma * (y - x),
            x * (rho - z) - y,
            x * y - beta * z
        );
    }
};

// Dadras Attractor
struct Dadras {
    double a = 3.0;
    double b = 2.7;
    double c = 1.7;
    double d = 2.0;
    double e = 9.0;

    static const char* name() { return "dadras"; }

    Vec3 init(double p) { return Vec3(p, p, p); }

    Vec3 compute(double x, double y, double z) {
        return Vec3(
            y - a * x + b * y * z,
            c * y - x * z + z,
            d * x * y - e * z
        );
    }
};

// Thomas Attractor
struct Thomas {
    double b = 0.208186;

    static const char* name() { return "thomas"; }

    Vec3 init(double p) { return Vec3(-p, p, p); }

    Vec3 compute(double x, double y, double z) {
        return Vec3(
            std::sin(y) - b * x,
            std::sin(z) - b * y,
            std::sin(x) - b * z
        );
    }
};

// Aizawa Attractor
struct Aizawa {
    double a = 0.95;
    double b = 0.7;
    double c = 0.6;
    double d = 3.5;
    double e = 0.25;
    double f = 0.1;

    static const char* name() { return "aizawa"; }

    Vec3 init(double p) { return Vec3(p, p, p); }

    Vec3 compute(double x, double y, double z) {
        double x2 = x * x;
        double y2 = y * y;
        double z3 = z * z * z;
        return Vec3(
            (z - b) * x - d * y,
            d * x + (z - b) * y,
            c + a * z - (z3 / 3.0) - (x2 + y2) * (1.0 + e * z) + f * z * x * x2
        );
    }
};

// Halvorsen Attractor
struct Halvorsen {
    double a = 1.89;

    static const char* name() { return "halvorsen"; }

    Vec3 init(double p) { return Vec3(-5.0 * p, p, -p); }

    Vec3 compute(double x, double y, double z) {
        return Vec3(
            -a * x - 4.0 * y - 4.0 * z - y * y,
            -a * y - 4.0 * z - 4.0 * x - z * z,
            -a * z - 4.0 * x - 4.0 * y - x * x
        );
    }
};

// Rabinovich-Fabrikant Attractor
struct Rabinovich {
    double gamma = 0.14;  // Stable chaotic regime
    double alpha = 0.98;  // Stable chaotic regime

    static const char* name() { return "rabinovich"; }

    Vec3 init(double p) { return Vec3(-p, p, p * 0.5); }

    Vec3 compute(double x, double y, double z) {
        double x2 = x * x;
        return Vec3(
            y * (z - 1.0 + x2) + gamma * x,
            x * (3.0 * z + 1.0 - x2) + gamma * y,
            -2.0 * z * (alpha + x * y)
        );
    }
};

// ============================================================================
// INTEGRATION METHODS
// ============================================================================

template<typename Attractor>
void euler_step(Attractor& att, double& x, double& y, double& z, double dt) {
    Vec3 d = att.compute(x, y, z);
    x += d.x * dt;
    y += d.y * dt;
    z += d.z * dt;
}

template<typename Attractor>
void rk4_step(Attractor& att, double& x, double& y, double& z, double dt) {
    Vec3 k1 = att.compute(x, y, z);

    double x2 = x + 0.5 * dt * k1.x;
    double y2 = y + 0.5 * dt * k1.y;
    double z2 = z + 0.5 * dt * k1.z;
    Vec3 k2 = att.compute(x2, y2, z2);

    double x3 = x + 0.5 * dt * k2.x;
    double y3 = y + 0.5 * dt * k2.y;
    double z3 = z + 0.5 * dt * k2.z;
    Vec3 k3 = att.compute(x3, y3, z3);

    double x4 = x + dt * k3.x;
    double y4 = y + dt * k3.y;
    double z4 = z + dt * k3.z;
    Vec3 k4 = att.compute(x4, y4, z4);

    x += (dt / 6.0) * (k1.x + 2.0 * k2.x + 2.0 * k3.x + k4.x);
    y += (dt / 6.0) * (k1.y + 2.0 * k2.y + 2.0 * k3.y + k4.y);
    z += (dt / 6.0) * (k1.z + 2.0 * k2.z + 2.0 * k3.z + k4.z);
}

// ============================================================================
// TEST RUNNER
// ============================================================================

template<typename Attractor>
void test_attractor(Attractor att, int num_steps, double dt, bool use_rk4,
                    bool output_csv, const std::string& csv_filename) {

    double init_pos = 0.1;
    Vec3 initial = att.init(init_pos);
    double x = initial.x, y = initial.y, z = initial.z;

    Stats sx, sy, sz;
    std::vector<Vec3> trajectory;

    int warmup = num_steps / 10;  // 10% warmup to settle onto attractor

    std::ofstream csv;
    if (output_csv) {
        csv.open(csv_filename);
        csv << "step,x,y,z\n";
    }

    std::cout << "\n=== Testing " << Attractor::name() << " attractor ===\n";
    std::cout << "Initial state: (" << x << ", " << y << ", " << z << ")\n";
    std::cout << "dt = " << dt << ", steps = " << num_steps
              << ", method = " << (use_rk4 ? "RK4" : "Euler") << "\n";
    std::cout << "Warmup steps: " << warmup << "\n\n";

    bool diverged = false;
    int diverge_step = -1;

    for (int i = 0; i < num_steps; i++) {
        if (use_rk4) {
            rk4_step(att, x, y, z, dt);
        } else {
            euler_step(att, x, y, z, dt);
        }

        // Check for divergence
        if (!std::isfinite(x) || !std::isfinite(y) || !std::isfinite(z) ||
            std::abs(x) > 1e10 || std::abs(y) > 1e10 || std::abs(z) > 1e10) {
            diverged = true;
            diverge_step = i;
            break;
        }

        // Collect stats after warmup
        if (i >= warmup) {
            sx.update(x);
            sy.update(y);
            sz.update(z);
        }

        if (output_csv) {
            csv << i << "," << x << "," << y << "," << z << "\n";
        }

        // Sample trajectory for bounding box
        if (i % 100 == 0 && i >= warmup) {
            trajectory.push_back(Vec3(x, y, z));
        }
    }

    if (diverged) {
        std::cout << "*** DIVERGED at step " << diverge_step << " ***\n";
        std::cout << "Last values: (" << x << ", " << y << ", " << z << ")\n";
        return;
    }

    std::cout << std::fixed << std::setprecision(6);
    std::cout << "Statistics (after warmup):\n";
    std::cout << "  X: min=" << std::setw(12) << sx.min_val
              << " max=" << std::setw(12) << sx.max_val
              << " range=" << std::setw(12) << sx.range()
              << " mean=" << std::setw(12) << sx.mean()
              << " std=" << std::setw(12) << sx.stddev() << "\n";
    std::cout << "  Y: min=" << std::setw(12) << sy.min_val
              << " max=" << std::setw(12) << sy.max_val
              << " range=" << std::setw(12) << sy.range()
              << " mean=" << std::setw(12) << sy.mean()
              << " std=" << std::setw(12) << sy.stddev() << "\n";
    std::cout << "  Z: min=" << std::setw(12) << sz.min_val
              << " max=" << std::setw(12) << sz.max_val
              << " range=" << std::setw(12) << sz.range()
              << " mean=" << std::setw(12) << sz.mean()
              << " std=" << std::setw(12) << sz.stddev() << "\n";

    // Suggest scale factor
    double max_range = std::max({sx.range(), sy.range(), sz.range()});
    double suggested_scale = (max_range > 0) ? 1.0 / max_range : 1.0;
    std::cout << "\nSuggested scale_factor for tanh normalization: " << suggested_scale << "\n";
    std::cout << "  (Current ranges would map to roughly ±" << std::tanh(max_range * suggested_scale) << ")\n";

    std::cout << "\nFinal state: (" << x << ", " << y << ", " << z << ")\n";

    if (output_csv) {
        csv.close();
        std::cout << "Trajectory saved to: " << csv_filename << "\n";
    }
}

// ============================================================================
// MAIN
// ============================================================================

void print_usage(const char* prog) {
    std::cout << "Usage: " << prog << " [attractor] [options]\n\n";
    std::cout << "Attractors: lorenz, dadras, thomas, aizawa, halvorsen, rabinovich, all\n\n";
    std::cout << "Options:\n";
    std::cout << "  -n <steps>   Number of integration steps (default: 100000)\n";
    std::cout << "  -dt <value>  Time step (default: 0.01)\n";
    std::cout << "  -rk4         Use RK4 integration (default: Euler)\n";
    std::cout << "  -csv         Output trajectory to CSV file\n";
    std::cout << "  -h           Show this help\n";
}

int main(int argc, char* argv[]) {
    std::string attractor = "all";
    int num_steps = 100000;
    double dt = 0.01;
    bool use_rk4 = false;
    bool output_csv = false;

    for (int i = 1; i < argc; i++) {
        std::string arg = argv[i];
        if (arg == "-h" || arg == "--help") {
            print_usage(argv[0]);
            return 0;
        } else if (arg == "-n" && i + 1 < argc) {
            num_steps = std::stoi(argv[++i]);
        } else if (arg == "-dt" && i + 1 < argc) {
            dt = std::stod(argv[++i]);
        } else if (arg == "-rk4") {
            use_rk4 = true;
        } else if (arg == "-csv") {
            output_csv = true;
        } else if (arg[0] != '-') {
            attractor = arg;
        }
    }

    std::cout << "========================================\n";
    std::cout << "  Attractor Test Harness\n";
    std::cout << "========================================\n";

    auto run_test = [&](auto att) {
        std::string csv_name = std::string(att.name()) + "_trajectory.csv";
        test_attractor(att, num_steps, dt, use_rk4, output_csv, csv_name);
    };

    if (attractor == "all") {
        run_test(Lorenz{});
        run_test(Dadras{});
        run_test(Thomas{});
        run_test(Aizawa{});
        run_test(Halvorsen{});
        run_test(Rabinovich{});
    } else if (attractor == "lorenz") {
        run_test(Lorenz{});
    } else if (attractor == "dadras") {
        run_test(Dadras{});
    } else if (attractor == "thomas") {
        run_test(Thomas{});
    } else if (attractor == "aizawa") {
        run_test(Aizawa{});
    } else if (attractor == "halvorsen") {
        run_test(Halvorsen{});
    } else if (attractor == "rabinovich") {
        run_test(Rabinovich{});
    } else {
        std::cerr << "Unknown attractor: " << attractor << "\n";
        print_usage(argv[0]);
        return 1;
    }

    return 0;
}
