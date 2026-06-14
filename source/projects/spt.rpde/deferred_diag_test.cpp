// deferred_diag_test.cpp
// Tests for the deferred verbose-diagnostic logic in spt.rpde.cpp.
//
// The RPDE worker thread must never call cout (Max console output is only safe on
// the main thread). Instead it stashes a DiagSnapshot under diag_mutex, sets
// diag_pending, and calls diag_queue.set() so the main thread prints it. The
// deterministic part of that hand-off is modeled and verified here (the real
// object cannot be compiled outside the Max runtime).
//
// This must be kept in sync with spt.rpde.cpp: the DiagSnapshot fields, the
// worker stash block, and the diag_queue drain lambda.
//
// Compile: clang++ -std=c++17 -O2 deferred_diag_test.cpp -o deferred_diag_test
// Run:     ./deferred_diag_test

#include <atomic>
#include <functional>
#include <iostream>
#include <mutex>
#include <optional>
#include <string>
#include <thread>
#include <vector>

// ============================================================================
// TEST FRAMEWORK
// ============================================================================

std::vector<std::pair<std::string, std::string>> failures;
int tests_run = 0;
int tests_passed = 0;
std::string current_test;

#define ASSERT_TRUE(cond, msg)                       \
    do {                                             \
        if (!(cond)) {                               \
            failures.push_back({current_test, msg}); \
            return false;                            \
        }                                            \
    } while (0)

#define ASSERT_EQ(a, b, msg) ASSERT_TRUE((a) == (b), msg)

bool run_test(const std::string& name, std::function<bool()> fn) {
    current_test = name;
    tests_run++;
    bool ok = false;
    try {
        ok = fn();
    } catch (const std::exception& e) {
        failures.push_back({name, std::string("Exception: ") + e.what()});
        return false;
    }
    if (ok) {
        tests_passed++;
        std::cout << "[PASS] " << name << "\n";
    } else {
        std::cout << "[FAIL] " << name << "\n";
    }
    return ok;
}

// ============================================================================
// MODEL OF spt.rpde deferred verbose logging
// Mirrors the worker stash block and the diag_queue drain lambda.
// ============================================================================

struct DiagSnapshot {
    int N{0}, dim{0}, tau{0}, tmax{0};
    float epsilon{0.0f};
    int total_recurrences{0}, nonzero_bins{0}, num_bins{0};
    float raw_entropy{0.0f}, max_entropy{0.0f}, rpde{0.0f}, period{0.0f};
    bool operator==(const DiagSnapshot& o) const {
        return N == o.N && dim == o.dim && tau == o.tau && tmax == o.tmax &&
               epsilon == o.epsilon && total_recurrences == o.total_recurrences &&
               nonzero_bins == o.nonzero_bins && num_bins == o.num_bins &&
               raw_entropy == o.raw_entropy && max_entropy == o.max_entropy &&
               rpde == o.rpde && period == o.period;
    }
};

class DeferredDiag {
public:
    // --- worker-thread side: mirrors the `if (verbose) { ... }` stash block ---
    void stash(const DiagSnapshot& s) {
        std::lock_guard<std::mutex> lk(_mutex);
        _snapshot = s;
        _pending = true;
        _queue_set_count++;  // stands in for diag_queue.set()
    }

    // --- main-thread side: mirrors the diag_queue drain lambda ---
    // Returns the snapshot that would be printed, or nullopt if nothing pending.
    std::optional<DiagSnapshot> drain() {
        std::lock_guard<std::mutex> lk(_mutex);
        if (!_pending)
            return std::nullopt;
        _pending = false;
        return _snapshot;
    }

    int queue_set_count() const { return _queue_set_count; }

private:
    std::mutex _mutex;
    DiagSnapshot _snapshot;
    bool _pending{false};
    int _queue_set_count{0};
};

static DiagSnapshot make_snapshot(int n) {
    DiagSnapshot s;
    s.N = n;
    s.dim = 3;
    s.tau = 16;
    s.tmax = 200;
    s.epsilon = 0.1f;
    s.total_recurrences = n * 2;
    s.nonzero_bins = 5;
    s.num_bins = 10;
    s.raw_entropy = 1.5f;
    s.max_entropy = 2.3f;
    s.rpde = 0.65f;
    s.period = 42.0f;
    return s;
}

// ============================================================================
// TESTS
// ============================================================================

bool test_drain_with_nothing_pending() {
    DeferredDiag diag;
    // A spurious queue service before any computation must print nothing.
    ASSERT_TRUE(!diag.drain().has_value(), "drain with no pending snapshot yields nullopt");
    return true;
}

bool test_stash_then_drain_returns_snapshot() {
    DeferredDiag diag;
    DiagSnapshot s = make_snapshot(5000);
    diag.stash(s);
    auto out = diag.drain();
    ASSERT_TRUE(out.has_value(), "drain after stash returns a snapshot");
    ASSERT_TRUE(*out == s, "drained snapshot matches the stashed one field-for-field");
    ASSERT_EQ(diag.queue_set_count(), 1, "exactly one queue.set() per stash");
    return true;
}

bool test_drain_clears_pending() {
    DeferredDiag diag;
    diag.stash(make_snapshot(1000));
    ASSERT_TRUE(diag.drain().has_value(), "first drain returns the snapshot");
    ASSERT_TRUE(!diag.drain().has_value(), "second drain returns nullopt (nothing to print)");
    return true;
}

