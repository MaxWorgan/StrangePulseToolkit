# SPT visual style guide — dark editorial

A single design language for every SPT bpatcher. Direction: **minimal / editorial, dark
surfaces** — derived from the references (config.figma.com, springsummer.dk,
lorenzodaldosso.it, pierrerousseau.info, molonglo.com/less-solstice).

What those references share, and what we take from them:

- **Near‑monochrome base + one vivid accent.** Figma Config is literally "kelly‑green glyphs
  on black". We invert the editorial black‑on‑white sites to a dark base and allow exactly
  **one** accent, used sparingly for live/active signal.
- **Strong type hierarchy.** Clean grotesque; ALL‑CAPS, letter‑spaced section headers; large
  light display numerals; quiet secondary labels.
- **Whitespace does the work.** Generous padding, few borders — dividers are hairlines or just
  space.
- **Sharp, flat, restrained.** No rounded corners, no gradients, no drop shadows. Decoration is
  limited to an index marker / hairline rule.

---

## 1. Tokens

### Colour (hex → Max rgba is /255, alpha 1.0 unless noted)

| Token | Hex | Use |
|---|---|---|
| `base` | `#0E0E0F` | patch canvas / behind modules |
| `surface` | `#161618` | module panel |
| `surface-2` | `#202024` | inputs, number/slider beds |
| `hairline` | `#2C2C31` | 1 px dividers, panel borders |
| `text` | `#ECECEC` | primary text, values |
| `text-dim` | `#8A8A8F` | labels, secondary |
| `text-faint` | `#5C5C61` | units, captions, placeholders |
| `accent` | `#B8FF5C` | **the** accent — live signal, active state, focus (use sparingly) |
| `accent-fill` | `#B8FF5C` @ 0.16α | slider/meter fills, selected beds |
| `warn` | `#E0A33A` | warnings / bad‑state only (never decorative) |

> The accent is the one lever to react to first. `#B8FF5C` (phosphor/oscilloscope green) nods
> to both the Figma reference and the scope/signal context. A warmer alternative is amber
> `#E8B24A`. Pick one accent for the whole toolkit.

### Typography

- **Family:** `Helvetica Neue` (present on every mac; clean geometric grotesque). Single family
  throughout — weight and case carry the hierarchy, not multiple fonts.
- **Scale (pt) & treatment:**

  | Role | Size | Weight | Case | Colour |
  |---|---|---|---|---|
  | Section header | 9 | regular | UPPERCASE, tracked | `text-dim` |
  | Label | 10 | regular | sentence | `text-dim` |
  | Value (number) | 11 | regular | — | `text` (or `accent` when live) |
  | Display numeral | 18–22 | light | — | `text` |
  | Units / caption | 9 | regular | lowercase | `text-faint` |

- Tracking on headers: Max comments have no letter‑spacing, so fake it with a thin space
  between letters only where it reads well, or just rely on UPPERCASE + size. Keep it subtle.

### Space (4 px base unit)

- Panel inner padding: **12 px**. Control gutter: **8 px**. Module outer margin: **16 px**.
- Labels left‑aligned on a shared left edge; values right‑aligned to a shared right edge.
- One hairline rule (optional) directly under a section header, full panel width.

### Shape

- **Corners: 0** (sharp) on every panel and input.
- Borders: 1 px `hairline`, or none — never heavy. No gradients, no relief, no shadow.

---

## 2. Components (Max recipes)

- **Module surface** — `panel`: `bgcolor = surface`, `rounded = 0`, `border = 1`,
  `bordercolor = hairline`. Sized to the presentation bounds; everything else sits on top.
- **Section header** — `comment`: Helvetica Neue 9, UPPERCASE, `textcolor = text-dim`. Optional
  `panel` 1 px tall in `hairline` beneath it as a rule.
- **Label** — `comment`: 10, `textcolor = text-dim`.
- **Value** — `number` / `flonum`: `bgcolor = surface-2`, `textcolor = text`, `triangle = 0`,
  `fontsize = 11`. Turn the value `accent` only when it represents a live/changing signal.
- **Toggle** — `live.toggle` (or `toggle`): off = `surface-2`, on = `accent`. No border.
- **Slider / amount** — `slider` or `live.slider`: bed `surface-2`, fill/knob `accent-fill` /
  `accent`, `relief = 0`, no border.
- **Selector (tab/umenu)** — flat: `surface-2` bed, `text` label, `accent` for the active item.
- **Scope / display** — `scope~` / `jit.pwindow`: background `base`, trace `accent`, grid off
  or a single `hairline`. Never a pure‑black void — frame it with the panel + a faint baseline.
- **Empty state** — dark panel + centered `text-faint` "—" or a one‑line caption, so idle
  modules read as intentional, not broken.

### Per‑module convention

Each bpatcher = one `panel` surface, a top‑left **index + name** (e.g. `02 · MULTIMOD`) in the
section‑header style, then controls on the 4 px grid. Inlets/outlets keep Max defaults.

---

## 3. Implementation notes

- Define the tokens once as **named patcher styles** (`spt.surface`, `spt.header`, `spt.label`,
  `spt.value`, `spt.accent`) and apply via each object's `style` attribute, OR set the colour
  attributes directly per object. Named styles are per‑document, so each abstraction carries its
  own copy of the style block (or we add them to the user global stylesheet once).
- Restyle is **presentation‑only** — patching view is left as‑is. Resize/relayout in
  presentation to the 4 px grid; keep `openinpresentation = 1`.
- The 11 abstractions with **no presentation UI** (Attractors, DisplayUtilities, Feedback,
  RhythmMakers, RhythmModifiers, SignalShapers, SingleBandpass~, StrangePanStereo, euclid,
  gateToTrigger, polySampPlay) need a presentation layout designed from scratch in this language.

---

## 4. Rollout order (after sign‑off)

1. **Tokens + prototype** (this doc + `StylePrototype.maxpat`).
2. Representative modules for approval: `MultiModTrigger`, `AudioTriggers` (the outlier),
   `AttractorDisplay`.
3. Remaining presentation bpatchers (Triggers → Signal shaping → Display → Sampler → MIDI).
4. Design presentation UIs for the 11 no‑UI abstractions.
5. Update the demo patchers to match.
