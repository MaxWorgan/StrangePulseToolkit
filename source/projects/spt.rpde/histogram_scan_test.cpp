// Standalone test for the spt.rpde recurrence-period scan.
//
// spt.rpde cannot be compiled outside the Max runtime, so this test *models*
// the production scan and keeps it in sync by hand.
//
// Two models are defined:
//   * scan_old — the OLD inner loop: re-reads the reference vector's strided
//     components from the window on every j, bounds the scan with a
//     `lag > dmax` break, and guards the histogram write with
//     `lag > dmin && lag <= dmax`.
//   * scan_new — the NEW inner loop: hoists the reference vector y_i out of
//     the j scan, precomputes `jend = min(N, i + dmax + 1)`, and writes
//     histogram[j - i] unguarded.
//
// The optimisation is meant to be purely mechanical, so the test proves the
// two produce byte-identical histograms across randomised windows and
// parameter combinations. The guard removal is the subtle part: it is only
// sound because j < jend caps the lag at dmax and j > jstart == i + dmin
// guarantees the lag exceeds dmin, so both former conditions hold by
// construction.
//
// Also asserts the stack-buffer precondition the new form introduces: the
// hoisted `float yi[kMaxDim]` is safe only while dim stays within the
// `dim` attribute's clamp, declared in spt.rpde.cpp as range{1, 20}.
//
// Build:  clang++ -std=c++17 -O2 histogram_scan_test.cpp -o histogram_scan_test
//
// Keep in sync with source/projects/spt.rpde/spt.rpde.cpp compute_rpde().

#include <algorithm>
#include <iostream>
#include <random>
#include <string>
#include <vector>

static int failures = 0;

static void check(bool cond, const std::string& what) {
    if (!cond) {
        std::cout << "  FAIL: " << what << std::endl;
        ++failures;
    }
}

// kMaxDim in spt.rpde.cpp must not be smaller than the dim attribute's upper
// clamp, or the hoisted yi[] overflows. Mirrored here so the pair stay honest.
static constexpr int kMaxDim = 20;
static constexpr int kDimAttributeMax = 20;   // range{1, 20} in spt.rpde.cpp