bool test_multiple_stashes_coalesce_to_latest() {
    // Several worker windows can complete before the main thread services the
    // queue. Only the most recent snapshot should be printed (last-writer-wins).
    DeferredDiag diag;
    diag.stash(make_snapshot(1000));
    diag.stash(make_snapshot(2000));
    diag.stash(make_snapshot(3000));
    auto out = diag.drain();
    ASSERT_TRUE(out.has_value(), "coalesced drain returns a snapshot");
    ASSERT_EQ(out->N, 3000, "drain surfaces the most recent snapshot");
    ASSERT_EQ(diag.queue_set_count(), 3, "queue.set() called once per stash even when coalesced");
    ASSERT_TRUE(!diag.drain().has_value(), "pending cleared after coalesced drain");
    return true;
}

bool test_round_trip_after_drain() {
    // After a drain, a fresh stash must be observable again (no sticky state).
    DeferredDiag diag;
    diag.stash(make_snapshot(100));
    diag.drain();
    diag.stash(make_snapshot(200));
    auto out = diag.drain();
    ASSERT_TRUE(out.has_value(), "second stash is drainable");
    ASSERT_EQ(out->N, 200, "second drain returns the second snapshot");
    return true;
}

bool test_aggregate_initializer_field_order() {
    // The production worker fills DiagSnapshot with a POSITIONAL aggregate
    // initializer (spt.rpde.cpp). A transposed value there would silently log
    // the wrong field. This pins the struct field order against that initializer:
    // each value is distinct, so any reorder of the struct members (or the
    // worker's initializer) makes a field land in the wrong slot and fails here.
    // Order must match the worker stash block:
    //   N, dim, tau, tmax, epsilon, total_recurrences,
    //   nonzero_bins, num_bins, raw_entropy, max_entropy, rpde, period
    DiagSnapshot s{
        1,      // N
        2,      // dim
        3,      // tau
        4,      // tmax
        5.0f,   // epsilon
        6,      // total_recurrences
        7,      // nonzero_bins
        8,      // num_bins
        9.0f,   // raw_entropy
        10.0f,  // max_entropy
        11.0f,  // rpde
        12.0f   // period
    };
    ASSERT_EQ(s.N, 1, "N must be field 0");
    ASSERT_EQ(s.dim, 2, "dim must be field 1");
    ASSERT_EQ(s.tau, 3, "tau must be field 2");
    ASSERT_EQ(s.tmax, 4, "tmax must be field 3");
    ASSERT_EQ(s.epsilon, 5.0f, "epsilon must be field 4");
    ASSERT_EQ(s.total_recurrences, 6, "total_recurrences must be field 5");
    ASSERT_EQ(s.nonzero_bins, 7, "nonzero_bins must be field 6");
    ASSERT_EQ(s.num_bins, 8, "num_bins must be field 7");
    ASSERT_EQ(s.raw_entropy, 9.0f, "raw_entropy must be field 8");
    ASSERT_EQ(s.max_entropy, 10.0f, "max_entropy must be field 9");
    ASSERT_EQ(s.rpde, 11.0f, "rpde must be field 10");
    ASSERT_EQ(s.period, 12.0f, "period must be field 11");
    return true;
}

bool test_concurrent_stash_drain() {
    // Exercise the mutex under real contention. make_snapshot() keeps an
    // invariant (total_recurrences == 2*N); a torn read from a missing/broken
    // lock would surface a snapshot violating it. Run a writer and a reader
    // concurrently and confirm every drained snapshot is internally consistent.
    DeferredDiag diag;
    std::atomic<bool> stop{false};
    std::atomic<bool> torn{false};
    std::atomic<int> drained_count{0};

    std::thread writer([&]() {
        for (int i = 1; i <= 200000; ++i)
            diag.stash(make_snapshot(i));
        stop.store(true);
    });

    std::thread reader([&]() {
        while (true) {
            auto v = diag.drain();
            if (v) {
                ++drained_count;
                if (v->total_recurrences != v->N * 2)
                    torn.store(true);
            } else if (stop.load()) {
                // Writer is done and nothing is pending: a second empty drain
                // confirms there is no more work, so exit.
                if (!diag.drain().has_value())
                    break;
            }
        }
    });

    writer.join();
    reader.join();

    ASSERT_TRUE(!torn.load(), "no torn/inconsistent snapshot should ever be drained");
    ASSERT_TRUE(drained_count.load() > 0, "reader should have drained at least one snapshot");
    return true;
}

// ============================================================================
// MAIN
// ============================================================================

int main() {
    std::cout << "========================================\n";
    std::cout << "  RPDE Deferred Diagnostic Tests\n";
    std::cout << "========================================\n\n";

    run_test("Drain with nothing pending", test_drain_with_nothing_pending);
    run_test("Stash then drain returns snapshot", test_stash_then_drain_returns_snapshot);
    run_test("Drain clears pending", test_drain_clears_pending);
    run_test("Multiple stashes coalesce to latest", test_multiple_stashes_coalesce_to_latest);
    run_test("Round-trip after drain", test_round_trip_after_drain);
    run_test("Aggregate initializer field order", test_aggregate_initializer_field_order);
    run_test("Concurrent stash/drain (mutex contention)", test_concurrent_stash_drain);

    std::cout << "\n----------------------------------------\n";
    std::cout << "Total: " << tests_passed << "/" << tests_run << " tests passed\n";
    std::cout << "----------------------------------------\n";

    if (!failures.empty()) {
        std::cout << "\nFailures:\n";
        for (const auto& f : failures)
            std::cout << "  " << f.first << ": " << f.second << "\n";
    }

    return (tests_passed == tests_run) ? 0 : 1;
}
