// attractor_base.h
#pragma once
#include "c74_min.h"
#include <cmath>
#include <atomic>   // NEW: for thread-safe sync flag
#include <limits>

// Macro so that subclasses can just use this, but any changes to attributes will reset secondary attractor
// CHANGED: call request_secondary_sync() to avoid UI/audio thread data races.
#define MAKE_ATTR(TYPE, NAME, DEFAULT, DESC)                        \
    attribute<TYPE> NAME{ this, #NAME, DEFAULT, description{DESC},  \
        setter{ MIN_FUNCTION{                                       \
            this->request_secondary_sync();                         \
            return args;                                            \
        }}                                                          \
    }

using namespace c74::min;

template <typename Derived>
class attractor_base : public object<Derived>, public vector_operator<> {
public:
    static constexpr double default_dt              = 1;
    static constexpr double default_speed_primary   = 0.01;
    static constexpr double default_speed_secondary = 1;
    static constexpr bool   default_scale_outputs   = true;
    static constexpr double default_position        = 0.001;
    static constexpr double default_scale_factor    = 0.1;
    static constexpr bool   default_use_rk4         = false;

    inlet<>  input_signal  { this, "(signal) dummy input", "signal" };
    outlet<> output_x      { this, "(signal) primary x",   "signal" };
    outlet<> output_y      { this, "(signal) primary y",   "signal" };
    outlet<> output_z      { this, "(signal) primary z",   "signal" };
    outlet<> output_x2     { this, "(signal) secondary x", "signal" };
    outlet<> output_y2     { this, "(signal) secondary y", "signal" };
    outlet<> output_z2     { this, "(signal) secondary z", "signal" };

    // Pull per-attractor defaults from Derived::…
    attribute<number> dt              { this, "dt",              Derived::default_dt,              description{"Base integrator time step"} };
    attribute<number> speed_primary   { this, "speed_primary",   Derived::default_speed_primary,   description{"Primary substep multiplier (≈ steps/sample)"} };
    attribute<number> speed_secondary { this, "speed_secondary", Derived::default_speed_secondary, description{"Secondary substep multiplier (≈ steps/sample)"} };
    attribute<bool>   scale_outputs   { this, "scale_outputs",   Derived::default_scale_outputs,   description{"Scale outputs to ±1"} };
    attribute<number> smooth          { this, "smooth",          0.8,                              description{"Output smoothing amount (0 = off, 1 = strong low-pass)"} };
    attribute<number> position        { this, "position",        Derived::default_position,        description{"Reset position on NaN/Inf/Zero"} };
    attribute<bool>   use_rk4         { this, "use_rk4",         Derived::default_use_rk4,         description("Use the rk4 ingreator rather that euler")};

    attractor_base(const atoms& args = {}) {
        double p = position.get();
        static_cast<Derived*>(this)->init_state(p, _x, _y, _z, _x2, _y2, _z2);
        reset_outputs_to_state();
    }

