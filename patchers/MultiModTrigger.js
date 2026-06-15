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
        mode: 6,                 // start on "none" = bypass
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
function freshFx() { return { pulse: 0, cursor: -1, roll: null, travels: [], burst: null, snap: null }; }
var fx = [freshFx(), freshFx(), freshFx()];
var outFx = [0, 0];

var openMenu = -1, drag = null;

// ---------------------------------------------------------------- layout
var W = 384, H = 396;
var PAD = 16;
var CELLX = 14, CELLW = 356, CY0 = 46, CH = 98, CGAP = 6;   // bordered stage cells
var DD_X = 50, DD_W = 120, DD_H = 24;
var TX = 28, TW = 330, TH = 42;                              // control track within a cell
var VALW = 92, VALX = CELLX + CELLW - 12 - VALW;            // recessed value well

function blkTop(i) { return CY0 + i * (CH + CGAP); }         // cell top
function trackY(i) { return blkTop(i) + 48; }

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

// readout: passive accent number (right-aligned). the display below is the control.
function readout(top, str) { txt(W - PAD, top + 20, str, COL.accent, 22, 2); }
function readout2(top, str) { txt(W - PAD, top + 20, str, COL.accent, 18, 2); }

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
            f.snap = { start: nowt, wait: wait, grid: grid, dup: st.quantPending != null };
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
        if (f.snap && t - f.snap.start < f.snap.wait + 220) return true;
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
function heroVal(top, str, size) {                                       // recessed well + hero numeral
    rect(VALX, top + 8, VALW, 28, COL.surf2);
    txt(VALX + VALW - 10, top + 30, str, COL.accent, size || 22, 2);
}
function unit(top, s) { txt(VALX - 8, top + 29, trk(s), COL.faint, 8, 2); }

function paint() {
    regions = [];
    rect(0, 0, W, H, COL.base);
    txt(PAD, 26, trk("MULTIMOD"), COL.dim, 9);
    txt(W - PAD, 26, "trigger modulator", COL.faint, 9, 2);
    line(PAD, 35, W - PAD, 35, COL.hair, 1);
    for (var i = 0; i < 3; i++) drawStage(i);
    drawOutputs();
    if (openMenu >= 0) drawMenu(openMenu);
}

function drawStage(i) {
    var st = stages[i], f = fx[i], top = blkTop(i), ty = trackY(i);
    var labels = ["I", "II", "III"];
    rect(CELLX, top, CELLW, CH, COL.surface);                            // cell
    rectb(CELLX + 0.5, top + 0.5, CELLW - 1, CH - 1, lerp(COL.hair, COL.accent, 0.4 * f.pulse));
    txt(CELLX + 11, top + 31, labels[i], lerp(COL.dim, COL.accent, 0.5 + 0.5 * f.pulse), 16);
    rect(DD_X, top + 10, DD_W, DD_H, COL.surf2);                         // mode chip
    txt(DD_X + 10, top + 27, MODES[st.mode], COL.text, 12);
    txt(DD_X + DD_W - 15, top + 27, "\u25BE", COL.dim, 11);
    region(i, "mode", DD_X, top + 10, DD_W, DD_H);
    switch (MODES[st.mode]) {
        case "modulo":      vizModulo(i, st, f, top, ty); break;
        case "probability": vizProb(i, st, f, top, ty); break;
        case "euclidean":   vizEuclid(i, st, f, top, ty); break;
        case "repeater":    vizRepeater(i, st, f, top, ty); break;
        case "quantize":    vizQuantize(i, st, f, top, ty); break;
        case "delay":       vizDelay(i, st, f, top, ty); break;
        case "threshold":   vizThreshold(i, st, f, top, ty); break;
        case "curve":       vizCurve(i, st, f, top, ty); break;
        case "debounce":    vizDebounce(i, st, f, top, ty); break;
        case "crossmap":    vizCrossmap(i, st, f, top, ty); break;
        case "none":        vizNone(i, st, f, top, ty); break;
    }
}

function vizModulo(i, st, f, top, ty) {
    unit(top, "every"); heroVal(top, "" + st.modulo);
    var n = st.modulo, gap = 4, cw = (TW - (n - 1) * gap) / n;
    for (var s = 0; s < n; s++) {
        var cx = TX + s * (cw + gap), isFire = (s === n - 1), isCur = (s === f.cursor);
        var b = isFire ? COL.accentD : COL.surf2;
        rect(cx, ty + 4, cw, TH - 8, isCur ? lerp(b, COL.accent, 0.6 + 0.4 * f.pulse) : b);
        if (isFire) rectb(cx + 0.5, ty + 4.5, cw - 1, TH - 9, COL.accent);
    }
    region(i, "modulo", TX, ty, TW, TH);
}

