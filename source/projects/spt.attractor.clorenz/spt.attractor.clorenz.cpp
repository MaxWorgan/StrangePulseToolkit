// clorenz.cpp
// Coupled Lorenz Attractor - 6-scroll multiscroll chaos
// Two coupled Lorenz oscillators - outputs only the coupled (second) oscillator
// Based on Yu, Lu, Tang, Chen (2006) multiscroll Lorenz systems
//
// The system runs two Lorenz oscillators:
//   Osc1: dx1 = σ(y1-x1), dy1 = r1*x1 - y1 - x1*z1, dz1 = x1*y1 - β*z1
//   Osc2: dx2 = σ(y2-x2) + ε(x1-x2), dy2 = r2*x2 - y2 - x2*z2, dz2 = x2*y2 - β*z2
//
// The coupling term ε(x1-x2) creates 6-scroll behavior.
// We output only Osc2, but need Osc1 running to drive the coupling.
// Like other attractors, we run primary and secondary instances at different speeds.

// Unfortunatly my attractor_base.h isn't flexible enough to handle this configuration
// hence lots of code reuse

#include "c74_min.h"
#include <cmath>
#include <atomic>

using namespace c74::min;

class clorenz : public object<clorenz>, public vector_operator<> {
public:
    MIN_DESCRIPTION { "Coupled Lorenz Attractor - 6-scroll multiscroll chaos" };
    MIN_TAGS        { "chaos, simulation" };
    MIN_AUTHOR      { "Max Worgan" };
    MIN_RELATED     { "spt.attractor.lorenz, spt.attractor.dadras, spt.attractor.thomas" };

    inlet<>  input_signal  { this, "(signal) dummy input", "signal" };
    outlet<> output_x      { this, "(signal) primary x",   "signal" };
    outlet<> output_y      { this, "(signal) primary y",   "signal" };
    outlet<> output_z      { this, "(signal) primary z",   "signal" };
    outlet<> output_x2     { this, "(signal) secondary x", "signal" };
    outlet<> output_y2     { this, "(signal) secondary y", "signal" };
    outlet<> output_z2     { this, "(signal) secondary z", "signal" };

    // Lorenz parameters
    attribute<number> sigma   { this, "sigma",   10.0,    description{"Prandtl number (typical: 10)"} };
    attribute<number> beta    { this, "beta",    2.6667,  description{"Geometric factor (typical: 8/3 = 2.667)"} };
    attribute<number> r1      { this, "r1",      28.0,    description{"Rayleigh number for driving oscillator (typical: 28)"} };
    attribute<number> r2      { this, "r2",      28.0,    description{"Rayleigh number for coupled oscillator (typical: 28)"} };
    attribute<number> epsilon { this, "epsilon", 5.0,     description{"Coupling strength (controls multi-scroll behavior)"} };

    // Timing parameters - matching attractor_base pattern
    attribute<number> dt              { this, "dt",              2.0,   description{"Base integrator time step"} };
    attribute<number> speed_primary   { this, "speed_primary",   0.01,  description{"Primary substep multiplier"} };
    attribute<number> speed_secondary { this, "speed_secondary", 0.5,   description{"Secondary substep multiplier"} };
    attribute<bool>   scale_outputs   { this, "scale_outputs",   true,  description{"Scale outputs to +/-1"} };
    attribute<number> smooth          { this, "smooth",          0.8,   description{"Output smoothing (0=off, 1=strong)"} };
    attribute<number> position        { this, "position",        0.01,  description{"Reset position on bad state"} };

    static constexpr double default_scale_factor = 0.03;  // Same as standard Lorenz

    clorenz(const atoms& args = {}) {
        double p = position.get();
        init_state(p);
    }

