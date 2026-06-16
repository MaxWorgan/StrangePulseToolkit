// MultiModTrigger.js — self-contained v8ui face + engine for the SPT
// 3-stage serial trigger modulator. One v8ui replaces the former nested
// bpatcher chain (MultiModTrigger / subMultiTrigMod / ModTrigger / ModTriggerSub).
//
// Interface (unchanged so demos drop in):
//   inlet  0 : trigger in (bang)        + control messages (tempo, setstate, reset)
//   outlet 0 : processed / "fired" trigger  -> downstream
//   outlet 1 : alternate / suppressed trigger
//
// A trigger flows  in -> I -> II -> III -> out.  Only each stage's "fire"
// output propagates to the next stage; the final stage's fire + alternate
// reach outlets 0 and 1 (shown by the two output indicators at the bottom).
//
// Design: dark-editorial, accent #B8FF5C (docs/style-guide.md). Each mode is a
// live mini-visualisation. Drag horizontally on the display to change values;
// click euclidean circles to toggle steps.

autowatch = 1;
inlets = 1;
outlets = 2;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

// ---------------------------------------------------------------- tokens
var COL = {
    base:    [0.0549, 0.0549, 0.0588, 1.0],
    surface: [0.0863, 0.0863, 0.0941, 1.0],
    surf2:   [0.1255, 0.1255, 0.1412, 1.0],
    hair:    [0.1725, 0.1725, 0.1922, 1.0],
    text:    [0.9255, 0.9255, 0.9255, 1.0],
    dim:     [0.5412, 0.5412, 0.5608, 1.0],
    faint:   [0.3608, 0.3608, 0.3804, 1.0],
    accent:  [0.7216, 1.0, 0.3608, 1.0],
    accentD: [0.7216, 1.0, 0.3608, 0.30],
    afill:   [0.7216, 1.0, 0.3608, 0.16]
};
var FONT = "Helvetica Neue";

var MODES = ["modulo", "probability", "euclidean", "repeater", "quantize", "delay", "threshold", "curve", "debounce", "crossmap", "none"];

var NOTE_BEATS = {
    "1n": 4.0, "2n": 2.0, "2nt": 1.3333, "4n": 1.0, "4nd": 1.5, "4nt": 0.6667,
    "8n": 0.5, "8nd": 0.75, "8nt": 0.3333, "16n": 0.25, "16nt": 0.1667, "32n": 0.125
};
var QUANT_DIVS = ["1n", "2n", "4n", "4nt", "8n", "8nt", "16n", "32n"];
var QUANT_LABEL = ["1/1", "1/2", "1/4", "1/4T", "1/8", "1/8T", "1/16", "1/32"];

function sum(a) { var s = 0; for (var i = 0; i < a.length; i++) s += a[i]; return s; }

function freshStage() {
    var st = {
        mode: MODES.indexOf("none"),   // start on "none" = bypass
        modulo: 4,               // every N (1..16)
        prob: 100,               // 0..100 %
        euSteps: 8, euEvents: 5, euPattern: null,
        repeats: 3, repInterval: 200, repDecay: REP_DECAY,
        quantDiv: 4,             // index into QUANT_DIVS (8n)
        delay: 200,              // ms
        thresh: 0.5, curve: 0, gap: 100, xmapAmt: 6, xmapInt: 120,
        count: 0, euStep: 0, quantPending: null, quantVel: 0, lastPass: 0
    };
    st.euPattern = bjorklund(st.euEvents, st.euSteps);
    return st;
}

var stages, bpm = 120.0, tasks = [];

// per-stage live FX + global output FX (never persisted)
function freshFx() { return { pulse: 0, cursor: -1, roll: null, travels: [], burst: null, snaps: [] }; }
var fx = [freshFx(), freshFx(), freshFx()];
var outFx = [0, 0];

var openMenu = -1, menuHover = -1, drag = null;

// ---------------------------------------------------------------- layout
// Compact: each stage is one ~22px row -> [ idx | mode chip | live viz | value ].
var W = 384, H = 190;
var PAD = 16;
var IDX_X = PAD;                                 // I / II / III
var DD_X = 36, DD_W = 100, DD_H = 22;            // mode chip
var VIZ_X = 146, VIZ_W = 140;                    // live control display
var ROW0 = 46, ROWH = 22, ROWP = 40;            // first row top, row height, row pitch

function rowTop(i) { return ROW0 + i * ROWP; }
function blkTop(i) { return rowTop(i); }                     // alias (engine-agnostic)

var regions = [];
function region(stage, field, x, y, w, h) { regions.push({ stage: stage, field: field, x: x, y: y, w: w, h: h }); }
function hit(px, py) {
    for (var i = regions.length - 1; i >= 0; i--) {
        var r = regions[i];
        if (px >= r.x && px <= r.x + r.w && py >= r.y && py <= r.y + r.h) return r;
    }
    return null;
}

