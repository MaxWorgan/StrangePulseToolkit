// Standalone test for the spt.rpde accumulation buffer (issue #3).
//
// spt.rpde externals cannot be compiled outside the Max runtime, so this test
// *models* the production accumulation logic and keeps it in sync by hand.
//
// Two models are defined:
//   * VectorAccumulator — the OLD logic: std::vector with push_back +
//     erase(begin, ...) front-trimming on the audio thread.
//   * RingAccumulator   — the NEW logic: a fixed-capacity ring buffer that
//     never reallocates and never shifts memory.
//
// The test proves that, in the steady-state (worker-idle) path, the new ring
// buffer emits exactly the same sequence of analysis windows as the old vector,
// and that the ring buffer satisfies the real-time-safety invariants the change
// was made for: capacity is fixed for life and the backing storage is never
// reallocated.
//
// Build:  clang++ -std=c++17 -O2 ring_buffer_test.cpp -o ring_buffer_test
//
// Keep in sync with source/projects/spt.rpde/spt.rpde.cpp operator().

#include <vector>
#include <cstddef>
#include <iostream>
#include <string>
#include <algorithm>

// ---------------------------------------------------------------------------
// OLD logic: std::vector + push_back + front-erase (the RT hazard being fixed).
// Mirrors the pre-change spt.rpde.cpp operator() accumulation path.
// ---------------------------------------------------------------------------
class VectorAccumulator {
public:
    VectorAccumulator(int window_size, int hop, int subsample)
        : ws(window_size), hop(hop), subsamp(subsample < 1 ? 1 : subsample) {
        accum.reserve(static_cast<size_t>(ws) * 2);
    }

    // Feed one block of input; returns the window emitted this block (empty if none).
    std::vector<float> process_block(const std::vector<float>& in) {
        std::vector<float> emitted;

        for (float x : in) {
            counter++;
            if (counter % subsamp == 0)
                accum.push_back(x);
        }

        if (accum.size() >= static_cast<size_t>(ws)) {
            auto start = (accum.size() > static_cast<size_t>(ws))
                         ? accum.end() - ws
                         : accum.begin();
            emitted.assign(start, accum.end());

            if (hop > 0 && hop < ws) {
                size_t overlap = static_cast<size_t>(ws - hop);
                if (accum.size() > overlap)
                    accum.erase(accum.begin(), accum.end() - overlap);
                else
                    accum.clear();
            } else {
                accum.clear();
            }
        }

        if (accum.size() > static_cast<size_t>(ws * 2))
            accum.erase(accum.begin(), accum.end() - ws);

        return emitted;
    }

private:
    int ws, hop, subsamp;
    std::vector<float> accum;
    size_t counter = 0;
};

// ---------------------------------------------------------------------------
// NEW logic: fixed-capacity ring buffer (RT-safe).
// Mirrors the post-change spt.rpde.cpp operator() accumulation path.
// ---------------------------------------------------------------------------
class RingAccumulator {
public:
    RingAccumulator(int window_size, int hop, int subsample)
        : ws(window_size), hop(hop), subsamp(subsample < 1 ? 1 : subsample) {
        ring.assign(static_cast<size_t>(ws), 0.0f);
        initial_capacity = ring.capacity();
        initial_data = ring.data();
    }

    // Mirrors the production `worker_busy` atomic: when the worker is still
    // processing the previous window, the perform method keeps accumulating but
    // does NOT emit. The ring keeps overwriting oldest samples (available stays
    // clamped at cap), so the next emit uses the freshest window.
    void set_worker_busy(bool b) { worker_busy = b; }

