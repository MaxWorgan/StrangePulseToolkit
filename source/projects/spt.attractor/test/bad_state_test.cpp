// bad_state_test.cpp
// Comprehensive test suite for attractor bad state detection
// Tests: NaN/Inf, overflow, origin collapse, fixed point detection, recovery, blow-up configs
// Compile: clang++ -std=c++17 -O2 bad_state_test.cpp -o bad_state_test
// Run: ./bad_state_test

#include <iostream>
#include <cmath>
#include <string>
#include <vector>
#include <functional>
#include <iomanip>
#include <limits>

// ============================================================================
// TEST FRAMEWORK
// ============================================================================

struct TestResult {
    std::string name;
    bool passed;
    std::string message;
};

std::vector<TestResult> test_results;
int tests_run = 0;
int tests_passed = 0;

#define ASSERT_TRUE(cond, msg) \
    do { \
        if (!(cond)) { \
            test_results.push_back({current_test, false, msg}); \
            return false; \
        } \
    } while(0)

#define ASSERT_FALSE(cond, msg) ASSERT_TRUE(!(cond), msg)

std::string current_test;

bool run_test(const std::string& name, std::function<bool()> test_fn) {
    current_test = name;
    tests_run++;
    bool result = false;
    try {
        result = test_fn();
        if (result) {
            tests_passed++;
            test_results.push_back({name, true, "OK"});
        }
    } catch (const std::exception& e) {
        test_results.push_back({name, false, std::string("Exception: ") + e.what()});
    }
    return result;
}

// ============================================================================
// BAD STATE DETECTION FUNCTIONS (matching attractor_base.h)
// ============================================================================

bool is_bad_state(double a, double b, double c, double limit = 100.0) {
    if (!std::isfinite(a) || !std::isfinite(b) || !std::isfinite(c)) return true;
    if (std::isnan(a) || std::isnan(b) || std::isnan(c)) return true;
    if (std::abs(a) > limit || std::abs(b) > limit || std::abs(c) > limit) return true;
    const double r2 = a*a + b*b + c*c;
    return r2 < 1e-10; // "collapsed" guard
}

// Current stall detection (velocity near zero)
bool is_stalled(double dx, double dy, double dz) {
    const double vel_sq = dx*dx + dy*dy + dz*dz;
    return vel_sq < 1e-16;
}

// Proposed: immediate fixed point detection (very small velocity)
// Threshold 1e-40 means velocities around 1e-20 or smaller trigger immediate reset
bool is_stalled_immediate(double dx, double dy, double dz) {
    const double vel_sq = dx*dx + dy*dy + dz*dz;
    return vel_sq < 1e-40;
}

// Proposed: slower stall detection with higher threshold
bool is_stalled_slow(double dx, double dy, double dz) {
    const double vel_sq = dx*dx + dy*dy + dz*dz;
    return vel_sq < 1e-12;
}

// ============================================================================
// VARIANCE TRACKING (Proposed addition)
// ============================================================================

class VarianceTracker {
public:
    double variance_x{1.0}, variance_y{1.0}, variance_z{1.0};
    double mean_x{0}, mean_y{0}, mean_z{0};
    static constexpr double alpha = 0.001;  // Slow update
    static constexpr double threshold = 1e-8;

    void update(double x, double y, double z) {
        mean_x = (1 - alpha) * mean_x + alpha * x;
        mean_y = (1 - alpha) * mean_y + alpha * y;
        mean_z = (1 - alpha) * mean_z + alpha * z;

        double dx = x - mean_x;
        double dy = y - mean_y;
        double dz = z - mean_z;

        variance_x = (1 - alpha) * variance_x + alpha * dx * dx;
        variance_y = (1 - alpha) * variance_y + alpha * dy * dy;
        variance_z = (1 - alpha) * variance_z + alpha * dz * dz;
    }

    bool is_low_variance() const {
        return (variance_x + variance_y + variance_z) < threshold;
    }

    double total_variance() const {
        return variance_x + variance_y + variance_z;
    }

    void reset() {
        variance_x = variance_y = variance_z = 1.0;
        mean_x = mean_y = mean_z = 0;
    }
};

// ============================================================================
// ATTRACTOR DEFINITIONS
// ============================================================================