// ---------------------------------------------------------------- draw helpers
function setc(c) { mgraphics.set_source_rgba(c[0], c[1], c[2], c[3]); }
function rect(x, y, w, h, c) { setc(c); mgraphics.rectangle(x, y, w, h); mgraphics.fill(); }
function rectb(x, y, w, h, c) { setc(c); mgraphics.set_line_width(1); mgraphics.rectangle(x, y, w, h); mgraphics.stroke(); }
function line(x1, y1, x2, y2, c, lw) { setc(c); mgraphics.set_line_width(lw || 1); mgraphics.move_to(x1, y1); mgraphics.line_to(x2, y2); mgraphics.stroke(); }
function disc(cx, cy, r, c) { setc(c); mgraphics.ellipse(cx - r, cy - r, r * 2, r * 2); mgraphics.fill(); }
function ring(cx, cy, r, c, lw) { setc(c); mgraphics.set_line_width(lw || 1); mgraphics.ellipse(cx - r, cy - r, r * 2, r * 2); mgraphics.stroke(); }
function setfont(size) { mgraphics.select_font_face(FONT); mgraphics.set_font_size(size); }
function measure(s, size) { setfont(size); var m = mgraphics.text_measure("" + s); return (m && m.length) ? m[0] : ("" + s).length * size * 0.55; }
function txt(x, y, s, c, size, just) {
    setc(c); setfont(size);
    var w = (just === 1 || just === 2) ? measure(s, size) : 0;
    mgraphics.move_to(just === 2 ? x - w : (just === 1 ? x - w / 2 : x), y);
    mgraphics.show_text("" + s);
}
function lerp(a, b, t) { return [a[0] + (b[0] - a[0]) * t, a[1] + (b[1] - a[1]) * t, a[2] + (b[2] - a[2]) * t, a[3] + (b[3] - a[3]) * t]; }
function clamp(v, lo, hi) { return v < lo ? lo : (v > hi ? hi : v); }
function nowMs() { return (new Date()).getTime(); }

// readout: passive accent value, right-aligned at the row's far right.
function readout(top, str, size) { txt(W - PAD, top + 15, str, COL.accent, size || 14, 2); }
function readsub(top, str) { txt(W - PAD, top + 24, trk(str), COL.faint, 7, 2); }   // small unit/aux line

// ---------------------------------------------------------------- euclid math
function bjorklund(pulses, steps) {
    steps = Math.max(1, Math.round(steps));
    pulses = clamp(Math.round(pulses), 0, steps);
    var p = [], i;
    if (pulses === 0) { for (i = 0; i < steps; i++) p.push(0); return p; }
    if (pulses === steps) { for (i = 0; i < steps; i++) p.push(1); return p; }
    var counts = [], rem = [], divisor = steps - pulses, level = 0;
    rem.push(pulses);
    while (true) {
        counts.push(Math.floor(divisor / rem[level]));
        rem.push(divisor % rem[level]);
        divisor = rem[level]; level++;
        if (rem[level] <= 1) break;
    }
    counts.push(divisor);
    function build(l) {
        if (l === -1) p.push(0);
        else if (l === -2) p.push(1);
        else { for (var k = 0; k < counts[l]; k++) build(l - 1); if (rem[l] !== 0) build(l - 2); }
    }
    build(level);
    var first = p.indexOf(1);
    if (first > 0) p = p.slice(first).concat(p.slice(0, first));
    return p;
}
function noteMs(name) { return (NOTE_BEATS[name] || 1.0) * (60000.0 / bpm); }

// ---------------------------------------------------------------- engine
function schedule(ms, fn) {
    if (ms <= 0) { fn(); return; }
    var t = new Task(function () { fn(); var k = tasks.indexOf(t); if (k >= 0) tasks.splice(k, 1); });
    tasks.push(t);
    t.schedule(ms);
}
// the module's alt (outlet 1) is threaded from the last NON-none stage; trailing
// 'none' stages just pass the fire through and don't hijack the alt.
function lastNonNone() {
    for (var i = 2; i >= 0; i--) if (MODES[stages[i].mode] !== "none") return i;
    return 2;
}
var REP_DECAY = 0.72;     // repeater echo: velocity falloff per repeat

