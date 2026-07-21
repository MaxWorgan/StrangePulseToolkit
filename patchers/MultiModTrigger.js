// MultiModTrigger.js — self-contained v8ui face + engine for the SPT
// Serial trigger modulator with a DYNAMIC number of stages (1..8). One v8ui
// replaces the former nested bpatcher chain AND the standalone ModTrigger:
// a single-stage MultiMod is exactly a ModTrigger.
//
// Interface (unchanged so demos drop in):
//   inlet  0 : trigger in (bang)        + control messages (tempo, setstate, reset)
//   outlet 0 : processed / "fired" trigger  -> downstream
//   outlet 1 : alternate / suppressed trigger
// pattr / preset: full state round-trips via getvalueof/setvalueof (one JSON
// symbol); name a MultiModTrigger instance and a host pattrstorage stores it
// as <name>::mmt_ui. See the pattr section near the bottom.
//
// A trigger flows  in -> I -> II -> ... -> out.  Only each stage's "fire"
// output propagates to the next stage; the final stage's fire + alternate
// reach outlets 0 and 1 (shown by the two output indicators at the bottom).
//
// Stages:
//   +  ADD STAGE strip (below the last row) appends a stage; the face grows.
//   hover a stage index (I / II / …) -> it turns to  ×  ; click to delete that
//   stage.  The last remaining stage can't be deleted.
//
// Design: Paper Lab light palette (design_handoff_paperlab_ui/tokens.md).
// Each mode is a live mini-visualisation. Drag horizontally on the display to
// change values; click euclidean circles to toggle steps.

autowatch = 1;
inlets = 1;
outlets = 3;   // 0 = fire, 1 = alt, 2 = pattr param bus (per-param lists to the host pattr bank)

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

// ---------------------------------------------------------------- tokens
// Paper Lab — light lab-instrument palette (see design_handoff_paperlab_ui/tokens.md)
var COL = {
  base: [0.925, 0.906, 0.863, 1.0],
  surface: [0.965, 0.953, 0.925, 1.0],
  surf2: [0.886, 0.863, 0.808, 1.0],
  hair: [0.788, 0.761, 0.698, 1.0],
  text: [0.094, 0.086, 0.067, 1.0],
  dim: [0.408, 0.384, 0.31, 1.0],
  faint: [0.639, 0.612, 0.541, 1.0],
  warn: [0.306, 0.482, 0.91, 1.0],
  accent: [0.863, 0.227, 0.106, 1.0],
  accent2: [0.306, 0.482, 0.91, 1.0],
  accentD: [0.863, 0.227, 0.106, 0.3],
  afill: [0.863, 0.227, 0.106, 0.13],
};
var FONT = "Helvetica Neue";
var MONO = "Menlo";

var MODES = [
  "modulo",
  "probability",
  "euclidean",
  "repeater",
  "quantize",
  "delay",
  "threshold",
  "curve",
  "swing",
  "accent",
  "jitter",
  "none",
];
// pre-v9 saved states stored mode as an index into this old table; deleted
// modes (debounce, crossmap) degrade to "none" on load.
var LEGACY_MODES = [
  "modulo",
  "probability",
  "euclidean",
  "repeater",
  "quantize",
  "delay",
  "threshold",
  "curve",
  "debounce",
  "crossmap",
  "none",
];
function modeIndex(m) {
  var name = typeof m === "number" ? LEGACY_MODES[m] : m;
  var idx = MODES.indexOf(name);
  return idx >= 0 ? idx : MODES.indexOf("none");
}
var ROMAN = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII"];

var NOTE_BEATS = {
  "1n": 4.0,
  "2n": 2.0,
  "2nt": 1.3333,
  "4n": 1.0,
  "4nd": 1.5,
  "4nt": 0.6667,
  "8n": 0.5,
  "8nd": 0.75,
  "8nt": 0.3333,
  "16n": 0.25,
  "16nt": 0.1667,
  "32n": 0.125,
};
var QUANT_DIVS = ["1n", "2n", "4n", "4nt", "8n", "8nt", "16n", "32n"];
var QUANT_LABEL = ["1/1", "1/2", "1/4", "1/4T", "1/8", "1/8T", "1/16", "1/32"];
var QUANT_WINDOW = [1, 2, 4, 4, 8, 8, 16, 16]; // grid cells shown across the viz (~one bar)

var MIN_STAGES = 1,
  MAX_STAGES = 8;
var REP_DECAY = 0.72; // repeater echo: velocity falloff per repeat

function sum(a) {
  var s = 0;
  for (var i = 0; i < a.length; i++) s += a[i];
  return s;
}

function freshStage() {
  var st = {
    mode: MODES.indexOf("none"), // start on "none" = bypass
    modulo: 4, // every N (1..16)
    prob: 100, // 0..100 %
    euSteps: 8,
    euEvents: 5,
    euPattern: null,
    repeats: 3,
    repInterval: 200,
    repDecay: REP_DECAY,
    quantDiv: 4, // index into QUANT_DIVS (8n)
    delay: 200, // ms
    thresh: 0.5,
    curve: 0,
    swing: 62, // offbeat position, % of the pair (50 = straight, 75 = hard shuffle)
    swingDiv: 4, // index into QUANT_DIVS — the division being swung (8n)
    accentN: 4, // accent every Nth trigger
    accentLvl: 0.4, // velocity scale for the unaccented triggers
    jitMs: 25, // humanize: max random late-shift (ms)
    jitVel: 0.2, // humanize: max random velocity dip (0..1)
    count: 0,
    euStep: 0,
    swingPhase: 0,
    accStep: 0,
    quantPending: null,
    quantVel: 0,
  };
  st.euPattern = bjorklund(st.euEvents, st.euSteps);
  return st;
}

var stages,
  bpm = 120.0,
  tasks = [];

// per-stage live FX + global output FX (never persisted). fx tracks stages 1:1.
function freshFx() {
  return {
    pulse: 0,
    cursor: -1,
    roll: null,
    travels: [],
    burst: null,
    snaps: [],
  };
}
var fx = [freshFx()];
var outFx = [0, 0];
function syncFx() {
  while (fx.length < stages.length) fx.push(freshFx());
  if (fx.length > stages.length) fx.length = stages.length;
}

var openMenu = -1,
  menuHover = -1,
  drag = null;
var hoverRemove = -1,
  hoverAdd = false;

// ---------------------------------------------------------------- layout
// Each stage is one 28px row -> [ idx | mode chip | wide live viz | value ].
// Chrome is a single 20px top rail (title + global fire/alt dots); no footer.
// Height is driven by the stage count and applied to the box on add/remove.
// --- resizable layout -------------------------------------------------
// Natural size = 384 wide; height is driven by the stage count at BASE_ROWP.
// onresize() lets the enclosing bpatcher scale the face within clamps
// ("up to a point"); applyHeight() resizes the box to fit on add/remove.
var W = 384,
  H = 65,
  boxW = 384,
  boxH = 65;
var MINW = 300,
  MAXW = 600; // width clamp
var BASE_ROWP = 21, // default row pitch (~2/3 of the old 32 -> thinner rows)
  ROWP_MIN = 17,
  ROWP_MAX = 32;
var ADDH = 18,
  BOT_PAD = 6; // add-stage strip / bottom padding at max
// filled by layout() from W/H each paint:
var PAD = 14,
  IDX_X = 14,
  DD_X = 38,
  DD_W = 90,
  DD_H = 28;
