// thomas.cpp
#include "attractor_base.h"
#include <cmath>

using namespace c74::min;

class thomas : public attractor_base<thomas> {
public:
    MIN_DESCRIPTION { "Thomas Attractor simulation" };
    MIN_TAGS        { "chaos, simulation" };
    MIN_AUTHOR      { "Max Worgan" };
    MIN_RELATED     { "spt.attractor.lorenz, spt.attractor.aizawa, spt.attractor.dadras, spt.attractor.halvorsen, spt.attractor.tsucs1" };

    MAKE_ATTR(number, b, 0.208186, "Parameter b");

    static constexpr double default_dt = 5.0;
    static constexpr double default_speed_primary = 0.05;
    static constexpr double default_speed_secondary = 3.0;
    static constexpr double default_scale_factor = 0.2;
    static constexpr double default_overflow_limit = 100.0;
    static inline std::vector<double> default_position{0.001, 0.003, 0.001};

    thomas(const atoms& args = {}) : attractor_base<thomas>(args) {}

    void compute(Vec3& vel, const Vec3& pos) {
        double b_val = b.get();
        vel(0) = std::sin(pos(1)) - b_val * pos(0);
        vel(1) = std::sin(pos(2)) - b_val * pos(1);
        vel(2) = std::sin(pos(0)) - b_val * pos(2);
    }
};

MIN_EXTERNAL(thomas);