// every event carries a velocity (0–1) payload; structural ops carry it for free,
// a few stages reshape it (repeater decay, quantize max-merge).
function doFire(i, vel) {
    flashFire(i, vel);
    if (i < 2) fireStage(i + 1, vel);
    else { outlet(0, vel); outFx[0] = clamp(vel, 0.2, 1); pump(); }
}
function doAlt(i, vel) {
    if (i === lastNonNone()) { outlet(1, vel); outFx[1] = clamp(vel, 0.2, 1); pump(); }
}
function emit(i, which, delayMs, vel) {
    schedule(delayMs, function () { if (which === 0) doFire(i, vel); else doAlt(i, vel); });
}
function fireStage(i, vel) {
    if (vel === undefined) vel = 1.0;
    var st = stages[i], f = fx[i];
    if (!f.travels) f.travels = [];
    if (!f.snaps) f.snaps = [];
    switch (MODES[st.mode]) {
        case "threshold":                                         // velocity gate
            var pass = vel >= st.thresh;
            f.roll = { x: vel, hit: pass, t: nowMs() };
            emit(i, pass ? 0 : 1, 0, vel); break;
        case "curve":                                             // velocity shaper (all pass)
            var g = Math.pow(3, -st.curve), vo = Math.pow(clamp(vel, 0, 1), g);
            f.roll = { x: vel, y: vo, t: nowMs() };
            emit(i, 1, 0, vel);                                   // dry alt
            emit(i, 0, 0, vo); break;                             // shaped fire
        case "debounce":                                          // drop triggers within gap ms
            var dnow = nowMs();
            if (dnow - st.lastPass >= st.gap) { st.lastPass = dnow; f.roll = { hit: true, t: dnow }; emit(i, 0, 0, vel); }
            else { f.roll = { hit: false, t: dnow }; emit(i, 1, 0, vel); }
            break;
        case "crossmap":                                          // velocity -> repeat density
            var reps = 1 + Math.round(clamp(vel, 0, 1) * st.xmapAmt);
            f.burst = { start: nowMs(), n: reps, interval: st.xmapInt }; f.xreps = reps;
            emit(i, 1, 0, vel);                                   // alt = original single
            for (var xk = 0; xk < reps; xk++) emit(i, 0, xk * st.xmapInt, vel * Math.pow(0.8, xk));
            break;
        case "none":
            emit(i, 0, 0, vel); emit(i, 1, 0, vel); break;
        case "modulo":
            st.count++;
            f.cursor = (st.count - 1) % st.modulo;
            emit(i, (st.count % st.modulo === 0) ? 0 : 1, 0, vel); break;
        case "probability":
            var r = Math.random() * 100.0, hit = r < st.prob;
            f.roll = { x: r / 100, hit: hit, t: nowMs() };
            emit(i, hit ? 0 : 1, 0, vel); break;
        case "euclidean":
            var n = st.euSteps, step = st.euStep % n, on = st.euPattern[step] === 1;
            f.cursor = step; st.euStep = (step + 1) % n;
            emit(i, on ? 0 : 1, 0, vel); break;
        case "repeater":
            f.burst = { start: nowMs(), n: st.repeats, interval: st.repInterval };
            emit(i, 1, 0, vel);                                       // alt = original, full velocity
            for (var k = 0; k < st.repeats; k++)
                emit(i, 0, k * st.repInterval, vel * Math.pow(st.repDecay, k));   // echoes fade (per-stage decay)
            break;
        case "quantize":
            var grid = noteMs(QUANT_DIVS[st.quantDiv]), nowt = nowMs();
            if (st.quantPending != null && nowt >= st.quantPending) st.quantPending = null;  // boundary passed
            var wait = grid - (nowt % grid), target = nowt + wait;
            f.snaps.push({ start: nowt, wait: wait, grid: grid, dup: st.quantPending != null });   // one particle per event
            if (f.snaps.length > 24) f.snaps.shift();
            emit(i, 1, 0, vel);                                       // dry alt keeps its own velocity
            if (st.quantPending == null) {                            // schedule one fire per boundary
                st.quantPending = target; st.quantVel = vel;
                (function (stage, tgt) {                              // fire reads MAX-merged velocity
                    schedule(wait, function () {
                        if (stages[stage].quantPending === tgt) stages[stage].quantPending = null;
                        doFire(stage, stages[stage].quantVel);
                    });
                })(i, target);
            } else { st.quantVel = Math.max(st.quantVel, vel); }      // merge = loudest wins
            break;
        case "delay":
            f.travels.push({ start: nowMs(), dur: st.delay });        // one particle per event
            emit(i, 1, 0, vel);                                       // dry alt
            emit(i, 0, st.delay, vel); break;
    }
    pump();
}
function bang() { fireStage(0, 1.0); }
function msg_int(v) { fireStage(0, v); }
function msg_float(v) { fireStage(0, v); }
function tempo(v) { if (v > 0) bpm = v; }
function flashFire(i, vel) { fx[i].pulse = (vel === undefined) ? 1 : clamp(vel, 0.2, 1); pump(); }