var VIZ_X = 136,
  VIZ_W = 172,
  RAIL = 20,
  ROW0 = 26,
  ROWH = 28,
  ROWP = 32;

function canAdd() {
  return stages.length < MAX_STAGES;
}
function addOverhead() {
  return canAdd() ? ADDH : BOT_PAD;
}

function layout() {
  W = clamp(W, MINW, MAXW);
  PAD = clamp(Math.round(W * 0.037), 8, 16);
  IDX_X = PAD;
  RAIL = 20;
  ROW0 = RAIL + 6;
  DD_X = PAD + 24; // after the numbered node
  DD_W = clamp(Math.round(W * 0.234), 70, 110); // mode chip
  VIZ_X = DD_X + DD_W + 8;
  VIZ_W = Math.max(40, W - PAD - 62 - VIZ_X); // 62px right gutter: readout + unit + ×
  var avail = H - ROW0 - addOverhead(),
    n = Math.max(1, stages.length);
  ROWP = clamp(avail / n, ROWP_MIN, ROWP_MAX); // vertical scale, clamped
  ROWH = Math.max(14, ROWP - 4);
}
function onresize(w, h) {
  boxW = w;
  boxH = h;
  W = w;
  H = h;
  layout();
  mgraphics.redraw();
}

function rowTop(i) {
  return ROW0 + i * ROWP;
}
function midY(top) {
  return top + ROWH / 2;
} // row vertical centre
function textY(top) {
  return top + ROWH / 2 + 4;
} // baseline for row-centred text
function stagesBottom() {
  return ROW0 + stages.length * ROWP;
}
function addTop() {
  return stagesBottom();
}
// natural (fit) height for the current stage count, at the base row pitch
function computeH() {
  return 20 + 6 + stages.length * BASE_ROWP + addOverhead();
}

var regions = [];
function region(stage, field, x, y, w, h) {
  regions.push({ stage: stage, field: field, x: x, y: y, w: w, h: h });
}
function hit(px, py) {
  for (var i = regions.length - 1; i >= 0; i--) {
    var r = regions[i];
    if (px >= r.x && px <= r.x + r.w && py >= r.y && py <= r.y + r.h) return r;
  }
  return null;
}

// self-resize (mirrors attractorFit.js / AudioReactiveFit.js idiom)
function selfBox() {
  var b = null;
  try {
    b = this.box;
  } catch (e) {}
  if (b) return b;
  try {
    b = this.patcher.getnamed("mmt_ui");
  } catch (e2) {}
  return b;
}
// the enclosing bpatcher box in the parent patch, when this face is embedded as one
function hostBox() {
  var b = null;
  try {
    b = this.patcher.box;
  } catch (e) {}
  return b;
}
function resizeBox(b, w, h) {
  if (!b) return;
  try {
    var r = b.rect;
    b.rect = [r[0], r[1], r[0] + w, r[1] + h];
  } catch (e) {}
  try {
    var p = b.presentation_rect;
    b.presentation_rect = [p[0], p[1], w, h];
  } catch (e2) {}
}
function applyHeight() {
  H = computeH();
  layout(); // W is clamped and row metrics settle to BASE_ROWP
  boxW = W;
  boxH = H;
  resizeBox(selfBox(), W, H); // the v8ui itself (standalone jsui use)
  resizeBox(hostBox(), W, H); // the enclosing bpatcher, so it grows/shrinks to fit
  mgraphics.redraw();
}

// ---------------------------------------------------------------- draw helpers
function setc(c) {
  mgraphics.set_source_rgba(c[0], c[1], c[2], c[3]);
}
function rect(x, y, w, h, c) {
  setc(c);
  mgraphics.rectangle(x, y, w, h);
  mgraphics.fill();
}
function rectb(x, y, w, h, c) {
  setc(c);
  mgraphics.set_line_width(1);
  mgraphics.rectangle(x, y, w, h);
  mgraphics.stroke();
}
function line(x1, y1, x2, y2, c, lw) {
  setc(c);
  mgraphics.set_line_width(lw || 1);
  mgraphics.move_to(x1, y1);
  mgraphics.line_to(x2, y2);
  mgraphics.stroke();
}
function disc(cx, cy, r, c) {
  setc(c);
  mgraphics.ellipse(cx - r, cy - r, r * 2, r * 2);
  mgraphics.fill();
}
function ring(cx, cy, r, c, lw) {
  setc(c);
  mgraphics.set_line_width(lw || 1);
  mgraphics.ellipse(cx - r, cy - r, r * 2, r * 2);
  mgraphics.stroke();
}
function setfont(size, mono) {
  mgraphics.select_font_face(mono ? MONO : FONT);
  mgraphics.set_font_size(size);
}
function measure(s, size, mono) {
  setfont(size, mono);
  var m = mgraphics.text_measure("" + s);
  return m && m.length ? m[0] : ("" + s).length * size * 0.55;
}
function txt(x, y, s, c, size, just, mono) {
  setc(c);
  setfont(size, mono);
  var w = just === 1 || just === 2 ? measure(s, size, mono) : 0;
  mgraphics.move_to(just === 2 ? x - w : just === 1 ? x - w / 2 : x, y);
  mgraphics.show_text("" + s);
}
function lerp(a, b, t) {
  return [
    a[0] + (b[0] - a[0]) * t,
    a[1] + (b[1] - a[1]) * t,
    a[2] + (b[2] - a[2]) * t,
    a[3] + (b[3] - a[3]) * t,
  ];
}
function alpha(c, a) {
  return [c[0], c[1], c[2], a];
}
function clamp(v, lo, hi) {
  return v < lo ? lo : v > hi ? hi : v;
}
function nowMs() {
  return new Date().getTime();
}

// readout: passive accent value, right-aligned at the row's far right.
function readout(top, str, size) {
  txt(W - PAD, textY(top), str, COL.accent, size || 15, 2, true);
}
function readsub(top, str) {
  txt(W - PAD, top + ROWH - 2, trk(str), COL.faint, 7, 2);
} // small unit/aux line

// ---------------------------------------------------------------- euclid math
function bjorklund(pulses, steps) {
  steps = Math.max(1, Math.round(steps));
  pulses = clamp(Math.round(pulses), 0, steps);
  var p = [],
    i;
  if (pulses === 0) {
    for (i = 0; i < steps; i++) p.push(0);
    return p;
  }
  if (pulses === steps) {
    for (i = 0; i < steps; i++) p.push(1);
    return p;
  }
  var counts = [],
    rem = [],
    divisor = steps - pulses,
    level = 0;
  rem.push(pulses);
  while (true) {
    counts.push(Math.floor(divisor / rem[level]));
    rem.push(divisor % rem[level]);
    divisor = rem[level];
    level++;
    if (rem[level] <= 1) break;
  }
  counts.push(divisor);
  function build(l) {
    if (l === -1) p.push(0);
    else if (l === -2) p.push(1);
    else {
      for (var k = 0; k < counts[l]; k++) build(l - 1);
      if (rem[l] !== 0) build(l - 2);
    }
  }
  build(level);
  var first = p.indexOf(1);
  if (first > 0) p = p.slice(first).concat(p.slice(0, first));
  return p;
}
function noteMs(name) {
  return (NOTE_BEATS[name] || 1.0) * (60000.0 / bpm);
}

