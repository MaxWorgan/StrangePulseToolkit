# Paper Lab — per-module specs

Read `tokens.md` first. Each module below lists: **Source file**, **Contract**
(inlets/outlets/attributes — the part that must NOT change), **Canvas size**,
**Layout & elements** (mapped to `mgraphics` draws), and **Interaction**.

Colours refer to the tokens (`accent` = vermillion, `accent2` = cobalt, etc.).
Reference visual: the matching `components/Sp<Name>.dc.html` file.

---

## 01 · Gradient Trigger
- **Source:** `patchers/GradientTrigger.js` (existing jsui). **Reference:** `SpGradient.dc.html`.
- **Contract:** keep existing. Spatial X/Y/Z gradient trigger with UP / DOWN sensitivities.
- **Canvas:** ~384×110.
- **Layout:**
  - Header row: `01` index (`faint`) + `GRADIENT` (`dim`, tracked); right: `X · Y · Z` (mono, `faint`).
  - Scope well (`base` + `hair` border): faint cobalt `grid` behind; a wandering signal trace in `accent` (line loop over buffer) with `afill` fill-under; vertical event tick marks (alternating `text`/`accent2` at low alpha).
  - Footer: two sliders `UP` and `DN` — label (`faint`) + `surf2` track + `accent` fill + mono value (`accent`).
- **Interaction:** drag UP / DN sliders → existing outlets. Confirm exact attribute names in source.

## 02 · MultiMod  (the hero — rhythm chain)
- **Source:** `patchers/MultiModTrigger.js` (existing jsui, ~32KB). **Reference:** `SpMMRack2.dc.html` (chrome "B"); see also `SpMMRack.dc.html`, `SpMMChain/Timeline/Radial` for explored alternatives (not chosen).
- **Contract (must preserve):** a **serial chain of 1–8 stages**; each stage is set to one of **11 modes**: `modulo, probability, euclidean, repeater, quantize, delay, threshold, curve, debounce, crossmap, none`. Add/remove stages; per-stage mode menu; drag-to-edit values. Keep the existing inlets/outlets and stage/mode message protocol.
- **Canvas:** ~358×(variable with stage count). Chosen chrome = minimal ("B").
- **Layout (chosen = `SpMMRack2` chrome B):**
  - Header, single line: `02 MULTIMOD` (index `faint` + name `dim`) · `· N/8` (mono `faint`); at right, the status cluster **ALT** (small hollow dot) and **FIRE** (`accent` dot with glow). **No separate divider row, no footer** — this is the "minimal" chrome the client selected over two alternatives (one-line+footer, and a filled status bar).
  - One **row per stage** (height ≈ 23px): a numbered **node** — a 14px circle, 1.5px `accent` ring, number inside (mono). When a stage is *firing*, the node fills `accent` with a glow and the whole row tints `afill`. Then a **mode chip** (`surf2`, mode name in `text`, a small `▾` caret in `faint`) → opens the mode menu. Then a **live mini-viz** whose type depends on the stage's mode:
    - euclidean/modulo → row of step cells (filled `accent` = hit, hollow `hair` outline = rest; the active step gets a cobalt outline).
    - probability/threshold → a horizontal `surf2` bar with an `afill` region and an `accent` marker line.
    - delay/quantize → a baseline with tick marks (`afill`/`accent2`) and an `accent2` dot cursor.
    - repeater → a small descending bar cluster (echo decay), first bar `accent`.
    - curve → a transfer curve (`accent` path over a faint diagonal).
    Then a right-aligned **readout** (mono `accent`) with a tiny **unit** sub-label (`faint`, e.g. STEP / CHANCE / ms / GRID / GATE), and a circled **×** remove control.
  - **+ ADD STAGE** row (dashed `hair`, `+` node) when count < 8.
  - **Mode menu popover:** a `surf2` box, 1px `dim` border, 2-column grid of the 11 mode names; current mode in `accent` on `afill`, hover row on `hair`.