    void init_state(double p) {
        // Primary coupled pair (osc1 drives osc2)
        _p_x1 = p;   _p_y1 = p;   _p_z1 = p;      // driving oscillator
        _p_x2 = -p;  _p_y2 = p;   _p_z2 = p;      // coupled oscillator (output)

        // Secondary coupled pair
        _s_x1 = p;   _s_y1 = p;   _s_z1 = p;
        _s_x2 = -p;  _s_y2 = p;   _s_z2 = p;

        // Reset smoothed outputs
        _ox = _p_x2;  _oy = _p_y2;  _oz = _p_z2;
        _ox2 = _s_x2; _oy2 = _s_y2; _oz2 = _s_z2;
    }

    message<> bang { this, "bang", "Reset to initial state",
        MIN_FUNCTION {
            pending_reset.store(true, std::memory_order_release);
            return {};
        }
    };

    void operator()(audio_bundle, audio_bundle output) {
        auto   outs = output.samples();
        size_t n    = output.frame_count();

        // Handle reset request
        if (pending_reset.exchange(false, std::memory_order_acq_rel)) {
            init_state(position.get());
        }

        const double dt_base = (dt.get() / samplerate()) * 100.0;
        const double sig     = sigma.get();
        const double b       = beta.get();
        const double rho1    = r1.get();
        const double rho2    = r2.get();
        const double eps     = epsilon.get();
        const double pos     = position.get();

        // Speed configuration (matching attractor_base pattern)
        double sp1 = speed_primary.get();
        double sp2 = speed_secondary.get();
        if (sp1 < 0.0) sp1 = 0.0;
        if (sp2 < 0.0) sp2 = 0.0;

        bool   skip_mode_1 = false, skip_mode_2 = false;
        int    n1 = 0, n2 = 0;
        size_t skip_interval_1 = 1, skip_interval_2 = 1;

        auto configure_speed = [](double s, bool& skip_mode, int& substeps, size_t& skip_interval) {
            if (s <= 0.0) {
                skip_mode = false;
                substeps = 0;
                skip_interval = 1;
            } else if (s < 1.0) {
                skip_mode = true;
                substeps = 1;
                double inv = 1.0 / s;
                if (inv < 1.0) inv = 1.0;
                skip_interval = static_cast<size_t>(std::llround(inv));
                if (skip_interval == 0) skip_interval = 1;
            } else {
                skip_mode = false;
                substeps = std::max(1, static_cast<int>(std::lround(s)));
                skip_interval = 1;
            }
        };

        configure_speed(sp1, skip_mode_1, n1, skip_interval_1);
        configure_speed(sp2, skip_mode_2, n2, skip_interval_2);

        const bool   do_scale = scale_outputs.get();
        const double sf = default_scale_factor;

        double smooth_amt = smooth.get();
        if (smooth_amt < 0.0) smooth_amt = 0.0;
        if (smooth_amt > 1.0) smooth_amt = 1.0;
        const bool use_smooth = (smooth_amt > 0.0);
        const double alpha = 1.0 - smooth_amt;
        const double one_minus_alpha = 1.0 - alpha;

        for (size_t i = 0; i < n; ++i) {
            // Decide whether to step this sample
            bool do_step_primary   = !skip_mode_1 || ((sample_counter % skip_interval_1) == 0);
            bool do_step_secondary = !skip_mode_2 || ((sample_counter % skip_interval_2) == 0);

            // Step primary coupled pair
            if (do_step_primary && n1 > 0) {
                for (int s = 0; s < n1; ++s) {
                    step_coupled(_p_x1, _p_y1, _p_z1, _p_x2, _p_y2, _p_z2,
                                 sig, b, rho1, rho2, eps, dt_base);
                }
            }

            // Step secondary coupled pair
            if (do_step_secondary && n2 > 0) {
                for (int s = 0; s < n2; ++s) {
                    step_coupled(_s_x1, _s_y1, _s_z1, _s_x2, _s_y2, _s_z2,
                                 sig, b, rho1, rho2, eps, dt_base);
                }
            }

            // Bad state check (throttled)
            if ((sample_counter & 0x3F) == 0) {
                if (is_bad_state(_p_x2, _p_y2, _p_z2) || is_bad_state(_s_x2, _s_y2, _s_z2) ||
                    is_bad_state(_p_x1, _p_y1, _p_z1) || is_bad_state(_s_x1, _s_y1, _s_z1)) {
                    init_state(pos);
                }
            }

            // Output only the coupled oscillators (osc2 from each pair)
            double xv  = _p_x2, yv  = _p_y2, zv  = _p_z2;
            double xv2 = _s_x2, yv2 = _s_y2, zv2 = _s_z2;

            if (do_scale) {
                xv  = std::tanh(_p_x2 * sf);
                yv  = std::tanh(_p_y2 * sf);
                zv  = std::tanh(_p_z2 * sf);
                xv2 = std::tanh(_s_x2 * sf);
                yv2 = std::tanh(_s_y2 * sf);
                zv2 = std::tanh(_s_z2 * sf);
            }

            if (use_smooth) {
                _ox  = one_minus_alpha * _ox  + alpha * xv;
                _oy  = one_minus_alpha * _oy  + alpha * yv;
                _oz  = one_minus_alpha * _oz  + alpha * zv;
                _ox2 = one_minus_alpha * _ox2 + alpha * xv2;
                _oy2 = one_minus_alpha * _oy2 + alpha * yv2;
                _oz2 = one_minus_alpha * _oz2 + alpha * zv2;

                outs[0][i] = static_cast<sample>(_ox);
                outs[1][i] = static_cast<sample>(_oy);
                outs[2][i] = static_cast<sample>(_oz);
                outs[3][i] = static_cast<sample>(_ox2);
                outs[4][i] = static_cast<sample>(_oy2);
                outs[5][i] = static_cast<sample>(_oz2);
            } else {
                outs[0][i] = static_cast<sample>(xv);
                outs[1][i] = static_cast<sample>(yv);
                outs[2][i] = static_cast<sample>(zv);
                outs[3][i] = static_cast<sample>(xv2);
                outs[4][i] = static_cast<sample>(yv2);
                outs[5][i] = static_cast<sample>(zv2);
            }

            ++sample_counter;
        }
    }

private:
    // Primary coupled pair: osc1 (driving) + osc2 (coupled, output)
    double _p_x1{0}, _p_y1{0}, _p_z1{0};  // driving oscillator
    double _p_x2{0}, _p_y2{0}, _p_z2{0};  // coupled oscillator (output)