// ---------------------------------------------------------------- engine
function schedule(ms, fn) {
  if (ms <= 0) {
    fn();
    return;
  }
  var t = new Task(function () {
    fn();
    var k = tasks.indexOf(t);
    if (k >= 0) tasks.splice(k, 1);
  });
  tasks.push(t);
  t.schedule(ms);
}
// the module's alt (outlet 1) is threaded from the last NON-none stage; trailing
// 'none' stages just pass the fire through and don't hijack the alt.
function lastNonNone() {
  for (var i = stages.length - 1; i >= 0; i--)
    if (MODES[stages[i].mode] !== "none") return i;
  return stages.length - 1;
}

// every event carries a velocity (0–1) payload; structural ops carry it for free,
// a few stages reshape it (repeater decay, quantize max-merge).
function doFire(i, vel) {
  flashFire(i, vel);
  if (i < stages.length - 1) fireStage(i + 1, vel);
  else {
    outlet(0, vel);
    outFx[0] = clamp(vel, 0.2, 1);
    pump();
  }
}
function doAlt(i, vel) {
  if (i === lastNonNone()) {
    outlet(1, vel);
    outFx[1] = clamp(vel, 0.2, 1);
    pump();
  }
}
function emit(i, which, delayMs, vel) {
  schedule(delayMs, function () {
    if (which === 0) doFire(i, vel);
    else doAlt(i, vel);
  });
}
function fireStage(i, vel) {
  if (i < 0 || i >= stages.length) return;
  if (vel === undefined) vel = 1.0;
  var st = stages[i],
    f = fx[i];
  if (!f.travels) f.travels = [];
  if (!f.snaps) f.snaps = [];
  switch (MODES[st.mode]) {
    case "threshold": // velocity gate
      var pass = vel >= st.thresh;
      f.roll = { x: vel, hit: pass, t: nowMs() };
      emit(i, pass ? 0 : 1, 0, vel);
      break;
    case "curve": // velocity shaper (all pass)
      var g = Math.pow(3, -st.curve),
        vo = Math.pow(clamp(vel, 0, 1), g);
      f.roll = { x: vel, y: vo, t: nowMs() };
      emit(i, 1, 0, vel); // dry alt
      emit(i, 0, 0, vo);
      break; // shaped fire
    case "swing": // every 2nd trigger pushed late — shuffle feel
      var pair = 2 * noteMs(QUANT_DIVS[st.swingDiv]); // a down+off beat pair
      var odd = st.swingPhase === 1;
      st.swingPhase = odd ? 0 : 1;
      var shift = odd ? ((st.swing - 50) / 100) * pair : 0;
      f.roll = { odd: odd, t: nowMs() };
      if (shift > 0) f.travels.push({ start: nowMs(), dur: shift });
      emit(i, 1, 0, vel); // dry alt
      emit(i, 0, shift, vel);
      break;
    case "accent": // cyclic dynamics: 1st of N full, rest attenuated
      var ak = st.accStep % st.accentN;
      f.cursor = ak;
      st.accStep = (ak + 1) % st.accentN;
      emit(i, 1, 0, vel); // dry alt
      emit(i, 0, 0, ak === 0 ? vel : vel * st.accentLvl);
      break;
    case "jitter": // humanize: random late-shift + velocity dip
      var jd = Math.random() * st.jitMs;
      var jv = clamp(vel * (1 - st.jitVel * Math.random()), 0, 1);
      f.travels.push({ start: nowMs(), dur: jd });
      emit(i, 1, 0, vel); // dry alt
      emit(i, 0, jd, jv);
      break;
    case "none":
      emit(i, 0, 0, vel);
      emit(i, 1, 0, vel);
      break;
    case "modulo":
      st.count++;
      f.cursor = (st.count - 1) % st.modulo;
      emit(i, st.count % st.modulo === 0 ? 0 : 1, 0, vel);
      break;
    case "probability":
      var r = Math.random() * 100.0,
        hit = r < st.prob;
      f.roll = { x: r / 100, hit: hit, t: nowMs() };
      emit(i, hit ? 0 : 1, 0, vel);
      break;
    case "euclidean":
      var n = st.euSteps,
        step = st.euStep % n,
        on = st.euPattern[step] === 1;
      f.cursor = step;
      st.euStep = (step + 1) % n;
      emit(i, on ? 0 : 1, 0, vel);
      break;
    case "repeater":
      f.burst = { start: nowMs(), n: st.repeats, interval: st.repInterval };
      emit(i, 1, 0, vel); // alt = original, full velocity
      for (var k = 0; k < st.repeats; k++)
        emit(i, 0, k * st.repInterval, vel * Math.pow(st.repDecay, k)); // echoes fade (per-stage decay)
      break;
    case "quantize":
      var grid = noteMs(QUANT_DIVS[st.quantDiv]),
        nowt = nowMs();
      if (st.quantPending != null && nowt >= st.quantPending)
        st.quantPending = null; // boundary passed
      var wait = grid - (nowt % grid),
        target = nowt + wait;
      // spawn at the event's phase within the viz window; land on its own gridline
      var win = grid * QUANT_WINDOW[st.quantDiv],
        posIn = nowt % win;
      f.snaps.push({
        start: nowt,
        wait: wait,
        x0: posIn / win,
        x1: Math.min(1, (posIn + wait) / win),
        dup: st.quantPending != null,
      }); // one particle per event
      if (f.snaps.length > 24) f.snaps.shift();
      emit(i, 1, 0, vel); // dry alt keeps its own velocity
      if (st.quantPending == null) {
        // schedule one fire per boundary
        st.quantPending = target;
        st.quantVel = vel;
        (function (stage, tgt) {
          // fire reads MAX-merged velocity
          schedule(wait, function () {
            if (stages[stage] && stages[stage].quantPending === tgt)
              stages[stage].quantPending = null;
            if (stages[stage]) doFire(stage, stages[stage].quantVel);
          });
        })(i, target);
      } else {
        st.quantVel = Math.max(st.quantVel, vel);
      } // merge = loudest wins
      break;
    case "delay":
      f.travels.push({ start: nowMs(), dur: st.delay }); // one particle per event
      emit(i, 1, 0, vel); // dry alt
      emit(i, 0, st.delay, vel);
      break;
  }
  pump();
}
function bang() {
  fireStage(0, 1.0);
}
function msg_int(v) {
  fireStage(0, v);
}
function msg_float(v) {
  fireStage(0, v);
}
function tempo(v) {
  if (v > 0 && v !== bpm) {
    bpm = v;
    stateDirty();
  }
}
function flashFire(i, vel) {
  if (fx[i]) {
    fx[i].pulse = vel === undefined ? 1 : clamp(vel, 0.2, 1);
    pump();
  }
}

// ---------------------------------------------------------------- animation pump
var pumpTask = null,
  pumping = false;
function anyAnim() {
  var t = nowMs();
  if (outFx[0] > 0.03 || outFx[1] > 0.03) return true;
  for (var i = 0; i < stages.length; i++) {
    var f = fx[i];
    if (!f) continue;
    if (f.pulse > 0.03) return true;
    if (f.travels && f.travels.length) return true;
    if (f.burst && t - f.burst.start < (f.burst.n - 1) * f.burst.interval + 220)
      return true;
    if (f.snaps)
      for (var q = 0; q < f.snaps.length; q++)
        if (t - f.snaps[q].start < f.snaps[q].wait + 220) return true;
    if (f.roll && t - f.roll.t < 280) return true;
  }
  return false;
}
function animTick() {
  var t = nowMs();
  for (var i = 0; i < stages.length; i++) {
    var f = fx[i];
    if (!f) continue;
    f.pulse *= 0.84;
    var tv = f.travels || (f.travels = []);
    for (var p = tv.length - 1; p >= 0; p--)
      if (t - tv[p].start > tv[p].dur + 200) tv.splice(p, 1);
    var sn = f.snaps || (f.snaps = []);
    for (var q = sn.length - 1; q >= 0; q--)
      if (t - sn[q].start > sn[q].wait + 220) sn.splice(q, 1);
  }
  outFx[0] *= 0.705; // ~half the previous flash length (0.84^2)
  outFx[1] *= 0.705;
  mgraphics.redraw();
  if (!anyAnim()) {
    pumping = false;
    if (pumpTask) pumpTask.cancel();
  }
}
function pump() {
  if (pumping) return;
  pumping = true;
  if (!pumpTask) pumpTask = new Task(animTick);
  pumpTask.interval = 33;
  pumpTask.repeat();
}