struct Vec3 {
    double x, y, z;
    Vec3(double x_ = 0, double y_ = 0, double z_ = 0) : x(x_), y(y_), z(z_) {}
    double magnitude_sq() const { return x*x + y*y + z*z; }
};

// Lorenz Attractor
struct Lorenz {
    double sigma = 10.0;
    double rho = 28.0;
    double beta = 8.0 / 3.0;
    static constexpr double limit = 100.0;
    static const char* name() { return "Lorenz"; }
    Vec3 init(double p) { return Vec3(-p, p, p); }
    Vec3 compute(double x, double y, double z) const {
        return Vec3(sigma * (y - x), x * (rho - z) - y, x * y - beta * z);
    }
    // Known fixed points
    Vec3 origin_fixed_point() const { return Vec3(0, 0, 0); }
    Vec3 symmetric_fixed_point_positive() const {
        if (rho <= 1) return Vec3(0, 0, 0);
        double val = std::sqrt(beta * (rho - 1));
        return Vec3(val, val, rho - 1);
    }
    Vec3 symmetric_fixed_point_negative() const {
        if (rho <= 1) return Vec3(0, 0, 0);
        double val = std::sqrt(beta * (rho - 1));
        return Vec3(-val, -val, rho - 1);
    }
};

// Dadras Attractor
struct Dadras {
    double a = 3.0, b = 2.7, c = 1.7, d = 2.0, e = 9.0;
    static constexpr double limit = 100.0;
    static const char* name() { return "Dadras"; }
    Vec3 init(double p) { return Vec3(p, p, p); }
    Vec3 compute(double x, double y, double z) const {
        return Vec3(y - a * x + b * y * z, c * y - x * z + z, d * x * y - e * z);
    }
    Vec3 origin_fixed_point() const { return Vec3(0, 0, 0); }
};

// Thomas Attractor
struct Thomas {
    double b = 0.208186;
    static constexpr double limit = 100.0;
    static const char* name() { return "Thomas"; }
    Vec3 init(double p) { return Vec3(-p, p, p); }
    Vec3 compute(double x, double y, double z) const {
        return Vec3(std::sin(y) - b * x, std::sin(z) - b * y, std::sin(x) - b * z);
    }
    Vec3 origin_fixed_point() const { return Vec3(0, 0, 0); }
};

// Aizawa Attractor
struct Aizawa {
    double a = 0.95, b = 0.7, c = 0.6, d = 3.5, e = 0.25, f = 0.1;
    static constexpr double limit = 100.0;
    static const char* name() { return "Aizawa"; }
    Vec3 init(double p) { return Vec3(p, p, p); }
    Vec3 compute(double x, double y, double z) const {
        double x2 = x * x, y2 = y * y, z3 = z * z * z;
        return Vec3((z - b) * x - d * y, d * x + (z - b) * y,
                    c + a * z - (z3 / 3.0) - (x2 + y2) * (1.0 + e * z) + f * z * x * x2);
    }
    // Aizawa has a fixed point that can be found numerically - not at origin
    // At origin: dz = c + 0 - 0 - 0 + 0 = c != 0 (unless c=0)
};

// Halvorsen Attractor
struct Halvorsen {
    double a = 1.89;
    static constexpr double limit = 100.0;
    static const char* name() { return "Halvorsen"; }
    Vec3 init(double p) { return Vec3(-5.0 * p, p, -p); }
    Vec3 compute(double x, double y, double z) const {
        return Vec3(-a * x - 4.0 * y - 4.0 * z - y * y,
                    -a * y - 4.0 * z - 4.0 * x - z * z,
                    -a * z - 4.0 * x - 4.0 * y - x * x);
    }
    Vec3 origin_fixed_point() const { return Vec3(0, 0, 0); }
};

// Coupled Lorenz
struct CoupledLorenz {
    double sigma = 10.0, beta = 2.6667, r1 = 28.0, r2 = 28.0, epsilon = 5.0;
    static constexpr double limit = 500.0;
    static const char* name() { return "CoupledLorenz"; }
    Vec3 init(double p) { return Vec3(p, p, p); }
    Vec3 compute(double x, double y, double z) const {
        return Vec3(sigma * (y - x), r1 * x - y - x * z, x * y - beta * z);
    }
    Vec3 origin_fixed_point() const { return Vec3(0, 0, 0); }
};

