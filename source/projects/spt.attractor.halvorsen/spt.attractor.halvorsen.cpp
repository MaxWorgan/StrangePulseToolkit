// halvorsen.cpp
// Halvorsen Attractor - Striking cyclic attractor with 3-fold rotational symmetry
#include "attractor_base.h"

using namespace c74::min;

class halvorsen : public attractor_base<halvorsen> {
public:
    MIN_DESCRIPTION { "Halvorsen Attractor simulation - 3-fold symmetric chaos" };
    MIN_TAGS        { "chaos, simulation" };
    MIN_AUTHOR      { "Max Worgan" };
    MIN_RELATED     { "spt.attractor.lorenz, spt.attractor.thomas, spt.attractor.aizawa, spt.attractor.dadras, spt.attractor.tsucs1" };

    MAKE_ATTR(number, a, 1.89, "Parameter a - dissipation rate (try 1.3-2.0)");

    static constexpr double default_scale_factor = 0.06;
    static constexpr double default_dt = 4.0;
    static inline std::vector<double> default_position{-0.5, 0.1, -0.1};
    static constexpr double default_speed_primary = 0.01;
    static constexpr double default_speed_secondary = 0.1;
    static constexpr double default_overflow_limit = 100.0;

    halvorsen(const atoms& args = {}) : attractor_base<halvorsen>(args) {}

    void compute(Vec3& vel, const Vec3& pos) {
        double a_val = a.get();
        vel(0) = -a_val * pos(0) - 4.0 * pos(1) - 4.0 * pos(2) - pos(1) * pos(1);
        vel(1) = -a_val * pos(1) - 4.0 * pos(2) - 4.0 * pos(0) - pos(2) * pos(2);
        vel(2) = -a_val * pos(2) - 4.0 * pos(0) - 4.0 * pos(1) - pos(0) * pos(0);
    }
};

MIN_EXTERNAL(halvorsen);