// ---------------------------------------------------------------- paint
function trk(s) {
  return ("" + s).toUpperCase().split("").join(" ");
} // faux letter-spacing
// "small caps" per the Paper Lab type rules = tracked uppercase; long names
// (P R O B A B I L I T Y) can overrun a narrow chip, so step the size down to fit.
function fitTracked(s, maxW, size, minSize) {
  var t = trk(s);
  while (size > minSize && measure(t, size) > maxW) size -= 0.5;
  return { t: t, size: size };
}

function paint() {
  regions = [];
  layout();
  rect(0, 0, boxW, boxH, COL.surface);
  drawTopRail();
  for (var i = 0; i < stages.length; i++) drawStage(i);
  drawAddStrip();
  if (openMenu >= 0 && openMenu < stages.length) drawMenu(openMenu);
}

// single slim rail: module tag on the left, live global out (alt/fire) on the right.
function drawTopRail() {
  txt(PAD, 14, "02", COL.faint, 9);
  txt(PAD + 20, 14, trk("MULTIMOD"), COL.dim, 9);
  txt(
    PAD + 20 + measure(trk("MULTIMOD"), 9) + 8,
    14,
    "· " + stages.length + "/8",
    COL.faint,
    8,
    0,
    true,
  );
  txt(W - PAD - 14, 14, "FIRE", COL.faint, 8, 2);
  drawInd(W - PAD - 5, 10, COL.accent, outFx[0]);
  txt(W - PAD - 78, 14, "ALT", COL.faint, 8, 2);
  drawInd(W - PAD - 70, 10, COL.accent2, outFx[1]);
  line(PAD, RAIL, W - PAD, RAIL, COL.hair, 1);
}

// output indicator: idle = hollow ring; firing = solid full-colour dot + glow that fades
function drawInd(cx, cy, col, level) {
  if (level > 0.02) {
    disc(cx, cy, 5, alpha(col, 0.16 + 0.34 * clamp(level, 0, 1))); // glow halo
    disc(cx, cy, 3, col); // solid core, full colour
  } else {
    ring(cx, cy, 3, COL.hair, 1);
  }
}

function drawStage(i) {
  var st = stages[i],
    f = fx[i],
    top = rowTop(i);
  var removable = stages.length > MIN_STAGES;
  var showX = removable && hoverRemove === i;
  // firing row tint
  if (f.pulse > 0.02)
    rect(
      PAD - 2,
      top,
      W - 2 * PAD + 4,
      ROWH,
      alpha(COL.accent, 0.13 * clamp(f.pulse, 0, 1)),
    );
  // numbered node: 14px circle, 1.5px accent ring, fills accent on fire
  var ncx = IDX_X + 8,
    ncy = midY(top);
  if (showX) {
    ring(ncx, ncy, 7, COL.accent2, 1.5);
    txt(ncx, ncy + 4, "×", COL.accent2, 12, 1);
  } else {
    //if (f.pulse > 0.02) disc(ncx, ncy, 7, lerp(COL.surface, COL.accent, clamp(f.pulse, 0, 1)));
    //ring(ncx, ncy, 7, COL.accent, 1.5);
    txt(ncx, ncy + 3, i + 1, COL.accent, 10, 1, true);
  }
  if (removable) region(i, "remove", IDX_X - 4, top, 24, ROWH); // hover -> ×, click deletes
  rect(DD_X, top, DD_W, ROWH, COL.surf2); // mode chip (no caret — no down arrows)
  if (f.pulse > 0.02)
    rectb(
      DD_X + 0.5,
      top + 0.5,
      DD_W - 1,
      ROWH - 1,
      lerp(COL.surf2, COL.accent, 0.6 * f.pulse),
    );
  var chipLab = fitTracked(MODES[st.mode], DD_W - 14, 7, 6);
  txt(DD_X + 8, textY(top), chipLab.t, COL.text, chipLab.size);
  region(i, "mode", DD_X, top, DD_W, ROWH);
  switch (MODES[st.mode]) {
    case "modulo":
      vizModulo(i, st, f, top);
      break;
    case "probability":
      vizProb(i, st, f, top);
      break;
    case "euclidean":
      vizEuclid(i, st, f, top);
      break;
    case "repeater":
      vizRepeater(i, st, f, top);
      break;
    case "quantize":
      vizQuantize(i, st, f, top);
      break;
    case "delay":
      vizDelay(i, st, f, top);
      break;
    case "threshold":
      vizThreshold(i, st, f, top);
      break;
    case "curve":
      vizCurve(i, st, f, top);
      break;
    case "swing":
      vizSwing(i, st, f, top);
      break;
    case "accent":
      vizAccent(i, st, f, top);
      break;
    case "jitter":
      vizJitter(i, st, f, top);
      break;
    case "none":
      vizNone(i, st, f, top);
      break;
  }
}

// shared step-cell renderer — modulo and euclidean share one look (square cells).
function drawSteps(i, field, f, top, n, isOn, isFire, cursor) {
  var cw = VIZ_W / n,
    my = top + ROWH / 2;
  var sz = Math.min(ROWH - 4, cw - 2);
  if (sz < 3) sz = Math.max(2, cw - 1);
  for (var s = 0; s < n; s++) {
    var cx = VIZ_X + cw * (s + 0.5),
      x0 = cx - sz / 2,
      y0 = my - sz / 2;
    var on = isOn(s),
      fire = isFire(s),
      cur = s === cursor;
    if (on || fire) {
      var b = fire ? COL.accentD : COL.accent;
      rect(x0, y0, sz, sz, cur ? lerp(b, COL.text, 0.4 * f.pulse) : b);
      if (fire) rectb(x0 + 0.5, y0 + 0.5, sz - 1, sz - 1, COL.accent);
    } else {
      rectb(x0 + 0.5, y0 + 0.5, sz - 1, sz - 1, cur ? COL.dim : COL.faint);
    }
    if (cur) rectb(x0 - 2.5, y0 - 2.5, sz + 5, sz + 5, COL.accent2);
  }
  region(i, field, VIZ_X, top, VIZ_W, ROWH);
}

function vizModulo(i, st, f, top) {
  readout(top, "÷" + st.modulo);
  drawSteps(
    i,
    "modulo",
    f,
    top,
    st.modulo,
    function () {
      return false;
    },
    function (s) {
      return s === st.modulo - 1;
    },
    f.cursor,
  );
}

function vizEuclid(i, st, f, top) {
  readout(top, sum(st.euPattern) + "/" + st.euSteps);
  drawSteps(
    i,
    "eudots",
    f,
    top,
    st.euSteps,
    function (s) {
      return st.euPattern[s] === 1;
    },
    function () {
      return false;
    },
    f.cursor,
  );
}

