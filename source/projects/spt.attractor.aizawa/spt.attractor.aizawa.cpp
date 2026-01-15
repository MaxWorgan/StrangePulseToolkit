// aizawa.cpp
// Aizawa Attractor - Beautiful torus-like structure with complex spiral folding
#include "attractor_base.h"

using namespace c74::min;

class aizawa : public attractor_base<aizawa> {
public:
    MIN_DESCRIPTION { "Aizawa Attractor simulation - torus with spiral dynamics" };
    MIN_TAGS        { "chaos, simulation" };
    MIN_AUTHOR      { "Max Worgan" };
    MIN_RELATED     { "spt.attractor.lorenz, spt.attractor.thomas, spt.attractor.dadras, spt.attractor.halvorsen, spt.attractor.tsucs1" };

    MAKE_ATTR(number, a, 0.95, "Parameter a - controls torus shape");
    MAKE_ATTR(number, b, 0.7, "Parameter b - damping term");
    MAKE_ATTR(number, c, 0.6, "Parameter c - vertical drift");
    MAKE_ATTR(number, d, 3.5, "Parameter d - rotation coupling");
    MAKE_ATTR(number, e, 0.25, "Parameter e - z-modulation of radial term");
    MAKE_ATTR(number, f, 0.1, "Parameter f - cubic x-z coupling");

    static constexpr double default_scale_factor = 0.4;
    static constexpr double default_dt = 4.0;
    static inline std::vector<double> default_position{0.1, 0.1, 0.1};
    static constexpr double default_speed_primary = 0.01;
    static constexpr double default_speed_secondary = 0.2;
    static constexpr double default_overflow_limit = 5.0;
    static constexpr double default_stall_threshold = 0.0001;
    static constexpr double default_stall_immediate_threshold = 4.0e-07;
    aizawa(const atoms& args = {}) : attractor_base<aizawa>(args) {}

    void compute(Vec3& vel, const Vec3& pos) {
        double a_val = a.get();
        double b_val = b.get();
        double c_val = c.get();
        double d_val = d.get();
        double e_val = e.get();
        double f_val = f.get();

        double x2 = pos(0) * pos(0);
        double y2 = pos(1) * pos(1);
        double z3 = pos(2) * pos(2) * pos(2);

        vel(0) = (pos(2) - b_val) * pos(0) - d_val * pos(1);
        vel(1) = d_val * pos(0) + (pos(2) - b_val) * pos(1);
        vel(2) = c_val + a_val * pos(2) - (z3 / 3.0) - (x2 + y2) * (1.0 + e_val * pos(2)) + f_val * pos(2) * pos(0) * x2;
    }
};

MIN_EXTERNAL(aizawa);
