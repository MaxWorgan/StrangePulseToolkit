// dadras.cpp
#include "attractor_base.h"
#include <cmath>

using namespace c74::min;

class dadras : public attractor_base<dadras> {
public:
    MIN_DESCRIPTION { "Dadras Attractor simulation" };
    MIN_TAGS        { "chaos, simulation" };
    MIN_AUTHOR      { "Max Worgan" };
    MIN_RELATED     { "spt.attractor.lorenz, spt.attractor.thomas"};


    MAKE_ATTR(number, a, 3.0, "Parameter a");
    MAKE_ATTR(number, b, 2.7, "Parameter b");
    MAKE_ATTR(number, c, 1.7, "Parameter c");
    MAKE_ATTR(number, d, 2.0, "Parameter d");
    MAKE_ATTR(number, e, 9.0, "Parameter e");

    static constexpr double default_scale_factor = 0.075;
    static constexpr double default_dt = 0.01;

    dadras(const atoms& args = {})
    : attractor_base<dadras>(args) { }

    void init_state(double p, double& x, double& y, double& z, double& x2, double& y2, double& z2) {
        x = x2 = y = y2 = z = z2 = p;
    }

    void compute(double& dx, double& dy, double& dz,
                 double x, double y, double z) {
        dx = y - a.get() * x + b.get() * y * z;
        dy = c.get() * y - x * z + z;
        dz = d.get() * x * y - e.get() * z;
    }
};

MIN_EXTERNAL(dadras);
