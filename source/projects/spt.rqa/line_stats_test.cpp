// Standalone test for the spt.rqa recurrence count and vertical-line stats.
//
// spt.rqa cannot be compiled outside the Max runtime, so this test *models*
// the production analysis and keeps it in sync by hand.
//
// Two changes are covered, both meant to be purely mechanical:
//
//   * recurrence_count — OLD swept the upper triangle of R after the fill;
//     NEW counts during the fill, incrementing only when the neighbour index
//     exceeds the query index. Sound because the metric is symmetric, so each
//     unordered pair is returned from both endpoints and is therefore seen
//     exactly once with m.first > i.
//
//   * vertical lines — OLD scanned column-major, restarting a run wherever
//     R[i][j] == 1 and the cell above was 0; NEW scans row-major in runs.
//     Sound because R is symmetric, so the vertical runs of column j are the
//     horizontal runs of row j. The point of the change is memory order: the
//     column scan strided N per access and missed cache on every read.
//
// The test builds symmetric zero-diagonal matrices (what the real fill
// produces) across a range of densities and v_min values and proves the two
// forms agree on all three published quantities: recurrence_count,
// vert_line_points and the vertical line count that feeds TT.
//
// Build:  clang++ -std=c++17 -O2 line_stats_test.cpp -o line_stats_test
//
// Keep in sync with source/projects/spt.rqa/spt.rqa.cpp analysis thread.

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

struct Stats {
    size_t recurrence_count = 0;
    size_t vert_line_points = 0;
    size_t vert_line_count = 0;
    bool operator==(const Stats& o) const {
        return recurrence_count == o.recurrence_count
            && vert_line_points == o.vert_line_points
            && vert_line_count == o.vert_line_count;
    }
};

// ---------------------------------------------------------------------------
// OLD: upper-triangle count, then a column-major vertical-line scan collecting
// every run length into a vector.
static Stats stats_old(const std::vector<char>& R, size_t N, int v_min) {
    Stats s;

    for (size_t i = 0; i < N; i++)
        for (size_t j = i + 1; j < N; j++)
            if (R[i * N + j] == 1)
                s.recurrence_count++;

    std::vector<int> vert_lengths;
    for (size_t j = 0; j < N; j++) {
        for (size_t i = 0; i < N; i++) {
            if (R[i * N + j] == 1) {
                if (i == 0 || R[(i - 1) * N + j] == 0) {
                    int v_len = 0;
                    size_t ii = i;
                    while (ii < N && R[ii * N + j] == 1) {
                        v_len++;
                        ii++;
                    }
                    if (v_len >= v_min)
                        vert_lengths.push_back(v_len);
                }
            }
        }
    }
    for (int v : vert_lengths)
        s.vert_line_points += static_cast<size_t>(v);
    s.vert_line_count = vert_lengths.size();
    return s;
}

// ---------------------------------------------------------------------------
// NEW: count during the fill (m.first > i), row-major run scan, running totals
// instead of a collected vector.
static Stats stats_new(const std::vector<char>& R, size_t N, int v_min) {
    Stats s;

    // stands in for the radiusSearch fill loop: for each query point i, every
    // neighbour j != i is visited; the pair is counted once, when j > i
    for (size_t i = 0; i < N; i++)
        for (size_t j = 0; j < N; j++)
            if (j != i && R[i * N + j] == 1 && j > i)
                s.recurrence_count++;

    for (size_t i = 0; i < N; i++) {
        const char* row = &R[i * N];
        size_t j = 0;
        while (j < N) {
            if (row[j] == 1) {
                size_t start = j;
                while (j < N && row[j] == 1)
                    j++;
                int v_len = static_cast<int>(j - start);
                if (v_len >= v_min) {
                    s.vert_line_points += static_cast<size_t>(v_len);
                    s.vert_line_count++;
                }
            }
            else {
                j++;
            }
        }
    }
    return s;
}

// Symmetric, zero diagonal — the shape the real fill produces.
static std::vector<char> random_R(std::mt19937& rng, size_t N, double density) {
    std::vector<char> R(N * N, 0);
    for (size_t i = 0; i < N; i++) {
        for (size_t j = i + 1; j < N; j++) {
            if (static_cast<double>(rng() % 1000) / 1000.0 < density) {
                R[i * N + j] = 1;
                R[j * N + i] = 1;
            }
        }
    }
    return R;
}