// ---------------------------------------------------------------- animation pump
var pumpTask = null, pumping = false;
function anyAnim() {
    var t = nowMs();
    if (outFx[0] > 0.03 || outFx[1] > 0.03) return true;
    for (var i = 0; i < 3; i++) {
        var f = fx[i];
        if (f.pulse > 0.03) return true;
        if (f.travels && f.travels.length) return true;
        if (f.burst && t - f.burst.start < (f.burst.n - 1) * f.burst.interval + 220) return true;
        if (f.snaps) for (var q = 0; q < f.snaps.length; q++) if (t - f.snaps[q].start < f.snaps[q].wait + 220) return true;
        if (f.roll && t - f.roll.t < 280) return true;
    }
    return false;
}
function animTick() {
    var t = nowMs();
    for (var i = 0; i < 3; i++) {
        fx[i].pulse *= 0.84;
        var tv = fx[i].travels || (fx[i].travels = []);
        for (var p = tv.length - 1; p >= 0; p--) if (t - tv[p].start > tv[p].dur + 200) tv.splice(p, 1);
        var sn = fx[i].snaps || (fx[i].snaps = []);
        for (var q = sn.length - 1; q >= 0; q--) if (t - sn[q].start > sn[q].wait + 220) sn.splice(q, 1);
    }
    outFx[0] *= 0.84; outFx[1] *= 0.84;
    mgraphics.redraw();
    if (!anyAnim()) { pumping = false; if (pumpTask) pumpTask.cancel(); }
}
function pump() {
    if (pumping) return;
    pumping = true;
    if (!pumpTask) pumpTask = new Task(animTick);
    pumpTask.interval = 33;
    pumpTask.repeat();
}

// ---------------------------------------------------------------- paint
function trk(s) { return ("" + s).toUpperCase().split("").join(" "); }   // faux letter-spacing

function paint() {
    regions = [];
    rect(0, 0, W, H, COL.base);
    txt(PAD, 24, trk("MULTIMOD"), COL.dim, 9);
    txt(W - PAD, 24, "in \u2192 I \u2192 II \u2192 III \u2192 out", COL.faint, 8, 2);   // serial flow (no arrows between rows)
    line(PAD, 33, W - PAD, 33, COL.hair, 1);
    for (var i = 0; i < 3; i++) drawStage(i);
    drawOutputs();
    if (openMenu >= 0) drawMenu(openMenu);
}

function drawStage(i) {
    var st = stages[i], f = fx[i], top = rowTop(i);
    var labels = ["I", "II", "III"];
    txt(IDX_X, top + 15, labels[i], lerp(COL.dim, COL.accent, 0.4 + 0.6 * f.pulse), 13);
    rect(DD_X, top, DD_W, ROWH, COL.surf2);                              // mode chip (no caret \u2014 no down arrows)
    if (f.pulse > 0.02) rectb(DD_X + 0.5, top + 0.5, DD_W - 1, ROWH - 1, lerp(COL.surf2, COL.accent, 0.6 * f.pulse));
    txt(DD_X + 8, top + 15, MODES[st.mode], COL.text, 11);
    region(i, "mode", DD_X, top, DD_W, ROWH);
    switch (MODES[st.mode]) {
        case "modulo":      vizModulo(i, st, f, top); break;
        case "probability": vizProb(i, st, f, top); break;
        case "euclidean":   vizEuclid(i, st, f, top); break;
        case "repeater":    vizRepeater(i, st, f, top); break;
        case "quantize":    vizQuantize(i, st, f, top); break;
        case "delay":       vizDelay(i, st, f, top); break;
        case "threshold":   vizThreshold(i, st, f, top); break;
        case "curve":       vizCurve(i, st, f, top); break;
        case "debounce":    vizDebounce(i, st, f, top); break;
        case "crossmap":    vizCrossmap(i, st, f, top); break;
        case "none":        vizNone(i, st, f, top); break;
    }
}

// shared step-cell renderer \u2014 modulo and euclidean share one look (square cells).
function drawSteps(i, field, f, top, n, isOn, isFire, cursor) {
    var cw = VIZ_W / n, my = top + ROWH / 2;
    var sz = Math.min(ROWH - 4, cw - 2); if (sz < 3) sz = Math.max(2, cw - 1);
    for (var s = 0; s < n; s++) {
        var cx = VIZ_X + cw * (s + 0.5), x0 = cx - sz / 2, y0 = my - sz / 2;
        var on = isOn(s), fire = isFire(s), cur = (s === cursor);
        if (on || fire) {
            var b = fire ? COL.accentD : COL.accent;
            rect(x0, y0, sz, sz, cur ? lerp(b, COL.text, 0.4 * f.pulse) : b);
            if (fire) rectb(x0 + 0.5, y0 + 0.5, sz - 1, sz - 1, COL.accent);
        } else {
            rectb(x0 + 0.5, y0 + 0.5, sz - 1, sz - 1, cur ? COL.dim : COL.faint);
        }
        if (cur) rectb(x0 - 2.5, y0 - 2.5, sz + 5, sz + 5, lerp(COL.dim, COL.accent, f.pulse));
    }
    region(i, field, VIZ_X, top, VIZ_W, ROWH);
}

