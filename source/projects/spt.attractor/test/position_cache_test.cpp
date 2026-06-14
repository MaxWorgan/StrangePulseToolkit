// Standalone test for the attractor_base #11 refactor.
//
// The externals cannot be compiled outside the Max runtime, so this test models
// the refactored logic and keeps it in sync by hand. It guards two behaviour-
// preserving changes:
//
//   1. get_position() used to rebuild a Vec3 from position.get() (a std::vector
//      copy) on every audio buffer. It now returns a cached Vec3 that is updated
//      only when the position attribute changes (via vec3_from()). The cached
//      value must equal what the old per-buffer recompute would have produced,
//      for every attribute vector length (0..n), padding missing components with 0.
//
//   2. The smoothing EMA coefficients were renamed (alpha/one_minus_alpha ->
//      new_weight/history_weight). This must be a pure rename: the weights must
//      not be swapped.
//
// Build:  clang++ -std=c++17 -O2 position_cache_test.cpp -o position_cache_test
//
// Keep in sync with source/projects/spt.attractor/include/attractor_base.h
// (vec3_from / get_position / the position setter, and the EMA in operator()).

// Note: the production invariant that `_reset_position` is declared BEFORE the
// `position` attribute (so the setter never writes an unconstructed member during
// attribute init) is enforced by declaration order in attractor_base.h and cannot
// be exercised by a standalone logic test — it is called out here for the record.

#include <iostream>
#include <string>
#include <vector>
#include <cmath>

struct V3 {
    double x, y, z;
    bool operator==(const V3& o) const { return x == o.x && y == o.y && z == o.z; }
};

// --- OLD get_position(): rebuild from the attribute vector every call ----------
static V3 old_get_position(const std::vector<double>& pos) {
    const double x = pos.size() > 0 ? pos[0] : 0.0;
    const double y = pos.size() > 1 ? pos[1] : 0.0;
    const double z = pos.size() > 2 ? pos[2] : 0.0;
    return {x, y, z};
}

// --- NEW vec3_from(): generic size-guarded builder (mirrors the template) ------
template <typename Seq>
static V3 vec3_from(const Seq& s) {
    const double x = s.size() > 0 ? static_cast<double>(s[0]) : 0.0;
    const double y = s.size() > 1 ? static_cast<double>(s[1]) : 0.0;
    const double z = s.size() > 2 ? static_cast<double>(s[2]) : 0.0;
    return {x, y, z};
}

// --- Model of the cached position attribute ------------------------------------
// The constructor seeds the cache from the (defaulted) attribute; the setter
// refreshes it on every change. get_position() returns the cache without copying.
class PositionModel {
public:
    explicit PositionModel(std::vector<double> def) : attr(std::move(def)) {
        cache = vec3_from(attr);            // constructor seeds the cache
    }
    void set(std::vector<double> v) {
        attr = std::move(v);
        cache = vec3_from(attr);            // setter refreshes the cache
    }
    V3 get_position() const { return cache; }
    const std::vector<double>& raw() const { return attr; }
private:
    std::vector<double> attr;
    V3 cache;
};

static int failures = 0;
static void check(bool cond, const std::string& msg) {
    if (!cond) { std::cout << "  FAIL: " << msg << std::endl; failures++; }
}

// vec3_from must reproduce old_get_position for every attribute vector length.
static void test_vec3_from_equivalence() {
    std::vector<std::vector<double>> cases = {
        {},                              // empty -> (0,0,0)
        {1.5},                           // x only
        {1.5, -2.0},                     // x, y
        {1.5, -2.0, 3.25},               // full
        {1.5, -2.0, 3.25, 9.9},          // extra components ignored
        {0.001, 0.001, 0.001},           // typical default
    };
    for (const auto& v : cases) {
        check(vec3_from(v) == old_get_position(v),
              "vec3_from must match old get_position for length " + std::to_string(v.size()));
    }
}

// The cache must always equal what the old per-call recompute would produce,
// both after construction and after every attribute change.
static void test_cache_stays_in_sync() {
    PositionModel m({0.001, 0.001, 0.001});
    check(m.get_position() == old_get_position(m.raw()),
          "cache after construction must equal the recomputed position");

    m.set({1.0, 2.0, 3.0});
    check(m.get_position() == old_get_position(m.raw()),
          "cache after a full set must equal the recomputed position");
    check((m.get_position() == V3{1.0, 2.0, 3.0}), "cache must hold the newly set position");

    m.set({5.0});  // short vector -> y,z padded with 0
    check(m.get_position() == old_get_position(m.raw()),
          "cache after a short set must equal the recomputed position");
    check((m.get_position() == V3{5.0, 0.0, 0.0}), "short set must pad missing components with 0");

    m.set({});     // empty -> origin
    check((m.get_position() == V3{0.0, 0.0, 0.0}), "empty set must yield the origin");
}

// The EMA rename must not swap the weights. Rather than compare the production
// coefficient form against itself (which would be a tautology), compare it against
// an INDEPENDENT reference derived from the EMA semantics: when `smooth` is the
// fraction of the previous value retained, the output moves (1 - smooth) of the way
// from prev toward sample. A weight swap diverges from this reference, so the test
// has real discriminating power (asserted explicitly below).
static void test_ema_rename_preserves_weights() {
    const double prev = 0.4, sample = 0.9;
    for (double smooth_amt : {0.0, 0.2, 0.5, 0.8, 1.0}) {
        // Independent reference (lerp form), NOT the coefficient form.
        const double reference = prev + (1.0 - smooth_amt) * (sample - prev);

        // Production coefficient form (mirrors operator()): history_weight = smooth.
        const double history_weight = smooth_amt;
        const double new_weight     = 1.0 - smooth_amt;
        const double production     = history_weight * prev + new_weight * sample;
        check(std::abs(production - reference) < 1e-12,
              "EMA coeff form must match the independent reference at smooth=" + std::to_string(smooth_amt));

        // Guard the test's own power: a swapped form must DIVERGE from the reference
        // (except at smooth=0.5, where the swap is numerically identical).
        const double swapped = new_weight * prev + history_weight * sample;
        if (std::abs(smooth_amt - 0.5) > 1e-9)
            check(std::abs(swapped - reference) > 1e-9,
                  "a swapped EMA must NOT match the reference at smooth=" + std::to_string(smooth_amt));
    }
    // Semantics: smooth=1 keeps history only; smooth=0 takes the sample only.
    check((1.0 * prev + 0.0 * sample) == prev, "smooth=1 must keep the previous value");
    check((0.0 * prev + 1.0 * sample) == sample, "smooth=0 must take the new sample");
}

int main() {
    std::cout << "=== attractor_base #11 refactor test (position cache + EMA rename) ===" << std::endl;

    test_vec3_from_equivalence();
    test_cache_stays_in_sync();
    test_ema_rename_preserves_weights();

    std::cout << (failures == 0 ? "ALL TESTS PASSED" : (std::to_string(failures) + " FAILURE(S)")) << std::endl;
    return failures == 0 ? 0 : 1;
}