function vizProb(i, st, f, top, ty) {
    var my = ty + TH / 2, p = st.prob / 100;
    heroVal(top, Math.round(st.prob) + "%");
    rect(TX, my - 7, TW, 14, COL.surf2);
    rect(TX, my - 7, TW * p, 14, COL.afill);
    line(TX + TW * p, ty + 5, TX + TW * p, ty + TH - 5, COL.accent, 1);
    if (f.roll && nowMs() - f.roll.t < 280) {
        var rx = TX + TW * f.roll.x;
        line(rx, ty + 2, rx, ty + TH - 2, f.roll.hit ? COL.accent : COL.faint, f.roll.hit ? 2 : 1);
        disc(rx, my, f.roll.hit ? 5 : 3, f.roll.hit ? COL.accent : COL.faint);
    }
    region(i, "probbar", TX, ty, TW, TH);
}

function vizEuclid(i, st, f, top, ty) {
    heroVal(top, sum(st.euPattern) + "/" + st.euSteps, 20);
    var n = st.euSteps, my = ty + TH / 2, step = TW / n, sz = Math.min(14, step - 3); if (sz < 5) sz = 5;
    for (var s = 0; s < n; s++) {
        var cx = TX + step * (s + 0.5), cur = (s === f.cursor);
        if (st.euPattern[s] === 1) rect(cx - sz / 2, my - sz / 2, sz, sz, cur ? lerp(COL.accent, COL.text, 0.4 * f.pulse) : COL.accent);
        else rectb(cx - sz / 2 + 0.5, my - sz / 2 + 0.5, sz - 1, sz - 1, cur ? COL.dim : COL.faint);
        if (cur) rectb(cx - sz / 2 - 2.5, my - sz / 2 - 2.5, sz + 5, sz + 5, lerp(COL.dim, COL.accent, f.pulse));
    }
    region(i, "eudots", TX, ty, TW, TH);
}

function vizRepeater(i, st, f, top, ty) {
    heroVal(top, st.repeats + "\u00D7", 20);
    txt(VALX - 8, top + 29, trk(st.repInterval + "ms"), COL.faint, 8, 2);
    var n = st.repeats, x0 = TX + 6, base = ty + 28, maxH = 22, dec = st.repDecay;
    var ivn = Math.log(st.repInterval / 20) / Math.log(100);   // log spacing (matches exp drag)
    var maxStep = (TW - 12) / Math.max(1, n - 1);
    var stepx = Math.max(6, ivn * maxStep);
    var elapsed = f.burst ? nowMs() - f.burst.start : -1;
    line(TX, base, TX + TW, base, COL.surf2, 1);
    for (var k = 0; k < n; k++) {
        var bx = x0 + k * stepx, amp = Math.pow(dec, k), h = maxH * (0.12 + 0.88 * amp);
        var lit = f.burst && elapsed >= k * f.burst.interval && elapsed < k * f.burst.interval + 150;
        var col = lit ? COL.accent : lerp(COL.surf2, COL.accent, 0.2 + 0.6 * amp);
        line(bx, base, bx, base - h, col, lit ? 3 : 2);
        disc(bx, base - h, lit ? 4 : 2.5, col);
    }
    var sy = ty + 34, sx = TX + 38, sw = TW - 38;
    txt(TX, sy + 5, "decay", COL.faint, 8);
    rect(sx, sy, sw, 4, COL.surf2);
    rect(sx, sy, sw * dec, 4, COL.accent);
    region(i, "reptrack", TX, ty, TW, 30);
    region(i, "repdecay", TX, ty + 30, TW, TH - 28);
}

function vizQuantize(i, st, f, top, ty) {
    var my = ty + TH / 2;
    unit(top, "grid"); heroVal(top, QUANT_LABEL[st.quantDiv], 20);
    var density = [4, 4, 4, 6, 8, 12, 16, 16][st.quantDiv];
    for (var g = 0; g <= density; g++) line(TX + TW * g / density, ty + 6, TX + TW * g / density, ty + TH - 6, COL.hair, 1);
    line(TX, my, TX + TW, my, COL.surf2, 1);
    if (f.snap) {
        var t = nowMs() - f.snap.start, prog = clamp(t / Math.max(1, f.snap.wait), 0, 1);
        var snapX = TX + TW * (1 - (f.snap.wait / f.snap.grid)), cx = TX + (snapX - TX) * prog;
        var arrived = prog >= 1 && t < f.snap.wait + 200;
        disc(cx, my, arrived ? 5 : 3, f.snap.dup ? COL.faint : (arrived ? COL.accent : COL.dim));
        if (arrived && !f.snap.dup) line(snapX, ty + 4, snapX, ty + TH - 4, COL.accent, 2);
    }
    region(i, "quantbar", TX, ty, TW, TH);
}