- **Interaction:** click mode chip → popover → pick mode (existing set-mode message). Drag a stage's viz to edit its value. `×` removes; `+` adds. Preserve outlet order.

## 03 · Threshold Trigger
- **Source:** `patchers/ThresholdTrigger.js` (existing jsui). **Reference:** `SpThreshold.dc.html`.
- **Contract:** keep existing. HI and LO thresholds on an incoming signal; fires HIGH / LOW.
- **Canvas:** ~300×140.
- **Layout:** header `03 THRESHOLD` + `LO ◂ / ▸ HI` (mono `faint`). Scope well with cobalt `grid`, an `accent` signal trace + `afill`. Two horizontal threshold lines with draggable end-caps: **HI** line in `text` with a `surf2` value tag (e.g. `+0.35`), **LO** line in `accent` with tag (e.g. `−0.28`). Footer legend: `HIGH` (accent dot, glow) / `LOW` (hollow dot).
- **Interaction:** drag HI/LO lines (or their caps) to set thresholds → existing outlets.

## 04 · Sample Play (poly)
- **Source:** `patchers/SamplePlayPoly.js` (existing jsui). **Reference:** `SpSample.dc.html`.
- **Contract:** keep existing. Polyphonic sample player: file load, gain, pan, voice count, amp envelope, start/end region.
- **Canvas:** ~320×190.
- **Layout:** header `04 SAMPLE` + a `DROP | OPEN` split control (drop target / open-file). Waveform well (`base`): full waveform in `faint`, the active start→end region redrawn in `accent`; region shaded `afill`; two `accent2` playhead lines; an envelope breakpoint overlay (`accent` line, `afill` area) over the waveform. Controls: `GAIN` slider + mono value + a `VOX` voice-count dot strip (filled `accent` dots = active voices, `surf2` = inactive); `PAN` slider with centre detent + handle dot; an `ENV` toggle button (`afill` bg, `accent` border/text).
- **Interaction:** drop/open file; drag gain/pan; set voices; drag region handles & envelope. Keep existing messages.

## 05 · Fold
- **Source:** `patchers/fold.js` (existing jsui). **Reference:** `SpFold.dc.html`.
- **Contract:** keep existing. Wavefolder with modes **FOLD / WRAP / CLIP** and a **DRIVE** amount.
- **Canvas:** ~236×200.
- **Layout:** header `05 FOLD` + a 3-way mode label row `FOLD / WRAP / CLIP` (active in `accent`, others `faint`). A square-ish transfer-function well (`base`): faint identity diagonal (`dim`@low alpha), the input signal ghost (`accent2`@low alpha), and the folded transfer curve as a bold `accent` path. Footer: `DRIVE` label + a large hero numeric (≈19px, light, `text`, mono, e.g. `6.82`) + a `surf2`/`accent` progress bar.
- **Interaction:** click mode label to switch FOLD/WRAP/CLIP; drag drive. Keep outlets.

## 06 · Filter
- **Source:** `patchers/StrangeFilter.js` (+ `patchers/StrangeFilter.maxpat`).
- **Contract:** stereo 64-band filter bank (`mcs.fffb~`). Two independently
  paintable band-gain curves (L / R), each modulated by its own control signal.
  One parameter: **EXPAND** (0–1).
- **EXPAND is a contrast control, not a dry/wet.** The patch tracks the running
  min/max of the incoming control-derived band values and normalises them to fill
  0–1; EXPAND crossfades between the raw values (0) and that normalised version
  (1). Low = follows the attractor's actual excursion and filters gently; high =
  always stretches to full range, keeping band contrast vivid however small the
  incoming swing. Was `ExpandGain` pre-redesign.
- **Q was removed** — it had almost no audible effect. Resonance is now fixed by
  the filter banks' constructor args (`mcs.fffb~ 64 20 H 10`), which is the value
  the UI booted with anyway, so default behaviour is unchanged.
