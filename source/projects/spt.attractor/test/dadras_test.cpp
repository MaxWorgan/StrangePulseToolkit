// Test to verify both attractors show chaotic behavior
// Compile with: clang++ -std=c++17 -O2 dadras_test.cpp -o dadras_test

#include <iostream>
#include <cmath>
#include <iomanip>
#include <cstdint>

struct DadrasParams {
    double a = 3.0;
    double b = 2.7;
    double c = 1.7;
    double d = 2.0;
    double e = 9.0;
};

void compute(const DadrasParams& p, double& dx, double& dy, double& dz,
             double x, double y, double z) {
    dx = y - p.a * x + p.b * y * z;
    dy = p.c * y - x * z + z;
    dz = p.d * x * y - p.e * z;
}

void euler_step(const DadrasParams& p, double& x, double& y, double& z, double dt) {
    double dx, dy, dz;
    compute(p, dx, dy, dz, x, y, z);
    x += dx * dt;
    y += dy * dt;
    z += dz * dt;
}

class RNG {
    uint64_t state{0x853c49e6748fea9bULL};
public:
    double next() {
        state ^= state >> 12;
        state ^= state << 25;
        state ^= state >> 27;
        uint64_t result = state * 0x2545F4914F6CDD1DULL;
        return (static_cast<double>(result) / static_cast<double>(UINT64_MAX)) * 2.0 - 1.0;
    }
};

void perturbed_init(RNG& rng, double p,
                    double& x1, double& y1, double& z1,
                    double& x2, double& y2, double& z2) {
    x1 = y1 = z1 = p;
    x2 = y2 = z2 = p;

    const double base_scale = 100.0 * 0.02;  // 2% of overflow_limit
    const double offset_x = base_scale * 1.0;
    const double offset_y = base_scale * 0.7;
    const double offset_z = base_scale * 0.3;

    const double perturb_scale = base_scale * 0.5;
    const double rand_x = rng.next() * perturb_scale;
    const double rand_y = rng.next() * perturb_scale;
    const double rand_z = rng.next() * perturb_scale;

    x1 += offset_x + rand_x;
    y1 += offset_y + rand_y;
    z1 += offset_z + rand_z;
    x2 += offset_x + rand_x;
    y2 += offset_y + rand_y;
    z2 += offset_z + rand_z;
}

void test_chaos_visibility(const DadrasParams& params, const char* name) {
    std::cout << "\n=== " << name << " ===" << std::endl;
    std::cout << "Parameters: a=" << params.a << " b=" << params.b
              << " c=" << params.c << " d=" << params.d << " e=" << params.e << std::endl;

    const double sample_rate = 44100.0;
    const double dt_base = (3.0 / sample_rate) * 100.0;  // Same dt for both!

    RNG rng;
    double x1, y1, z1, x2, y2, z2;
    perturbed_init(rng, 0.001, x1, y1, z1, x2, y2, z2);

    std::cout << "\nBoth start at same position: (" << x1 << ", " << y1 << ", " << z1 << ")\n" << std::endl;

    // Track min/max to show range of motion (chaos indicator)
    double p_min_x = x1, p_max_x = x1;
    double s_min_x = x2, s_max_x = x2;

    const int total_samples = 3 * 44100;  // 3 seconds
    const int report_interval = 44100 / 2;  // Every 0.5 seconds

    std::cout << "Time     Primary (slow, 1 step/100 samples)          Secondary (fast, 1 step/sample)" << std::endl;
    std::cout << "         Position              Velocity              Position              Velocity" << std::endl;
    std::cout << std::string(100, '-') << std::endl;

    int stall_count_1 = 0, stall_count_2 = 0;
    int reset_count = 0;
    const int stall_threshold = 3;

    for (int sample = 0; sample < total_samples; ++sample) {
        // Primary: same dt, but steps only every 100 samples
        if (sample % 100 == 0) {
            euler_step(params, x1, y1, z1, dt_base);
        }

        // Secondary: same dt, steps every sample
        euler_step(params, x2, y2, z2, dt_base);

        // Stall detection every 64 samples (like real code)
        if ((sample & 0x3F) == 0) {
            double dx1, dy1, dz1, dx2, dy2, dz2;
            compute(params, dx1, dy1, dz1, x1, y1, z1);
            compute(params, dx2, dy2, dz2, x2, y2, z2);
            double vel_sq1 = dx1*dx1 + dy1*dy1 + dz1*dz1;
            double vel_sq2 = dx2*dx2 + dy2*dy2 + dz2*dz2;

            if (vel_sq1 < 1e-12) stall_count_1++; else stall_count_1 = 0;
            if (vel_sq2 < 1e-12) stall_count_2++; else stall_count_2 = 0;

            if (stall_count_1 >= stall_threshold || stall_count_2 >= stall_threshold) {
                perturbed_init(rng, 0.001, x1, y1, z1, x2, y2, z2);
                stall_count_1 = stall_count_2 = 0;
                reset_count++;
            }
        }

        // Track range
        if (x1 < p_min_x) p_min_x = x1;
        if (x1 > p_max_x) p_max_x = x1;
        if (x2 < s_min_x) s_min_x = x2;
        if (x2 > s_max_x) s_max_x = x2;

        if ((sample + 1) % report_interval == 0) {
            double sec = (sample + 1) / 44100.0;

            double dx1, dy1, dz1, dx2, dy2, dz2;
            compute(params, dx1, dy1, dz1, x1, y1, z1);
            compute(params, dx2, dy2, dz2, x2, y2, z2);
            double vel1 = std::sqrt(dx1*dx1 + dy1*dy1 + dz1*dz1);
            double vel2 = std::sqrt(dx2*dx2 + dy2*dy2 + dz2*dz2);

            std::cout << std::fixed << std::setprecision(1) << sec << "s     "
                      << std::setprecision(2)
                      << "(" << std::setw(6) << x1 << "," << std::setw(6) << y1 << "," << std::setw(6) << z1 << ") "
                      << "vel=" << std::setw(6) << vel1 << "     "
                      << "(" << std::setw(6) << x2 << "," << std::setw(6) << y2 << "," << std::setw(6) << z2 << ") "
                      << "vel=" << std::setw(6) << vel2 << std::endl;
        }
    }

    std::cout << std::string(100, '-') << std::endl;
    std::cout << "X range - Primary: [" << std::setprecision(2) << p_min_x << ", " << p_max_x
              << "] span=" << (p_max_x - p_min_x) << std::endl;
    std::cout << "X range - Secondary: [" << s_min_x << ", " << s_max_x
              << "] span=" << (s_max_x - s_min_x) << std::endl;

    bool primary_chaotic = (p_max_x - p_min_x) > 1.0;
    bool secondary_chaotic = (s_max_x - s_min_x) > 1.0;

    std::cout << "Resets triggered: " << reset_count << std::endl;
    std::cout << "\nVerdict: Primary " << (primary_chaotic ? "CHAOTIC ✓" : "STUCK ✗")
              << ", Secondary " << (secondary_chaotic ? "CHAOTIC ✓" : "STUCK ✗") << std::endl;
}

int main() {
    // Test with default parameters
    DadrasParams defaults;
    test_chaos_visibility(defaults, "Default Parameters (should be chaotic)");

    // Test with problematic c=0.5
    DadrasParams low_c;
    low_c.c = 0.5;
    test_chaos_visibility(low_c, "Low c=0.5 (was causing stuck behavior)");

    // Test with another parameter set
    DadrasParams high_a;
    high_a.a = 5.0;
    test_chaos_visibility(high_a, "High a=5.0");

    return 0;
}
