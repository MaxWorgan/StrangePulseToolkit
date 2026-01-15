// lorenz.cpp
#include "attractor_base.h"

using namespace c74::min;

class lorenz : public attractor_base<lorenz> {
public:
    MIN_DESCRIPTION { "Lorenz Attractor simulation" };
    MIN_TAGS        { "chaos, simulation" };
    MIN_AUTHOR      { "Max Worgan" };
    MIN_RELATED     { "spt.attractor.thomas, spt.attractor.aizawa, spt.attractor.dadras, spt.attractor.halvorsen, spt.attractor.tsucs1" };

    MAKE_ATTR(number, sigma, 10.0, "Parameter sigma");
    MAKE_ATTR(number, rho, 28, "Parameter rho");
    MAKE_ATTR(number, beta, 8.0/3.0, "Parameter beta");

    static constexpr double default_scale_factor = 0.03;
    static constexpr double default_dt = 2.0;
    static inline std::vector<double> default_position{0.01, 0.01, 0.01};
    static constexpr double default_speed_primary = 0.01;
    static constexpr double default_speed_secondary = 0.5;
    static constexpr double default_overflow_limit = 100.0;

    lorenz(const atoms& args = {}) : attractor_base<lorenz>(args) {}

    void compute(Vec3& vel, const Vec3& pos) {
        vel(0) = sigma * (pos(1) - pos(0));
        vel(1) = pos(0) * (rho - pos(2)) - pos(1);
        vel(2) = pos(0) * pos(1) - beta * pos(2);
    }
};

MIN_EXTERNAL(lorenz);