- **Canvas:** ~236×200.
- **Layout:** header `06 FILTER` + right-aligned `L` / `R` tabs. Spectrum well
  (`base`, cobalt `grid`, centre zero-line): inactive channel drawn dim, active
  lit on top. Footer: a single `EXPAND` slider + mono value.
- **Interaction:** click L/R to choose the paint target; drag across the spectrum
  to draw band gains; drag EXPAND.


## 08 · MIDI Out   ⚠ no committed source
- **Source:** none in repo — corresponds to the **ToExternalMidi** abstraction. **Reference:** `SpMidiOut.dc.html`.
- **Assumed contract (confirm/define):** send notes to an external MIDI device; NUM vs KEYS input mode; octave, channel, gate length; device selector.
- **Canvas:** ~236×196.
- **Layout:** header `08 MIDI OUT` + a `NUM | KEYS` segmented toggle (active = `accent` bg, ink text). A **piano keyboard** well (`base`): one octave — **7 white keys** (light `keyWhite`, the active/root key = `accent`) with the correct **5 black keys grouped 2 then 3** (dark `keyBlack`) positioned on the C–D, D–E, F–G, G–A, A–B boundaries (skip E–F and B–C). Compute white key = surface lightened, black key = ink; in Max just use near-white and near-black. Below: three steppers `OCT` / `CHAN` / `GATE` (`surf2`, `‹ value ›`, mono value) and a device selector row (`surf2`, name + `▾`).
- **Interaction:** toggle NUM/KEYS; click keys; step OCT/CHAN/GATE; pick device.
- **Keyboard geometry (important):** white keys are a 7-wide flex; black keys centre on boundaries at 1/7, 2/7, 4/7, 5/7, 6/7 of the width, ~9px wide, ~60% height. Getting the 2-then-3 grouping right is the thing to preserve.

## 09 · Signal Morph
- **Source:** `patchers/SignalMorph.js` (existing jsui). **Reference:** `SpSignalMorph.dc.html`.
- **Contract (from source — preserve exactly):**
  - `inlets = 1`, `outlets = 2` → **outlet 0 = mode**, **outlet 1 = blend**.
  - Messages in: `a(v)`, `b(v)`, `c(v)`, `output(v)` (signals clamped −1..1, ring buffer), `mode(v)` (0..2), `blend(v)` (0..1).
  - Modes: `["MIX","LOGIC","CHOP"]`. Rail labels depend on mode: MIX → `A / B / <pct>%`; LOGIC → `AND / OR / <pct>%`; CHOP → `A / B / <(blend*2−1).toFixed(2)>`.
- **Canvas:** ~320×170 (native 184×95, resizable).
- **Layout:** header `09 SIGNAL MORPH` + a `MIX | LOGIC | CHOP` segmented chip (active = `accent` bg). Scope well (`base`, cobalt `grid`, centre zero-line): input **A** ghost trace (`text`@~0.34 alpha), input **B** ghost (`dim`@~0.45), and — in CHOP mode — the **C** ghost (`faint`), then the **output** trace bold in `accent`. Bottom **blend rail**: left label + `surf2` track + `afill` fill to blend + `accent` handle + right label + mono readout (per mode).
- **Interaction:** click the mode chip region → cycle mode → `outlet(0, mode)`. Click/drag the blend rail → `outlet(1, blend)`. (This is exactly the existing `onclick`/`ondrag` logic — restyle only.)

## 10 · Motion Logic
- **Source:** `patchers/MotionLogic.js` (existing jsui). **Reference:** `SpMotionLogic.dc.html`.
- **Contract (from source — preserve exactly):**
  - `inlets = 1`, `outlets = 1` → **outlet 0 = op value (0..5, continuous/morphable)**.
  - Messages in: `a(v)`, `b(v)` (0..1 gates, ring buffer), `output(v)` (0..1), `op(v)` (0..5).
  - Ops: `["AND","OR","XOR","NAND","NOR","XNOR"]`. Between integers the label morphs, e.g. `"AND / OR"`.
