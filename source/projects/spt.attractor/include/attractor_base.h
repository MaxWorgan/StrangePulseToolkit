// attractor_base.h
#pragma once
#include "c74_min.h"
#include <Eigen/Dense>
#include <cmath>
#include <atomic>
#include <vector>

#include <algorithm>

using namespace c74::min;

// Use Eigen's Vector3d with DontAlign to avoid alignment issues in structs
using Vec3 = Eigen::Matrix<double, 3, 1, Eigen::DontAlign>;

// Fast tanh approximation - accurate to ~0.1% in [-3, 3] range
inline double fast_tanh(double x) {
    if (x < -3.0) return -1.0;
    if (x > 3.0) return 1.0;
    double x2 = x * x;
    return x * (27.0 + x2) / (27.0 + 9.0 * x2);
}

// Macro for subclass attributes that trigger secondary sync
#define MAKE_ATTR(TYPE, NAME, DEFAULT, DESC)                        \
    attribute<TYPE> NAME{ this, #NAME, DEFAULT, description{DESC},  \
        setter{ MIN_FUNCTION{                                       \
            this->request_secondary_sync();                         \
            return args;                                            \
        }}                                                          \
    }

template <typename Derived>
class attractor_base : public object<Derived>, public vector_operator<> {
public:
    // Use Derived::default_* to access subclass values
    static constexpr double default_collapse_threshold        = 1e-10;
    static constexpr double default_stall_immediate_threshold = 1e-40;
    static constexpr double default_stall_threshold           = 1e-12;
    static constexpr int    default_stall_count_limit         = 3;
    static constexpr size_t BAD_STATE_CHECK_INTERVAL          = 64;
    static constexpr double default_reset_log_interval_sec    = 1.5;


    // Per-attractor overridable defaults
    static constexpr double default_dt              = 1;
    static constexpr double default_speed_primary   = 0.01;
    static constexpr double default_speed_secondary = 1;
    static constexpr bool   default_scale_outputs   = true;
    static inline std::vector<double> default_position{0.001, 0.001, 0.001};
    static constexpr double default_scale_factor    = 0.1;
    static constexpr bool   default_use_rk4         = false;
    static constexpr double default_overflow_limit  = 100.0;

    inlet<>  input_signal  { this, "(signal) dummy input", "signal" };
    outlet<> output_x      { this, "(signal) primary x",   "signal" };
    outlet<> output_y      { this, "(signal) primary y",   "signal" };
    outlet<> output_z      { this, "(signal) primary z",   "signal" };
    outlet<> output_x2     { this, "(signal) secondary x", "signal" };
    outlet<> output_y2     { this, "(signal) secondary y", "signal" };
    outlet<> output_z2     { this, "(signal) secondary z", "signal" };

    attribute<number> dt              { this, "dt",              Derived::default_dt,              description{"Base integrator time step"} };
    attribute<number> speed_primary   { this, "speed_primary",   Derived::default_speed_primary,   description{"Primary substep multiplier"} };
    attribute<number> speed_secondary { this, "speed_secondary", Derived::default_speed_secondary, description{"Secondary substep multiplier"} };
    attribute<bool>   scale_outputs   { this, "scale_outputs",   Derived::default_scale_outputs,   description{"Scale outputs to +/-1"} };
    attribute<number> smooth          { this, "smooth",          0.8,                              description{"Output smoothing (0=off, 1=max)"} };
    attribute<vector<number>> position { this, "position",       Derived::default_position,        description{"Reset position (x, y, z)"} };
    attribute<bool>   use_rk4         { this, "use_rk4",         Derived::default_use_rk4,         description{"Use RK4 integrator (more accurate, slower)"} };
    attribute<bool>   log_resets      { this, "log_resets",      true,                             description{"Log resets to the console"} };

    attractor_base(const atoms& args = {}) {
        Vec3 pos = get_position();
        _primary.pos = pos;
        _secondary.pos = pos;
        reset_outputs();
    }