function vizProb(i, st, f, top) {
  var my = top + ROWH / 2,
    p = st.prob / 100;
  readout(top, Math.round(st.prob) + "%");
  rect(VIZ_X, my - 5, VIZ_W, 10, COL.surf2);
  rect(VIZ_X, my - 5, VIZ_W * p, 10, COL.afill);
  line(VIZ_X + VIZ_W * p, my - 8, VIZ_X + VIZ_W * p, my + 8, COL.accent, 1);
  if (f.roll && nowMs() - f.roll.t < 280) {
    var rx = VIZ_X + VIZ_W * f.roll.x;
    line(
      rx,
      my - 9,
      rx,
      my + 9,
      f.roll.hit ? COL.accent : COL.faint,
      f.roll.hit ? 2 : 1,
    );
    disc(rx, my, f.roll.hit ? 4 : 2.5, f.roll.hit ? COL.accent : COL.faint);
  }
  region(i, "probbar", VIZ_X, top, VIZ_W, ROWH);
}

function vizRepeater(i, st, f, top) {
  readout(top, st.repeats + "×");
  readsub(top, Math.round(st.repInterval) + "ms");
  var n = st.repeats,
    base = top + ROWH - 4,
    maxH = ROWH - 8,
    dec = st.repDecay,
    x0 = VIZ_X + 3;
  var ivn = Math.log(st.repInterval / 20) / Math.log(100); // log spacing (matches exp drag)
  var stepx = Math.max(5, (ivn * (VIZ_W - 6)) / Math.max(1, n - 1));
  var elapsed = f.burst ? nowMs() - f.burst.start : -1;
  line(VIZ_X, base, VIZ_X + VIZ_W, base, COL.surf2, 1);
  for (var k = 0; k < n; k++) {
    var bx = x0 + k * stepx;
    if (bx > VIZ_X + VIZ_W) break;
    var amp = Math.pow(dec, k),
      h = maxH * (0.15 + 0.85 * amp);
    var lit =
      f.burst &&
      elapsed >= k * f.burst.interval &&
      elapsed < k * f.burst.interval + 150;
    var col = lit ? COL.accent : lerp(COL.surf2, COL.accent, 0.2 + 0.6 * amp);
    line(bx, base, bx, base - h, col, lit ? 3 : 2);
    disc(bx, base - h, lit ? 3.5 : 2, col);
  }
  region(i, "reptrack", VIZ_X, top, VIZ_W, ROWH); // <-> interval, up/down repeats, shift+up/down decay
}

function vizQuantize(i, st, f, top) {
  var my = top + ROWH / 2;
  readout(top, QUANT_LABEL[st.quantDiv]);
  var density = QUANT_WINDOW[st.quantDiv]; // gridlines across the window
  line(VIZ_X, my, VIZ_X + VIZ_W, my, COL.surf2, 1);
  for (var g = 0; g <= density; g++) {
    // bright lines on the selected grid
    var gx = VIZ_X + (VIZ_W * g) / density;
    line(gx, my - 8, gx, my + 8, COL.accentD, 1);
  }
  var snaps = f.snaps || [],
    now = nowMs();
  for (var q = 0; q < snaps.length; q++) {
    // one particle per event: spawns at its phase in the window, slides to
    // its own gridline (uses the whole width, not just the right edge)
    var sn = snaps[q],
      t = now - sn.start,
      prog = clamp(t / Math.max(1, sn.wait), 0, 1);
    var sx = VIZ_X + VIZ_W * sn.x0,
      gx2 = VIZ_X + VIZ_W * sn.x1,
      cx = sx + (gx2 - sx) * prog;
    var arrived = prog >= 1 && t < sn.wait + 200;
    if (sn.dup)
      disc(cx, my, 2.5, COL.faint); // merged event: faint, no boundary flash
    else {
      disc(cx, my, arrived ? 5 : 3, arrived ? COL.accent : COL.dim);
      if (arrived) line(gx2, my - 8, gx2, my + 8, COL.accent, 2); // leader flashes its gridline
    }
  }
  region(i, "quantbar", VIZ_X, top, VIZ_W, ROWH);
}

function vizDelay(i, st, f, top) {
  var my = top + ROWH / 2;
  readout(top, Math.round(st.delay) + "ms", 13);
  var ox = VIZ_X + VIZ_W * clamp(st.delay / 2000, 0, 1);
  line(VIZ_X, my, VIZ_X + VIZ_W, my, COL.surf2, 1);
  line(VIZ_X, my - 7, VIZ_X, my + 7, COL.dim, 1.5); // origin
  line(ox, my - 7, ox, my + 7, COL.accentD, 1.5); // target
  var tvs = f.travels || [];
  for (var p = 0; p < tvs.length; p++) {
    var tr = tvs[p],
      prog = clamp((nowMs() - tr.start) / Math.max(1, tr.dur), 0, 1);
    disc(
      VIZ_X + (ox - VIZ_X) * prog,
      my,
      prog >= 1 ? 5 : 3.5,
      prog >= 1 ? COL.accent : COL.dim,
    );
  }
  region(i, "delaybar", VIZ_X, top, VIZ_W, ROWH);
}

function vizNone(i, st, f, top) {
  var my = midY(top);
  txt(W - PAD, textY(top), "—", COL.faint, 16, 2);
  line(VIZ_X, my, VIZ_X + VIZ_W, my, COL.surf2, 1.5);
  disc(VIZ_X + VIZ_W - 4, my, 3, lerp(COL.surf2, COL.accent, f.pulse));
}

function vizThreshold(i, st, f, top) {
  var my = top + ROWH / 2;
  readout(top, "≥" + Math.round(st.thresh * 100) + "%", 13);
  rect(VIZ_X, my - 5, VIZ_W, 10, COL.surf2);
  rect(
    VIZ_X + VIZ_W * st.thresh,
    my - 5,
    VIZ_W * (1 - st.thresh),
    10,
    COL.afill,
  ); // pass zone (>= thresh)
  line(
    VIZ_X + VIZ_W * st.thresh,
    my - 8,
    VIZ_X + VIZ_W * st.thresh,
    my + 8,
    COL.accent,
    1.5,
  );
  if (f.roll && nowMs() - f.roll.t < 280 && f.roll.x !== undefined) {
    var rx = VIZ_X + VIZ_W * f.roll.x;
    line(
      rx,
      my - 9,
      rx,
      my + 9,
      f.roll.hit ? COL.accent : COL.faint,
      f.roll.hit ? 2 : 1,
    );
    disc(rx, my, f.roll.hit ? 4 : 2.5, f.roll.hit ? COL.accent : COL.faint);
  }
  region(i, "threshbar", VIZ_X, top, VIZ_W, ROWH);
}

function vizCurve(i, st, f, top) {
  var g = Math.pow(3, -st.curve);
  readout(top, (st.curve >= 0 ? "+" : "") + Math.round(st.curve * 100), 13);
  var y0 = top + ROWH - 3,
    hh = ROWH - 6;
  line(VIZ_X, y0, VIZ_X + VIZ_W, y0 - hh, COL.surf2, 1); // linear reference
  setc(COL.accent);
  mgraphics.set_line_width(1.5);
  mgraphics.move_to(VIZ_X, y0);
  for (var s = 1; s <= 20; s++) {
    var vin = s / 20;
    mgraphics.line_to(VIZ_X + VIZ_W * vin, y0 - hh * Math.pow(vin, g));
  }
  mgraphics.stroke();
  if (f.roll && nowMs() - f.roll.t < 280 && f.roll.x !== undefined) {
    var vx = f.roll.x;
    disc(VIZ_X + VIZ_W * vx, y0 - hh * Math.pow(vx, g), 3.5, COL.accent);
  }
  region(i, "curvebar", VIZ_X, top, VIZ_W, ROWH); // <-> and up/down both shape the curve
}

