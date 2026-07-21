# Max test harnesses

Patchers used to exercise the externals and abstractions by hand. They live here
rather than in `patchers/` deliberately: Max puts a package's `patchers/` folder
on the global search path, so anything in there is offered to users as if it were
a toolkit module and can collide with their own file names. These are neither.

They are not run by `ctest` — that covers the standalone C++ tests registered in
`../CMakeLists.txt`. Open these by hand when changing the relevant code.

| Harness | Exercises |
|---|---|
| `attractor_test.maxpat` | attractor externals — dynamics, parameter ranges, bad-state recovery |
| `rpde_test_harness.maxpat` | `spt.rpde` against a live attractor signal |
| `ToExternalMidi_test.maxpat` | `ToExternalMidi` note/channel output |

They still resolve their dependencies (`AttractorDisplay.maxpat`, the externals)
through the package search path, so opening them from this folder works
unchanged — `patchers/` and `externals/` remain on the path regardless of where
the harness itself sits.
