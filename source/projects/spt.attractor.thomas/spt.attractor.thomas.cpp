// thomas.cpp
#include "attractor_base.h"
#include <cmath>

using namespace c74::min;

class thomas : public attractor_base<thomas> {
public:
    MIN_DESCRIPTION { "Thomas Attractor simulation" };
    MIN_TAGS        { "chaos, simulation" };
    MIN_AUTHOR      { "Max Worgan" };
    MIN_RELATED     { "spt.attractor.dadras, spt.attractor.lorenz"};


    static constexpr double default_dt             = 5.0;
    static constexpr double default_speed_primary  = 0.05;
    static constexpr double default_speed_secondary= 3.0;
    static constexpr double default_scale_factor   = 0.2;

    MAKE_ATTR(number, b, 0.208186, "Parameter b");

    thomas(const atoms& args={}) : attractor_base<thomas>(args) { }

    void init_state(double p, double& x, double& y, double& z, double& x2, double& y2, double& z2) {
        x = x2 = -p;
        y = y2 = z = z2 = p;
    }

    void compute(double& dx, double& dy, double& dz,
                 double x, double y, double z) {
        dx = std::sin(y) - b.get() * x;
        dy = std::sin(z) - b.get() * y;
        dz = std::sin(x) - b.get() * z;
    }
};

MIN_EXTERNAL(thomas);