    void operator()(audio_bundle, audio_bundle output) {
        auto*  outs = output.samples();
        size_t n    = output.frame_count();

        handle_pending_requests();

        // Cache attributes once per buffer
        const double sr = samplerate();
        const double dt_base = (dt.get() / sr) * 100.0;
        const double scale_factor = Derived::default_scale_factor;
        const bool   do_scale = scale_outputs.get();
        const bool   use_rk4_flag = use_rk4.get();
        const Vec3   reset_pos = get_position();

        if (sr > 0.0) {
            _reset_log_interval_samples = std::max<size_t>(
                1, static_cast<size_t>(sr * default_reset_log_interval_sec));
        } else {
            _reset_log_interval_samples = 0;
        }

        // Smoothing coefficients
        double smooth_amt = std::clamp(smooth.get(), 0.0, 1.0);
        const bool   use_smooth = (smooth_amt > 0.0);
        const double alpha = 1.0 - smooth_amt;
        const double one_minus_alpha = smooth_amt;

        // Configure speed/stepping
        SpeedConfig sp1 = configure_speed(speed_primary.get());
        SpeedConfig sp2 = configure_speed(speed_secondary.get());

        auto& derived = *static_cast<Derived*>(this);

        for (size_t i = 0; i < n; ++i) {
            if (should_step(sp1, _sample_counter)) {
                step_n_times(derived, _primary.pos, sp1.substeps, dt_base, use_rk4_flag);
            }
            if (should_step(sp2, _sample_counter)) {
                step_n_times(derived, _secondary.pos, sp2.substeps, dt_base, use_rk4_flag);
            }

            if ((_sample_counter & (BAD_STATE_CHECK_INTERVAL - 1)) == 0) {
                check_and_handle_bad_state(derived, reset_pos);
            }

            Vec3 out1 = do_scale ? scale_vec(_primary.pos, scale_factor) : _primary.pos;
            Vec3 out2 = do_scale ? scale_vec(_secondary.pos, scale_factor) : _secondary.pos;

            if (use_smooth) {
                _primary.smoothed = one_minus_alpha * _primary.smoothed + alpha * out1;
                _secondary.smoothed = one_minus_alpha * _secondary.smoothed + alpha * out2;
                write_outputs(outs, i, _primary.smoothed, _secondary.smoothed);
            } else {
                write_outputs(outs, i, out1, out2);
            }

            ++_sample_counter;
        }
    }

    message<> bang { this, "bang", "Reset attractor to initial state",
        MIN_FUNCTION {
            _pending_reset.store(true, std::memory_order_release);
            return {};
        }
    };

protected:
    struct AttractorState {
        Vec3 pos = Vec3::Zero();
        Vec3 smoothed = Vec3::Zero();
        Vec3 mean = Vec3::Zero();
        int stall_count{0};

        void reset_tracking(const Vec3& p) {
            mean = p;
            stall_count = 0;
        }
    };

    AttractorState _primary;
    AttractorState _secondary;
    size_t _sample_counter{0};
    size_t _last_reset_log_sample{0};
    size_t _reset_log_interval_samples{0};

    std::atomic<bool> _pending_sync{false};
    std::atomic<bool> _pending_reset{false};

    void request_secondary_sync() {
        _pending_sync.store(true, std::memory_order_release);
    }

private:
    struct SpeedConfig {
        int substeps{0};
        size_t skip_interval{1};
        bool skip_mode{false};
    };

    static SpeedConfig configure_speed(double s) {
        SpeedConfig cfg;
        if (s <= 0.0) {
            cfg.substeps = 0;
        } else if (s < 1.0) {
            cfg.skip_mode = true;
            cfg.substeps = 1;
            cfg.skip_interval = std::max(size_t(1), static_cast<size_t>(std::llround(1.0 / s)));
        } else {
            cfg.substeps = std::max(1, static_cast<int>(std::lround(s)));
        }
        return cfg;
    }

    static bool should_step(const SpeedConfig& cfg, size_t counter) {
        if (cfg.substeps == 0) return false;
        if (!cfg.skip_mode) return true;
        return (counter % cfg.skip_interval) == 0;
    }

    Vec3 get_position() {
        auto pos = position.get();
        const double x = pos.size() > 0 ? pos[0] : 0.0;
        const double y = pos.size() > 1 ? pos[1] : 0.0;
        const double z = pos.size() > 2 ? pos[2] : 0.0;
        return Vec3(x, y, z);
    }

    void handle_pending_requests() {
        const Vec3 reset_pos = get_position();
        if (_pending_sync.exchange(false, std::memory_order_acq_rel)) {
            if (is_bad_state(_primary.pos) || is_stalled_check(_primary.pos)) {
                reset_both(reset_pos);
                log_reset();
            } else {
                _secondary.pos = _primary.pos;
                _secondary.smoothed = _secondary.pos;
                _secondary.reset_tracking(_secondary.pos);
            }
        }

        if (_pending_reset.exchange(false, std::memory_order_acq_rel)) {
            reset_both(reset_pos);
            log_reset();
        }
    }

    void reset_outputs() {
        _primary.smoothed = _primary.pos;
        _secondary.smoothed = _secondary.pos;
        _primary.reset_tracking(_primary.pos);
        _secondary.reset_tracking(_secondary.pos);
    }

    void reset_state(AttractorState& state, const Vec3& pos) {
        state.pos = pos;
        state.smoothed = pos;
        state.reset_tracking(pos);
    }

    void reset_both(const Vec3& pos) {
        reset_state(_primary, pos);
        reset_state(_secondary, pos);
    }

