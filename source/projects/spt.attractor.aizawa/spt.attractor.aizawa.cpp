// aizawa.cpp
// Aizawa Attractor - Beautiful torus-like structure with complex spiral folding
// Discovered by Yoji Aizawa, exhibits quasi-periodic and chaotic behavior
#include "attractor_base.h"
#include <cmath>

using namespace c74::min;

class aizawa : public attractor_base<aizawa> {
public:
    MIN_DESCRIPTION { "Aizawa Attractor simulation - torus with spiral dynamics" };
    MIN_TAGS        { "chaos, simulation" };
    MIN_AUTHOR      { "Max Worgan" };
    MIN_RELATED     { "spt.attractor.dadras, spt.attractor.halvorsen, spt.attractor.rabinovich" };

    // Aizawa parameters - these values produce beautiful torus-spiral dynamics
    MAKE_ATTR(number, a, 0.95, "Parameter a - controls torus shape");
    MAKE_ATTR(number, b, 0.7, "Parameter b - damping term");
    MAKE_ATTR(number, c, 0.6, "Parameter c - vertical drift");
    MAKE_ATTR(number, d, 3.5, "Parameter d - rotation coupling");
    MAKE_ATTR(number, e, 0.25, "Parameter e - z-modulation of radial term");
    MAKE_ATTR(number, f, 0.1, "Parameter f - cubic x-z coupling");

    static constexpr double default_scale_factor = 0.4;
    static constexpr double default_dt = 4.0;              // Higher dt = lower CPU
    static constexpr double default_position = 0.1;
    static constexpr double default_speed_primary = 0.01;   // ~2.3 Hz rhythm
    static constexpr double default_speed_secondary = 0.2;  // ~45 Hz low audio

    aizawa(const atoms& args = {})
    : attractor_base<aizawa>(args) { }

    void init_state(double p, double& x, double& y, double& z, double& x2, double& y2, double& z2) {
        // Start on the attractor's basin
        x = x2 = p;
        y = y2 = p;
        z = z2 = p;
    }

    void compute(double& dx, double& dy, double& dz,
                 double x, double y, double z) {
        double a_val = a.get();
        double b_val = b.get();
        double c_val = c.get();
        double d_val = d.get();
        double e_val = e.get();
        double f_val = f.get();

        double x2 = x * x;
        double y2 = y * y;
        double z3 = z * z * z;

        dx = (z - b_val) * x - d_val * y;
        dy = d_val * x + (z - b_val) * y;
        dz = c_val + a_val * z - (z3 / 3.0) - (x2 + y2) * (1.0 + e_val * z) + f_val * z * x * x2;
    }
};

MIN_EXTERNAL(aizawa);