- **Canvas:** ~384×190 (native 184×95, resizable).
- **Layout:** header `10 MOTION LOGIC` + current op label at right in `accent` (mono), showing the morph label when between ops. A single well split into **three stacked lanes** with `hair` separators: **A**, **B**, **OUT** (lane labels top-left in `faint`). Lane traces are gate/square waves: A in `text`@~0.35, B in `dim`@~0.55, OUT bold in `accent`. Bottom **op rail**: a 6-tick track (`AND`…`XNOR`), ticks in `faint`, the selected/nearest tick in `accent`, an `accent` handle; end labels `AND` / `XNOR` in `faint`.
- **Interaction:** click/drag the op rail → `outlet(0, opValue)` (0..5, continuous). Existing logic.

## 11 · Audio Reactive
- **Source:** `patchers/sptAudioReactive.js` (existing jsui). **Reference:** `SpAudioReactive.dc.html`.
- **Contract (from source — preserve exactly):**
  - `inlets = 1`, `outlets = 1`. Messages in: `level(v)`, `env(v)` (0..1, ring buffer), `event()` (flashes an EVENT indicator ~90ms). Attribute-style setters (each also `outlet(0, name, value)` when dragged): `low`, `high` (Hz, log range 20–20000), `order` (1–8), `attack` (0.5–500 ms), `release` (10–3000 ms), `drive` (0.25–32 ×), `threshold` (0.01–0.99), `hysteresis` (0–0.3), `holdoff` (0–1000 ms), `length` (envelope ms).
- **Canvas:** ~384×296 (native 494×323, resizable).
- **Layout (top→bottom):**
  - Header `11 AUDIO REACTIVE` + status at right: `LISTENING` (`faint`) or `EVENT` (`accent`, on `flash`) with a dot.
  - **Scope well** (`base`, cobalt `grid`): a threshold line (`accent`@~0.4) across the middle with a `THR <val>` mono tag; the **level** trace (`dim`/`faint` ghost) and the **envelope-follower** trace bold in `accent` with `afill` fill-under.
  - **Band row:** `BAND` label + a range slider on a `surf2` track with **two `accent` handles** (low & high freq, log-mapped) and Hz labels (`fmtHz`: `>=1000` → `x.xk`); right side `ORDER <n>` in `accent`.
  - **Control grid:** 2 columns × 3 rows of mini param cells (`base` + `hair`): each = tiny label (`faint`) + mono value (`text`) + a thin `surf2` track with `accent` fill. The six params: ATTACK, RELEASE, DRIVE, THRESHOLD, HYSTERESIS, HOLDOFF.
  - **Envelope slot:** a `base` box labelled `ENVELOPE` / `BREAKPOINT / CURVE`, `LENGTH` + mono ms, with a breakpoint curve (`accent`) drawn inside.
- **Interaction:** keep the `regions[]` hit-test model — drag band handles (log freq), click ORDER to cycle, drag each param cell; `outlet(0, name, value)`.

## 12 · Recurrence (RQA)   — display for the `spt.rqa` external
- **Source:** external `source/projects/spt.rqa/spt.rqa.cpp`; this is a **new `jsui` display** that reads the external's outputs. **Reference:** `SpRQA.dc.html` (embeds module 14 in "bare" mode).
- **External contract (from `spt.rqa.cpp`):** `sample_operator<3,6>` — **3 signal inlets** `x, y, z` (attractor coords); **6 signal outlets, in this order:** `0 RR` (recurrence rate 0..1), `1 DET` (determinism 0..1), `2 Lmax` (max diagonal line length, int), `3 ENTR` (entropy, nats), `4 LAM` (laminarity 0..1), `5 TT` (trapping time, avg vertical line length, samples). Attributes: `threshold`, `window_size` (arg), `subsample_factor`, `hop_size`, `diagonal_line_min_length`, `vertical_line_min_length`, `use_dynamic_threshold`, `dynamic_threshold_factor`.
- **Canvas:** ~340×200.
- **Layout:** header `12 RECURRENCE · RQA` + `X · Y · Z` (mono `faint`). Left: the **recurrence plot** (module 14 in bare mode) as a square (`base`), i.e. the N×N recurrence matrix with the **line-of-identity in `accent2`** and recurrence points in `accent`. Right: a column of the **six metrics**, each = value (mono `accent`) over a tiny label (`faint`, RECURRENCE RATE / DETERMINISM / MAX DIAGONAL / ENTROPY / LAMINARITY / TRAPPING TIME) with the key (`RR/DET/Lmax/ENTR/LAM/TT`, `dim`) right-aligned, `hair` underlines.
- **Note:** the display just visualises the 6 outlet signals + the matrix; it does not compute RQA. In Max, feed the matrix from a `jit.matrix` recurrence build or the external's plot if exposed.