    void operator()(audio_bundle, audio_bundle output) {
        auto   outs = output.samples();
        size_t n    = output.frame_count();

        // Handle deferred, thread-safe secondary sync (requested by attribute setters)
        if (pending_sync.exchange(false, std::memory_order_acq_rel)) {
            _x2 = _x; _y2 = _y; _z2 = _z;
        }

        double& x  = _x;   double& y  = _y;   double& z  = _z;
        double& x2 = _x2;  double& y2 = _y2;  double& z2 = _z2;

        // Substeps per audio sample; clamp to keep CPU sane.
        // dt_base is still per-sample step size; speed < 1 uses sample skipping,
        // speed >= 1 uses substeps-per-sample.
        const double dt_base      = (dt.get() / samplerate()) * 100.0;

        double sp1 = speed_primary.get();
        double sp2 = speed_secondary.get();
        
        if (sp1 < 0.0) sp1 = 0.0;
        if (sp2 < 0.0) sp2 = 0.0;

        bool   skip_mode_1 = false;
        bool   skip_mode_2 = false;
        int    n1          = 0;    // substeps per sample (0 = frozen)
        int    n2          = 0;
        size_t skip_interval_1 = 1;
        size_t skip_interval_2 = 1;

        auto configure_speed = [](double s, bool& skip_mode, int& n, size_t& skip_interval) {
            if (s <= 0.0) {
                // Frozen: never take a step, just hold last value.
                skip_mode    = false;
                n            = 0;
                skip_interval = 1;
            } else if (s < 1.0) {
                // 0 < s < 1: one step every N samples, where N ≈ 1/s.
                skip_mode = true;
                n         = 1;
                double inv = 1.0 / s;
                if (inv < 1.0) inv = 1.0;
                skip_interval = static_cast<size_t>(std::llround(inv));
                if (skip_interval == 0) skip_interval = 1;
            } else {
                // s >= 1: "substeps per sample".
                skip_mode    = false;
                n            = std::max(1, static_cast<int>(std::lround(s)));
                skip_interval = 1;
            }
        };

        configure_speed(sp1, skip_mode_1, n1, skip_interval_1);
        configure_speed(sp2, skip_mode_2, n2, skip_interval_2);

        const bool   use_rk4_flag = use_rk4.get();
        const bool   do_scale     = scale_outputs.get();
        const double pos          = position.get();
        const double sf           = Derived::default_scale_factor;
        // Output smoothing: 0 = off, 1 = strong low-pass.
        double smooth_amt = smooth.get();
        if (smooth_amt < 0.0) smooth_amt = 0.0;
        if (smooth_amt > 1.0) smooth_amt = 1.0;
        const bool use_smooth = (smooth_amt > 0.0);
        // Map smooth_amt (0..1) to alpha for a simple one-pole low-pass:
        // y = (1 - alpha) * y_prev + alpha * x;
        // small alpha => heavier smoothing. We'll invert so that higher smooth_amt
        // means heavier smoothing.
        const double alpha = 1.0 - smooth_amt;        // smooth=0 -> alpha=1 (no smoothing), smooth=1 -> alpha=0 (max smoothing)
        const double one_minus_alpha = 1.0 - alpha;

        auto& derived = *static_cast<Derived*>(this);

        auto step = [&](double& X, double& Y, double& Z) {
            if (use_rk4_flag) {
                rk4_step(derived, X, Y, Z, dt_base);
            } else {
                euler(derived, X, Y, Z, dt_base);
            }
        };

        for (size_t i = 0; i < n; ++i) {

            // Decide whether to step primary / secondary this sample.
            bool do_step_primary   = true;
            bool do_step_secondary = true;

            if (skip_mode_1) {
                do_step_primary = ((sample_counter % static_cast<size_t>(skip_interval_1)) == 0);
            }
            if (skip_mode_2) {
                do_step_secondary = ((sample_counter % static_cast<size_t>(skip_interval_2)) == 0);
            }

            if (do_step_primary) {
                for (int s = 0; s < n1; ++s) {
                    step(x, y, z);
                }
            }

            if (do_step_secondary) {
                for (int s = 0; s < n2; ++s) {
                    step(x2, y2, z2);
                }
            }

            // Bad-state guard (throttled to every 64 samples as before)
            if ((sample_counter & 0x3F) == 0) {
                if (is_bad_state(x, y, z) || is_bad_state(x2, y2, z2)) {
                    derived.init_state(pos, _x, _y, _z, _x2, _y2, _z2);
                    x  = _x;  y  = _y;  z  = _z;
                    x2 = _x2; y2 = _y2; z2 = _z2;
                    reset_outputs_to_state();
                }
            }

            double xv  = x,  yv  = y,  zv  = z;
            double xv2 = x2, yv2 = y2, zv2 = z2;

            if (do_scale) {
                xv  = std::tanh(x  * sf);
                yv  = std::tanh(y  * sf);
                zv  = std::tanh(z  * sf);
                xv2 = std::tanh(x2 * sf);
                yv2 = std::tanh(y2 * sf);
                zv2 = std::tanh(z2 * sf);
            }

            if (use_smooth) {
                // One-pole low-pass on outputs; internal state (_x, etc.) remains exact.
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
                // No smoothing: raw attractor values.
                outs[0][i] = static_cast<sample>(xv);
                outs[1][i] = static_cast<sample>(yv);
                outs[2][i] = static_cast<sample>(zv);
                outs[3][i] = static_cast<sample>(xv2);
                outs[4][i] = static_cast<sample>(yv2);
                outs[5][i] = static_cast<sample>(zv2);
            }

            // Advance the global sample counter used for skipping logic.
            ++sample_counter;
        }
    }

protected:
    double _x{0}, _y{0}, _z{0};
    double _x2{0}, _y2{0}, _z2{0};
    // Smoothed (low-passed) output states for primary and secondary.
    double _ox{0}, _oy{0}, _oz{0};
    double _ox2{0}, _oy2{0}, _oz2{0};
    // Helper to copy current state to output variables (used on reset).
    void reset_outputs_to_state() {
        _ox  = _x;   _oy  = _y;   _oz  = _z;
        _ox2 = _x2;  _oy2 = _y2;  _oz2 = _z2;
    }
    // Global sample counter used for skip-based speed control.
    size_t sample_counter{0};

    void request_secondary_sync() {
        pending_sync.store(true, std::memory_order_release);
    }

    static bool is_bad_state(double a, double b, double c) {
        if (!std::isfinite(a) || !std::isfinite(b) || !std::isfinite(c)) return true;
        if (std::isnan(a) || std::isnan(b) || std::isnan(c)) return true;
        if (a > 100 || b > 100 || c > 100) return true;
        const double r2 = a*a + b*b + c*c;
        return r2 < 1e-10; // "collapsed" guard
    }
    
    template <typename D>
    static inline void euler(D& derived,
                             double& x, double& y, double& z,
                             const double dt) {
        double dx = 0.0, dy = 0.0, dz = 0.0;
        derived.compute(dx, dy, dz, x, y, z);
        x += dx * dt;
        y += dy * dt;
        z += dz * dt;
    }

    template <typename D>
    static inline void rk4_step(D& derived,
                                double& x, double& y, double& z,
                                const double dt) {
        double k1x, k1y, k1z;
        derived.compute(k1x, k1y, k1z, x, y, z);

        double x2 = x + 0.5 * dt * k1x;
        double y2 = y + 0.5 * dt * k1y;
        double z2 = z + 0.5 * dt * k1z;
        double k2x, k2y, k2z;
        derived.compute(k2x, k2y, k2z, x2, y2, z2);

        double x3 = x + 0.5 * dt * k2x;
        double y3 = y + 0.5 * dt * k2y;
        double z3 = z + 0.5 * dt * k2z;
        double k3x, k3y, k3z;
        derived.compute(k3x, k3y, k3z, x3, y3, z3);

        double x4 = x + dt * k3x;
        double y4 = y + dt * k3y;
        double z4 = z + dt * k3z;
        double k4x, k4y, k4z;
        derived.compute(k4x, k4y, k4z, x4, y4, z4);

        x += (dt / 6.0) * (k1x + 2.0 * k2x + 2.0 * k3x + k4x);
        y += (dt / 6.0) * (k1y + 2.0 * k2y + 2.0 * k3y + k4y);
        z += (dt / 6.0) * (k1z + 2.0 * k2z + 2.0 * k3z + k4z);
    }

    std::atomic<bool> pending_sync{false};
};