function vizModulo(i, st, f, top) {
    readout(top, "\u00F7" + st.modulo);
    drawSteps(i, "modulo", f, top, st.modulo,
        function () { return false; }, function (s) { return s === st.modulo - 1; }, f.cursor);
}

function vizEuclid(i, st, f, top) {
    readout(top, sum(st.euPattern) + "/" + st.euSteps);
    drawSteps(i, "eudots", f, top, st.euSteps,
        function (s) { return st.euPattern[s] === 1; }, function () { return false; }, f.cursor);
}

function vizProb(i, st, f, top) {
    var my = top + ROWH / 2, p = st.prob / 100;
    readout(top, Math.round(st.prob) + "%");
    rect(VIZ_X, my - 5, VIZ_W, 10, COL.surf2);
    rect(VIZ_X, my - 5, VIZ_W * p, 10, COL.afill);
    line(VIZ_X + VIZ_W * p, my - 8, VIZ_X + VIZ_W * p, my + 8, COL.accent, 1);
    if (f.roll && nowMs() - f.roll.t < 280) {
        var rx = VIZ_X + VIZ_W * f.roll.x;
        line(rx, my - 9, rx, my + 9, f.roll.hit ? COL.accent : COL.faint, f.roll.hit ? 2 : 1);
        disc(rx, my, f.roll.hit ? 4 : 2.5, f.roll.hit ? COL.accent : COL.faint);
    }
    region(i, "probbar", VIZ_X, top, VIZ_W, ROWH);
}

function vizRepeater(i, st, f, top) {
    readout(top, st.repeats + "\u00D7"); readsub(top, st.repInterval + "ms");
    var n = st.repeats, base = top + ROWH - 4, maxH = ROWH - 8, dec = st.repDecay, x0 = VIZ_X + 3;
    var ivn = Math.log(st.repInterval / 20) / Math.log(100);                   // log spacing (matches exp drag)
    var stepx = Math.max(5, ivn * (VIZ_W - 6) / Math.max(1, n - 1));
    var elapsed = f.burst ? nowMs() - f.burst.start : -1;
    line(VIZ_X, base, VIZ_X + VIZ_W, base, COL.surf2, 1);
    for (var k = 0; k < n; k++) {
        var bx = x0 + k * stepx; if (bx > VIZ_X + VIZ_W) break;
        var amp = Math.pow(dec, k), h = maxH * (0.15 + 0.85 * amp);
        var lit = f.burst && elapsed >= k * f.burst.interval && elapsed < k * f.burst.interval + 150;
        var col = lit ? COL.accent : lerp(COL.surf2, COL.accent, 0.2 + 0.6 * amp);
        line(bx, base, bx, base - h, col, lit ? 3 : 2);
        disc(bx, base - h, lit ? 3.5 : 2, col);
    }
    region(i, "reptrack", VIZ_X, top, VIZ_W, ROWH);   // <-> interval, up/down repeats, shift+up/down decay
}

function vizQuantize(i, st, f, top) {
    var my = top + ROWH / 2;
    readout(top, QUANT_LABEL[st.quantDiv]);
    var density = [1, 2, 4, 4, 8, 8, 16, 16][st.quantDiv];                     // gridlines across the window
    line(VIZ_X, my, VIZ_X + VIZ_W, my, COL.surf2, 1);
    for (var g = 0; g <= density; g++) {                                        // bright lines on the selected grid
        var gx = VIZ_X + VIZ_W * g / density;
        line(gx, my - 8, gx, my + 8, COL.accentD, 1);
    }
    var snaps = f.snaps || [], cellw = VIZ_W / density, tx = VIZ_X + VIZ_W, now = nowMs();
    for (var q = 0; q < snaps.length; q++) {                                    // one particle per event (delay-style, doesn't reset)
        var sn = snaps[q], t = now - sn.start, prog = clamp(t / Math.max(1, sn.wait), 0, 1);
        var sx = tx - cellw * (sn.wait / sn.grid), cx = sx + (tx - sx) * prog;
        var arrived = prog >= 1 && t < sn.wait + 200;
        if (sn.dup) disc(cx, my, 2.5, COL.faint);                              // merged event: faint, no boundary flash
        else {
            disc(cx, my, arrived ? 5 : 3, arrived ? COL.accent : COL.dim);
            if (arrived) line(tx, my - 8, tx, my + 8, COL.accent, 2);          // leader flashes the boundary
        }
    }
    region(i, "quantbar", VIZ_X, top, VIZ_W, ROWH);
}

