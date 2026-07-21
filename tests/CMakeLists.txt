# Standalone unit tests for SPT.
#
# The externals themselves cannot be compiled outside the Max runtime, so each
# test is a self-contained C++17 program that *models* the production logic (kept
# in sync by hand) and returns a non-zero exit code on failure. They are
# registered here so `ctest` runs something meaningful from the project root:
#
#     cmake --build build --config Release
#     ctest --test-dir build --build-config Release --output-on-failure
#
# To add a test, drop its source path (relative to source/projects) below.

find_package(Threads REQUIRED)

set(SPT_STANDALONE_TESTS
    spt.attractor/test/deferred_log_test.cpp      # #1 deferred reset logging off the audio thread
    spt.attractor/test/secondary_sync_test.cpp    # #8 secondary-sync guard on value change
    spt.attractor/test/bad_state_test.cpp         # bad-state detection (NaN/Inf/overflow/collapse/recovery)
    spt.attractor/test/position_cache_test.cpp    # #11 cached reset position + EMA coeff rename
    spt.rpde/deferred_diag_test.cpp               # #2 deferred verbose diagnostics off the worker thread
    spt.rpde/ring_buffer_test.cpp                 # #3 real-time-safe accumulation ring buffer
    spt.rqa/hop_size_test.cpp                     # #7 tunable, clamped hop_size
)

# Deliberately NOT registered — these are exploratory analysis harnesses, not
# regression tests. They compile, but they print measurements and always exit 0
# (attractor_test's only non-zero return is a CLI usage error), so running them
# under ctest would report green regardless of what the numbers say. Kept because
# they are useful to run by hand when tuning; promote one only after giving it
# real assertions and a failing exit code.
#
#   spt.attractor/test/attractor_test.cpp       CLI dynamics explorer, takes an attractor name
#   spt.attractor/test/cpu_stability_test.cpp   CPU vs stability tradeoff sweep over dt/speed
#   spt.attractor/test/dadras_test.cpp          chaotic-behaviour spot check
#   spt.attractor/test/speed_test.cpp           dt/speed sweep, rhythm vs audio-rate boundary
#   spt.rpde/test_rpde.cpp                      RPDE algorithm bench
#
# Note these model a `rabinovich` attractor that is not shipped as an external;
# the struct is defined locally in the harness, so they still build.

foreach (test_src ${SPT_STANDALONE_TESTS})
    get_filename_component(test_name ${test_src} NAME_WE)
    add_executable(${test_name} "${CMAKE_SOURCE_DIR}/source/projects/${test_src}")
    target_compile_features(${test_name} PRIVATE cxx_std_17)
    target_link_libraries(${test_name} PRIVATE Threads::Threads)
    set_target_properties(${test_name} PROPERTIES FOLDER "tests")
    add_test(NAME ${test_name} COMMAND ${test_name})
endforeach ()
