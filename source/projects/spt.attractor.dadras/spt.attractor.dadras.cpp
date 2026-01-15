// dadras.cpp
#include "attractor_base.h"

using namespace c74::min;

class dadras : public attractor_base<dadras> {
public:
    MIN_DESCRIPTION { "Dadras Attractor simulation" };
    MIN_TAGS        { "chaos, simulation" };
    MIN_AUTHOR      { "Max Worgan" };
    MIN_RELATED     { "spt.attractor.lorenz, spt.attractor.thomas, spt.attractor.aizawa, spt.attractor.halvorsen, spt.attractor.tsucs1" };

    MAKE_ATTR(number, a, 3.0, "Parameter a");
    MAKE_ATTR(number, b, 2.7, "Parameter b");
    MAKE_ATTR(number, c, 1.7, "Parameter c");
    MAKE_ATTR(number, d, 2.0, "Parameter d");
    MAKE_ATTR(number, e, 9.0, "Parameter e");

    static constexpr double default_scale_factor = 0.075;
    static constexpr double default_dt = 3.0;
    static inline std::vector<double> default_position{0.001, 0.05, 0.001};
    static constexpr double default_speed_primary = 0.01;
    static constexpr double default_speed_secondary = 1.0;
    static constexpr double default_overflow_limit = 100.0;
    static constexpr double default_stall_threshold = 0.0001;
    static constexpr double default_stall_immediate_threshold = 1.0e-10;

    dadras(const atoms& args = {}) : attractor_base<dadras>(args) {}

    void compute(Vec3& vel, const Vec3& pos) {
        vel(0) = pos(1) - a.get() * pos(0) + b.get() * pos(1) * pos(2);
        vel(1) = c.get() * pos(1) - pos(0) * pos(2) + pos(2);
        vel(2) = d.get() * pos(0) * pos(1) - e.get() * pos(2);
    }
};

MIN_EXTERNAL(dadras);