function vizDelay(i, st, f, top, ty) {
    var my = ty + TH / 2;
    heroVal(top, Math.round(st.delay) + "", 22); txt(VALX - 8, top + 29, trk("ms"), COL.faint, 8, 2);
    var ox = TX + TW * clamp(st.delay / 2000, 0, 1);
    line(TX, my, TX + TW, my, COL.surf2, 1);
    line(TX, ty + 6, TX, ty + TH - 6, COL.dim, 1.5);
    line(ox, ty + 6, ox, ty + TH - 6, COL.accentD, 1.5);
    var tvs = f.travels || [];
    for (var p = 0; p < tvs.length; p++) {
        var tr = tvs[p], prog = clamp((nowMs() - tr.start) / Math.max(1, tr.dur), 0, 1);
        disc(TX + (ox - TX) * prog, my, prog >= 1 ? 5 : 3.5, prog >= 1 ? COL.accent : COL.dim);
    }
    region(i, "delaybar", TX, ty, TW, TH);
}

function vizNone(i, st, f, top, ty) {
    txt(VALX + VALW - 10, top + 30, "\u2014", COL.faint, 20, 2);
    unit(top, "thru");
    var my = ty + TH / 2;
    line(TX, my, TX + TW, my, COL.surf2, 1.5);
    disc(TX + TW - 4, my, 3.5, lerp(COL.surf2, COL.accent, f.pulse));
}

function vizThreshold(i, st, f, top, ty) {
    var my = ty + TH / 2;
    heroVal(top, "\u2265 " + Math.round(st.thresh * 100) + "%", 20);
    rect(TX, my - 7, TW, 14, COL.surf2);
    rect(TX + TW * st.thresh, my - 7, TW * (1 - st.thresh), 14, COL.afill);     // pass zone (>= thresh)
    line(TX + TW * st.thresh, ty + 4, TX + TW * st.thresh, ty + TH - 4, COL.accent, 1.5);
    if (f.roll && nowMs() - f.roll.t < 280 && f.roll.x !== undefined) {
        var rx = TX + TW * f.roll.x;
        line(rx, ty + 2, rx, ty + TH - 2, f.roll.hit ? COL.accent : COL.faint, f.roll.hit ? 2 : 1);
        disc(rx, my, f.roll.hit ? 5 : 3, f.roll.hit ? COL.accent : COL.faint);
    }
    region(i, "threshbar", TX, ty, TW, TH);
}

function vizCurve(i, st, f, top, ty) {
    var g = Math.pow(3, -st.curve);
    heroVal(top, (st.curve >= 0 ? "+" : "") + Math.round(st.curve * 100), 20);
    unit(top, st.curve >= 0 ? "compress" : "expand");
    var y0 = ty + TH - 5, hh = TH - 10;
    line(TX, y0, TX + TW, y0 - hh, COL.surf2, 1);                               // linear reference
    setc(COL.accent); mgraphics.set_line_width(2); mgraphics.move_to(TX, y0);
    for (var s = 1; s <= 24; s++) { var vin = s / 24; mgraphics.line_to(TX + TW * vin, y0 - hh * Math.pow(vin, g)); }
    mgraphics.stroke();
    if (f.roll && nowMs() - f.roll.t < 280 && f.roll.x !== undefined) {
        var vx = f.roll.x; disc(TX + TW * vx, y0 - hh * Math.pow(vx, g), 4, COL.accent);
    }
    region(i, "curvebar", TX, ty, TW, TH);
}

function vizDebounce(i, st, f, top, ty) {
    var my = ty + TH / 2;
    heroVal(top, st.gap + "", 22); unit(top, "ms");
    var gn = Math.log(st.gap / 20) / Math.log(50);                             // 20..1000 -> 0..1
    rect(TX, my - 5, TW, 10, COL.surf2);
    rect(TX, my - 5, TW * gn, 10, COL.afill);                                  // min-gap window
    line(TX + TW * gn, ty + 4, TX + TW * gn, ty + TH - 4, COL.accentD, 1);
    if (f.roll && nowMs() - f.roll.t < 280)
        disc(TX + TW - 6, my, f.roll.hit ? 5 : 3, f.roll.hit ? COL.accent : COL.faint);
    region(i, "debouncebar", TX, ty, TW, TH);
}

