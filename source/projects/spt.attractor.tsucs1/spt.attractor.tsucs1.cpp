#include "attractor_base.h"

using namespace c74::min;

class tsucs1 : public attractor_base<tsucs1> {
public:
    MIN_DESCRIPTION { "Three-Scroll Unified Chaotic System (TSUCS1)" };
    MIN_TAGS        { "chaos, simulation" };
    MIN_AUTHOR      { "Max Worgan" };
    MIN_RELATED     { "spt.attractor.lorenz, spt.attractor.thomas, spt.attractor.aizawa, spt.attractor.dadras, spt.attractor.halvorsen" };

    MAKE_ATTR(number, alpha, 0.2, "Parameter alpha (0-1) - interpolates between Lorenz and Lu Chen attractors");
    MAKE_ATTR(number, m, 100.0, "Parameter m (-250-250) - controls morphology");

    static constexpr double default_scale_factor = 0.01;
    static constexpr double default_dt = 0.1;
    static inline std::vector<double> default_position{0.1, 1.0, -0.1};
    static constexpr double default_speed_primary = 0.01;
    static constexpr double default_speed_secondary = 0.5;
    static constexpr double default_overflow_limit = 400.0;

    static constexpr double default_stall_threshold = 1e-10;
    static constexpr double default_stall_immediate_threshold = 1e-20;

    tsucs1(const atoms& args = {}) : attractor_base<tsucs1>(args) {}

    void compute(Vec3& vel, const Vec3& pos) {
        double x = pos(0), y = pos(1), z = pos(2);
        double a = alpha;
        double m = this->m;

        double coef_a = 20.0 * a + 40.0;           // (20α + 40)
        double coef_d = (6.0 * a + 4.0) / 25.0;    // (6α + 4)/25
        double coef_c = 55.0 - 90.0 * a;           // (55 - 90α)
        double coef_f = 5.0 * a + 20.0;            // (5α + 20)
        double coef_e = 13.0 / 20.0;               // 13/20 = 0.65
        double coef_b = (11.0 - 6.0 * a) / 6.0;    // (11 - 6α)/6

        vel(0) = coef_a * (y - x) + coef_d * x * z;
        vel(1) = coef_c * x + coef_f * y - x * z;
        vel(2) = -coef_e * x * x + x * y + coef_b * z + m;
    }
};

MIN_EXTERNAL(tsucs1);
