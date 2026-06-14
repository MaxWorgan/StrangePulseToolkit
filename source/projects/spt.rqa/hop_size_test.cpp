// Standalone test for spt.rqa hop_size tunability (issue #7).
//
// spt.rqa cannot be compiled outside the Max runtime, so this test *models* the
// production hop_size logic and keeps it in sync by hand. It covers the change
// that made hop_size a writable, clamped attribute (previously readonly):
//   * the setter clamps to [1, window_size] and recomputes the cached hop;
//   * the setter may fire during construction before window_size is known
//     (m_window_size == 0), so the upper clamp is deferred to the constructor;
//   * the audio-thread gate fires every hop_size_fixed samples, so changing the
//     attribute at runtime actually changes the analysis cadence.
//
// Build:  clang++ -std=c++17 -O2 hop_size_test.cpp -o hop_size_test
//
// Keep in sync with source/projects/spt.rqa/spt.rqa.cpp (hop_size_attr setter,
// constructor recompute, and the operator() gate).

#include <cstddef>
#include <iostream>
#include <string>
#include <vector>

// ---------------------------------------------------------------------------
// Model of the production hop_size handling.
// ---------------------------------------------------------------------------
class RqaHopModel {
public:
    // Mirrors construction: attribute defaults are applied through the setter
    // FIRST (while m_window_size is still 0), then the constructor body sets the
    // real window size and re-clamps the cached hop.
    RqaHopModel(size_t window_size, double initial_hop = 256.0) {
        m_window_size = 0;                 // not yet known during attribute init
        apply_setter(initial_hop);         // setter fires early -> skips upper clamp
        hop_after_early_setter = hop_size_fixed;  // capture pre-recompute value for the deferred-clamp test

        if (window_size < 10) window_size = 10;  // matches "minimum sensible window size"
        m_window_size = window_size;

        // Constructor recompute (matches spt.rqa.cpp constructor body).
        double hs = hop_size_attr;
        if (hs < 1.0) hs = 1.0;
        if (hs > static_cast<double>(m_window_size)) hs = static_cast<double>(m_window_size);
        hop_size_fixed = static_cast<size_t>(hs);
    }

    // Runtime attribute change (setter runs with m_window_size already known).
    void set_hop(double value) { apply_setter(value); }

    // What the inspector shows (the stored attribute value).
    double attr_value() const { return hop_size_attr; }
    // The effective cached hop used by the audio thread.
    size_t effective_hop() const { return hop_size_fixed; }
    // Value of the cached hop right after the early setter fired, BEFORE the
    // constructor re-clamped it (exposes the deferred-upper-clamp behaviour).
    size_t hop_before_recompute() const { return hop_after_early_setter; }

    // Model the audio-thread gate. Production only advances the hop counter on
    // retained subsamples (`if (counter % subsamp == 0)`), so the real cadence in
    // input samples is hop_size_fixed * subsample. Returns the 1-based input-sample
    // indices at which a window snapshot fires.
    std::vector<size_t> run_gate(size_t n, int subsample = 1) {
        if (subsample < 1) subsample = 1;
        std::vector<size_t> fires;
        for (size_t i = 0; i < n; ++i) {
            if (counter % subsample == 0) {
                samples_since_last_update++;
                if (samples_since_last_update >= hop_size_fixed) {
                    fires.push_back(i + 1);
                    samples_since_last_update = 0;
                }
            }
            counter++;
        }
        return fires;
    }

private:
    // Mirrors the production setter: clamp low always, clamp to window only when
    // the window size is known. Returns the value stored in the attribute.
    void apply_setter(double hs) {
        if (hs < 1.0) hs = 1.0;
        if (m_window_size > 0 && hs > static_cast<double>(m_window_size))
            hs = static_cast<double>(m_window_size);
        hop_size_fixed = static_cast<size_t>(hs);
        hop_size_attr = hs;  // the setter's return value becomes the attribute value
    }

    size_t m_window_size = 0;
    double hop_size_attr = 256.0;
    // Production declares this std::atomic<size_t> (main-thread store / audio-thread
    // load); that cross-thread contract is out of scope for this single-threaded model.
    size_t hop_size_fixed = 256;
    size_t hop_after_early_setter = 256;
    size_t samples_since_last_update = 0;
    size_t counter = 0;
};

// ---------------------------------------------------------------------------
// Harness
// ---------------------------------------------------------------------------
static int failures = 0;

static void check(bool cond, const std::string& msg) {
    if (!cond) {
        std::cout << "  FAIL: " << msg << std::endl;
        failures++;
    }
}

static void test_default_construction() {
    RqaHopModel m(1024);  // default hop 256, window 1024
    check(m.effective_hop() == 256, "default hop should be 256 with a 1024 window");
    check(m.attr_value() == 256.0, "default attribute value should be 256");
}

