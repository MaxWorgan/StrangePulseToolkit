#include "c74_min.h"
#include "c74_min_queue.h"
#include "c74_jitter.h"
#include <mutex>
#include <condition_variable>
#include <atomic>
#include <vector>
#include <map>
#include <cmath>
#include <iostream>
#include <chrono>
#ifdef PI
#undef PI
#endif

#include "nanoflann.hpp"

#include <Eigen/Dense>

using namespace c74::min;
using namespace std::chrono;
using Eigen::MatrixXd;
using Eigen::Vector3d;

template <typename Derived>
struct EigenMatrixAdaptor {
    const Derived &m_data;
    EigenMatrixAdaptor(const Derived &mat) : m_data(mat) {}
    inline size_t kdtree_get_point_count() const { return m_data.rows(); }
    inline double kdtree_get_pt(const size_t idx, const size_t dim) const {
        return m_data(idx, dim);
    }
    template <class BBOX>
    bool kdtree_get_bbox(BBOX & /*bb*/) const { return false; }
};

typedef nanoflann::KDTreeSingleIndexAdaptor<
    nanoflann::L2_Simple_Adaptor<double, EigenMatrixAdaptor<MatrixXd> >,
    EigenMatrixAdaptor<MatrixXd>,
    3
> KDTreeEigen;

//----------------------------------------------------------------------
// RQA Object: computes RQA metrics and outputs them as six signals.
// Outlets:
//   0: Recurrence Rate (RR)
//   1: Determinism (DET)
//   2: Maximum Diagonal Line Length (Lmax)
//   3: Entropy (ENTR)
//   4: Laminarity (LAM)
//   5: Trapping Time (TT)
//----------------------------------------------------------------------
class rqa : public c74::min::object<rqa>, public sample_operator<3,6> {
private:
    MatrixXd ring_buffer;
    size_t m_window_size;
    size_t write_index = 0;
    size_t samples_since_last_update = 0;

    // Double-buffering for thread safety
    MatrixXd snapshot_buffer_a;
    MatrixXd snapshot_buffer_b;
    std::atomic<int> active_snapshot_buffer { 0 };  // 0 = A, 1 = B

    std::atomic<int> hop_size;

    std::atomic<bool> snapshot_ready { false };
    std::mutex worker_mutex;
    std::condition_variable worker_cv;

    std::atomic<bool> worker_running { true };
    std::thread worker_thread;

    // Pre-allocated recurrence matrix storage (reused across iterations)
    std::vector<char> R_matrix;
    size_t R_matrix_size = 0;

    // Atomic variables for computed metrics.
    std::atomic<double> atomic_RR   { 0.0 };
    std::atomic<double> atomic_DET  { 0.0 };
    std::atomic<double> atomic_Lmax { 0.0 };
    std::atomic<double> atomic_ENTR { 0.0 };
    std::atomic<double> atomic_LAM  { 0.0 };
    std::atomic<double> atomic_TT   { 0.0 };

    // Subsample counter.
    size_t counter = 0;

public:
    MIN_DESCRIPTION {"Recurrence Quantification Analysis"};
    MIN_TAGS {""};
    MIN_AUTHOR {"Max Worgan"};
    MIN_RELATED { "spt.rpde"};


    inlet<> input_x { this, "(signal) x coordinate" };
    inlet<> input_y { this, "(signal) y coordinate" };
    inlet<> input_z { this, "(signal) z coordinate" };

    outlet<> output_RR   { this, "(signal) recurrence_rate", "signal" };
    outlet<> output_DET  { this, "(signal) determinism", "signal" };
    outlet<> output_Lmax { this, "(signal) Lmax", "signal" };
    outlet<> output_ENTR { this, "(signal) entropy", "signal" };
    outlet<> output_LAM  { this, "(signal) laminarity", "signal" };
    outlet<> output_TT   { this, "(signal) trapping_time", "signal" };


    argument<number> window_size_arg { this, "window_size", "Number of samples to analyze" };

    attribute<number> subsample_factor { this, "subsample_factor", 5,
        description { "Subsampling rate" },
        setter { MIN_FUNCTION {
            double val = args[0];
            if (val < 1.0) val = 1.0;  // Prevent division by zero
            return { val };
        }}
    };
    attribute<number> hop_size_attr { this, "hop_size", 256,
        description { "Hop size for overlapping windows" } };
    attribute<number> threshold { this, "threshold", 0.1,
        description { "Static recurrence threshold" } };
    attribute<bool> use_dynamic_threshold { this, "use_dynamic_threshold", false,
        description { "If true, compute threshold from attractor spread" } };
    attribute<number> dynamic_threshold_factor { this, "dynamic_threshold_factor", 0.1,
        description { "Multiplier for dynamic threshold" } };
    attribute<number> l_min{ this, "diagonal_line_min_length", 2.0,
        description { "The minimum length for diagonal lines to be counted" } };
    attribute<number> v_min{ this, "vertical_line_min_length", 2.0,
        description { "The minimum length for vertical lines to be counted" } };

