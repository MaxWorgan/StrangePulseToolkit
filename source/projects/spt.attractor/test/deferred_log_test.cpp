// deferred_log_test.cpp
// Tests for the deferred reset-logging logic in attractor_base.h.
//
// Console output (cout) must never happen on the audio thread. attractor_base
// instead stashes a reset reason in an atomic on the audio thread and defers the
// actual print to Max's main thread via a queue (qelem). Two pieces of logic are
// deterministic and worth pinning down here:
//
//   1. Throttle gate  - log_reset() only fires once per _reset_log_interval_samples,
//                        matching the original rate-limiting behaviour.
//   2. Reason hand-off - the audio thread stores a reason pointer; the main thread
//                        reads it with exchange(nullptr). Multiple stores between
//                        drains coalesce to the most recent reason, and a drain with
//                        nothing pending yields nullptr (nothing to print).
//
// This file models that logic exactly (the real header cannot be compiled outside
// the Max runtime), so it must be kept in sync with attractor_base.h::log_reset()
// and the _log_queue lambda.
//
// Compile: clang++ -std=c++17 -O2 deferred_log_test.cpp -o deferred_log_test
// Run:     ./deferred_log_test

#include <atomic>
#include <cstddef>
#include <functional>
#include <iostream>
#include <string>
#include <vector>

// ============================================================================
// TEST FRAMEWORK
// ============================================================================

std::vector<std::pair<std::string, std::string>> failures;
int tests_run = 0;
int tests_passed = 0;
std::string current_test;

