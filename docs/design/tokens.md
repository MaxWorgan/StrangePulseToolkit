# Paper Lab — design tokens (`mgraphics`-native)

Everything below is the shared system. All 14 modules use it. Where the existing
`.js` files store colours as normalized RGBA arrays (e.g. `accent:[.722,1,.361,1]`),
the arrays here are drop-in replacements for those `COL` / `C` tables.

## Palette

| Token | Role | Hex | CSS | `mgraphics` normalized RGBA |
|-------|------|-----|-----|------------------------------|
| `base` | scope/well background (inside plots) | `#ECE7DC` | rgb(236,231,220) | `[.925,.906,.863,1]` |
| `surface` | module panel background | `#F6F3EC` | rgb(246,243,236) | `[.965,.953,.925,1]` |
| `surf2` | inset control fill / track | `#E2DCCE` | rgb(226,220,206) | `[.886,.863,.808,1]` |
| `hair` | 1px borders & separators | `#C9C2B2` | rgb(201,194,178) | `[.788,.761,.698,1]` |
| `text` | primary ink (labels, values) | `#181611` | rgb(24,22,17) | `[.094,.086,.067,1]` |
| `dim` | secondary text (module name) | `#68624F` | rgb(104,98,79) | `[.408,.384,.310,1]` |
| `faint` | tertiary text (unit labels, ticks) | `#A39C8A` | rgb(163,156,138) | `[.639,.612,.541,1]` |
| `accent` | PRIMARY — signal, value, active | `#DC3A1B` | rgb(220,58,27) | `[.863,.227,.106,1]` |
| `accent2` | SECONDARY — "live"/grid/markers | `#4E7BE8` | rgb(78,123,232) | `[.306,.482,.910,1]` |

Derived fills (use accent/accent2 with alpha — do **not** introduce new hues):
- `afill` = accent @ 0.13 → `[.863,.227,.106,0.13]` (region shading, fill-under)
- `grid`  = accent2 @ 0.13 → `[.306,.482,.910,0.13]` (blueprint measurement grid)

Paste-ready `COL` block for the existing files:
```js
var COL = {
  base:   [.925,.906,.863,1],
  surface:[.965,.953,.925,1],
  surf2:  [.886,.863,.808,1],
  hair:   [.788,.761,.698,1],
  text:   [.094,.086,.067,1],
  dim:    [.408,.384,.310,1],
  faint:  [.639,.612,.541,1],
  accent: [.863,.227,.106,1],
  accent2:[.306,.482,.910,1]
};
// helper already present in the files: alpha(c,a) => [c[0],c[1],c[2],a]
// afill => alpha(COL.accent,0.13);  grid => alpha(COL.accent2,0.13)
```

### Two-accent rule (important)
- **Vermillion (`accent`)** = the value / the signal / the selected thing / firing.
- **Cobalt (`accent2`)** = the "live" or reference layer: the blueprint measurement
  grid behind scopes, playheads / cursors, the recurrence line-of-identity, the RPDE
  mode marker and ±σ band, the FIRE indicator.
Never add a third hue. Everything else is greyscale ink (`text`/`dim`/`faint`).

## Typography
- **Labels & titles:** `Helvetica Neue` (the files already set `FONT="Helvetica Neue"`).
- **All numeric readouts:** monospace. In HTML this is `ui-monospace / SF Mono / Menlo`.
  In Max, use a monospaced face available on the system (e.g. `Menlo` / `Courier New`)
  via `select_font_face`. Numerals must be mono so columns of values align.
- **Tracked-out labels:** module names and section labels are UPPERCASE with wide
  letter-spacing. The files already have `trk(s)` = uppercase + join with spaces —
  keep using it. Target letter-spacing ≈ 2–3px equivalent.
- Sizes (at the ~184–384px native module widths): module index/name 9px; section &
  unit labels 7–8px; inline control labels 10–11px; primary readouts 11–14px; a few
  "hero" numerics (Fold drive, RPDE value) 19–30px, weight light.

## Geometry & spacing
- **Corner radius: 0** everywhere (panels, wells, controls, chips). Sharp.
- **Borders: 1px** hairlines in `hair`. Scope wells = `base` fill + 1px `hair` border.
- Panel padding ≈ 12–14px. Row height in list layouts ≈ 23–26px (compact).
- Sliders/tracks: 5–7px tall `surf2`, filled portion `accent`, handle a 4–5px
  `accent` bar or a 7–8px `accent` dot.
- Scopes have a centre zero-line in `hair`; many carry a faint `grid` (cobalt @0.13)
  measurement grid drawn *behind* the trace.

## Drawing primitives (mgraphics)
Everything is built from four calls the files already wrap:
- `rect(x,y,w,h,c)` → `set_source_rgba` + `rectangle` + `fill` — panels, tracks, fills, bars.
- `rectb(...)` (stroke rectangle) — well borders.
- `line(x1,y1,x2,y2,c,lw)` → `move_to`/`line_to`/`stroke` — separators, zero-lines,
  traces (loop `move_to` then `line_to` over a signal buffer), grid, tick marks.
- `text(x,y,s,c,size,right)` → `select_font_face`/`set_font_size`/`show_text`
  (with `text_measure` for right-alignment) — all labels and readouts.
Scope traces: iterate the ring buffer and `line_to` each sample. Fill-under (afill)
= build the same path, close it to the baseline, `fill`. Keep the resizable layout
math (`layout()`/`onresize`) the files already have.

## Interaction conventions (preserve these)
- **Sliders/rails:** `onclick` sets value from x, `ondrag` continues; release when
  `button===0`. Output via the existing outlet(s).
- **Mode chips / segmented toggles:** click cycles or selects a mode; the existing
  files already do `modeValue=(modeValue+1)%3` etc. Keep the same outlet semantics.
- **Region hit-testing:** modules like Audio Reactive register clickable `regions[]`
  with per-control ranges — keep that pattern; only restyle the drawing.