static void test_equivalence(int trials) {
    std::mt19937 rng(20260721);
    int compared = 0;

    for (int t = 0; t < trials; ++t) {
        size_t N = 8 + (rng() % 90);
        double density = 0.05 + static_cast<double>(rng() % 60) / 100.0;
        int v_min = 2 + static_cast<int>(rng() % 4);

        auto R = random_R(rng, N, density);
        Stats a = stats_old(R, N, v_min);
        Stats b = stats_new(R, N, v_min);

        if (!(a == b)) {
            std::cout << "  mismatch at N=" << N << " v_min=" << v_min
                      << "  old(" << a.recurrence_count << "," << a.vert_line_points
                      << "," << a.vert_line_count << ")"
                      << "  new(" << b.recurrence_count << "," << b.vert_line_points
                      << "," << b.vert_line_count << ")" << std::endl;
            check(false, "stats differ");
            return;
        }
        ++compared;
    }
    std::cout << "  " << compared << " randomised matrices, stats identical" << std::endl;
}

static void test_edges() {
    // empty matrix: no recurrences, no lines
    std::vector<char> empty(32 * 32, 0);
    check(stats_old(empty, 32, 2) == stats_new(empty, 32, 2), "empty matrix");
    check(stats_new(empty, 32, 2).recurrence_count == 0, "empty matrix has no recurrences");

    // fully dense off-diagonal: every row is one long run broken by the diagonal
    size_t N = 24;
    std::vector<char> full(N * N, 1);
    for (size_t i = 0; i < N; i++)
        full[i * N + i] = 0;
    check(stats_old(full, N, 2) == stats_new(full, N, 2), "dense matrix");
    check(stats_new(full, N, 2).recurrence_count == N * (N - 1) / 2,
          "dense matrix should count every unordered pair once");

    // runs shorter than v_min must be discarded by both
    std::vector<char> sparse(16 * 16, 0);
    sparse[2 * 16 + 5] = 1;
    sparse[5 * 16 + 2] = 1;
    check(stats_old(sparse, 16, 2) == stats_new(sparse, 16, 2), "isolated point");
    check(stats_new(sparse, 16, 2).vert_line_count == 0,
          "a single point is shorter than v_min and is not a line");

    // v_min == 2 vs a large v_min on the same matrix
    std::mt19937 rng(7);
    auto R = random_R(rng, 40, 0.35);
    check(stats_old(R, 40, 2) == stats_new(R, 40, 2), "v_min = 2");
    check(stats_old(R, 40, 12) == stats_new(R, 40, 12), "v_min = 12");

    std::cout << "  edge cases agree" << std::endl;
}

// The row-scan rewrite is only valid while R is symmetric; if the fill ever
// stops writing both [i][j] and [j][i], this assumption silently breaks.
static void test_symmetry_assumption() {
    std::mt19937 rng(11);
    auto R = random_R(rng, 48, 0.3);
    size_t N = 48;
    bool symmetric = true;
    for (size_t i = 0; i < N && symmetric; i++)
        for (size_t j = 0; j < N; j++)
            if (R[i * N + j] != R[j * N + i]) { symmetric = false; break; }
    check(symmetric, "test fixture must be symmetric to model the real fill");
    std::cout << "  symmetry precondition holds" << std::endl;
}

int main() {
    std::cout << "=== spt.rqa recurrence count + vertical-line stats ===" << std::endl;

    std::cout << "\n--- Old vs new equivalence ---" << std::endl;
    test_equivalence(400);

    std::cout << "\n--- Edge cases ---" << std::endl;
    test_edges();

    std::cout << "\n--- Symmetry precondition ---" << std::endl;
    test_symmetry_assumption();

    std::cout << "\n=== "
              << (failures == 0 ? "ALL TESTS PASSED"
                                : (std::to_string(failures) + " FAILURE(S)"))
              << " ===" << std::endl;
    return failures == 0 ? 0 : 1;
}