// swing: pair window [downbeat .. downbeat]; straight offbeat ghosted at 50%,
// the swung offbeat marker sits at swing% — delayed triggers slide out to it.
function vizSwing(i, st, f, top) {
  var my = top + ROWH / 2;
  readout(top, Math.round(st.swing) + "%");
  readsub(top, QUANT_LABEL[st.swingDiv]);
  var mid = VIZ_X + VIZ_W * 0.5,
    sxp = VIZ_X + VIZ_W * (st.swing / 100);
  line(VIZ_X, my, VIZ_X + VIZ_W, my, COL.surf2, 1);
  line(VIZ_X, my - 7, VIZ_X, my + 7, COL.dim, 1.5); // downbeat
  line(VIZ_X + VIZ_W, my - 7, VIZ_X + VIZ_W, my + 7, COL.dim, 1.5); // next downbeat
  line(mid, my - 6, mid, my + 6, COL.hair, 1); // straight offbeat (ghost)
  line(sxp, my - 7, sxp, my + 7, COL.accent, 1.5); // swung offbeat
  if (f.roll && !f.roll.odd && nowMs() - f.roll.t < 200)
    disc(VIZ_X, my, 4, COL.accent); // downbeat passes untouched
  var tvs = f.travels || [];
  for (var p = 0; p < tvs.length; p++) {
    var tr = tvs[p],
      prog = clamp((nowMs() - tr.start) / Math.max(1, tr.dur), 0, 1);
    disc(
      mid + (sxp - mid) * prog,
      my,
      prog >= 1 ? 5 : 3.5,
      prog >= 1 ? COL.accent : COL.dim,
    );
  }
  region(i, "swingbar", VIZ_X, top, VIZ_W, ROWH); // <-> amount, shift+up/down division
}

// accent: bar per step of the cycle — tall accent head, attenuated tail.
function vizAccent(i, st, f, top) {
  readout(top, st.accentN);
  readsub(top, Math.round(st.accentLvl * 100) + "%");
  var n = st.accentN,
    cw = VIZ_W / n,
    base = top + ROWH - 4,
    maxH = ROWH - 8;
  line(VIZ_X, base, VIZ_X + VIZ_W, base, COL.surf2, 1);
  for (var k = 0; k < n; k++) {
    var bx = VIZ_X + cw * (k + 0.5);
    var amp = k === 0 ? 1 : st.accentLvl;
    var h = maxH * (0.12 + 0.88 * amp);
    var lit = k === f.cursor && f.pulse > 0.05;
    var col = lit
      ? COL.accent
      : k === 0
        ? lerp(COL.surf2, COL.accent, 0.8)
        : lerp(COL.surf2, COL.accent, 0.2 + 0.5 * amp);
    line(bx, base, bx, base - h, col, lit ? 3 : 2);
    disc(bx, base - h, lit ? 3.5 : 2, col);
  }
  region(i, "accentbar", VIZ_X, top, VIZ_W, ROWH); // <-> cycle length, up/down level
}

// jitter: shaded landing window from the origin; each trigger lands somewhere inside.
var JIT_MAX = 250; // ms, full viz width
function vizJitter(i, st, f, top) {
  var my = top + ROWH / 2;
  readout(top, Math.round(st.jitMs) + "ms", 13);
  readsub(top, "vel -" + Math.round(st.jitVel * 100) + "%");
  var jw = VIZ_W * clamp(st.jitMs / JIT_MAX, 0, 1);
  line(VIZ_X, my, VIZ_X + VIZ_W, my, COL.surf2, 1);
  rect(VIZ_X, my - 5, jw, 10, COL.afill); // possible landing zone
  line(VIZ_X, my - 7, VIZ_X, my + 7, COL.dim, 1.5); // origin (in time)
  line(VIZ_X + jw, my - 8, VIZ_X + jw, my + 8, COL.accentD, 1); // max shift
  var tvs = f.travels || [];
  for (var p = 0; p < tvs.length; p++) {
    var tr = tvs[p],
      prog = clamp((nowMs() - tr.start) / Math.max(1, tr.dur), 0, 1);
    var lx = VIZ_X + VIZ_W * clamp(tr.dur / JIT_MAX, 0, 1) * prog;
    disc(lx, my, prog >= 1 ? 5 : 3.5, prog >= 1 ? COL.accent : COL.dim);
  }
  region(i, "jitterbar", VIZ_X, top, VIZ_W, ROWH); // <-> time jitter, up/down vel jitter
}

// thin "+ ADD STAGE" affordance below the last row; hairline flanks a centered label.
function drawAddStrip() {
  if (!canAdd()) return;
  var y = addTop(),
    cy = y + ADDH / 2,
    size = 8;
  var label = "+  " + trk("add stage");
  var tw = measure(label, size),
    cx = W / 2;
  var c = hoverAdd ? COL.accent : COL.dim;
  line(PAD, cy, cx - tw / 2 - 8, cy, COL.hair, 1);
  line(cx + tw / 2 + 8, cy, W - PAD, cy, COL.hair, 1);
  txt(cx, cy + 3, label, c, size, 1);
  region(-1, "add", 0, y, W, ADDH);
}

function drawMenu(i) {
  var ih = 14,
    cw = 96,
    cols = 3,
    rows = Math.ceil(MODES.length / cols); // 3-col popover fits even a 1-stage face
  var mw = cols * cw,
    mh = rows * ih;
  var mx = clamp(DD_X, 0, W - mw),
    my = clamp(rowTop(i) + ROWH, 0, H - mh); // anchored to the chip, kept on-canvas
  rect(mx, my, mw, mh, COL.surf2);
  rectb(mx + 0.5, my + 0.5, mw - 1, mh - 1, COL.hair);
  for (var d = 1; d < cols; d++)
    line(mx + cw * d, my + 2, mx + cw * d, my + mh - 2, COL.hair, 1);
  for (var m = 0; m < MODES.length; m++) {
    var c = Math.floor(m / rows),
      r = m % rows,
      ix = mx + c * cw,
      iy = my + r * ih;
    var sel = m === stages[i].mode,
      hov = m === menuHover;
    if (sel) rect(ix, iy, cw, ih, COL.afill);
    else if (hov) rect(ix, iy, cw, ih, COL.hair);
    var mLab = fitTracked(MODES[m], cw - 14, 6.5, 6);
    txt(
      ix + 8,
      iy + 10,
      mLab.t,
      sel ? COL.accent : hov ? COL.text : COL.dim,
      mLab.size,
    );
    region(i, "menu:" + m, ix, iy, cw, ih);
  }
}

// ---------------------------------------------------------------- stage add / remove
function addStage() {
  if (stages.length >= MAX_STAGES) return;
  stages.push(freshStage());
  fx.push(freshFx());
  hoverAdd = false;
  applyHeight();
  stateDirty();
}
function removeStage(i) {
  if (stages.length <= MIN_STAGES || i < 0 || i >= stages.length) return;
  stages.splice(i, 1);
  fx.splice(i, 1);
  if (openMenu === i) openMenu = -1;
  else if (openMenu > i) openMenu--;
  hoverRemove = -1;
  applyHeight();
  stateDirty();
}