    rqa(const atoms& args = {}) {
        size_t ws = (args.size() > 0 ? static_cast<size_t>(args[0]) : 1024);
        if (ws < 10) ws = 10;  // Minimum sensible window size
        m_window_size = ws;

        ring_buffer = MatrixXd::Zero(m_window_size, 3);
        snapshot_buffer_a = MatrixXd::Zero(m_window_size, 3);
        snapshot_buffer_b = MatrixXd::Zero(m_window_size, 3);
        write_index = 0;
        samples_since_last_update = 0;

        // Pre-allocate recurrence matrix
        R_matrix_size = m_window_size * m_window_size;
        R_matrix.resize(R_matrix_size, 0);

        hop_size.store(static_cast<int>(hop_size_attr), std::memory_order_relaxed);
        worker_thread = std::thread([this]() { this->worker_function(); });
    }

    ~rqa() {
        worker_running.store(false, std::memory_order_release);
        worker_cv.notify_one();
        if (worker_thread.joinable())
            worker_thread.join();
    }

    samples<6> operator()(sample x, sample y, sample z) {
        int subsamp = static_cast<int>(subsample_factor);
        if (subsamp < 1) subsamp = 1;  // Safety check

        if (counter % subsamp == 0) {
            ring_buffer.row(write_index) = Vector3d(x, y, z);
            write_index = (write_index + 1) % m_window_size;
            samples_since_last_update++;

            if (samples_since_last_update >= static_cast<size_t>(hop_size.load(std::memory_order_relaxed))) {
                if (!snapshot_ready.load(std::memory_order_acquire)) {
                    // Write to the inactive buffer
                    int active = active_snapshot_buffer.load(std::memory_order_acquire);
                    MatrixXd& target_buffer = (active == 0) ? snapshot_buffer_b : snapshot_buffer_a;
                    reorder_ring_buffer(target_buffer);

                    // Signal that new data is ready
                    snapshot_ready.store(true, std::memory_order_release);
                    worker_cv.notify_one();
                }
                samples_since_last_update = 0;
            }
        }
        counter++;
        return {
            atomic_RR.load(std::memory_order_relaxed),
            atomic_DET.load(std::memory_order_relaxed),
            atomic_Lmax.load(std::memory_order_relaxed),
            atomic_ENTR.load(std::memory_order_relaxed),
            atomic_LAM.load(std::memory_order_relaxed),
            atomic_TT.load(std::memory_order_relaxed)
        };
    }

    void reorder_ring_buffer(MatrixXd& target) {
        size_t n1 = m_window_size - write_index;  // rows from write_index to end
        size_t n2 = write_index;                   // rows from beginning to write_index
        if (n1 > 0)
            target.block(0, 0, n1, 3) = ring_buffer.block(write_index, 0, n1, 3);
        if (n2 > 0)
            target.block(n1, 0, n2, 3) = ring_buffer.block(0, 0, n2, 3);
    }

