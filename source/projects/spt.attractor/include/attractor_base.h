// attractor_base.h
#pragma once
#include "c74_min.h"
#include <cmath>


// Macro so that subclasses can just use this, but any changes to attributes will reset secondary attractor
#define MAKE_ATTR(TYPE, NAME, DEFAULT, DESC)                        \
    attribute<TYPE> NAME{ this, #NAME, DEFAULT, description{DESC},  \
setter{ MIN_FUNCTION{                                               \
            reset_secondary();                                      \
            return args;                                            \
        }}                                                          \
    }

using namespace c74::min;

template <typename Derived>
class attractor_base : public object<Derived>, public vector_operator<> {
public:
    
    static constexpr double default_dt              = 0.01;
    static constexpr double default_speed_primary   = 10.0;
    static constexpr double default_speed_secondary = 100.0;
    static constexpr bool   default_scale_outputs   = true;
    static constexpr double default_position        = 0.001;
    static constexpr double default_scale_factor    = 0.1;
    
    inlet<>  input_signal  { this, "(signal) dummy input", "signal" };
    outlet<> output_x      { this, "(signal) primary x",   "signal" };
    outlet<> output_y      { this, "(signal) primary y",   "signal" };
    outlet<> output_z      { this, "(signal) primary z",   "signal" };
    outlet<> output_x2     { this, "(signal) secondary x", "signal" };
    outlet<> output_y2     { this, "(signal) secondary y", "signal" };
    outlet<> output_z2     { this, "(signal) secondary z", "signal" };

    // **Pull your per-attractor defaults from Derived::…**
    attribute<number> dt            { this, "dt",            Derived::default_dt,            description{"Time step"} };
    attribute<number> speed_primary    { this, "speed_primary",    Derived::default_speed_primary,    description{"Speed Factor of the primary attractor"} };
    attribute<number> speed_secondary    { this, "speed_secondary",    Derived::default_speed_secondary,    description{"Speed Factor of the secondary attractor"} };
    attribute<bool>   scale_outputs { this, "scale_outputs", Derived::default_scale_outputs, description{"Scale outputs to ±1"} };
    attribute<number> position      { this, "position",      Derived::default_position,      description{"Reset position on NaN/Inf/Zero"} };

    attractor_base(const atoms& args = {}) {
        double p = position.get();
        static_cast<Derived*>(this)->init_state(p, _x, _y, _z, _x2, _y2, _z2);
    }

    void operator()(audio_bundle, audio_bundle output) {
        auto   outs      = output.samples();
        size_t n         = output.frame_count();
        double dt_audio  = speed_primary.get() / samplerate();
        double& x        = _x;
        double& y        = _y;
        double& z        = _z;
        double& x2       = _x2;
        double& y2       = _y2;
        double& z2       = _z2;

        for (size_t i = 0; i < n; ++i) {
            double dx, dy, dz;
            static_cast<Derived*>(this)->compute(dx, dy, dz, x, y, z);

            x += dt_audio * dx;
            y += dt_audio * dy;
            z += dt_audio * dz;

            if (std::isinf(x) || std::isinf(y) || std::isinf(z) ||
                std::isnan(x) || std::isnan(y) || std::isnan(z) ||
                (x == 0.0 && y == 0.0 && z == 0.0) || x == y == z) {
                double p = position.get();
                static_cast<Derived*>(this)->init_state(p, _x, _y, _z, _x2, _y2, _z2);
            }
            // Update secondary attractor
            double dt_audio2 = speed_secondary.get() / samplerate();
            double dx2, dy2, dz2;
            static_cast<Derived*>(this)->compute(dx2, dy2, dz2, _x2, _y2, _z2);

            x2 += dt_audio2 * dx2;
            y2 += dt_audio2 * dy2;
            z2 += dt_audio2 * dz2;

            double xv = x, yv = y, zv = z;
            double xv2 = x2, yv2 = y2, zv2 = z2;
            if (scale_outputs.get()) {
                xv = std::tanh(x * Derived::default_scale_factor);
                yv = std::tanh(y * Derived::default_scale_factor);
                zv = std::tanh(z * Derived::default_scale_factor);
                xv2 = std::tanh(_x2 * Derived::default_scale_factor);
                yv2 = std::tanh(_y2 * Derived::default_scale_factor);
                zv2 = std::tanh(_z2 * Derived::default_scale_factor);
            }

            outs[0][i] = static_cast<sample>(xv);
            outs[1][i] = static_cast<sample>(yv);
            outs[2][i] = static_cast<sample>(zv);
            // Secondary attractor output
            outs[3][i] = static_cast<sample>(xv2);
            outs[4][i] = static_cast<sample>(yv2);
            outs[5][i] = static_cast<sample>(zv2);
        }
    }

protected:
    double _x{0}, _y{0}, _z{0};
    double _x2{0}, _y2{0}, _z2{0};
    void reset_secondary() {
        _x2 = _x;
        _y2 = _y;
        _z2 = _z;
    }
    
};