// ---------------------------------------------------------------- interaction
function onclick(x, y, but, cmd, shift) {
  if (openMenu >= 0) {
    var r = hit(x, y);
    if (r && ("" + r.field).indexOf("menu:") === 0 && r.stage === openMenu) {
      stages[openMenu].mode = parseInt(("" + r.field).split(":")[1], 10);
      stateDirty();
    }
    openMenu = -1;
    menuHover = -1;
    mgraphics.redraw();
    return;
  }
  var h = hit(x, y);
  if (!h) return;
  if (h.field === "add") {
    addStage();
    return;
  }
  if (h.field === "remove") {
    removeStage(h.stage);
    return;
  }
  if (h.field === "mode") {
    openMenu = h.stage;
    menuHover = -1;
    mgraphics.redraw();
    return;
  }
  drag = {
    stage: h.stage,
    field: h.field,
    x0: x,
    y0: y,
    moved: false,
    shift: !!shift,
  };
  var st = stages[h.stage];
  drag.start = startVal(st, h.field);
  if (h.field === "eudots") {
    drag.circle = Math.floor((x - VIZ_X) / (VIZ_W / st.euSteps));
    drag.startEvents = st.euEvents;
  }
  if (h.field === "reptrack") {
    drag.startInterval = st.repInterval;
    drag.startDecay = st.repDecay;
  }
  if (h.field === "swingbar") drag.startDiv = st.swingDiv;
  if (h.field === "accentbar") drag.startLvl = st.accentLvl;
  if (h.field === "jitterbar") drag.startVel = st.jitVel;
  applyDrag(x, y);
}
onclick.local = 1;

function ondrag(x, y, but) {
  if (!drag) return;
  if (Math.abs(x - drag.x0) > 3 || Math.abs(y - drag.y0) > 3) drag.moved = true;
  if (but === 0) {
    if (drag.field === "eudots" && !drag.moved)
      toggleStep(stages[drag.stage], drag.circle);
    drag = null;
    mgraphics.redraw();
    stateDirty(); // commit point for every drag/click edit
    return;
  }
  applyDrag(x, y);
}
ondrag.local = 1;

// hover highlight for the open mode menu, the remove ×, and the add strip
function onidle(x, y) {
  var r = hit(x, y);
  var nMenu = -1,
    nRem = -1,
    nAdd = false;
  if (openMenu >= 0) {
    if (r && ("" + r.field).indexOf("menu:") === 0 && r.stage === openMenu)
      nMenu = parseInt(("" + r.field).split(":")[1], 10);
  } else if (r) {
    if (r.field === "remove") nRem = r.stage;
    else if (r.field === "add") nAdd = true;
  }
  if (nMenu !== menuHover || nRem !== hoverRemove || nAdd !== hoverAdd) {
    menuHover = nMenu;
    hoverRemove = nRem;
    hoverAdd = nAdd;
    mgraphics.redraw();
  }
}
onidle.local = 1;
function onidleout() {
  if (menuHover >= 0 || hoverRemove >= 0 || hoverAdd) {
    menuHover = -1;
    hoverRemove = -1;
    hoverAdd = false;
    mgraphics.redraw();
  }
}
onidleout.local = 1;

function applyDrag(x, y) {
  var st = stages[drag.stage],
    dx = x - drag.x0,
    dy = drag.y0 - y;
  switch (drag.field) {
    case "modulo":
      st.modulo = clamp(Math.round(drag.start + dx / 16), 1, 16);
      st.count = 0;
      break;
    case "probbar":
      st.prob = clamp(((x - VIZ_X) / VIZ_W) * 100, 0, 100);
      break;
    case "delaybar":
      st.delay = clamp(((x - VIZ_X) / VIZ_W) * 2000, 0, 2000);
      break;
    case "reptrack":
      st.repInterval = clamp(
        Math.round(drag.startInterval * Math.exp(dx * 0.014)),
        20,
        2000,
      ); // <-> interval (exp)
      if (drag.shift)
        st.repDecay = clamp(drag.startDecay + dy * 0.004, 0.1, 0.98); // shift+up/down decay
      else st.repeats = clamp(Math.round(drag.start + dy / 16), 1, 12);
      break; // up/down repeats
    case "threshbar":
      st.thresh = clamp((x - VIZ_X) / VIZ_W, 0, 1);
      break;
    case "curvebar":
      st.curve = clamp(drag.start + (dx + dy) * 0.006, -1, 1);
      break; // <-> and up/down both shape
    case "swingbar":
      if (drag.shift)
        st.swingDiv = clamp(
          Math.round(drag.startDiv + dy / 20),
          0,
          QUANT_DIVS.length - 1,
        ); // shift+up/down division
      else st.swing = clamp(((x - VIZ_X) / VIZ_W) * 100, 50, 75); // marker tracks the mouse
      break;
    case "accentbar":
      st.accentN = clamp(Math.round(drag.start + dx / 16), 1, 12); // <-> cycle length
      st.accentLvl = clamp(drag.startLvl + dy * 0.006, 0, 1); // up/down level
      if (st.accStep >= st.accentN) st.accStep = 0;
      break;
    case "jitterbar":
      st.jitMs = clamp(((x - VIZ_X) / VIZ_W) * JIT_MAX, 0, JIT_MAX); // <-> time jitter
      st.jitVel = clamp(drag.startVel + dy * 0.006, 0, 1); // up/down vel jitter
      break;
    case "quantbar":
      st.quantDiv = clamp(
        Math.round(drag.start + dx / 28),
        0,
        QUANT_DIVS.length - 1,
      );
      break;
    case "eudots":
      if (drag.moved) {
        // drag ←→ steps, drag ↕ events, regenerate euclidean
        st.euSteps = clamp(Math.round(drag.start + dx / 16), 1, 32);
        st.euEvents = clamp(
          Math.round(drag.startEvents + dy / 14),
          0,
          st.euSteps,
        );
        st.euPattern = bjorklund(st.euEvents, st.euSteps);
        st.euStep = 0;
      }
      break;
  }
  mgraphics.redraw();
}
function startVal(st, field) {
  switch (field) {
    case "modulo":
      return st.modulo;
    case "reptrack":
      return st.repeats;
    case "accentbar":
      return st.accentN;
    case "quantbar":
      return st.quantDiv;
    case "curvebar":
      return st.curve;
    case "eudots":
      return st.euSteps;
  }
  return 0;
}
function toggleStep(st, k) {
  if (k < 0 || k >= st.euSteps) return;
  st.euPattern[k] = st.euPattern[k] ? 0 : 1;
  st.euEvents = sum(st.euPattern);
  mgraphics.redraw();
}