## 13 · RPDE   — display for the `spt.rpde` external
- **Source:** external `source/projects/spt.rpde/spt.rpde.cpp`; **new `jsui` display**. **Reference:** `SpRPDE.dc.html`.
- **External contract (from `spt.rpde.cpp`):** **1 signal inlet**; **3 signal outlets:** `0 RPDE` (normalized recurrence-period-density entropy, 0..1), `1 period` (mode of recurrence periods, samples), `2 diag` (status: 0=ok, 1=norm_fail, 2=no_recurrence, 3=invalid_params). Attributes: `window_size` (arg, read-only), `hop_size`, `dim`, `tau`, `epsilon` (0.0001–1), `tmax`, `theiler`, `subsample_factor`, `verbose`.
- **Canvas:** ~340×210.
- **Layout:** header `13 RPDE` + status `OK` with a `diag`-driven dot (`accent2` = ok). A big **NORMALIZED ENTROPY** hero numeric (≈30px, light, mono, e.g. `0.42`) with, at right, `T = <period>` (mono `accent`) over `MODE PERIOD · SMP`. A **0..1 scale bar** (`surf2` track, `accent` fill to the RPDE value, endpoint labels `0 · periodic` / `1 · noisy`). A **period-density histogram** well (`base`): bars in `accent`@~0.55 with the mode bin solid `accent`; **overlaid metric visualisation** → the mode marked by an `accent2` line with a `T <n>` tag, and the **normalized entropy shown as a ±σ band** (`afill` with `accent2` edges) computed from the histogram's centroid ± standard deviation (tight band = low entropy/periodic, wide = high/noisy). Caption `PERIOD DENSITY · ±σ = ENTROPY`.
- **Note:** outlets 0 (value) and 1 (period/T) map directly to the on-plot marker + band; outlet 2 drives the status dot colour.

## 14 · Recurrence Plot   — reusable display (also embedded in RQA)
- **Source:** your own patcher (no committed `.js`). **Reference:** `SpRecurrencePlot.dc.html`. Built as a **reusable component with a `bare` flag**: `bare=false` → full module card; `bare=true` → just the plot square (this bare form is what RQA #12 embeds). Mirror that in Max — a single `jsui` reused, or a shared draw routine.
- **What it draws:** the N×N **recurrence matrix** of an embedded signal (embedding delay τ, radius ε): a point at (i, j) when ‖y_i − y_j‖ < ε. Points in `accent`; the **main diagonal (line of identity) in `accent2`**; well `base` + `hair`. It is symmetric; diagonal structures = deterministic/periodic behaviour (this is the visual RQA quantifies).
- **Full-card layout:** header `14 RECURRENCE PLOT` + `N×N` (mono `faint`); the large square plot with `i →` / `↑ j` axis ticks (`faint`); footer of three param cells `THRESHOLD` (ε) / `WINDOW` / `τ · DELAY` (`base`+`hair`, mono values).
- **Params to expose:** `n` (matrix size / window), `tau` (embedding delay), `eps` (recurrence radius/threshold). These correspond to the RQA/RPDE embedding + threshold attributes — wire the plot's ε/τ to the same values feeding the analysis externals so the picture matches the metrics.