function vizDelay(i, st, f, top) {
    var my = top + ROWH / 2;
    readout(top, Math.round(st.delay) + "ms", 13);
    var ox = VIZ_X + VIZ_W * clamp(st.delay / 2000, 0, 1);
    line(VIZ_X, my, VIZ_X + VIZ_W, my, COL.surf2, 1);
    line(VIZ_X, my - 7, VIZ_X, my + 7, COL.dim, 1.5);                           // origin
    line(ox, my - 7, ox, my + 7, COL.accentD, 1.5);                            // target
    var tvs = f.travels || [];
    for (var p = 0; p < tvs.length; p++) {
        var tr = tvs[p], prog = clamp((nowMs() - tr.start) / Math.max(1, tr.dur), 0, 1);
        disc(VIZ_X + (ox - VIZ_X) * prog, my, prog >= 1 ? 5 : 3.5, prog >= 1 ? COL.accent : COL.dim);
    }
    region(i, "delaybar", VIZ_X, top, VIZ_W, ROWH);
}

function vizNone(i, st, f, top) {
    var my = top + ROWH / 2;
    txt(W - PAD, top + 15, "\u2014", COL.faint, 16, 2);
    line(VIZ_X, my, VIZ_X + VIZ_W, my, COL.surf2, 1.5);
    disc(VIZ_X + VIZ_W - 4, my, 3, lerp(COL.surf2, COL.accent, f.pulse));
}

function vizThreshold(i, st, f, top) {
    var my = top + ROWH / 2;
    readout(top, "\u2265" + Math.round(st.thresh * 100) + "%", 13);
    rect(VIZ_X, my - 5, VIZ_W, 10, COL.surf2);
    rect(VIZ_X + VIZ_W * st.thresh, my - 5, VIZ_W * (1 - st.thresh), 10, COL.afill);   // pass zone (>= thresh)
    line(VIZ_X + VIZ_W * st.thresh, my - 8, VIZ_X + VIZ_W * st.thresh, my + 8, COL.accent, 1.5);
    if (f.roll && nowMs() - f.roll.t < 280 && f.roll.x !== undefined) {
        var rx = VIZ_X + VIZ_W * f.roll.x;
        line(rx, my - 9, rx, my + 9, f.roll.hit ? COL.accent : COL.faint, f.roll.hit ? 2 : 1);
        disc(rx, my, f.roll.hit ? 4 : 2.5, f.roll.hit ? COL.accent : COL.faint);
    }
    region(i, "threshbar", VIZ_X, top, VIZ_W, ROWH);
}

function vizCurve(i, st, f, top) {
    var g = Math.pow(3, -st.curve);
    readout(top, (st.curve >= 0 ? "+" : "") + Math.round(st.curve * 100), 13);
    var y0 = top + ROWH - 3, hh = ROWH - 6;
    line(VIZ_X, y0, VIZ_X + VIZ_W, y0 - hh, COL.surf2, 1);                      // linear reference
    setc(COL.accent); mgraphics.set_line_width(1.5); mgraphics.move_to(VIZ_X, y0);
    for (var s = 1; s <= 20; s++) { var vin = s / 20; mgraphics.line_to(VIZ_X + VIZ_W * vin, y0 - hh * Math.pow(vin, g)); }
    mgraphics.stroke();
    if (f.roll && nowMs() - f.roll.t < 280 && f.roll.x !== undefined) {
        var vx = f.roll.x; disc(VIZ_X + VIZ_W * vx, y0 - hh * Math.pow(vx, g), 3.5, COL.accent);
    }
    region(i, "curvebar", VIZ_X, top, VIZ_W, ROWH);   // <-> and up/down both shape the curve
}

function vizDebounce(i, st, f, top) {
    var my = top + ROWH / 2;
    readout(top, st.gap + "ms", 13);
    var gn = Math.log(st.gap / 20) / Math.log(50);                             // 20..1000 -> 0..1
    rect(VIZ_X, my - 5, VIZ_W, 10, COL.surf2);
    rect(VIZ_X, my - 5, VIZ_W * gn, 10, COL.afill);                            // min-gap window
    line(VIZ_X + VIZ_W * gn, my - 8, VIZ_X + VIZ_W * gn, my + 8, COL.accentD, 1);
    if (f.roll && nowMs() - f.roll.t < 280)
        disc(VIZ_X + VIZ_W - 6, my, f.roll.hit ? 4 : 2.5, f.roll.hit ? COL.accent : COL.faint);
    region(i, "debouncebar", VIZ_X, top, VIZ_W, ROWH);
}