    std::vector<float> process_block(const std::vector<float>& in) {
        std::vector<float> emitted;
        const size_t cap = ring.size();

        for (float x : in) {
            counter++;
            if (counter % subsamp == 0) {
                ring[head] = x;
                if (++head == cap) head = 0;
                if (available < static_cast<int>(cap)) available++;
            }
        }

        if (available >= ws && !worker_busy) {
            emitted.resize(cap);
            // Oldest -> newest, as two contiguous spans from head.
            std::copy(ring.begin() + head, ring.end(), emitted.begin());
            std::copy(ring.begin(), ring.begin() + head, emitted.begin() + (cap - head));

            if (hop > 0 && hop < ws)
                available = ws - hop;
            else
                available = 0;
        }

        return emitted;
    }

    // RT-safety invariants: the backing storage must never reallocate.
    bool storage_stable() const {
        return ring.capacity() == initial_capacity && ring.data() == initial_data;
    }

private:
    int ws, hop, subsamp;
    std::vector<float> ring;
    size_t head = 0;
    int available = 0;
    size_t counter = 0;
    bool worker_busy = false;
    size_t initial_capacity = 0;
    const float* initial_data = nullptr;
};

// ---------------------------------------------------------------------------
// Test harness.
// ---------------------------------------------------------------------------
static int failures = 0;

static void check(bool cond, const std::string& msg) {
    if (!cond) {
        std::cout << "  FAIL: " << msg << std::endl;
        failures++;
    }
}

// Stream a deterministic ramp through both accumulators in fixed-size blocks and
// require the emitted window sequences to be identical.
static void test_equivalence(int ws, int hop, int subsamp, int block, int total) {
    VectorAccumulator vec(ws, hop, subsamp);
    RingAccumulator ring(ws, hop, subsamp);

    std::string label = "ws=" + std::to_string(ws) + " hop=" + std::to_string(hop) +
                        " subsamp=" + std::to_string(subsamp) + " block=" + std::to_string(block);

    float sample = 0.0f;
    int emitted_count = 0;
    for (int fed = 0; fed < total; fed += block) {
        std::vector<float> in(block);
        for (int i = 0; i < block; i++) in[i] = sample++;  // unique values -> strong ordering check

        auto w_vec = vec.process_block(in);
        auto w_ring = ring.process_block(in);

        check(w_vec.size() == w_ring.size(),
              label + ": emitted-window size mismatch (" +
              std::to_string(w_vec.size()) + " vs " + std::to_string(w_ring.size()) + ")");

        if (w_vec.size() == w_ring.size()) {
            bool match = true;
            for (size_t i = 0; i < w_vec.size(); i++) {
                if (w_vec[i] != w_ring[i]) { match = false; break; }
            }
            check(match, label + ": emitted-window contents differ");
        }
        if (!w_ring.empty()) emitted_count++;
    }

    // Sanity: the stream is long enough that windows actually fired.
    check(emitted_count > 0, label + ": expected at least one window to be emitted");
    // The whole run must not have reallocated the ring's storage.
    check(ring.storage_stable(), label + ": ring buffer storage reallocated (NOT RT-safe)");
}

// Exact-content check for the simplest case: non-overlapping windows, no subsample.
// Window k must be samples[k*ws .. (k+1)*ws).
static void test_exact_nonoverlapping() {
    const int ws = 64;
    RingAccumulator ring(ws, ws /*hop==ws -> no overlap*/, 1);

    float sample = 0.0f;
    int window_index = 0;
    for (int fed = 0; fed < ws * 5; fed += ws) {
        std::vector<float> in(ws);
        for (int i = 0; i < ws; i++) in[i] = sample++;
        auto w = ring.process_block(in);
        if (!w.empty()) {
            bool ok = (static_cast<int>(w.size()) == ws);
            for (int i = 0; ok && i < ws; i++)
                ok = (w[i] == static_cast<float>(window_index * ws + i));
            check(ok, "non-overlapping window " + std::to_string(window_index) + " has wrong contents");
            window_index++;
        }
    }
    check(window_index >= 4, "expected ~5 non-overlapping windows");
}