static void test_construction_upper_clamp() {
    // hop passed as an attribute (fires early, window unknown) larger than the
    // window must be clamped down once the constructor learns the window size.
    RqaHopModel m(100, 500.0);
    // Prove it is the CONSTRUCTOR (not the early setter) that applies the upper
    // clamp: right after the early setter the value is still 500 (window unknown),
    // and only the constructor recompute brings it to the window size.
    check(m.hop_before_recompute() == 500, "early setter must NOT upper-clamp while window is unknown");
    check(m.effective_hop() == 100, "constructor recompute must clamp hop down to window");
}

static void test_runtime_writable() {
    // The whole point of #7: hop is no longer readonly.
    RqaHopModel m(1024, 256.0);
    m.set_hop(64.0);
    check(m.effective_hop() == 64, "runtime set_hop should change the effective hop");
    check(m.attr_value() == 64.0, "runtime set_hop should update the attribute value");
}

static void test_runtime_upper_clamp() {
    RqaHopModel m(1024, 256.0);
    m.set_hop(5000.0);  // > window
    check(m.effective_hop() == 1024, "runtime hop > window must clamp to window");
    check(m.attr_value() == 1024.0, "clamped attribute value should reflect the clamp");
}

static void test_lower_clamp() {
    RqaHopModel m(1024, 256.0);
    m.set_hop(0.0);
    check(m.effective_hop() == 1, "hop < 1 must clamp to 1");
    m.set_hop(-10.0);
    check(m.effective_hop() == 1, "negative hop must clamp to 1");
}

// Changing the hop must actually change how often the analysis window fires.
static void test_gate_cadence_follows_hop() {
    RqaHopModel m(1024, 256.0);

    auto fires_256 = m.run_gate(1024);
    check(fires_256.size() == 4, "hop=256 over 1024 samples should fire 4 times");
    if (fires_256.size() == 4) {
        bool ok = fires_256[0] == 256 && fires_256[1] == 512 &&
                  fires_256[2] == 768 && fires_256[3] == 1024;
        check(ok, "hop=256 should fire at 256/512/768/1024");
    }

    m.set_hop(100.0);
    auto fires_100 = m.run_gate(1000);
    check(fires_100.size() == 10, "after set_hop(100), 1000 samples should fire 10 times");
    if (!fires_100.empty())
        check(fires_100[0] == 100, "first fire after set_hop(100) should be at sample 100");
}

// The hop gate only advances on retained subsamples, so the real cadence in
// input samples is hop * subsample.
static void test_gate_cadence_with_subsample() {
    RqaHopModel m(1024, 100.0);
    auto fires = m.run_gate(2000, /*subsample=*/2);
    check(fires.size() == 10, "hop=100 subsample=2 over 2000 input samples should fire 10 times");
    // counter starts at 0, so the first retained sample is index 0; the 100th
    // retained sample lands at input index 198 -> recorded (1-based) as 199.
    if (!fires.empty())
        check(fires[0] == 199, "hop=100 subsample=2 first fire should be at input sample 199");
}

// Boundary cadences: hop == window (single fire) and hop == 1 (fire every sample).
static void test_gate_boundaries() {
    RqaHopModel single(1024, 1024.0);
    auto f1 = single.run_gate(1024);
    check(f1.size() == 1 && !f1.empty() && f1[0] == 1024,
          "hop==window should fire exactly once, at the window boundary");

    RqaHopModel every(1024, 256.0);
    every.set_hop(1.0);
    auto f2 = every.run_gate(5);
    bool ok = (f2.size() == 5);
    for (size_t i = 0; ok && i < f2.size(); ++i) ok = (f2[i] == i + 1);
    check(ok, "hop==1 should fire on every sample");
}

// A window below the sensible minimum is raised to 10, and hop is then clamped
// against that floored window.
static void test_window_minimum() {
    RqaHopModel m(5, 8.0);   // window floored to 10
    check(m.effective_hop() == 8, "hop within the floored window should be unchanged");
    RqaHopModel m2(3, 50.0);  // window floored to 10, hop clamps to 10
    check(m2.effective_hop() == 10, "hop > floored window (10) must clamp to 10");
}

int main() {
    std::cout << "=== spt.rqa hop_size tunability test (issue #7) ===" << std::endl;

    test_default_construction();
    test_construction_upper_clamp();
    test_runtime_writable();
    test_runtime_upper_clamp();
    test_lower_clamp();
    test_gate_cadence_follows_hop();
    test_gate_cadence_with_subsample();
    test_gate_boundaries();
    test_window_minimum();

    std::cout << (failures == 0 ? "ALL TESTS PASSED" : (std::to_string(failures) + " FAILURE(S)")) << std::endl;
    return failures == 0 ? 0 : 1;
}