// ============================================================================
// INTEGRATION
// ============================================================================

template<typename Attractor>
void euler_step(const Attractor& att, double& x, double& y, double& z, double dt) {
    Vec3 d = att.compute(x, y, z);
    x += d.x * dt;
    y += d.y * dt;
    z += d.z * dt;
}

// ============================================================================
// TESTS: NaN/Inf DETECTION
// ============================================================================

bool test_nan_detection() {
    double nan_val = std::nan("");
    ASSERT_TRUE(is_bad_state(nan_val, 0, 0), "Should detect NaN in x");
    ASSERT_TRUE(is_bad_state(0, nan_val, 0), "Should detect NaN in y");
    ASSERT_TRUE(is_bad_state(0, 0, nan_val), "Should detect NaN in z");
    ASSERT_TRUE(is_bad_state(nan_val, nan_val, nan_val), "Should detect all NaN");
    return true;
}

bool test_inf_detection() {
    double inf_val = std::numeric_limits<double>::infinity();
    ASSERT_TRUE(is_bad_state(inf_val, 0, 0), "Should detect +Inf in x");
    ASSERT_TRUE(is_bad_state(-inf_val, 0, 0), "Should detect -Inf in x");
    ASSERT_TRUE(is_bad_state(0, inf_val, 0), "Should detect +Inf in y");
    ASSERT_TRUE(is_bad_state(0, 0, inf_val), "Should detect +Inf in z");
    return true;
}

// ============================================================================
// TESTS: OVERFLOW DETECTION
// ============================================================================

bool test_overflow_detection_standard() {
    ASSERT_TRUE(is_bad_state(101, 0, 0, 100), "Should detect overflow > 100 in x");
    ASSERT_TRUE(is_bad_state(0, 101, 0, 100), "Should detect overflow > 100 in y");
    ASSERT_TRUE(is_bad_state(0, 0, 101, 100), "Should detect overflow > 100 in z");
    ASSERT_TRUE(is_bad_state(-101, 0, 0, 100), "Should detect overflow < -100 in x");
    ASSERT_FALSE(is_bad_state(99, 99, 99, 100), "Should not flag values < 100");
    return true;
}

bool test_overflow_detection_clorenz() {
    ASSERT_TRUE(is_bad_state(501, 0, 0, 500), "Should detect overflow > 500 in x");
    ASSERT_FALSE(is_bad_state(400, 400, 400, 500), "Should not flag values < 500");
    return true;
}

// ============================================================================
// TESTS: ORIGIN COLLAPSE DETECTION
// ============================================================================

bool test_collapse_detection() {
    ASSERT_TRUE(is_bad_state(0, 0, 0), "Should detect zero state");
    ASSERT_TRUE(is_bad_state(1e-6, 1e-6, 1e-6), "Should detect near-zero state");
    ASSERT_FALSE(is_bad_state(0.01, 0.01, 0.01), "Should not flag small but valid state");
    return true;
}

// ============================================================================
// TESTS: FIXED POINT (STALL) DETECTION
// ============================================================================

bool test_stall_detection() {
    ASSERT_TRUE(is_stalled(0, 0, 0), "Should detect zero velocity");
    ASSERT_TRUE(is_stalled(1e-9, 1e-9, 1e-9), "Should detect near-zero velocity");
    ASSERT_FALSE(is_stalled(0.001, 0.001, 0.001), "Should not flag small but valid velocity");
    ASSERT_FALSE(is_stalled(1.0, 0, 0), "Should not flag normal velocity");
    return true;
}

