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

// Macro for subclass attributes that trigger secondary sync.
// Only request a sync when the value actually changes: a setter also fires on
// patch load and on no-op re-sends of the current value, and syncing then would
// needlessly collapse the secondary trajectory back onto the primary.
#define MAKE_ATTR(TYPE, NAME, DEFAULT, DESC)                        \
    attribute<TYPE> NAME{ this, #NAME, DEFAULT, description{DESC},  \
        setter{ MIN_FUNCTION{                                       \
            if (!args.empty() && static_cast<TYPE>(args[0]) != this->NAME.get()) \
                this->request_secondary_sync();                     \
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

    // Output smoothing default: EMA weight kept from history (0 = off, 1 = max).
    static constexpr double default_smooth          = 0.8;
    // The dt attribute is expressed in a convenient user range; this scales it
    // into the integrator's per-sample time step: dt_base = dt/sr * dt_time_scale.
    static constexpr double dt_time_scale           = 100.0;

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
    attribute<number> smooth          { this, "smooth",          default_smooth,                   description{"Output smoothing (0=off, 1=max)"} };

    // Cached reset position. Declared before `position` so its setter can populate
    // it during construction. Updated only when the position attribute changes,
    // avoiding a std::vector copy on every audio buffer (it is read on the audio
    // thread; a torn read during a rare position change is a benign reset target).
    Vec3 _reset_position { Vec3::Zero() };
    attribute<vector<number>> position { this, "position", Derived::default_position,
        description{"Reset position (x, y, z)"},
        setter{ MIN_FUNCTION {
            _reset_position = vec3_from(args);
            return args;
        }}
    };
    attribute<bool>   use_rk4         { this, "use_rk4",         Derived::default_use_rk4,         description{"Use RK4 integrator (more accurate, slower)"} };
    attribute<bool>   log_resets      { this, "log_resets",      true,                             description{"Log resets to the console"} };
    attribute<bool>   sync_secondary  { this, "sync_secondary",  true,                             description{"Reset secondary position to primary position on parameter change. If disabled the two attractors might diverge."} };

    attractor_base(const atoms& args = {}) {
        // Initialize the cache from the (possibly defaulted) attribute, in case the
        // attribute default did not fire the position setter during construction.
        _reset_position = vec3_from(position.get());
        Vec3 pos = _reset_position;
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
        const double dt_base = (dt.get() / sr) * dt_time_scale;
        const double scale_factor = Derived::default_scale_factor;
        const bool   do_scale = scale_outputs.get();
        const bool   use_rk4_flag = use_rk4.get();
        const Vec3   reset_pos = get_position();

        // Only spend cycles on the secondary attractor when at least one of its
        // outputs is actually patched. has_signal_connection() reflects the
        // current dsp chain, so connecting or disconnecting a secondary outlet
        // recompiles the chain and flips this with no user intervention. When
        // unused, we skip its integration, scaling and smoothing entirely and
        // emit silence on its outlets.
        const bool secondary_active = output_x2.has_signal_connection()
                                   || output_y2.has_signal_connection()
                                   || output_z2.has_signal_connection();

        if (sr > 0.0) {
            _reset_log_interval_samples = std::max<size_t>(
                1, static_cast<size_t>(sr * default_reset_log_interval_sec));
        } else {
            _reset_log_interval_samples = 0;
        }

        // Exponential moving average: smoothed = history_weight*previous + new_weight*sample.
        // smooth (0..1) is how much of the previous smoothed value to retain.
        const double smooth_amt = std::clamp(smooth.get(), 0.0, 1.0);
        const bool   use_smooth = (smooth_amt > 0.0);
        const double history_weight = smooth_amt;
        const double new_weight     = 1.0 - smooth_amt;

        // Configure speed/stepping
        SpeedConfig sp1 = configure_speed(speed_primary.get());
        SpeedConfig sp2 = configure_speed(speed_secondary.get());

        auto& derived = *static_cast<Derived*>(this);

        // Prime the scaled-output cache for this buffer's do_scale setting. An
        // attractor's scaled output only changes when its position changes (i.e.
        // when it actually steps), so we pay for the tanh scaling once per step
        // and reuse the result on the intervening samples instead of recomputing
        // it every sample. Priming here also picks up any position change from
        // handle_pending_requests() and any toggle of do_scale since last buffer.
        _primary.scaled = scale_pos(_primary.pos, do_scale, scale_factor);
        if (secondary_active) {
            _secondary.scaled = scale_pos(_secondary.pos, do_scale, scale_factor);
        }

        for (size_t i = 0; i < n; ++i) {
            if (should_step(sp1, _sample_counter)) {
                step_n_times(derived, _primary.pos, sp1.substeps, dt_base, use_rk4_flag);
                _primary.scaled = scale_pos(_primary.pos, do_scale, scale_factor);
            }
            if (secondary_active && should_step(sp2, _sample_counter)) {
                step_n_times(derived, _secondary.pos, sp2.substeps, dt_base, use_rk4_flag);
                _secondary.scaled = scale_pos(_secondary.pos, do_scale, scale_factor);
            }

            if ((_sample_counter & (BAD_STATE_CHECK_INTERVAL - 1)) == 0) {
                check_and_handle_bad_state(derived, reset_pos, secondary_active);
                // A reset moves the position, so refresh the cache. This runs at
                // most once per BAD_STATE_CHECK_INTERVAL samples.
                _primary.scaled = scale_pos(_primary.pos, do_scale, scale_factor);
                if (secondary_active) {
                    _secondary.scaled = scale_pos(_secondary.pos, do_scale, scale_factor);
                }
            }

            // Per-sample work is now just the EMA toward the cached scaled target.
            if (use_smooth) {
                _primary.smoothed = history_weight * _primary.smoothed + new_weight * _primary.scaled;
                write_primary(outs, i, _primary.smoothed);
            } else {
                write_primary(outs, i, _primary.scaled);
            }

            if (secondary_active) {
                if (use_smooth) {
                    _secondary.smoothed = history_weight * _secondary.smoothed + new_weight * _secondary.scaled;
                    write_secondary(outs, i, _secondary.smoothed);
                } else {
                    write_secondary(outs, i, _secondary.scaled);
                }
            } else {
                outs[3][i] = static_cast<sample>(0.0);
                outs[4][i] = static_cast<sample>(0.0);
                outs[5][i] = static_cast<sample>(0.0);
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
        Vec3 scaled = Vec3::Zero();   // cached scaled output; refreshed only when pos changes
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

    // Reset reasons are always string literals (static storage duration), so the
    // pointer stashed here from the audio thread stays valid until read on the
    // main thread by the deferred log queue below.
    std::atomic<const char*> _pending_log_reason{nullptr};

    // Console output must happen on Max's main thread, never on the audio or
    // worker thread. queue::set() is thread-safe (qelem_set) and defers the
    // actual printing to the next main-thread service tick.
    queue<> _log_queue { this, MIN_FUNCTION {
        const char* reason = _pending_log_reason.exchange(nullptr, std::memory_order_acq_rel);
        if (reason)
            this->cout << "Reset: " << reason << endl;
        return {};
    }};

    void request_secondary_sync() {
        if(sync_secondary.get()){
            _pending_sync.store(true, std::memory_order_release);
        }
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

    // Build a Vec3 from any size-and-index sequence (atoms or vector<number>),
    // padding missing components with 0. Used to populate the cached reset position.
    template <typename Seq>
    static Vec3 vec3_from(const Seq& s) {
        const double x = s.size() > 0 ? static_cast<double>(s[0]) : 0.0;
        const double y = s.size() > 1 ? static_cast<double>(s[1]) : 0.0;
        const double z = s.size() > 2 ? static_cast<double>(s[2]) : 0.0;
        return Vec3(x, y, z);
    }

    // Returns the cached reset position (updated only when the attribute changes).
    Vec3 get_position() const { return _reset_position; }

    void handle_pending_requests() {
        const Vec3 reset_pos = get_position();
        if (_pending_sync.exchange(false, std::memory_order_acq_rel)) {
            if (is_bad_state(_primary.pos) || is_stalled_check(_primary.pos)) {
                reset_both(reset_pos);
                log_reset("sync (bad state)");
            } else {
                _secondary.pos = _primary.pos;
                _secondary.smoothed = _secondary.pos;
                _secondary.reset_tracking(_secondary.pos);
            }
        }

        if (_pending_reset.exchange(false, std::memory_order_acq_rel)) {
            reset_both(reset_pos);
            log_reset("manual");
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

    void check_and_handle_bad_state(Derived& derived, const Vec3& reset_pos,
                                    bool check_secondary = true) {
        // When the secondary's outlets are unpatched it is frozen and unread, so
        // check_secondary is false and all of its checks below are skipped: it
        // cannot drift into a bad state, and running the stall detector on a
        // static position could otherwise spam reset logging.
        const char* reason_primary = nullptr;
        const char* reason_secondary = nullptr;

        // Check for NaN/Inf
        if (!_primary.pos.allFinite()) {
            reason_primary = "NaN/Inf";
        }
        if (check_secondary && !_secondary.pos.allFinite()) {
            reason_secondary = "NaN/Inf";
        }

        // Check overflow
        if (!reason_primary &&
            _primary.pos.cwiseAbs().maxCoeff() > Derived::default_overflow_limit) {
            reason_primary = "overflow";
        }
        if (check_secondary && !reason_secondary &&
            _secondary.pos.cwiseAbs().maxCoeff() > Derived::default_overflow_limit) {
            reason_secondary = "overflow";
        }

        // Check collapse to origin
        if (!reason_primary &&
            _primary.pos.squaredNorm() < Derived::default_collapse_threshold) {
            reason_primary = "collapse";
        }
        if (check_secondary && !reason_secondary &&
            _secondary.pos.squaredNorm() < Derived::default_collapse_threshold) {
            reason_secondary = "collapse";
        }

        // Compute velocities for stall checks
        Vec3 vel1 = Vec3::Zero(), vel2 = Vec3::Zero();
        if (!reason_primary) {
            derived.compute(vel1, _primary.pos);
        }
        if (check_secondary && !reason_secondary) {
            derived.compute(vel2, _secondary.pos);
        }

        double vel1_sq = vel1.squaredNorm();
        double vel2_sq = vel2.squaredNorm();

        // Immediate stall (essentially zero velocity)
        if (!reason_primary && vel1_sq < Derived::default_stall_immediate_threshold) {
            reason_primary = "stall (immediate)";
        }
        if (check_secondary && !reason_secondary && vel2_sq < Derived::default_stall_immediate_threshold) {
            reason_secondary = "stall (immediate)";
        }

        // Gradual stall detection
        if (!reason_primary && check_stall(_primary, vel1)) {
            reason_primary = "stall (gradual)";
        }
        if (check_secondary && !reason_secondary && check_stall(_secondary, vel2)) {
            reason_secondary = "stall (gradual)";
        }

        // Apply resets
        if (reason_primary) {
            reset_state(_primary, reset_pos);
        }
        if (reason_secondary) {
            reset_state(_secondary, reset_pos);
        }

        // Log with reason (prefer primary reason if both reset)
        if (reason_primary || reason_secondary) {
            log_reset(reason_primary ? reason_primary : reason_secondary);
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

    // Apply output scaling (or pass through) for a position. Wraps scale_vec so
    // the operator loop can cache the result and skip recomputing the tanh on
    // every sample between integrator steps.
    static Vec3 scale_pos(const Vec3& pos, bool do_scale, double sf) {
        return do_scale ? scale_vec(pos, sf) : pos;
    }

    static void write_primary(sample** outs, size_t i, const Vec3& v) {
        outs[0][i] = static_cast<sample>(v(0));
        outs[1][i] = static_cast<sample>(v(1));
        outs[2][i] = static_cast<sample>(v(2));
    }

    static void write_secondary(sample** outs, size_t i, const Vec3& v) {
        outs[3][i] = static_cast<sample>(v(0));
        outs[4][i] = static_cast<sample>(v(1));
        outs[5][i] = static_cast<sample>(v(2));
    }

    void log_reset(const char* reason) {
        if (!log_resets.get()) return;
        if (_reset_log_interval_samples == 0) return;
        if (_sample_counter - _last_reset_log_sample < _reset_log_interval_samples)
            return;
        _last_reset_log_sample = _sample_counter;

        // Hand the reason off to the main thread; do NOT touch the console here
        // (this runs on the audio thread).
        _pending_log_reason.store(reason, std::memory_order_release);
        _log_queue.set();
    }

};
