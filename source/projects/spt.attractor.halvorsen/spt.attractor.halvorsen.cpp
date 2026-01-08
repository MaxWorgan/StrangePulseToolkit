// halvorsen.cpp
// Halvorsen Attractor - Striking cyclic attractor with 3-fold rotational symmetry
// Creates beautiful intertwined lobes that spiral around each axis
#include "attractor_base.h"
#include <cmath>

using namespace c74::min;

class halvorsen : public attractor_base<halvorsen> {
public:
    MIN_DESCRIPTION { "Halvorsen Attractor simulation - 3-fold symmetric chaos" };
    MIN_TAGS        { "chaos, simulation" };
    MIN_AUTHOR      { "Max Worgan" };
    MIN_RELATED     { "spt.attractor.dadras, spt.attractor.aizawa, spt.attractor.rabinovich" };

    // Halvorsen has elegant symmetry - same coupling for all three dimensions
    // The parameter 'a' controls the damping/dissipation
    MAKE_ATTR(number, a, 1.89, "Parameter a - dissipation rate (try 1.3-2.0)");

    static constexpr double default_scale_factor = 0.06;
    static constexpr double default_dt = 4.0;              // Higher dt = lower CPU
    static constexpr double default_position = 0.1;
    static constexpr double default_speed_primary = 0.01;   // ~2.7 Hz rhythm
    static constexpr double default_speed_secondary = 0.1;  // ~32 Hz low audio

    halvorsen(const atoms& args = {})
    : attractor_base<halvorsen>(args) { }

    void init_state(double p, double& x, double& y, double& z, double& x2, double& y2, double& z2) {
        // Asymmetric start to break symmetry and explore all lobes
        x = x2 = -5.0 * p;
        y = y2 = p;
        z = z2 = -p;
    }

    void compute(double& dx, double& dy, double& dz,
                 double x, double y, double z) {
        double a_val = a.get();

        // Cyclic structure: each equation couples to the next two variables
        // The quadratic terms create the characteristic folding
        dx = -a_val * x - 4.0 * y - 4.0 * z - y * y;
        dy = -a_val * y - 4.0 * z - 4.0 * x - z * z;
        dz = -a_val * z - 4.0 * x - 4.0 * y - x * x;
    }
};

MIN_EXTERNAL(halvorsen);