// Overlap check: with hop < ws, consecutive windows must share (ws - hop) tail/head samples.
static void test_overlap_continuity() {
    const int ws = 100, hop = 40;
    RingAccumulator ring(ws, hop, 1);

    float sample = 0.0f;
    std::vector<float> prev;
    int checked = 0;
    for (int fed = 0; fed < ws * 10; fed += hop) {
        std::vector<float> in(hop);
        for (int i = 0; i < hop; i++) in[i] = sample++;
        auto w = ring.process_block(in);
        if (w.empty()) continue;

        if (!prev.empty()) {
            // The last (ws - hop) samples of the previous window must equal the
            // first (ws - hop) samples of this one (window advanced by hop).
            int overlap = ws - hop;
            bool ok = true;
            for (int i = 0; i < overlap; i++)
                if (prev[hop + i] != w[i]) { ok = false; break; }
            check(ok, "overlap continuity broken between consecutive windows");
            checked++;
        }
        prev = w;
    }
    check(checked > 0, "expected overlapping windows to compare");
}

// Worker-busy backpressure: while the worker is busy, no window is emitted and
// the ring keeps overwriting oldest samples. Once the worker goes idle, the next
// emitted window must be the FRESHEST window_size samples (oldest data dropped) —
// and the storage must still never reallocate under sustained load.
static void test_worker_busy_backpressure() {
    const int ws = 64;
    RingAccumulator ring(ws, ws /*no overlap*/, 1);

    float sample = 0.0f;
    auto feed = [&](int count) {
        std::vector<float> in(count);
        for (int i = 0; i < count; i++) in[i] = sample++;
        return ring.process_block(in);
    };

    // Worker busy throughout: feed many full windows' worth of samples; nothing emits.
    ring.set_worker_busy(true);
    int emits_while_busy = 0;
    for (int b = 0; b < 10; b++)
        if (!feed(ws).empty()) emits_while_busy++;
    check(emits_while_busy == 0, "no window should be emitted while worker is busy");

    // Worker goes idle; the next emit must be the most recent ws samples.
    ring.set_worker_busy(false);
    float next = sample;                 // first sample value of the upcoming block
    auto w = feed(ws);
    check(!w.empty(), "a window should be emitted once the worker is idle");
    if (!w.empty()) {
        // After feeding this block, the freshest ws samples end at value (next+ws-1),
        // so the window must be [next .. next+ws-1] — all older data overwritten.
        bool ok = (static_cast<int>(w.size()) == ws);
        for (int i = 0; ok && i < ws; i++)
            ok = (w[i] == next + static_cast<float>(i));
        check(ok, "post-backpressure window is not the freshest window_size samples");
    }
    check(ring.storage_stable(), "ring storage reallocated under sustained backpressure (NOT RT-safe)");
}

int main() {
    std::cout << "=== spt.rpde ring-buffer accumulation test (issue #3) ===" << std::endl;

    std::cout << "\n--- Equivalence: ring buffer vs old vector (steady state) ---" << std::endl;
    // Vary window/hop/subsample/block size across realistic and edge combinations.
    for (int ws : {64, 100, 256}) {
        for (int hop : {1, ws / 4, ws / 2, ws - 1, ws, ws + 10, 0}) {
            for (int subsamp : {1, 2, 5}) {
                for (int block : {16, 64, 113}) {
                    test_equivalence(ws, hop, subsamp, block, ws * subsamp * 12);
                }
            }
        }
    }

    std::cout << "\n--- Exact contents: non-overlapping windows ---" << std::endl;
    test_exact_nonoverlapping();

    std::cout << "\n--- Overlap continuity ---" << std::endl;
    test_overlap_continuity();

    std::cout << "\n--- Worker-busy backpressure ---" << std::endl;
    test_worker_busy_backpressure();

    std::cout << "\n=== " << (failures == 0 ? "ALL TESTS PASSED" : (std::to_string(failures) + " FAILURE(S)")) << " ===" << std::endl;
    return failures == 0 ? 0 : 1;
}
