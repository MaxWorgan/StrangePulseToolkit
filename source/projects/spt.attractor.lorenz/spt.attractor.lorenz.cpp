// thomas.cpp
#include "attractor_base.h"
#include <cmath>

using namespace c74::min;

class lorenz : public attractor_base<lorenz> {
public:
    MIN_DESCRIPTION { "Thomas Attractor simulation" };
    MIN_TAGS        { "chaos, simulation" };
    MIN_AUTHOR      { "Max Worgan" };
    MIN_RELATED     { "spt.attractor.dadras, spt.attractor.thomas"};

    MAKE_ATTR(number, sigma, 10.0, "Parameter sigma");
    MAKE_ATTR(number, rho, 28, "Parameter rho");
    MAKE_ATTR(number, beta, 8.0/3.0, "Parameter beta");

    static constexpr double default_scale_factor = 0.03;
    static constexpr double default_dt = 0.005;
    static constexpr double default_position = 0.01;
    static constexpr double default_speed_primary = 2.0;
    static constexpr double default_speed_secondary = 10.0;


    lorenz(const atoms& args = {})
    : attractor_base<lorenz>(args) { }

    void init_state(double p, double& x, double& y, double& z, double& x2, double& y2, double& z2) {
        x = x2 = -p;
        y = y2 = z = z2 = p;
    }

    void compute(double& dx, double& dy, double& dz,
                 double x, double y, double z) {
        dx = sigma * (y - x);
        dy = x * (rho - z ) - y;
        dz = x * y - beta * z;
    }
};

MIN_EXTERNAL(lorenz);
