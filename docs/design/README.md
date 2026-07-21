# Strange Pulse Toolkit — "Paper Lab" UI design system

> **Status: implemented.** This began as a handoff brief for the redesign; that
> work has since landed, so the document now serves as the record of *why* the
> interface looks the way it does. `tokens.md` is the live source of truth for
> the palette — if you are restyling or adding a module, start there.
>
> The original bundle also carried rendered screenshots and HTML design
> components. Those were working references for the port and are **not** kept in
> the repo (they are large and now redundant); `tokens.md` and `MODULES.md`
> together specify everything needed to build a module in this language.

## Overview
A unified visual redesign of the Strange Pulse Toolkit's interface modules in a
light, lab-instrument aesthetic called **Paper Lab**: off-white paper panels,
dark ink text, a vermillion primary accent and a cobalt secondary accent, sharp
1px hairlines, zero corner radius, Helvetica Neue labels and a monospace face for
all numeric readouts. 13 modules are covered (Pan was dropped).

## About the design files
The files in this bundle are **design references created in HTML** (Design
Components, `*.dc.html`). They are prototypes that show the intended look, layout,
proportions and live-visualisation behaviour of each module — **not** production
code to copy.

**The real implementation target is Max/MSP `jsui` (`mgraphics`).** Almost every
module here already exists in the repo as an `mgraphics` `.js` file (see the
"Source file" line in each module spec). So the task is **not** to build new Max
objects from scratch, and **not** to port HTML/DOM literally — it is to **rewrite
the palette (`COL`) and the `paint()` / draw functions** of the existing `.js`
files so their canvas output matches these references, while preserving each
object's existing inlets, outlets, attributes and mouse hit-testing.

Do **not** translate the DOM 1:1 — `mgraphics` is an immediate-mode canvas, not a
retained DOM. Match the *rendered result*, drawn with `mgraphics` primitives.

## Fidelity
**High-fidelity.** Final colours, type, spacing, and per-module live
visualisations are all specified. Reproduce the canvas output faithfully. Exact
hex + normalized-RGBA values are in `tokens.md`; per-element draw mappings and the
real object contracts are in `MODULES.md`.

## How to approach a module (the pattern)
1. Open the existing source file named in the module spec (e.g.
   `patchers/SignalMorph.js`).
2. Replace its `COL` / `C` colour table with the Paper Lab table from `tokens.md`
   (already given as `mgraphics` normalized arrays — paste directly).
3. Rewrite `paint()` (and its helpers `drawScope`, `drawRail`, etc.) to match the
   layout and element list in the module spec, using `mgraphics` primitives
   (`rectangle`/`fill`, `move_to`/`line_to`/`stroke`, `select_font_face` +
   `show_text`). Keep the resizable-layout approach the files already use
   (`onresize` → recompute region rects → `redraw`).
4. **Do not change** `inlets`, `outlets`, the outlet order, attribute names/ranges,
   or the `onclick`/`ondrag` hit regions unless the spec explicitly says to. The
   redesign is visual; the DSP/patch contract must stay identical.
5. Compare the running `jsui` against the module spec in `MODULES.md`.

Two modules (**Filter, MIDI Out**) had no `.js` source when this brief was written
and were specified from a screenshot instead. Both have since been built —
`patchers/StrangeFilter.js` and `patchers/ToExternalMidi.js` — and follow the same
conventions. A third (**Pan**) was built and then dropped: the module did not earn
its place and `StrangePan` is no longer in the package.
Where `MODULES.md` still flags a module as missing, the code is authoritative.

## Files
- `tokens.md` — the full design system: palette (hex + `mgraphics` arrays), type,
  spacing, primitives, and interaction conventions. **Read this first.**
- `MODULES.md` — per-module specs (layout, element→`mgraphics` mapping, params,
  inlets/outlets, interactions, source file).

The shipped implementation of each module is the `.js` file named in the module
index below; those are the ones to read when the spec and the code disagree.

## Module index
| # | Module | Source file | Contract |
|---|--------|-------------|----------|
| 01 | Gradient Trigger | `patchers/GradientTrigger.js` | existing jsui |
| 02 | MultiMod (rhythm chain) | `patchers/MultiModTrigger.js` | existing jsui — variable 1–8 stages, 11 modes |
| 03 | Threshold Trigger | `patchers/ThresholdTrigger.js` | existing jsui |
| 04 | Sample Play (poly) | `patchers/SamplePlayPoly.js` | existing jsui |
| 05 | Fold | `patchers/fold.js` | existing jsui |
| 06 | Filter | `patchers/StrangeFilter.js` | existing jsui |
| 08 | MIDI Out | `patchers/ToExternalMidi.js` | existing jsui |
| 09 | Signal Morph | `patchers/SignalMorph.js` | existing jsui — 1 in / 2 out |
| 10 | Motion Logic | `patchers/MotionLogic.js` | existing jsui — 1 in / 1 out |
| 11 | Audio Reactive | `patchers/AudioReactive.js` | existing jsui |
| 12 | Recurrence (RQA) | display for `spt.rqa` external | new display; external = 3 sig in / 6 sig out |
| 13 | RPDE | display for `spt.rpde` external | new display; external = 1 in / 3 sig out |
| 14 | Recurrence Plot | your own patcher | reusable display, embedded in RQA |

See `MODULES.md` for full detail on each.