    void worker_function() {
        using IndexType = KDTreeEigen::IndexType;
        using DistanceType = KDTreeEigen::DistanceType;
        std::vector< nanoflann::ResultItem<IndexType, DistanceType> > matches;
        matches.reserve(64);
        nanoflann::SearchParameters params;

        while (worker_running.load(std::memory_order_acquire)) {
            {
                std::unique_lock<std::mutex> lock(worker_mutex);
                worker_cv.wait(lock, [this]() {
                    return snapshot_ready.load(std::memory_order_acquire) ||
                           !worker_running.load(std::memory_order_acquire);
                });
                if (!worker_running.load(std::memory_order_acquire))
                    break;
            }

            // Swap buffers: the inactive buffer becomes active for processing
            int active = active_snapshot_buffer.load(std::memory_order_acquire);
            int new_active = (active == 0) ? 1 : 0;
            active_snapshot_buffer.store(new_active, std::memory_order_release);
            snapshot_ready.store(false, std::memory_order_release);

            // Work on the now-active buffer (which was just written by audio thread)
            const MatrixXd& snapshot = (new_active == 0) ? snapshot_buffer_a : snapshot_buffer_b;
            const size_t N = snapshot.rows();
            if (N == 0)
                continue;

            double effective_threshold = 0.0;
            if (static_cast<bool>(this->use_dynamic_threshold)) {
                Vector3d centroid = snapshot.colwise().mean();
                double total_distance = 0.0;
                for (size_t i = 0; i < N; i++) {
                    total_distance += (snapshot.row(i).transpose() - centroid).norm();
                }
                double avg_distance = total_distance / N;
                effective_threshold = static_cast<double>(this->dynamic_threshold_factor) * avg_distance;
            } else {
                effective_threshold = static_cast<double>(this->threshold);
            }
            double search_radius = effective_threshold * effective_threshold;

            EigenMatrixAdaptor<MatrixXd> dataset(snapshot);
            KDTreeEigen tree(3, dataset, nanoflann::KDTreeSingleIndexAdaptorParams(10));
            tree.buildIndex();

            // Reuse pre-allocated R matrix, clear it
            if (N * N > R_matrix_size) {
                R_matrix_size = N * N;
                R_matrix.resize(R_matrix_size);
            }
            std::fill(R_matrix.begin(), R_matrix.begin() + N * N, 0);

            for (size_t i = 0; i < N; i++) {
                std::vector< nanoflann::ResultItem<IndexType, DistanceType> > local_matches;
                local_matches.reserve(64);
                Vector3d query = snapshot.row(i);
                tree.radiusSearch(query.data(), search_radius, local_matches, params);
                for (const auto &m : local_matches) {
                    if (static_cast<size_t>(m.first) != i) {
                        R_matrix[i * N + m.first] = 1;
                        R_matrix[m.first * N + i] = 1;
                    }
                }
            }

            // Count total recurrence points (upper triangle only, excluding diagonal)
            size_t recurrence_count = 0;
            for (size_t i = 0; i < N; i++) {
                for (size_t j = i + 1; j < N; j++) {
                    if (R_matrix[i * N + j] == 1) {
                        recurrence_count++;
                    }
                }
            }

            // Diagonal line analysis
            int Lmax = 0;
            size_t diag_line_points = 0;  // Points that belong to diagonal lines >= l_min
            std::map<int, int> diag_hist;
            int l_min_int = static_cast<int>(this->l_min);
            if (l_min_int < 2) l_min_int = 2;

            for (size_t i = 0; i < N; i++) {
                for (size_t j = i + 1; j < N; j++) {
                    if (R_matrix[i * N + j] == 1) {
                        // Check if this is the start of a diagonal line
                        if (i == 0 || j == 0 || R_matrix[(i - 1) * N + (j - 1)] == 0) {
                            int diag_len = 0;
                            size_t ii = i, jj = j;
                            while (ii < N && jj < N && R_matrix[ii * N + jj] == 1) {
                                diag_len++;
                                ii++;
                                jj++;
                            }
                            if (diag_len >= l_min_int) {
                                diag_line_points += diag_len;
                                if (diag_len > Lmax)
                                    Lmax = diag_len;
                                diag_hist[diag_len]++;
                            }
                        }
                    }
                }
            }

            // RR: Recurrence Rate = recurrence points / possible pairs (excluding diagonal)
            // Standard formula: RR = sum(R_ij for i!=j) / (N * (N-1))
            double RR = (N > 1) ? (2.0 * recurrence_count) / static_cast<double>(N * (N - 1)) : 0.0;

            // DET: Determinism = points in diagonal lines / total recurrence points
            double DET = (recurrence_count > 0) ? static_cast<double>(diag_line_points) / static_cast<double>(recurrence_count) : 0.0;

            // Entropy of diagonal line length distribution
            double total_lines = 0.0;
            for (auto &p : diag_hist)
                total_lines += p.second;
            double entropy = 0.0;
            if (total_lines > 0) {
                for (auto &p : diag_hist) {
                    double prob = static_cast<double>(p.second) / total_lines;
                    if (prob > 0)
                        entropy -= prob * log(prob);
                }
            }
            double ENTR = entropy;

            // Vertical line analysis for LAM and TT
            std::vector<int> vert_lengths;
            int v_min_int = static_cast<int>(this->v_min);
            if (v_min_int < 2) v_min_int = 2;

            for (size_t j = 0; j < N; j++) {
                for (size_t i = 0; i < N; i++) {
                    if (R_matrix[i * N + j] == 1) {
                        if (i == 0 || R_matrix[(i - 1) * N + j] == 0) {
                            int v_len = 0;
                            size_t ii = i;
                            while (ii < N && R_matrix[ii * N + j] == 1) {
                                v_len++;
                                ii++;
                            }
                            if (v_len >= v_min_int)
                                vert_lengths.push_back(v_len);
                        }
                    }
                }
            }

            size_t vert_line_points = 0;
            for (int v : vert_lengths)
                vert_line_points += v;

            // LAM: Laminarity = points in vertical lines / total recurrence points
            double LAM = (recurrence_count > 0) ? static_cast<double>(vert_line_points) / (2.0 * recurrence_count) : 0.0;

            // TT: Trapping Time = average vertical line length
            double TT = (vert_lengths.size() > 0) ? static_cast<double>(vert_line_points) / static_cast<double>(vert_lengths.size()) : 0.0;

            atomic_RR.store(RR, std::memory_order_release);
            atomic_DET.store(DET, std::memory_order_release);
            atomic_Lmax.store(static_cast<double>(Lmax), std::memory_order_release);
            atomic_ENTR.store(ENTR, std::memory_order_release);
            atomic_LAM.store(LAM, std::memory_order_release);
            atomic_TT.store(TT, std::memory_order_release);
        }
    }
};

MIN_EXTERNAL(rqa);