// ---------------------------------------------------------------- persistence
function stageSnapshot(t) {
  return {
    mode: MODES[t.mode], // persisted by name — survives reordering/removal of modes
    modulo: t.modulo,
    prob: t.prob,
    euSteps: t.euSteps,
    euEvents: t.euEvents,
    euPattern: t.euPattern.slice(0),
    repeats: t.repeats,
    repInterval: t.repInterval,
    repDecay: t.repDecay,
    quantDiv: t.quantDiv,
    delay: t.delay,
    thresh: t.thresh,
    curve: t.curve,
    swing: t.swing,
    swingDiv: t.swingDiv,
    accentN: t.accentN,
    accentLvl: t.accentLvl,
    jitMs: t.jitMs,
    jitVel: t.jitVel,
  };
}
function exportState() {
  var s = [];
  for (var i = 0; i < stages.length; i++) s.push(stageSnapshot(stages[i]));
  return { stages: s, tempo: bpm };
}
function applyState(o) {
  if (!o || !o.stages || !o.stages.length) return;
  var n = clamp(o.stages.length, MIN_STAGES, MAX_STAGES);
  stages = [];
  for (var i = 0; i < n; i++) {
    var src = o.stages[i],
      dst = freshStage();
    for (var k in src) if (src.hasOwnProperty(k)) dst[k] = src[k];
    dst.mode = src.mode !== undefined ? modeIndex(src.mode) : dst.mode;
    if (!dst.euPattern || !dst.euPattern.length)
      dst.euPattern = bjorklund(dst.euEvents, dst.euSteps);
    if (dst.repDecay === undefined) dst.repDecay = REP_DECAY;
    if (dst.thresh === undefined) dst.thresh = 0.5;
    if (dst.curve === undefined) dst.curve = 0;
    dst.count = 0;
    dst.euStep = 0;
    dst.swingPhase = 0;
    dst.accStep = 0;
    dst.quantPending = null;
    stages.push(dst);
  }
  syncFx();
  if (o.tempo) bpm = o.tempo;
  openMenu = -1;
  hoverRemove = -1;
  applyHeight();
}
function setstate(s) {
  try {
    applyState(JSON.parse(s));
  } catch (e) {
    post("setstate parse error\n");
  }
}
function save() {
  embedmessage("setstate", JSON.stringify(exportState()));
}
function reset() {
  stages = [freshStage()];
  fx = [freshFx()];
  outFx = [0, 0];
  openMenu = -1;
  applyHeight();
  stateDirty();
}

// ---------------------------------------------------------------- pattr / preset
// The whole face (stages + tempo) is one pattr value: a compact JSON symbol,
// the same shape save()/setstate use. [preset] captures a bare v8ui directly;
// through the wrapper, [pattr state @bindto mmt_ui] publishes it so a host
// pattrstorage sees it as <instance-varname>::state — give the MultiModTrigger
// instance a scripting name for that. Interpolation between presets is
// meaningless for structured state; pattrstorage ignores it.
//
// This is what carries the STRUCTURE (how many stages, each stage's euPattern).
// The per-param bank below carries the same numbers again, separately, so preset
// MORPHS interpolate them. Both are stored; whichever pattrstorage restores last
// wins, and since they are captured from one state they agree. Recalling only
// the bank would leave the stage count at whatever it already was.
//
// Caveat (Max 9.1.1, verified): v8 answers getvalueof only at queue priority
// — at high priority it posts "getvalueof not yet supported" and the store
// captures nothing. Clicking [preset]/storagewindow is queue-side and fine,
// but automated  store/recall  driven from metro/transport/MIDI must pass
// through [deferlow] on the way into pattrstorage.
function getvalueof() {
  return JSON.stringify(exportState());
}
function setvalueof(v) {
  // compact JSON has no whitespace, so it travels as a single symbol; if a
  // client hands it over split up anyway, the parse error posts below
  var s = arguments.length > 1 ? Array.prototype.slice.call(arguments).join("") : v;
  try {
    applyState(JSON.parse("" + s));
  } catch (e) {
    post("MultiModTrigger: unreadable pattr/preset value\n");
  }
}
// mark the pattr value dirty after every committed edit. Also mirror the
// morphable per-stage params onto the host pattr bank (Phase-2b) so preset
// morphs interpolate each number instead of hard-switching a JSON blob.
function stateDirty() {
  if (typeof notifyclients === "function") notifyclients();
  emitParams();
}

// ---------------------------------------------------------------- pattr bank I/O
// Outlet 2 carries one list per morphable param (element per stage) to a bank of
// [pattr] objects in the wrapper; mode travels as symbols so pattrstorage snaps it
// (no interpolation) while the numbers interpolate. On recall/morph the pattrs
// stream back in via the s* setters below, which mutate state + redraw only (never
// re-emit — that would loop). See MultiModTrigger.maxpat.
function emitParams() {
  if (!stages || !stages.length) return;
  var mod = [], pr = [], es = [], ee = [], rp = [], ri = [], dl = [], qd = [], md = [];
  for (var i = 0; i < stages.length; i++) {
    var t = stages[i];
    mod.push(t.modulo); pr.push(t.prob); es.push(t.euSteps); ee.push(t.euEvents);
    rp.push(t.repeats); ri.push(t.repInterval); dl.push(t.delay); qd.push(t.quantDiv);
    md.push(MODES[t.mode]);
  }
  outlet(2, "pmodulo", mod); outlet(2, "pprob", pr); outlet(2, "peuSteps", es);
  outlet(2, "peuEvents", ee); outlet(2, "prepeats", rp); outlet(2, "prepInterval", ri);
  outlet(2, "pdelay", dl); outlet(2, "pquantDiv", qd); outlet(2, "pmode", md);
}
// Non-embedded bpatcher instances all share the template embed, so a recalled
// preset's list length is what defines this instance's stage count (1 for the
// single-stage replacements, 3 for the migrated multi-trigger). Resize to match.
function ensureStages(n) {
  n = clamp(Math.round(n), MIN_STAGES, MAX_STAGES);
  if (!stages || n === stages.length) return;
  while (stages.length < n) stages.push(freshStage());
  if (stages.length > n) stages.length = n;
  syncFx();
  applyHeight();
}
function setStageList(field, args, lo, hi, asInt) {
  if (!stages) return;
  ensureStages(args.length);
  var n = Math.min(args.length, stages.length);
  for (var i = 0; i < n; i++) {
    var v = args[i];
    if (asInt) v = Math.round(v);
    if (lo !== undefined) v = clamp(v, lo, hi);
    stages[i][field] = v;
  }
}
function afterSet(recomputeEu) {
  if (recomputeEu)
    for (var i = 0; i < stages.length; i++) {
      var t = stages[i];
      t.euPattern = bjorklund(Math.min(t.euEvents, t.euSteps), t.euSteps);
    }
  mgraphics.redraw();
}
function smodulo()      { setStageList("modulo",      arguments, 1, 16, true);   afterSet(false); }
function sprob()        { setStageList("prob",        arguments, 0, 100, false);  afterSet(false); }
function seuSteps()     { setStageList("euSteps",     arguments, 1, 64, true);    afterSet(true); }
function seuEvents()    { setStageList("euEvents",    arguments, 0, 64, true);    afterSet(true); }
function srepeats()     { setStageList("repeats",     arguments, 1, 32, true);    afterSet(false); }
function srepInterval() { setStageList("repInterval", arguments, 20, 2000, true); afterSet(false); }   // ms, integer (matches the drag)
function sdelay()       { setStageList("delay",       arguments, 0, 10000, false); afterSet(false); }
function squantDiv()    { setStageList("quantDiv",    arguments, 0, QUANT_DIVS.length - 1, true); afterSet(false); }
function smode() {                                                   // symbols -> mode indices (hard snap)
  if (!stages) return;
  ensureStages(arguments.length);
  var n = Math.min(arguments.length, stages.length);
  for (var i = 0; i < n; i++) stages[i].mode = modeIndex(arguments[i]);
  afterSet(false);
}

stages = [freshStage()];
syncFx();
// resize the box once the patcher is ready (box may not exist during script eval)
var initTask = new Task(function () {
  applyHeight();
});
initTask.schedule(60);
function loadbang() {
  applyHeight();
}