function vizCrossmap(i, st, f, top, ty) {
    heroVal(top, "v\u2192" + (1 + st.xmapAmt), 18);
    txt(VALX - 8, top + 29, trk(st.xmapInt + "ms"), COL.faint, 8, 2);
    var maxN = 1 + st.xmapAmt, x0 = TX + 6, base = ty + 28, maxH = 22;
    var span = TW * 0.7, stepx = maxN > 1 ? span / (maxN - 1) : 0;
    var liveN = f.xreps || 0, elapsed = f.burst ? nowMs() - f.burst.start : -1;
    line(TX, base, TX + TW, base, COL.surf2, 1);
    for (var k = 0; k < maxN; k++) {
        var bx = x0 + k * stepx;
        var on = k < liveN && f.burst && elapsed < liveN * f.burst.interval + 200;
        var lit = on && elapsed >= k * f.burst.interval && elapsed < k * f.burst.interval + 150;
        var h = on ? maxH * Math.pow(0.8, k) : maxH * 0.18;
        var col = lit ? COL.accent : (on ? lerp(COL.surf2, COL.accent, 0.5) : COL.surf2);
        line(bx, base, bx, base - h, col, lit ? 3 : 2);
        disc(bx, base - h, lit ? 4 : 2.5, col);
    }
    region(i, "crosstrack", TX, ty, TW, TH);                                   // <-> amount  up/down interval
}

function drawOutputs() {
    var oy = H - 14;
    line(PAD, oy - 13, W - PAD, oy - 13, COL.hair, 1);
    txt(PAD, oy, trk("output"), COL.faint, 8);
    txt(W - PAD - 14, oy, "fire", COL.faint, 9, 2);
    disc(W - PAD - 5, oy - 3, 4, lerp(COL.surf2, COL.accent, outFx[0]));
    txt(W - PAD - 80, oy, "alt", COL.faint, 9, 2);
    disc(W - PAD - 72, oy - 3, 4, lerp(COL.surf2, COL.accent, outFx[1]));
}

function drawMenu(i) {
    var top = blkTop(i) + 10, ih = 18, mh = MODES.length * ih, my = top + DD_H;
    if (my + mh > H) my = top - mh;
    rect(DD_X, my, DD_W, mh, COL.surf2);
    rectb(DD_X + 0.5, my + 0.5, DD_W - 1, mh - 1, COL.hair);
    for (var m = 0; m < MODES.length; m++) {
        var iy = my + m * ih;
        if (m === stages[i].mode) rect(DD_X, iy, DD_W, ih, COL.afill);
        txt(DD_X + 10, iy + 13, MODES[m], m === stages[i].mode ? COL.accent : COL.text, 10);
        region(i, "menu:" + m, DD_X, iy, DD_W, ih);
    }
}

// ---------------------------------------------------------------- interaction
function onclick(x, y, but, cmd, shift) {
    if (openMenu >= 0) {
        var r = hit(x, y);
        if (r && ("" + r.field).indexOf("menu:") === 0 && r.stage === openMenu)
            stages[openMenu].mode = parseInt(("" + r.field).split(":")[1], 10);
        openMenu = -1; mgraphics.redraw(); return;
    }
    var h = hit(x, y);
    if (!h) return;
    if (h.field === "mode") { openMenu = h.stage; mgraphics.redraw(); return; }
    drag = { stage: h.stage, field: h.field, x0: x, y0: y, moved: false };
    var st = stages[h.stage];
    drag.start = startVal(st, h.field);
    if (h.field === "eudots") { drag.circle = Math.floor((x - TX) / (TW / st.euSteps)); drag.startEvents = st.euEvents; }
    if (h.field === "reptrack") drag.startInterval = st.repInterval;
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

function applyDrag(x, y) {
    var st = stages[drag.stage], dx = x - drag.x0, dy = drag.y0 - y;
    switch (drag.field) {
        case "modulo":   st.modulo = clamp(Math.round(drag.start + dx / 16), 1, 16); st.count = 0; break;
        case "probbar":  st.prob = clamp((x - TX) / TW * 100, 0, 100); break;
        case "delaybar": st.delay = clamp((x - TX) / TW * 2000, 0, 2000); break;
        case "reptrack": st.repeats = clamp(Math.round(drag.start + dx / 16), 1, 12);
                         st.repInterval = clamp(Math.round(drag.startInterval * Math.exp(dy * 0.014)), 20, 2000); break;  // exp: ~50px/octave
        case "repdecay": st.repDecay = clamp((x - (TX + 38)) / (TW - 38), 0.1, 0.98); break;
        case "threshbar": st.thresh = clamp((x - TX) / TW, 0, 1); break;
        case "curvebar":  st.curve = clamp((x - TX) / TW * 2 - 1, -1, 1); break;
        case "debouncebar": st.gap = clamp(Math.round(20 * Math.pow(50, (x - TX) / TW)), 20, 1000); break;
        case "crosstrack": st.xmapAmt = clamp(Math.round(drag.start + dx / 16), 1, 11);
                           st.xmapInt = clamp(Math.round(drag.startInterval * Math.exp(dy * 0.014)), 20, 2000); break;
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