function vizCrossmap(i, st, f, top) {
    readout(top, "v\u2192" + (1 + st.xmapAmt), 13); readsub(top, st.xmapInt + "ms");
    var maxN = 1 + st.xmapAmt, x0 = VIZ_X + 3, base = top + ROWH - 4, maxH = ROWH - 8;
    var span = VIZ_W * 0.85, stepx = maxN > 1 ? span / (maxN - 1) : 0;
    var liveN = f.xreps || 0, elapsed = f.burst ? nowMs() - f.burst.start : -1;
    line(VIZ_X, base, VIZ_X + VIZ_W, base, COL.surf2, 1);
    for (var k = 0; k < maxN; k++) {
        var bx = x0 + k * stepx; if (bx > VIZ_X + VIZ_W) break;
        var on = k < liveN && f.burst && elapsed < liveN * f.burst.interval + 200;
        var lit = on && elapsed >= k * f.burst.interval && elapsed < k * f.burst.interval + 150;
        var h = on ? maxH * Math.pow(0.8, k) : maxH * 0.2;
        var col = lit ? COL.accent : (on ? lerp(COL.surf2, COL.accent, 0.5) : COL.surf2);
        line(bx, base, bx, base - h, col, lit ? 3 : 2);
        disc(bx, base - h, lit ? 3.5 : 2, col);
    }
    region(i, "crosstrack", VIZ_X, top, VIZ_W, ROWH);                          // <-> interval, up/down amount (matches repeater)
}

function drawOutputs() {
    var oy = H - 12;
    line(PAD, oy - 12, W - PAD, oy - 12, COL.hair, 1);
    txt(PAD, oy, trk("output"), COL.faint, 8);
    txt(W - PAD - 14, oy, "fire", COL.faint, 9, 2);
    disc(W - PAD - 5, oy - 3, 4, lerp(COL.surf2, COL.accent, outFx[0]));
    txt(W - PAD - 80, oy, "alt", COL.faint, 9, 2);
    disc(W - PAD - 72, oy - 3, 4, lerp(COL.surf2, COL.accent, outFx[1]));
}

function drawMenu(i) {
    var ih = 15, cw = 92, cols = 2, rows = Math.ceil(MODES.length / cols);      // 2-col popover fits the short canvas
    var mw = cols * cw, mh = rows * ih;
    var mx = DD_X, my = clamp(rowTop(i) + ROWH, 0, H - mh);                      // anchored to the chip, kept on-canvas
    rect(mx, my, mw, mh, COL.surf2);
    rectb(mx + 0.5, my + 0.5, mw - 1, mh - 1, COL.hair);
    line(mx + cw, my + 2, mx + cw, my + mh - 2, COL.hair, 1);
    for (var m = 0; m < MODES.length; m++) {
        var c = Math.floor(m / rows), r = m % rows, ix = mx + c * cw, iy = my + r * ih;
        var sel = (m === stages[i].mode), hov = (m === menuHover);
        if (sel) rect(ix, iy, cw, ih, COL.afill);
        else if (hov) rect(ix, iy, cw, ih, lerp(COL.surf2, COL.text, 0.1));
        txt(ix + 8, iy + 11, MODES[m], sel ? COL.accent : (hov ? COL.text : COL.dim), 10);
        region(i, "menu:" + m, ix, iy, cw, ih);
    }
}

// ---------------------------------------------------------------- interaction
function onclick(x, y, but, cmd, shift) {
    if (openMenu >= 0) {
        var r = hit(x, y);
        if (r && ("" + r.field).indexOf("menu:") === 0 && r.stage === openMenu)
            stages[openMenu].mode = parseInt(("" + r.field).split(":")[1], 10);
        openMenu = -1; menuHover = -1; mgraphics.redraw(); return;
    }
    var h = hit(x, y);
    if (!h) return;
    if (h.field === "mode") { openMenu = h.stage; menuHover = -1; mgraphics.redraw(); return; }
    drag = { stage: h.stage, field: h.field, x0: x, y0: y, moved: false, shift: !!shift };
    var st = stages[h.stage];
    drag.start = startVal(st, h.field);
    if (h.field === "eudots") { drag.circle = Math.floor((x - VIZ_X) / (VIZ_W / st.euSteps)); drag.startEvents = st.euEvents; }
    if (h.field === "reptrack") { drag.startInterval = st.repInterval; drag.startDecay = st.repDecay; }
    if (h.field === "crosstrack") drag.startInterval = st.xmapInt;
    applyDrag(x, y);
}
onclick.local = 1;

function ondrag(x, y, but) {
    if (!drag) return;
    if (Math.abs(x - drag.x0) > 3 || Math.abs(y - drag.y0) > 3) drag.moved = true;
    if (but === 0) {
        if (drag.field === "eudots" && !drag.moved) toggleStep(stages[drag.stage], drag.circle);
        drag = null; mgraphics.redraw(); return;
    }
    applyDrag(x, y);
}
ondrag.local = 1;

// hover highlight for the open mode menu
function onidle(x, y) {
    var nh = -1;
    if (openMenu >= 0) {
        var r = hit(x, y);
        if (r && ("" + r.field).indexOf("menu:") === 0 && r.stage === openMenu)
            nh = parseInt(("" + r.field).split(":")[1], 10);
    }
    if (nh !== menuHover) { menuHover = nh; mgraphics.redraw(); }
}
onidle.local = 1;
function onidleout() { if (menuHover >= 0) { menuHover = -1; mgraphics.redraw(); } }
onidleout.local = 1;