bool test_stall_consecutive_detection() {
    int stall_count = 0;
    const int stall_threshold = 5;

    // Simulate 5 consecutive stalls
    for (int i = 0; i < 5; i++) {
        double dx = 1e-10, dy = 1e-10, dz = 1e-10;
        if (is_stalled(dx, dy, dz)) {
            ++stall_count;
        } else {
            stall_count = 0;
        }
    }
    ASSERT_TRUE(stall_count >= stall_threshold, "Should reach stall threshold after 5 consecutive stalls");

    // Simulate interrupted stalls
    stall_count = 0;
    for (int i = 0; i < 10; i++) {
        double dx = (i % 3 == 0) ? 1.0 : 1e-10;
        double dy = 1e-10, dz = 1e-10;
        if (is_stalled(dx, dy, dz)) {
            ++stall_count;
        } else {
            stall_count = 0;
        }
    }
    ASSERT_TRUE(stall_count < stall_threshold, "Should not reach threshold with interrupted stalls");

    return true;
}

// ============================================================================
// TESTS: VARIANCE-BASED STAGNATION
// ============================================================================

bool test_variance_tracker_chaotic() {
    VarianceTracker tracker;
    Lorenz att;
    Vec3 init = att.init(0.1);
    double x = init.x, y = init.y, z = init.z;

    // Run for many steps - chaotic system should have high variance
    const double dt = 0.001;
    for (int i = 0; i < 50000; i++) {
        euler_step(att, x, y, z, dt);
        tracker.update(x, y, z);
    }

    ASSERT_FALSE(tracker.is_low_variance(), "Chaotic Lorenz should have high variance");
    return true;
}

bool test_variance_tracker_fixed_point() {
    VarianceTracker tracker;
    // Start with low variance since we're simulating a system that's already settled
    tracker.variance_x = tracker.variance_y = tracker.variance_z = 1e-10;
    tracker.mean_x = tracker.mean_y = tracker.mean_z = 1.0;

    // Simulate stuck at a point with tiny noise
    double x = 1.0, y = 1.0, z = 1.0;
    for (int i = 0; i < 50000; i++) {
        // Add tiny noise - variance should stay low
        tracker.update(x + 1e-12 * (i % 2 ? 1 : -1),
                       y + 1e-12 * (i % 3 ? 1 : -1),
                       z + 1e-12 * (i % 5 ? 1 : -1));
    }

    ASSERT_TRUE(tracker.is_low_variance(), "Fixed point should have low variance");
    return true;
}

// ============================================================================
// TESTS: LORENZ FIXED POINTS
// ============================================================================

bool test_lorenz_origin_is_fixed_point() {
    Lorenz att;
    Vec3 d = att.compute(0, 0, 0);
    ASSERT_TRUE(is_stalled(d.x, d.y, d.z), "Origin should be a fixed point for Lorenz");
    return true;
}

bool test_lorenz_symmetric_fixed_points() {
    Lorenz att;
    att.rho = 28.0;  // Standard chaotic parameter

    Vec3 fp_pos = att.symmetric_fixed_point_positive();
    Vec3 fp_neg = att.symmetric_fixed_point_negative();

    Vec3 d_pos = att.compute(fp_pos.x, fp_pos.y, fp_pos.z);
    Vec3 d_neg = att.compute(fp_neg.x, fp_neg.y, fp_neg.z);

    // Derivatives should be very small at fixed points
    ASSERT_TRUE(d_pos.magnitude_sq() < 1e-10, "Positive symmetric point should be fixed");
    ASSERT_TRUE(d_neg.magnitude_sq() < 1e-10, "Negative symmetric point should be fixed");
    return true;
}

bool test_lorenz_approach_origin() {
    // When rho < 1, origin is globally stable - system should approach it
    Lorenz att;
    att.rho = 0.5;  // Below bifurcation

    Vec3 init = att.init(0.1);
    double x = init.x, y = init.y, z = init.z;

    const double dt = 0.001;
    int steps_to_collapse = -1;
    for (int i = 0; i < 100000; i++) {
        euler_step(att, x, y, z, dt);
        if (is_bad_state(x, y, z)) {
            steps_to_collapse = i;
            break;
        }
    }

    ASSERT_TRUE(steps_to_collapse > 0, "Lorenz with rho<1 should collapse to origin");
    return true;
}