    bool is_stalled_check(const Vec3& pos) {
        auto& derived = *static_cast<Derived*>(this);
        Vec3 vel;
        derived.compute(vel, pos);
        return vel.squaredNorm() < Derived::default_stall_threshold;
    }

    bool is_bad_state(const Vec3& v) const {
        if (!v.allFinite()) return true;
        const double limit = Derived::default_overflow_limit;
        if (v.cwiseAbs().maxCoeff() > limit) return true;
        return v.squaredNorm() < Derived::default_collapse_threshold;
    }

    bool check_stall(AttractorState& state, const Vec3& vel) {
        double vel_sq = vel.squaredNorm();
        if (vel_sq < Derived::default_stall_immediate_threshold) return true;

        if (vel_sq < Derived::default_stall_threshold) {
            if (++state.stall_count >= Derived::default_stall_count_limit) return true;
        } else {
            state.stall_count = 0;
        }
        return false;
    }

    void check_and_handle_bad_state(Derived& derived, const Vec3& reset_pos) {
        bool reset_primary = false;
        bool reset_secondary = false;

        if (!_primary.pos.allFinite()) {
            reset_primary = true;
        }
        if (!_secondary.pos.allFinite()) {
            reset_secondary = true;
        }
        if (!reset_primary &&
            _primary.pos.cwiseAbs().maxCoeff() > Derived::default_overflow_limit) {
            reset_primary = true;
        }
        if (!reset_secondary &&
            _secondary.pos.cwiseAbs().maxCoeff() > Derived::default_overflow_limit) {
            reset_secondary = true;
        }
        if (!reset_primary &&
            _primary.pos.squaredNorm() < Derived::default_collapse_threshold) {
            reset_primary = true;
        }
        if (!reset_secondary &&
            _secondary.pos.squaredNorm() < Derived::default_collapse_threshold) {
            reset_secondary = true;
        }

        Vec3 vel1 = Vec3::Zero(), vel2 = Vec3::Zero();
        if (!reset_primary) {
            derived.compute(vel1, _primary.pos);
        }
        if (!reset_secondary) {
            derived.compute(vel2, _secondary.pos);
        }

        double vel1_sq = vel1.squaredNorm();
        double vel2_sq = vel2.squaredNorm();

        if (!reset_primary && vel1_sq < Derived::default_stall_immediate_threshold) {
            reset_primary = true;
        }
        if (!reset_secondary && vel2_sq < Derived::default_stall_immediate_threshold) {
            reset_secondary = true;
        }
        if (!reset_primary && check_stall(_primary, vel1)) {
            reset_primary = true;
        }
        if (!reset_secondary && check_stall(_secondary, vel2)) {
            reset_secondary = true;
        }

        if (reset_primary) {
            reset_state(_primary, reset_pos);
        }
        if (reset_secondary) {
            reset_state(_secondary, reset_pos);
        }
        if (reset_primary || reset_secondary) {
            log_reset();
        }
    }

    template <typename D>
    void step_n_times(D& derived, Vec3& pos, int n, double dt_val, bool use_rk4) {
        if (use_rk4) {
            for (int i = 0; i < n; ++i) rk4_step(derived, pos, dt_val);
        } else {
            for (int i = 0; i < n; ++i) euler_step(derived, pos, dt_val);
        }
    }

    template <typename D>
    static void euler_step(D& derived, Vec3& pos, double dt) {
        Vec3 vel;
        derived.compute(vel, pos);
        pos += vel * dt;
    }

    template <typename D>
    static void rk4_step(D& derived, Vec3& pos, double dt) {
        Vec3 k1, k2, k3, k4;

        derived.compute(k1, pos);
        derived.compute(k2, pos + k1 * (0.5 * dt));
        derived.compute(k3, pos + k2 * (0.5 * dt));
        derived.compute(k4, pos + k3 * dt);

        pos += (dt / 6.0) * (k1 + 2.0 * k2 + 2.0 * k3 + k4);
    }

    static Vec3 scale_vec(const Vec3& v, double sf) {
        return Vec3(fast_tanh(v(0) * sf), fast_tanh(v(1) * sf), fast_tanh(v(2) * sf));
    }

    static void write_outputs(sample** outs, size_t i, const Vec3& v1, const Vec3& v2) {
        outs[0][i] = static_cast<sample>(v1(0));
        outs[1][i] = static_cast<sample>(v1(1));
        outs[2][i] = static_cast<sample>(v1(2));
        outs[3][i] = static_cast<sample>(v2(0));
        outs[4][i] = static_cast<sample>(v2(1));
        outs[5][i] = static_cast<sample>(v2(2));
    }

    void log_reset() {
        if (!log_resets.get()) return;
        if (_reset_log_interval_samples == 0) return;
        if (_sample_counter - _last_reset_log_sample < _reset_log_interval_samples)
            return;
        _last_reset_log_sample = _sample_counter;

        this->cout << "Reset" << endl;
    }

};
