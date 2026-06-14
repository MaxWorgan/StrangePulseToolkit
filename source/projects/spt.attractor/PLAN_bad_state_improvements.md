# Plan: Improved Bad State Detection for Attractors

## Scope (Refined)

**Detect as bad state:**
- Fixed points (mathematical zeros where system gets stuck)
- Blow-up (NaN, Inf, overflow)
- Origin collapse

**NOT bad state (leave alone):**
- Limit cycles / periodic orbits - these are valid and desirable

**No perturbation on reset** - simple reset to default position

---

## Current State Analysis

### What Currently Exists

**Detection in `attractor_base.h`:**
- `is_bad_state()` - checks NaN, Inf, overflow (>100), collapse (r2 < 1e-10)
- `is_stalled()` - checks velocity near zero (vel_sq < 1e-16)
- Stall counter with threshold of 5 consecutive stalls
- Checks happen every 64 samples

**Bang handler** - already exists in base class and clorenz

**Test suite** - `bad_state_test.cpp` covers basic detection tests

---

## Problem: Why Systems Get Stuck

### 1. True Fixed Points (Mathematical)
Many attractors have fixed points where derivatives = 0:
- **Lorenz origin** (0,0,0) - always a fixed point
- **Lorenz symmetric points** at (±√(β(ρ-1)), ±√(β(ρ-1)), ρ-1) when ρ > 1
- **Thomas origin** - fixed point when sin(0) - b*0 = 0

Current detection catches velocity → 0, but the stall threshold (5 checks × 64 samples = 320 samples minimum) may be too slow.

### 2. Parameter-Dependent Stability Changes
- **Lorenz**: ρ < 1 → origin is globally stable
- **Lorenz**: 1 < ρ < ~24.74 → symmetric fixed points are stable
- **Thomas**: b > 1 → origin becomes stable attractor
- System can drift into stable regime with parameter changes

### 3. Numerical Decay to Fixed Point
Even in chaotic regime, numerical precision issues can cause slow drift toward fixed points, especially:
- Near bifurcation boundaries
- With low dt values
- After long running times

### 4. Limit Cycles (Periodic Orbits)
Some parameter regions produce periodic orbits rather than chaos. System isn't "stuck" but isn't chaotic either. This may or may not need detection depending on use case.

---

## Proposed Improvements

### A. Enhanced Fixed Point Detection

**Current:** Single velocity threshold (1e-16)

**Proposed:** Multi-level detection
```cpp
// Fast detection: immediate bad state
static constexpr double velocity_dead_threshold = 1e-20;

// Slow detection: consecutive stall with higher threshold
static constexpr double velocity_stall_threshold = 1e-12;
static constexpr int stall_threshold = 3;  // Reduced from 5
```

**Rationale:** Very small velocities (1e-20) indicate immediate fixed point. Slightly larger velocities (1e-12) over multiple checks indicate slow decay to fixed point.

### B. Variance-Based Stagnation Detection

Track output variance over a sliding window. If variance drops below threshold, system may be stuck even if velocity isn't exactly zero.

```cpp
// Simple variance tracking using exponential moving average
double _variance_x{1.0}, _variance_y{1.0}, _variance_z{1.0};
double _mean_x{0}, _mean_y{0}, _mean_z{0};
static constexpr double variance_alpha = 0.001;  // Slow update
static constexpr double variance_threshold = 1e-8;

void update_variance(double x, double y, double z) {
    _mean_x = (1 - variance_alpha) * _mean_x + variance_alpha * x;
    _mean_y = (1 - variance_alpha) * _mean_y + variance_alpha * y;
    _mean_z = (1 - variance_alpha) * _mean_z + variance_alpha * z;

    double dx = x - _mean_x;
    double dy = y - _mean_y;
    double dz = z - _mean_z;

    _variance_x = (1 - variance_alpha) * _variance_x + variance_alpha * dx * dx;
    _variance_y = (1 - variance_alpha) * _variance_y + variance_alpha * dy * dy;
    _variance_z = (1 - variance_alpha) * _variance_z + variance_alpha * dz * dz;
}

bool is_low_variance() const {
    return (_variance_x + _variance_y + _variance_z) < variance_threshold;
}
```

### C. Position-Based Fixed Point Detection

Check if position is near known fixed points (per-attractor):

```cpp
// In derived class, optionally override:
virtual bool is_near_fixed_point(double x, double y, double z) const {
    // Default: check origin
    return (x*x + y*y + z*z) < 1e-8;
}

// Lorenz override:
bool is_near_fixed_point(double x, double y, double z) const override {
    // Check origin
    if (x*x + y*y + z*z < 1e-8) return true;

    // Check symmetric fixed points if rho > 1
    double r = rho.get();
    if (r > 1) {
        double b = beta.get();
        double fx = std::sqrt(b * (r - 1));
        double fz = r - 1;
        // Check both symmetric points
        double d1 = (x-fx)*(x-fx) + (y-fx)*(y-fx) + (z-fz)*(z-fz);
        double d2 = (x+fx)*(x+fx) + (y+fx)*(y+fx) + (z-fz)*(z-fz);
        if (d1 < 1e-6 || d2 < 1e-6) return true;
    }
    return false;
}
```

### D. Per-Attractor Configurable Limits

Move thresholds to derived class defaults:
```cpp
// In attractor_base:
static constexpr double default_overflow_limit = 100.0;
static constexpr double default_collapse_threshold = 1e-10;

// In clorenz:
static constexpr double default_overflow_limit = 500.0;
```

---

## Test Suite Additions

### New Test Categories

1. **Fixed Point Approach Tests**
   - Test that system detects approach to origin
   - Test that system detects approach to symmetric fixed points (Lorenz)
   - Test with parameters that make fixed points stable

2. **Bang Reset Tests**
   - Verify bang resets state
   - Verify trajectory after reset is different
   - Verify stall counters reset

3. **Variance Detection Tests**
   - Test that low variance is detected
   - Test that chaotic motion has high variance

4. **Parameter Edge Case Tests**
   - Lorenz with rho < 1
   - Lorenz with rho near bifurcation (~24.74)
   - Thomas with b > 1

5. **Long-Running Stability Tests**
   - Run attractors for extended periods
   - Verify they remain chaotic
   - Verify resets work after long runs

6. **Per-Attractor Specific Tests**
   - Each attractor's known fixed points
   - Each attractor's typical operating range

---

## Implementation Order

1. **Phase 1: Improve existing detection**
   - Lower stall threshold from 5 to 3
   - Add dual-threshold velocity check
   - Update tests

2. **Phase 2: Add variance detection**
   - Implement variance tracking
   - Add to bad state check
   - Update tests

3. **Phase 3: Per-attractor fixed points**
   - Add `is_near_fixed_point()` checks
   - Each attractor checks its known fixed points
   - Update tests

---

## Resolved Design Decisions

1. **Limit cycles** - NOT detected as bad state. They are valid and desirable.
2. **Reset perturbation** - NOT adding. Simple reset to default position.
3. **Fixed point detection** - Use position-based checks for known fixed points + improved velocity detection.