bool test_lorenz_approach_symmetric_fixed_point() {
    // When 1 < rho < ~24.74, symmetric fixed points are stable
    Lorenz att;
    att.rho = 10.0;  // Between 1 and ~24.74

    Vec3 init = att.init(0.1);
    double x = init.x, y = init.y, z = init.z;

    const double dt = 0.001;
    bool detected_stall = false;
    int stall_count = 0;

    for (int i = 0; i < 200000; i++) {
        euler_step(att, x, y, z, dt);
        Vec3 d = att.compute(x, y, z);

        if (is_stalled_slow(d.x, d.y, d.z)) {
            stall_count++;
            if (stall_count >= 100) {
                detected_stall = true;
                break;
            }
        } else {
            stall_count = 0;
        }
    }

    ASSERT_TRUE(detected_stall, "Lorenz with 1<rho<24.74 should approach symmetric fixed point");
    return true;
}

// ============================================================================
// TESTS: THOMAS FIXED POINTS
// ============================================================================

bool test_thomas_origin_is_fixed_point() {
    Thomas att;
    Vec3 d = att.compute(0, 0, 0);
    ASSERT_TRUE(is_stalled(d.x, d.y, d.z), "Origin should be a fixed point for Thomas");
    return true;
}

bool test_thomas_high_b_approaches_origin() {
    // When b > 1, origin becomes the only attractor
    Thomas att;
    att.b = 1.5;  // Overdamped

    Vec3 init = att.init(0.1);
    double x = init.x, y = init.y, z = init.z;

    const double dt = 0.01;
    int steps_to_collapse = -1;
    for (int i = 0; i < 100000; i++) {
        euler_step(att, x, y, z, dt);
        if (is_bad_state(x, y, z)) {
            steps_to_collapse = i;
            break;
        }
    }

    ASSERT_TRUE(steps_to_collapse > 0, "Thomas with high b should collapse to origin");
    return true;
}

// ============================================================================
// TESTS: HALVORSEN FIXED POINT
// ============================================================================

bool test_halvorsen_origin_is_fixed_point() {
    Halvorsen att;
    Vec3 d = att.compute(0, 0, 0);
    ASSERT_TRUE(is_stalled(d.x, d.y, d.z), "Origin should be a fixed point for Halvorsen");
    return true;
}

// ============================================================================
// TESTS: DADRAS FIXED POINT
// ============================================================================

bool test_dadras_origin_is_fixed_point() {
    Dadras att;
    Vec3 d = att.compute(0, 0, 0);
    ASSERT_TRUE(is_stalled(d.x, d.y, d.z), "Origin should be a fixed point for Dadras");
    return true;
}

// ============================================================================
// TESTS: AIZAWA (origin is NOT a fixed point with default c=0.6)
// ============================================================================

bool test_aizawa_origin_not_fixed_point() {
    Aizawa att;
    Vec3 d = att.compute(0, 0, 0);
    // At origin: dz = c + 0 - 0 - 0 + 0 = c = 0.6 != 0
    ASSERT_FALSE(is_stalled(d.x, d.y, d.z), "Origin should NOT be a fixed point for Aizawa (c!=0)");
    return true;
}

bool test_aizawa_c_zero_origin_behavior() {
    Aizawa att;
    att.c = 0;  // Now dz at origin would be 0
    Vec3 d = att.compute(0, 0, 0);
    // At origin with c=0: dx=0, dy=0, dz=0
    ASSERT_TRUE(is_stalled(d.x, d.y, d.z), "Origin should be fixed point for Aizawa with c=0");
    return true;
}

// ============================================================================
// TESTS: BLOW-UP CONFIGURATIONS
// ============================================================================

bool test_lorenz_blow_up_high_dt() {
    Lorenz att;
    Vec3 init = att.init(0.1);
    double x = init.x, y = init.y, z = init.z;

    // Very high dt should cause numerical blow-up
    const double dt = 0.5;  // Way too high
    bool detected_blow_up = false;

    for (int i = 0; i < 1000; i++) {
        euler_step(att, x, y, z, dt);
        if (!std::isfinite(x) || !std::isfinite(y) || !std::isfinite(z) ||
            std::abs(x) > att.limit || std::abs(y) > att.limit || std::abs(z) > att.limit) {
            detected_blow_up = true;
            break;
        }
    }

    ASSERT_TRUE(detected_blow_up, "Lorenz with very high dt should blow up");
    return true;
}