// ---------------------------------------------------------------------------
// OLD: reference vector re-read per j; break on lag; guarded histogram write.
static std::vector<int> scan_old(const float* w, int N, int dim, int tau,
                                 int dmin, int dmax, float eps2, int hsize) {
    std::vector<int> histogram(hsize, 0);
    for (int i = 0; i < N; ++i) {
        int jstart = i + dmin;
        if (jstart >= N)
            continue;

        float init_dist2 = 0.0f;
        for (int k = 0; k < dim; ++k) {
            float diff = w[i + k * tau] - w[jstart + k * tau];
            init_dist2 += diff * diff;
        }
        bool inside = (init_dist2 < eps2);
        bool has_exited = !inside;

        for (int j = jstart + 1; j < N; ++j) {
            int lag = j - i;
            if (lag > dmax)
                break;

            float dist2 = 0.0f;
            for (int k = 0; k < dim; ++k) {
                float diff = w[i + k * tau] - w[j + k * tau];
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
    return histogram;
}

// ---------------------------------------------------------------------------
// NEW: y_i hoisted; jend precomputed; histogram write unguarded.
static std::vector<int> scan_new(const float* w, int N, int dim, int tau,
                                 int dmin, int dmax, float eps2, int hsize) {
    std::vector<int> histogram(hsize, 0);
    float yi[kMaxDim];

    for (int i = 0; i < N; ++i) {
        int jstart = i + dmin;
        if (jstart >= N)
            continue;

        for (int k = 0; k < dim; ++k)
            yi[k] = w[i + k * tau];

        float init_dist2 = 0.0f;
        for (int k = 0; k < dim; ++k) {
            float diff = yi[k] - w[jstart + k * tau];
            init_dist2 += diff * diff;
        }
        bool inside = (init_dist2 < eps2);
        bool has_exited = !inside;

        const int jend = std::min(N, i + dmax + 1);
        for (int j = jstart + 1; j < jend; ++j) {
            float dist2 = 0.0f;
            for (int k = 0; k < dim; ++k) {
                float diff = yi[k] - w[j + k * tau];
                dist2 += diff * diff;
            }
            bool now_inside = (dist2 < eps2);

            if (inside && !now_inside) {
                has_exited = true;
            }
            else if (!inside && now_inside && has_exited) {
                histogram[j - i] += 1;
                has_exited = false;
            }
            inside = now_inside;
        }
    }
    return histogram;
}

// ---------------------------------------------------------------------------
static void test_equivalence(int trials) {
    std::mt19937 rng(20260721);
    std::uniform_int_distribution<int> dN(40, 240), dDim(1, kDimAttributeMax), dTau(1, 8);
    std::uniform_real_distribution<float> dv(-1.0f, 1.0f);
    int compared = 0;

    for (int t = 0; t < trials; ++t) {
        int dim = dDim(rng);
        int tau = dTau(rng);
        int span = (dim - 1) * tau;
        int N = dN(rng);
        if (N <= span + 4)
            N = span + 40;

        int dmin = 1 + static_cast<int>(rng() % 5);
        int dmax = dmin + 1 + static_cast<int>(rng() % 60);
        int hsize = dmax + 2;

        std::vector<float> w(static_cast<size_t>(N + span + 8));
        for (auto& v : w)
            v = dv(rng);
        float eps2 = 0.02f + static_cast<float>(rng() % 100) / 400.0f;

        auto a = scan_old(w.data(), N, dim, tau, dmin, dmax, eps2, hsize);
        auto b = scan_new(w.data(), N, dim, tau, dmin, dmax, eps2, hsize);

        if (a != b) {
            std::cout << "  mismatch at N=" << N << " dim=" << dim << " tau=" << tau
                      << " dmin=" << dmin << " dmax=" << dmax << std::endl;
            check(false, "histograms differ");
            return;
        }
        ++compared;
    }
    std::cout << "  " << compared << " randomised windows, histograms identical" << std::endl;
}

// Degenerate shapes the randomised sweep is unlikely to hit.
static void test_edges() {
    std::vector<float> w(512, 0.25f);

    // every point inside the ball: no exit, so nothing is ever recorded
    auto flat_old = scan_old(w.data(), 64, 3, 2, 2, 20, 1.0f, 32);
    auto flat_new = scan_new(w.data(), 64, 3, 2, 2, 20, 1.0f, 32);
    check(flat_old == flat_new, "constant window");
    check(std::all_of(flat_new.begin(), flat_new.end(), [](int v) { return v == 0; }),
          "constant window should record no returns");

    // dmin immediately past the end: every i short-circuits
    auto none_old = scan_old(w.data(), 8, 2, 1, 32, 40, 0.5f, 64);
    auto none_new = scan_new(w.data(), 8, 2, 1, 32, 40, 0.5f, 64);
    check(none_old == none_new, "dmin beyond window");

    // dmax == dmin + 1: the tightest possible scan
    for (size_t i = 0; i < w.size(); ++i)
        w[i] = (i % 7 < 3) ? 0.0f : 1.0f;
    auto tight_old = scan_old(w.data(), 96, 2, 3, 4, 5, 0.1f, 8);
    auto tight_new = scan_new(w.data(), 96, 2, 3, 4, 5, 0.1f, 8);
    check(tight_old == tight_new, "dmax == dmin + 1");

    // the histogram is only large enough because lag never exceeds dmax
    auto within = scan_new(w.data(), 96, 2, 3, 4, 5, 0.1f, 8);
    for (size_t lag = 6; lag < within.size(); ++lag)
        check(within[lag] == 0, "no lag beyond dmax recorded");

    std::cout << "  edge cases agree" << std::endl;
}

static void test_dim_bound() {
    check(kMaxDim >= kDimAttributeMax,
          "kMaxDim must cover the dim attribute clamp, or yi[] overflows");
    std::cout << "  yi[] capacity " << kMaxDim
              << " covers dim clamp " << kDimAttributeMax << std::endl;
}

int main() {
    std::cout << "=== spt.rpde recurrence-period scan ===" << std::endl;

    std::cout << "\n--- Old vs new equivalence ---" << std::endl;
    test_equivalence(400);

    std::cout << "\n--- Edge cases ---" << std::endl;
    test_edges();

    std::cout << "\n--- Hoisted buffer bound ---" << std::endl;
    test_dim_bound();

    std::cout << "\n=== "
              << (failures == 0 ? "ALL TESTS PASSED"
                                : (std::to_string(failures) + " FAILURE(S)"))
              << " ===" << std::endl;
    return failures == 0 ? 0 : 1;
}