    // Secondary coupled pair
    double _s_x1{0}, _s_y1{0}, _s_z1{0};
    double _s_x2{0}, _s_y2{0}, _s_z2{0};

    // Smoothed outputs
    double _ox{0}, _oy{0}, _oz{0};
    double _ox2{0}, _oy2{0}, _oz2{0};

    size_t sample_counter{0};
    std::atomic<bool> pending_reset{false};

    // Step both oscillators together (required due to coupling)
    void step_coupled(double& x1, double& y1, double& z1,
                      double& x2, double& y2, double& z2,
                      double sig, double b, double rho1, double rho2,
                      double eps, double dt_val) {
        // Oscillator 1 (driving): standard Lorenz
        double dx1 = sig * (y1 - x1);
        double dy1 = rho1 * x1 - y1 - x1 * z1;
        double dz1 = x1 * y1 - b * z1;

        // Oscillator 2 (coupled): Lorenz + coupling term
        double dx2 = sig * (y2 - x2) + eps * (x1 - x2);
        double dy2 = rho2 * x2 - y2 - x2 * z2;
        double dz2 = x2 * y2 - b * z2;

        // Euler integration for both
        x1 += dx1 * dt_val;
        y1 += dy1 * dt_val;
        z1 += dz1 * dt_val;
        x2 += dx2 * dt_val;
        y2 += dy2 * dt_val;
        z2 += dz2 * dt_val;
    }

    static bool is_bad_state(double a, double b, double c) {
        if (!std::isfinite(a) || !std::isfinite(b) || !std::isfinite(c)) return true;
        constexpr double limit = 500.0;
        if (std::abs(a) > limit || std::abs(b) > limit || std::abs(c) > limit) return true;
        const double r2 = a*a + b*b + c*c;
        return r2 < 1e-10;
    }
};

MIN_EXTERNAL(clorenz);