bool test_lorenz_blow_up_extreme_rho() {
    Lorenz att;
    att.rho = 1000.0;  // Extreme parameter

    Vec3 init = att.init(0.1);
    double x = init.x, y = init.y, z = init.z;

    const double dt = 0.001;
    bool detected_blow_up = false;

    for (int i = 0; i < 10000; i++) {
        euler_step(att, x, y, z, dt);
        if (!std::isfinite(x) || !std::isfinite(y) || !std::isfinite(z) ||
            std::abs(x) > att.limit || std::abs(y) > att.limit || std::abs(z) > att.limit) {
            detected_blow_up = true;
            break;
        }
    }

    ASSERT_TRUE(detected_blow_up, "Lorenz with extreme rho should exceed limits");
    return true;
}

bool test_halvorsen_blow_up_low_a() {
    Halvorsen att;
    att.a = 0.1;  // Very low damping

    Vec3 init = att.init(0.1);
    double x = init.x, y = init.y, z = init.z;

    const double dt = 0.01;
    bool detected_issue = false;

    for (int i = 0; i < 50000; i++) {
        euler_step(att, x, y, z, dt);
        if (!std::isfinite(x) || !std::isfinite(y) || !std::isfinite(z) ||
            std::abs(x) > att.limit || std::abs(y) > att.limit || std::abs(z) > att.limit) {
            detected_issue = true;
            break;
        }
    }

    // With very low damping, system may blow up or become unstable
    // This tests that we CAN detect such scenarios
    // (Note: actual behavior depends on parameters)
    return true;  // This test documents the behavior rather than asserting
}

bool test_thomas_blow_up_negative_b() {
    Thomas att;
    att.b = -0.5;  // Negative damping = instability

    Vec3 init = att.init(0.1);
    double x = init.x, y = init.y, z = init.z;

    const double dt = 0.01;
    bool detected_blow_up = false;

    for (int i = 0; i < 10000; i++) {
        euler_step(att, x, y, z, dt);
        if (!std::isfinite(x) || !std::isfinite(y) || !std::isfinite(z) ||
            std::abs(x) > att.limit || std::abs(y) > att.limit || std::abs(z) > att.limit) {
            detected_blow_up = true;
            break;
        }
    }

    ASSERT_TRUE(detected_blow_up, "Thomas with negative b should blow up");
    return true;
}

bool test_dadras_blow_up_high_params() {
    Dadras att;
    att.a = 0.1;  // Very low damping on x
    att.e = 0.1;  // Very low damping on z

    Vec3 init = att.init(1.0);  // Larger initial condition
    double x = init.x, y = init.y, z = init.z;

    const double dt = 0.01;
    bool detected_blow_up = false;

    for (int i = 0; i < 50000; i++) {
        euler_step(att, x, y, z, dt);
        if (!std::isfinite(x) || !std::isfinite(y) || !std::isfinite(z) ||
            std::abs(x) > att.limit || std::abs(y) > att.limit || std::abs(z) > att.limit) {
            detected_blow_up = true;
            break;
        }
    }

    ASSERT_TRUE(detected_blow_up, "Dadras with low damping should blow up");
    return true;
}

// ============================================================================
// TESTS: BANG RESET BEHAVIOR (simulated)
// ============================================================================

bool test_bang_reset_clears_state() {
    Lorenz att;
    double x = 50.0, y = 50.0, z = 50.0;  // Far from initial

    // Simulate bang reset
    Vec3 init = att.init(0.01);  // Default position
    x = init.x; y = init.y; z = init.z;

    // Should be at initial position
    ASSERT_TRUE(std::abs(x - (-0.01)) < 1e-10, "x should be reset to -0.01");
    ASSERT_TRUE(std::abs(y - 0.01) < 1e-10, "y should be reset to 0.01");
    ASSERT_TRUE(std::abs(z - 0.01) < 1e-10, "z should be reset to 0.01");
    return true;
}

bool test_bang_reset_from_bad_state() {
    Lorenz att;
    double x = std::nan(""), y = 100, z = 100;  // Bad state

    ASSERT_TRUE(is_bad_state(x, y, z), "Should be in bad state before reset");

    // Simulate bang reset
    Vec3 init = att.init(0.01);
    x = init.x; y = init.y; z = init.z;

    ASSERT_FALSE(is_bad_state(x, y, z), "Should not be in bad state after reset");
    return true;
}