#define ASSERT_TRUE(cond, msg)                          \
    do {                                                \
        if (!(cond)) {                                  \
            failures.push_back({current_test, msg});    \
            return false;                               \
        }                                               \
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
// MODEL OF attractor_base.h deferred logging
// Mirrors log_reset() (audio thread) and _log_queue lambda (main thread).
// ============================================================================

class DeferredLogger {
public:
    explicit DeferredLogger(size_t interval) : _interval(interval) {}

    // --- audio-thread side: mirrors log_reset() ---
    // Returns true if the queue would have been "set" (i.e. a reason was handed off).
    bool log_reset(const char* reason, size_t sample_counter, bool log_enabled = true) {
        if (!log_enabled) return false;
        if (_interval == 0) return false;
        if (sample_counter - _last_reset_log_sample < _interval) return false;
        _last_reset_log_sample = sample_counter;

        _pending_reason.store(reason, std::memory_order_release);
        _queue_set_count++;  // stands in for _log_queue.set()
        return true;
    }

    // --- main-thread side: mirrors the _log_queue lambda ---
    // Returns the reason that would be printed, or nullptr if nothing pending.
    const char* drain() {
        return _pending_reason.exchange(nullptr, std::memory_order_acq_rel);
    }

    int queue_set_count() const { return _queue_set_count; }

private:
    size_t _interval;
    size_t _last_reset_log_sample{0};
    std::atomic<const char*> _pending_reason{nullptr};
    int _queue_set_count{0};
};

// ============================================================================
// THROTTLE TESTS
// ============================================================================

bool test_throttle_suppresses_within_interval() {
    DeferredLogger log(100);
    // First reset at counter 100 passes the gate (100 - 0 >= 100).
    ASSERT_TRUE(log.log_reset("overflow", 100), "first reset at interval should fire");
    // Subsequent resets before another full interval are suppressed.
    ASSERT_TRUE(!log.log_reset("overflow", 150), "reset 50 samples later should be suppressed");
    ASSERT_TRUE(!log.log_reset("overflow", 199), "reset 99 samples later should be suppressed");
    ASSERT_EQ(log.queue_set_count(), 1, "only one queue.set() expected within an interval");
    return true;
}

bool test_throttle_first_reset_before_interval_suppressed() {
    // _last_reset_log_sample starts at 0. A reset that arrives before the first
    // full interval has elapsed (counter < interval) must be suppressed, because
    // counter - 0 < interval. This mirrors an early reset right after DSP start.
    DeferredLogger log(100);
    ASSERT_TRUE(!log.log_reset("overflow", 50), "first reset at counter 50 (<100) should be suppressed");
    ASSERT_TRUE(!log.log_reset("overflow", 99), "first reset at counter 99 (<100) should be suppressed");
    ASSERT_EQ(log.queue_set_count(), 0, "no fire before the first full interval elapses");
    // Once the counter reaches the interval, it fires.
    ASSERT_TRUE(log.log_reset("overflow", 100), "reset at counter 100 should fire");
    ASSERT_EQ(log.queue_set_count(), 1, "exactly one fire at the interval boundary");
    return true;
}

bool test_throttle_fires_after_interval() {
    DeferredLogger log(100);
    ASSERT_TRUE(log.log_reset("overflow", 100), "first fire");
    ASSERT_TRUE(log.log_reset("overflow", 200), "fire after full interval");
    ASSERT_TRUE(log.log_reset("overflow", 300), "fire after another full interval");
    ASSERT_EQ(log.queue_set_count(), 3, "three fires across three intervals");
    return true;
}

bool test_throttle_zero_interval_never_fires() {
    // _reset_log_interval_samples == 0 means samplerate was unavailable; never log.
    DeferredLogger log(0);
    ASSERT_TRUE(!log.log_reset("overflow", 1000), "zero interval must never fire");
    ASSERT_EQ(log.queue_set_count(), 0, "no queue.set() with zero interval");
    return true;
}

bool test_throttle_respects_log_disabled() {
    DeferredLogger log(100);
    ASSERT_TRUE(!log.log_reset("overflow", 100, /*log_enabled=*/false),
                "disabled logging must not fire");
    ASSERT_EQ(log.queue_set_count(), 0, "no queue.set() when logging disabled");
    return true;
}

// ============================================================================
// REASON COALESCING TESTS (atomic exchange)
// ============================================================================

bool test_drain_returns_stored_reason() {
    DeferredLogger log(1);
    log.log_reset("collapse", 1);
    const char* r = log.drain();
    ASSERT_TRUE(r != nullptr, "drain should return a reason after a fire");
    ASSERT_TRUE(std::string(r) == "collapse", "drain should return the stored reason");
    return true;
}

bool test_drain_clears_pending() {
    DeferredLogger log(1);
    log.log_reset("NaN/Inf", 1);
    ASSERT_TRUE(log.drain() != nullptr, "first drain returns reason");
    ASSERT_TRUE(log.drain() == nullptr, "second drain returns nullptr (nothing to print)");
    return true;
}

bool test_multiple_resets_coalesce_to_latest() {
    // Several audio-thread resets can occur before the main thread services the
    // queue. Only the most recent reason should surface (last-writer-wins).
    DeferredLogger log(1);
    log.log_reset("overflow", 1);
    log.log_reset("collapse", 2);
    log.log_reset("stall (gradual)", 3);
    const char* r = log.drain();
    ASSERT_TRUE(r != nullptr, "coalesced drain should return a reason");
    ASSERT_TRUE(std::string(r) == "stall (gradual)", "drain should surface the most recent reason");
    ASSERT_TRUE(log.drain() == nullptr, "pending cleared after coalesced drain");
    return true;
}

bool test_drain_with_nothing_pending() {
    DeferredLogger log(100);
    // No reset has fired yet; a spurious queue service must not print garbage.
    ASSERT_TRUE(log.drain() == nullptr, "drain with no pending reason yields nullptr");
    return true;
}

// ============================================================================
// MAIN
// ============================================================================

int main() {
    std::cout << "========================================\n";
    std::cout << "  Deferred Reset-Logging Tests\n";
    std::cout << "========================================\n\n";

    std::cout << "--- Throttle Gate ---\n";
    run_test("Throttle: suppress within interval", test_throttle_suppresses_within_interval);
    run_test("Throttle: first reset before interval suppressed", test_throttle_first_reset_before_interval_suppressed);
    run_test("Throttle: fire after interval", test_throttle_fires_after_interval);
    run_test("Throttle: zero interval never fires", test_throttle_zero_interval_never_fires);
    run_test("Throttle: respects log disabled", test_throttle_respects_log_disabled);

    std::cout << "\n--- Reason Coalescing ---\n";
    run_test("Coalesce: drain returns stored reason", test_drain_returns_stored_reason);
    run_test("Coalesce: drain clears pending", test_drain_clears_pending);
    run_test("Coalesce: multiple resets -> latest", test_multiple_resets_coalesce_to_latest);
    run_test("Coalesce: drain with nothing pending", test_drain_with_nothing_pending);

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