function applyDrag(x, y) {
    var st = stages[drag.stage], dx = x - drag.x0, dy = drag.y0 - y;
    switch (drag.field) {
        case "modulo":   st.modulo = clamp(Math.round(drag.start + dx / 16), 1, 16); st.count = 0; break;
        case "probbar":  st.prob = clamp((x - VIZ_X) / VIZ_W * 100, 0, 100); break;
        case "delaybar": st.delay = clamp((x - VIZ_X) / VIZ_W * 2000, 0, 2000); break;
        case "reptrack": st.repInterval = clamp(Math.round(drag.startInterval * Math.exp(dx * 0.014)), 20, 2000);  // <-> interval (exp)
                         if (drag.shift) st.repDecay = clamp(drag.startDecay + dy * 0.004, 0.1, 0.98);             // shift+up/down decay
                         else st.repeats = clamp(Math.round(drag.start + dy / 16), 1, 12); break;                 // up/down repeats
        case "threshbar": st.thresh = clamp((x - VIZ_X) / VIZ_W, 0, 1); break;
        case "curvebar":  st.curve = clamp(drag.start + (dx + dy) * 0.006, -1, 1); break;                         // <-> and up/down both shape
        case "debouncebar": st.gap = clamp(Math.round(20 * Math.pow(50, (x - VIZ_X) / VIZ_W)), 20, 1000); break;
        case "crosstrack": st.xmapInt = clamp(Math.round(drag.startInterval * Math.exp(dx * 0.014)), 20, 2000);  // <-> interval (exp)
                           st.xmapAmt = clamp(Math.round(drag.start + dy / 16), 1, 11); break;                  // up/down amount
        case "quantbar": st.quantDiv = clamp(Math.round(drag.start + dx / 28), 0, QUANT_DIVS.length - 1); break;
        case "eudots":   if (drag.moved) {     // drag ←→ steps, drag ↕ events, regenerate euclidean
                             st.euSteps = clamp(Math.round(drag.start + dx / 16), 1, 32);
                             st.euEvents = clamp(Math.round(drag.startEvents + dy / 14), 0, st.euSteps);
                             st.euPattern = bjorklund(st.euEvents, st.euSteps); st.euStep = 0;
                         } break;
    }
    mgraphics.redraw();
}
function startVal(st, field) {
    switch (field) {
        case "modulo": return st.modulo;
        case "reptrack": return st.repeats;
        case "crosstrack": return st.xmapAmt;
        case "quantbar": return st.quantDiv;
        case "curvebar": return st.curve;
        case "eudots": return st.euSteps;
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
function exportState() {
    var s = [];
    for (var i = 0; i < 3; i++) {
        var t = stages[i];
        s.push({ mode: t.mode, modulo: t.modulo, prob: t.prob, euSteps: t.euSteps,
                 euEvents: t.euEvents, euPattern: t.euPattern.slice(0), repeats: t.repeats,
                 repInterval: t.repInterval, repDecay: t.repDecay, quantDiv: t.quantDiv, delay: t.delay,
                 thresh: t.thresh, curve: t.curve, gap: t.gap, xmapAmt: t.xmapAmt, xmapInt: t.xmapInt });
    }
    return { stages: s, tempo: bpm };
}
function applyState(o) {
    if (!o || !o.stages) return;
    for (var i = 0; i < 3 && i < o.stages.length; i++) {
        var src = o.stages[i], dst = stages[i];
        for (var k in src) if (src.hasOwnProperty(k)) dst[k] = src[k];
        if (!dst.euPattern || !dst.euPattern.length) dst.euPattern = bjorklund(dst.euEvents, dst.euSteps);
        if (dst.repDecay === undefined) dst.repDecay = REP_DECAY;
        if (dst.thresh === undefined) dst.thresh = 0.5;
        if (dst.curve === undefined) dst.curve = 0;
        if (dst.gap === undefined) dst.gap = 100;
        if (dst.xmapAmt === undefined) dst.xmapAmt = 6;
        if (dst.xmapInt === undefined) dst.xmapInt = 120;
        dst.count = 0; dst.euStep = 0; dst.quantPending = null; dst.lastPass = 0;
    }
    if (o.tempo) bpm = o.tempo;
    mgraphics.redraw();
}
function setstate(s) { try { applyState(JSON.parse(s)); } catch (e) { post("setstate parse error\n"); } }
function save() { embedmessage("setstate", JSON.stringify(exportState())); }
function reset() { stages = [freshStage(), freshStage(), freshStage()]; fx = [freshFx(), freshFx(), freshFx()]; outFx = [0, 0]; mgraphics.redraw(); }

stages = [freshStage(), freshStage(), freshStage()];