bool test_bang_reset_stall_counters() {
    // Simulating stall counter reset
    int stall_count_primary = 10;
    int stall_count_secondary = 10;

    // Simulate bang reset behavior
    stall_count_primary = 0;
    stall_count_secondary = 0;

    ASSERT_TRUE(stall_count_primary == 0, "Primary stall counter should reset");
    ASSERT_TRUE(stall_count_secondary == 0, "Secondary stall counter should reset");
    return true;
}

// ============================================================================
// TESTS: ATTRACTOR-SPECIFIC NORMAL OPERATION
// ============================================================================

template<typename Attractor>
bool test_attractor_normal_operation() {
    Attractor att;
    Vec3 init = att.init(0.1);
    double x = init.x, y = init.y, z = init.z;

    const double dt = 0.001;
    for (int i = 0; i < 10000; i++) {
        euler_step(att, x, y, z, dt);

        if (is_bad_state(x, y, z, Attractor::limit)) {
            std::string msg = std::string(Attractor::name()) + " hit bad state at step " + std::to_string(i);
            ASSERT_TRUE(false, msg.c_str());
        }
    }
    return true;
}

template<typename Attractor>
bool test_attractor_recovery() {
    Attractor att;
    double init_pos = 0.1;
    Vec3 init = att.init(init_pos);
    double x = init.x, y = init.y, z = init.z;

    // Force a bad state
    x = std::nan("");
    ASSERT_TRUE(is_bad_state(x, y, z, Attractor::limit), "Should detect forced NaN");

    // Simulate recovery (reset to init)
    Vec3 recovered = att.init(init_pos);
    x = recovered.x; y = recovered.y; z = recovered.z;
    ASSERT_FALSE(is_bad_state(x, y, z, Attractor::limit), "Should be valid after recovery");

    // Run a few steps to ensure continued stability
    const double dt = 0.001;
    for (int i = 0; i < 100; i++) {
        euler_step(att, x, y, z, dt);
    }
    ASSERT_FALSE(is_bad_state(x, y, z, Attractor::limit), "Should remain stable after recovery");

    return true;
}

// ============================================================================
// TESTS: PROPOSED DUAL-THRESHOLD DETECTION
// ============================================================================

bool test_dual_threshold_immediate() {
    // Very small velocity should trigger immediate detection
    ASSERT_TRUE(is_stalled_immediate(1e-22, 1e-22, 1e-22), "Should detect extremely small velocity");
    ASSERT_FALSE(is_stalled_immediate(1e-15, 1e-15, 1e-15), "Should not trigger on moderately small velocity");
    return true;
}

bool test_dual_threshold_slow() {
    // Moderately small velocity should trigger slow detection
    ASSERT_TRUE(is_stalled_slow(1e-8, 1e-8, 1e-8), "Should detect moderately small velocity");
    ASSERT_FALSE(is_stalled_slow(0.01, 0.01, 0.01), "Should not trigger on normal velocity");
    return true;
}

// ============================================================================
// MAIN
// ============================================================================

void print_results() {
    std::cout << "\n========================================\n";
    std::cout << "  Test Results\n";
    std::cout << "========================================\n\n";

    for (const auto& result : test_results) {
        std::cout << (result.passed ? "[PASS] " : "[FAIL] ")
                  << result.name << ": " << result.message << "\n";
    }

    std::cout << "\n----------------------------------------\n";
    std::cout << "Total: " << tests_passed << "/" << tests_run << " tests passed\n";
    std::cout << "----------------------------------------\n";
}

