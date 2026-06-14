// Standalone test for the attractor secondary-sync guard (issue #8).
//
// The attractor externals cannot be compiled outside the Max runtime, so this
// test *models* the MAKE_ATTR setter logic and keeps it in sync by hand.
//
// Background: each parameter attribute (a, b, c, ... built with MAKE_ATTR) runs
// a setter that may request a "secondary sync" — resetting the secondary
// trajectory's position back onto the primary's. The OLD setter called
// request_secondary_sync() unconditionally, so a no-op re-send of the current
// value, or a patch load re-applying saved values, would collapse the secondary
// trajectory onto the primary. The fix only requests a sync when the value
// actually changes.
//
// request_secondary_sync() itself is also gated on the sync_secondary attribute.
//
// Build:  clang++ -std=c++17 -O2 secondary_sync_test.cpp -o secondary_sync_test
//
// Keep in sync with source/projects/spt.attractor/include/attractor_base.h
// (the MAKE_ATTR macro setter and request_secondary_sync()).

#include <iostream>
#include <string>
#include <vector>

// Minimal model of a Max atom carrying either an int or a double, plus the
// static_cast<number> normalization the production setter applies to args[0].
// (number is a double, so an int atom normalizes to its exact double value.)
struct Atom {
    bool is_int;
    long i;
    double d;
    Atom(long v) : is_int(true), i(v), d(0.0) {}
    Atom(double v) : is_int(false), i(0), d(v) {}
    double as_number() const { return is_int ? static_cast<double>(i) : d; }  // static_cast<number>(args[0])
};

// Model of a single MAKE_ATTR parameter attribute + request_secondary_sync().
class SetterModel {
public:
    SetterModel(double initial, bool sync_enabled, bool guarded)
        : current(initial), sync_secondary(sync_enabled), guarded(guarded) {}

    // Apply a set (as Max would when a value is sent or restored on patch load).
    // Mirrors the setter: compare the incoming value against the CURRENT (pre-update)
    // attribute value, conditionally request a sync, then store the new value.
    void set(double value) {
        bool changed = (value != current);     // setter reads this->NAME.get() (old value)
        if (!guarded || changed)
            request_secondary_sync();
        current = value;                        // setter returns args -> attribute updated
    }

    // Apply a set from a Max atom, normalizing through static_cast<number> first
    // (mirrors `static_cast<TYPE>(args[0])` in the production setter).
    void set_atom(const Atom& a) { set(a.as_number()); }

    double get() const { return current; }

    // _pending_sync flag the audio thread consumes to actually move the secondary.
    bool pending() const { return _pending_sync; }
    bool consume_pending() { bool p = _pending_sync; _pending_sync = false; return p; }

private:
    void request_secondary_sync() {
        if (sync_secondary)                     // request_secondary_sync() gates on sync_secondary
            _pending_sync = true;
    }

    double current;
    bool sync_secondary;
    bool guarded;
    bool _pending_sync = false;
};

static SetterModel make_new(double initial, bool sync_enabled = true) { return SetterModel(initial, sync_enabled, /*guarded=*/true); }
static SetterModel make_old(double initial, bool sync_enabled = true) { return SetterModel(initial, sync_enabled, /*guarded=*/false); }

static int failures = 0;
static void check(bool cond, const std::string& msg) {
    if (!cond) { std::cout << "  FAIL: " << msg << std::endl; failures++; }
}

// A genuine value change must still request a sync (the feature must keep working).
static void test_value_change_syncs() {
    auto m = make_new(3.0);
    m.set(5.0);
    check(m.pending(), "changing a parameter value must request a secondary sync");
}

// A no-op re-send of the current value must NOT request a sync (the bug).
static void test_noop_resend_no_sync() {
    auto m = make_new(3.0);
    m.set(3.0);
    check(!m.pending(), "re-sending the current value must NOT request a sync");
}

// Patch load re-applies every saved attribute onto the freshly-constructed
// defaults. Attributes whose saved value equals the default must NOT sync; only
// genuinely changed ones do (and even that is harmless at load time, because the
// constructor starts the secondary trajectory equal to the primary).
static void test_patch_load() {
    // Attribute default 2.7, patch saved a value equal to the default -> no sync.
    {
        auto m = make_new(2.7);
        m.set(2.7);
        check(!m.pending(), "patch load of an unchanged (== default) value must NOT request a sync");
    }
    // Attribute default 2.7, patch saved a different value -> sync requested.
    {
        auto m = make_new(2.7);
        m.set(5.0);
        check(m.pending(), "patch load of a value differing from the default does request a sync");
    }
    // The OLD behaviour would sync on EVERY restored attribute, even unchanged ones.
    {
        auto oldm = make_old(2.7);
        oldm.set(2.7);
        check(oldm.pending(), "old behaviour synced on every restored attribute, even unchanged ones");
    }
}

// The setter normalizes args[0] via static_cast<number> before comparing. An int
// atom equal to the stored double must compare equal and NOT spuriously sync.
static void test_atom_normalization() {
    auto m = make_new(28.0);         // e.g. Lorenz rho stored as 28.0
    m.set_atom(Atom(28L));           // value re-sent as an integer atom
    check(!m.pending(), "an int atom equal to the stored double must NOT request a sync");

    m.set_atom(Atom(29L));           // genuinely different integer
    check(m.pending(), "an int atom differing from the stored value must request a sync");
}

// With sync_secondary disabled, even a real change must not flag a pending sync.
static void test_sync_disabled() {
    auto m = make_new(3.0, /*sync_enabled=*/false);
    m.set(9.0);
    check(!m.pending(), "with sync_secondary off, a change must not flag a pending sync");
}

// After a change is consumed, re-sending the same value must not re-arm a sync.
static void test_consume_then_resend() {
    auto m = make_new(3.0);
    m.set(9.0);
    check(m.consume_pending(), "first change should arm a pending sync");
    m.set(9.0);                      // no-op re-send of the now-current value
    check(!m.pending(), "re-sending the just-set value must not re-arm a sync");
}

// Contrast OLD vs NEW: they must AGREE on real changes and DIFFER on no-op re-sends,
// pinning down exactly what the fix changed.
static void test_old_vs_new_contrast() {
    // Real change: both behaviours request a sync.
    {
        auto oldm = make_old(3.0);
        auto newm = make_new(3.0);
        oldm.set(4.0);
        newm.set(4.0);
        check(oldm.pending() && newm.pending(),
              "old and new must agree: a real change requests a sync");
    }
    // No-op re-send: OLD collapses (pending), NEW does not — this is the fix.
    {
        auto oldm = make_old(3.0);
        auto newm = make_new(3.0);
        oldm.set(3.0);
        newm.set(3.0);
        check(oldm.pending(), "old behaviour collapses on a no-op re-send (demonstrates the bug)");
        check(!newm.pending(), "new behaviour must NOT collapse on a no-op re-send (the fix)");
    }
}

int main() {
    std::cout << "=== attractor secondary-sync guard test (issue #8) ===" << std::endl;

    test_value_change_syncs();
    test_noop_resend_no_sync();
    test_patch_load();
    test_atom_normalization();
    test_sync_disabled();
    test_consume_then_resend();
    test_old_vs_new_contrast();

    std::cout << (failures == 0 ? "ALL TESTS PASSED" : (std::to_string(failures) + " FAILURE(S)")) << std::endl;
    return failures == 0 ? 0 : 1;
}