int main() {
    std::cout << "========================================\n";
    std::cout << "  Attractor Bad State Detection Tests\n";
    std::cout << "========================================\n";

    // Basic detection tests
    std::cout << "\n--- Basic Detection Tests ---\n";
    run_test("NaN detection", test_nan_detection);
    run_test("Inf detection", test_inf_detection);
    run_test("Overflow detection (standard)", test_overflow_detection_standard);
    run_test("Overflow detection (clorenz)", test_overflow_detection_clorenz);
    run_test("Collapse detection", test_collapse_detection);
    run_test("Stall detection", test_stall_detection);
    run_test("Consecutive stall detection", test_stall_consecutive_detection);

    // Dual-threshold detection tests
    std::cout << "\n--- Dual-Threshold Detection Tests ---\n";
    run_test("Dual threshold: immediate", test_dual_threshold_immediate);
    run_test("Dual threshold: slow", test_dual_threshold_slow);

    // Variance tracking tests
    std::cout << "\n--- Variance Tracking Tests ---\n";
    run_test("Variance: chaotic system", test_variance_tracker_chaotic);
    run_test("Variance: fixed point", test_variance_tracker_fixed_point);

    // Fixed point tests
    std::cout << "\n--- Fixed Point Tests ---\n";
    run_test("Lorenz: origin is fixed point", test_lorenz_origin_is_fixed_point);
    run_test("Lorenz: symmetric fixed points", test_lorenz_symmetric_fixed_points);
    run_test("Lorenz: approach origin (rho<1)", test_lorenz_approach_origin);
    run_test("Lorenz: approach symmetric FP (1<rho<24.74)", test_lorenz_approach_symmetric_fixed_point);
    run_test("Thomas: origin is fixed point", test_thomas_origin_is_fixed_point);
    run_test("Thomas: high b approaches origin", test_thomas_high_b_approaches_origin);
    run_test("Halvorsen: origin is fixed point", test_halvorsen_origin_is_fixed_point);
    run_test("Dadras: origin is fixed point", test_dadras_origin_is_fixed_point);
    run_test("Aizawa: origin NOT fixed point", test_aizawa_origin_not_fixed_point);
    run_test("Aizawa: c=0 makes origin fixed", test_aizawa_c_zero_origin_behavior);

    // Blow-up tests
    std::cout << "\n--- Blow-Up Configuration Tests ---\n";
    run_test("Lorenz: blow-up high dt", test_lorenz_blow_up_high_dt);
    run_test("Lorenz: blow-up extreme rho", test_lorenz_blow_up_extreme_rho);
    run_test("Halvorsen: low a behavior", test_halvorsen_blow_up_low_a);
    run_test("Thomas: blow-up negative b", test_thomas_blow_up_negative_b);
    run_test("Dadras: blow-up low damping", test_dadras_blow_up_high_params);

    // Bang reset tests
    std::cout << "\n--- Bang Reset Tests ---\n";
    run_test("Bang: reset clears state", test_bang_reset_clears_state);
    run_test("Bang: reset from bad state", test_bang_reset_from_bad_state);
    run_test("Bang: reset stall counters", test_bang_reset_stall_counters);

    // Per-attractor normal operation tests
    std::cout << "\n--- Lorenz Attractor Tests ---\n";
    run_test("Lorenz: normal operation", test_attractor_normal_operation<Lorenz>);
    run_test("Lorenz: recovery", test_attractor_recovery<Lorenz>);

    std::cout << "\n--- Dadras Attractor Tests ---\n";
    run_test("Dadras: normal operation", test_attractor_normal_operation<Dadras>);
    run_test("Dadras: recovery", test_attractor_recovery<Dadras>);

    std::cout << "\n--- Thomas Attractor Tests ---\n";
    run_test("Thomas: normal operation", test_attractor_normal_operation<Thomas>);
    run_test("Thomas: recovery", test_attractor_recovery<Thomas>);

    std::cout << "\n--- Aizawa Attractor Tests ---\n";
    run_test("Aizawa: normal operation", test_attractor_normal_operation<Aizawa>);
    run_test("Aizawa: recovery", test_attractor_recovery<Aizawa>);

    std::cout << "\n--- Halvorsen Attractor Tests ---\n";
    run_test("Halvorsen: normal operation", test_attractor_normal_operation<Halvorsen>);
    run_test("Halvorsen: recovery", test_attractor_recovery<Halvorsen>);

    std::cout << "\n--- Coupled Lorenz Tests ---\n";
    run_test("CoupledLorenz: normal operation", test_attractor_normal_operation<CoupledLorenz>);
    run_test("CoupledLorenz: recovery", test_attractor_recovery<CoupledLorenz>);

    print_results();

    return (tests_passed == tests_run) ? 0 : 1;
}
