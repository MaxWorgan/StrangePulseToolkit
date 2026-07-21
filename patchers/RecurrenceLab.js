// RecurrenceLab.js — combined recurrence workstation face (module 15).
// One card unifying the three recurrence views:
//   · the high-res recurrence plot itself is NOT drawn here — the reference
//     jit.pix pipeline (recurrence2.genjit) renders into a jit.pwindow that the
//     wrapper patcher lays over this face's plot well (SIMD, cheap);
//   · RQA and RPDE are fold-down sections below the plot. Each section header
//     is a power switch: cobalt dot = analysing, hollow ring = off. Toggling
//     also (un)mutes the external's poly~ voice in the wrapper, so a folded
//     section really does stop computing. The face resizes itself on fold.
//
// Param cells (drag horizontally):
//   THRESHOLD  ε  -> plot eps + spt.rpde epsilon + spt.rqa threshold
//   WINDOW     ×d -> jit.catch~ downsample + both externals' subsample_factor
//   RESOLUTION n  -> jit.catch~ framesize (points across the plot window)
// One threshold / one timescale drive plot and analyses alike, so the picture
// and the metrics always describe the same data.
//
// In:  "rr|det|lmax|entr|lam|tt <v>"  RQA metrics   (snapshot~ fed)
//      "rpde <v>" "period <v>" "diag <v>"  RPDE outputs
//      "setstate <json>"  (embedded state)
// Out (outlet 0, config messages for the wrapper):
//      ("eps" f) ("framesize" n) ("downsample" n) ("rqaon" 0/1) ("rpdeon" 0/1)
//      ("hold" ms) — freeze the plot while jit.catch~ refills. Its ring buffer
//      cannot be purged, so after a framesize/downsample change it keeps
//      serving the previous timescale's samples until one full window has
//      elapsed; unfrozen, that splice renders as violent frame-to-frame
//      flicker. The wrapper gates the catch bang for the hold, and the header
//      shows a FILLING countdown in the meantime.

autowatch = 1;
inlets = 1;
outlets = 1;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

// ---------------------------------------------------------------- Paper Lab tokens
var COL = {
    base:    [0.925, 0.906, 0.863, 1.0],
    surface: [0.965, 0.953, 0.925, 1.0],
    surf2:   [0.886, 0.863, 0.808, 1.0],
    hair:    [0.788, 0.761, 0.698, 1.0],
    text:    [0.094, 0.086, 0.067, 1.0],
    dim:     [0.408, 0.384, 0.310, 1.0],
    faint:   [0.639, 0.612, 0.541, 1.0],
    accent:  [0.863, 0.227, 0.106, 1.0],
    accent2: [0.306, 0.482, 0.910, 1.0]
};
var FONT = "Helvetica Neue", MONO = "Menlo";

// ---------------------------------------------------------------- state
var W = 340, H = 424;
var EPS = 0.06;
var DS_STEPS = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024];   // WINDOW  (downsample)
var FS_STEPS = [32, 64, 128, 256, 512, 1024];             // RESOLUTION (framesize)
// defaults verified against spt.dadras' SECONDARY output (speed 1.0):
// chaotic a=3 oscillates at ~1 ms, the a=9 limit cycle takes ~216 ms; ×64
// subsample + tau 12 gave the best chaos/periodic separation in simulation
// (RPDE 0.88 vs 0.58, RQA Lmax 16 vs 915, RR 0.02 vs 0.11)
var DS_I = 6, FS_I = 4;                                    // ×64, 512
var RQA_ON = 0, RPDE_ON = 0;                               // sections start folded = idle
// per-metric plot masks (rr = local gauge; the rest are recurrence2 params)
var OV = { rr: 0, det: 0, lmax: 0, entr: 0, lam: 0, tt: 0 };
// per-section analysis attributes (defaults mirror the poly~ voice args)
var LMIN = 2, VMIN = 2;                                    // spt.rqa line minima
var PTAU = 12, PTMAX = 1500;                               // spt.rpde embedding/lag

var M = { rr: 0, det: 0, lmax: 0, entr: 0, lam: 0, tt: 0 };
var RQA_CELLS = [
    ["rr",   "RR",   "REC RATE"],
    ["det",  "DET",  "DETERMINISM"],
    ["lmax", "Lmax", "MAX DIAG"],
    ["entr", "ENTR", "ENTROPY"],
    ["lam",  "LAM",  "LAMINARITY"],
    ["tt",   "TT",   "TRAP TIME"]
];
// hover explanations, one terse line each
var TIPS = {
    rr:   "Share of point pairs within ε.",
    det:  "Points on diagonal lines — repetition.",
    lmax: "Longest diagonal — longest locked stretch.",
    entr: "Diversity of diagonal lengths — complexity.",
    lam:  "Points in vertical lines — lingering states.",
    tt:   "Mean vertical line — how long states hold."
};
var hoverTip = null;
var RP = { v: 0, period: 0, diag: 0 };
var STATUS = ["OK", "NORM FAIL", "NO RECUR", "BAD PARAMS"];
var NB = 36; // histogram bins

var regions = [], drag = null;

// ---------------------------------------------------------------- draw helpers
function clamp(v, a, b) { return v < a ? a : (v > b ? b : v); }
function alpha(c, a) { return [c[0], c[1], c[2], a]; }
function setc(c) { mgraphics.set_source_rgba(c[0], c[1], c[2], c[3]); }
function rect(x, y, w, h, c) { setc(c); mgraphics.rectangle(x, y, w, h); mgraphics.fill(); }
function frame(x, y, w, h, c) { setc(c); mgraphics.set_line_width(1); mgraphics.rectangle(x, y, w, h); mgraphics.stroke(); }
function line(x1, y1, x2, y2, c, lw) { setc(c); mgraphics.set_line_width(lw || 1); mgraphics.move_to(x1, y1); mgraphics.line_to(x2, y2); mgraphics.stroke(); }
function disc(cx, cy, r, c) { setc(c); mgraphics.ellipse(cx - r, cy - r, r * 2, r * 2); mgraphics.fill(); }
function ring(cx, cy, r, c) { setc(c); mgraphics.set_line_width(1); mgraphics.ellipse(cx - r, cy - r, r * 2, r * 2); mgraphics.stroke(); }
function font(s, mono) { mgraphics.select_font_face(mono ? MONO : FONT); mgraphics.set_font_size(s); }
function meas(s, z, mono) { font(z, mono); var m = mgraphics.text_measure("" + s); return m && m.length ? m[0] : 0; }
function text(x, y, s, c, z, right, mono) { setc(c); font(z, mono); if (right) x -= meas(s, z, mono); mgraphics.move_to(x, y); mgraphics.show_text("" + s); }
function trk(s) { return ("" + s).toUpperCase().split("").join(" "); }

// ---------------------------------------------------------------- layout
var P = 12, HDR = 20, PARAMH = 26, SECH = 18, PAD = 8;
var RQAB = 78, RPDEB = 124; // metric grid / hero+histogram + a param-cell row each
function plotSide() { return W - 2 * P; }
function plotY() { return HDR + 4; }
function gaugeH() { return OV.rr ? 10 : 0; }
function paramY() { return plotY() + plotSide() + 6 + gaugeH(); }
function rqaY() { return paramY() + PARAMH + PAD; }
function rpdeY() { return rqaY() + SECH + (RQA_ON ? RQAB : 0); }
function totalH() { return rpdeY() + SECH + (RPDE_ON ? RPDEB : 0) + PAD; }

// self-resize (house pattern: MultiModTrigger / fold)
function selfBox() {
    var b = null;
    try { b = this.box; } catch (e) {}
    if (b) return b;
    try { b = this.patcher.getnamed("ui"); } catch (e2) {}
    return b;
}
function hostBox() {
    var b = null;
    try { b = this.patcher.box; } catch (e) {}
    return b;
}
function resizeBox(b, w, h) {
    if (!b) return;
    try { var r = b.rect; b.rect = [r[0], r[1], r[0] + w, r[1] + h]; } catch (e) {}
    try { var p = b.presentation_rect; b.presentation_rect = [p[0], p[1], w, h]; } catch (e2) {}
}
function applyHeight() {
    H = totalH();
    resizeBox(selfBox(), W, H);
    resizeBox(hostBox(), W, H);
    mgraphics.redraw();
}

// ---------------------------------------------------------------- messages in
function onresize(w, h) { W = w; H = h; mgraphics.redraw(); }
function rr(v)   { M.rr = v;   if (RQA_ON) mgraphics.redraw(); }
function det(v)  { M.det = v;  if (RQA_ON) mgraphics.redraw(); }
function lmax(v) { M.lmax = v; if (RQA_ON) mgraphics.redraw(); }
function entr(v) { M.entr = v; if (RQA_ON) mgraphics.redraw(); }
function lam(v)  { M.lam = v;  if (RQA_ON) mgraphics.redraw(); }
function tt(v)   { M.tt = v;   if (RQA_ON) mgraphics.redraw(); }
function rpde(v)   { RP.v = clamp(v, 0, 1);              if (RPDE_ON) mgraphics.redraw(); }
function period(v) { RP.period = Math.round(v);          if (RPDE_ON) mgraphics.redraw(); }
function diag(v)   { RP.diag = clamp(Math.round(v), 0, 3); if (RPDE_ON) mgraphics.redraw(); }

// ---------------------------------------------------------------- config out
function sendEps()  { outlet(0, "eps", EPS); }
function sendFs()   { outlet(0, "framesize", FS_STEPS[FS_I]); sendHold(); }
function sendDs()   { outlet(0, "downsample", DS_STEPS[DS_I]); sendHold(); }

// window duration at 44.1k plus margin: how long jit.catch~ needs before the
// requested window consists purely of post-change samples
var rebufUntil = 0;
var rebufTask = new Task(function () {
    if (Date.now() >= rebufUntil) rebufTask.cancel();
    mgraphics.redraw();
});
function sendHold() {
    var ms = Math.ceil(FS_STEPS[FS_I] * DS_STEPS[DS_I] / 44.1 * 1.1) + 80;
    outlet(0, "hold", ms);
    rebufUntil = Date.now() + ms;
    rebufTask.cancel();
    rebufTask.interval = 250;
    rebufTask.repeat();
}
function sendRqa()  { outlet(0, "rqaon", RQA_ON); }
function sendRpde() { outlet(0, "rpdeon", RPDE_ON); }
function sendOv(k)  { if (k !== "rr") outlet(0, "ov" + k, OV[k]); } // rr is drawn locally
function sendLmin() { outlet(0, "lmin", LMIN); }
function sendVmin() { outlet(0, "vmin", VMIN); }
function sendTau()  { outlet(0, "tau", PTAU); }
function sendTmax() { outlet(0, "tmax", PTMAX); }
function sendAll() {
    sendEps(); sendFs(); sendDs(); sendRqa(); sendRpde();
    sendLmin(); sendVmin(); sendTau(); sendTmax();
    for (var k in OV) if (OV.hasOwnProperty(k)) sendOv(k);
}

function loadbang() { applyHeight(); sendAll(); }
var initTask = new Task(function () { applyHeight(); sendAll(); });
initTask.schedule(60);

// ---------------------------------------------------------------- persistence
function save() {
    embedmessage("setstate", JSON.stringify(
        { eps: EPS, fs: FS_I, ds: DS_I, rqa: RQA_ON, rpde: RPDE_ON, ov: OV,
          lmin: LMIN, vmin: VMIN, ptau: PTAU, ptmax: PTMAX }));
}
function setstate(s) {
    try {
        var o = JSON.parse(s);
        if (o.eps !== undefined) EPS = clamp(o.eps, 0.005, 0.5);
        if (o.fs !== undefined) FS_I = clamp(Math.round(o.fs), 0, FS_STEPS.length - 1);
        if (o.ds !== undefined) DS_I = clamp(Math.round(o.ds), 0, DS_STEPS.length - 1);
        RQA_ON = o.rqa ? 1 : 0;
        RPDE_ON = o.rpde ? 1 : 0;
        if (o.ov) for (var k in OV) if (OV.hasOwnProperty(k)) OV[k] = o.ov[k] ? 1 : 0;
        else { OV.det = o.ovd ? 1 : 0; OV.lam = o.ovl ? 1 : 0; } // pre-mask saves
        if (o.lmin !== undefined) LMIN = clamp(Math.round(o.lmin), 2, 12);
        if (o.vmin !== undefined) VMIN = clamp(Math.round(o.vmin), 2, 12);
        if (o.ptau !== undefined) PTAU = clamp(Math.round(o.ptau), 1, 200);
        if (o.ptmax !== undefined) PTMAX = clamp(Math.round(o.ptmax), 100, 2000);
        applyHeight();
        sendAll();
    } catch (e) { post("RecurrenceLab setstate parse error\n"); }
}

// ---------------------------------------------------------------- paint
function paint() {
    regions = [];
    rect(0, 0, W, H, COL.surface);
    var S = plotSide();

    // header rail; while jit.catch~ refills, the readout becomes a countdown
    text(P, 15, "15", COL.faint, 9, false);
    text(P + 20, 15, trk("recurrence lab"), COL.dim, 9, false);
    var rebuf = rebufUntil - Date.now();
    if (rebuf > 0)
        text(W - P, 15, "FILLING · " + (rebuf / 1000).toFixed(1) + "S", COL.accent2, 8, true, true);
    else
        text(W - P, 15, FS_STEPS[FS_I] + " · ×" + DS_STEPS[DS_I], COL.faint, 8, true, true);

    // plot well backing (jit.pwindow overlays the inside)
    var py = plotY();
    rect(P, py, S, S, COL.base);
    frame(P + 0.5, py + 0.5, S - 1, S - 1, COL.hair);

    // RR mask: density gauge strip directly under the plot
    if (OV.rr) {
        var gy = py + S + 3;
        rect(P, gy, S - 18, 4, COL.surf2);
        rect(P, gy, (S - 18) * clamp(M.rr, 0, 1), 4, COL.accent);
        text(W - P, gy + 5, "RR", COL.faint, 6.5, true, true);
    }

    drawParams(paramY(), S);
    drawSection(rqaY(), "rqa", "RQA · QUANTIFICATION", RQA_ON);
    if (RQA_ON) drawRqaBody(rqaY() + SECH, S);
    drawSection(rpdeY(), "rpde", "RPDE · PERIOD ENTROPY", RPDE_ON);
    if (RPDE_ON) drawRpdeBody(rpdeY() + SECH, S);
    if (hoverTip) drawTip(hoverTip);
}

// hover explanation card for a metric; kept below the pwindow overlay
function drawTip(name) {
    var tip = TIPS[name];
    if (!tip) return;
    var tw = meas(tip, 8.5) + 14, th = 18;
    var reg = null;
    for (var i = 0; i < regions.length; i++)
        if (regions[i].name === "ov" + name) reg = regions[i];
    if (!reg) return;
    var tx = clamp(reg.x, P, W - P - tw);
    var ty = Math.max(paramY() - 2, reg.y - th - 2);
    rect(tx, ty, tw, th, alpha(COL.surface, 0.97));
    frame(tx + 0.5, ty + 0.5, tw - 1, th - 1, COL.hair);
    text(tx + 7, ty + 12.5, tip, COL.text, 8.5, false);
}

// three draggable param cells, THRESHOLD / WINDOW / RESOLUTION
function drawParams(y, S) {
    var cw = (S - 12) / 3, ch = PARAMH;
    cell(P, y, cw, ch, "THRESHOLD", EPS.toFixed(3), COL.accent, "thr");
    cell(P + cw + 6, y, cw, ch, "WINDOW", "×" + DS_STEPS[DS_I], COL.text, "win");
    cell(P + 2 * (cw + 6), y, cw, ch, "RESOLUTION", "" + FS_STEPS[FS_I], COL.text, "res");
}
function cell(x, y, w, h, label, val, vc, name) {
    rect(x, y, w, h, COL.base);
    frame(x + 0.5, y + 0.5, w - 1, h - 1, COL.hair);
    text(x + 6, y + 9, trk(label), COL.faint, 7, false);
    text(x + 6, y + h - 5, val, vc, 11, false, true);
    regions.push({ name: name, x: x, y: y, w: w, h: h });
}

// section header: hairline rule, tracked title, ON/OFF word + power dot.
// The whole strip is the toggle.
function drawSection(y, name, title, on) {
    line(P, y + SECH - 1, W - P, y + SECH - 1, COL.hair, 1);
    text(P, y + 12, trk(title), on ? COL.dim : COL.faint, 8, false);
    var dx = W - P - 5;
    if (on) disc(dx, y + 8, 3, COL.accent2);
    else ring(dx, y + 8, 3, COL.hair);
    text(dx - 8, y + 11, on ? "ON" : "OFF", on ? COL.accent2 : COL.faint, 7, true);
    if (name === "rpde" && on) {
        // diag status beside the switch (cobalt dot already says "live")
        text(dx - 30, y + 11, STATUS[RP.diag], RP.diag === 0 ? COL.faint : COL.accent, 7, true);
    }
    regions.push({ name: name + "toggle", x: 0, y: y, w: W, h: SECH });
}

// 2×3 grid of the six RQA metrics: value over tiny label (Paper Lab numerics).
// Every cell is a mask toggle: click overlays that metric's structure on the
// plot (per-cell in recurrence2.genjit; RR = the gauge strip). The state
// square mirrors each mask's actual colour treatment.
function maskSwatch(k, x, y) {
    if (k === "rr") rect(x, y, 5, 5, COL.accent);
    else if (k === "det") rect(x, y, 5, 5, COL.accent2);
    else if (k === "lam") rect(x, y, 5, 5, alpha(COL.accent2, 0.4));
    else if (k === "tt") rect(x, y, 5, 5, alpha(COL.accent2, 0.75));
    else if (k === "lmax") rect(x, y, 5, 5, COL.text);
    else if (k === "entr") { rect(x, y, 5, 5, COL.base); frame(x + 0.5, y + 0.5, 4, 4, COL.accent2); }
}
function drawRqaBody(y, S) {
    var cw = S / 3, rh = 25; // metric grid stays 2×25px; attribute row sits below
    for (var i = 0; i < RQA_CELLS.length; i++) {
        var c = i % 3, r = (i / 3) | 0, m = RQA_CELLS[i];
        var x = P + c * cw, yy = y + r * rh;
        var on = OV[m[0]];
        text(x, yy + 14, fmtMetric(m[0]), COL.accent, 12, false, true);
        text(x + cw - 18, yy + 14, m[1], on ? COL.text : COL.dim, 8, true, true);
        text(x, yy + 22, trk(m[2]), COL.faint, 6.5, false);
        var sx = x + cw - 14, sy = yy + 8;
        if (on) maskSwatch(m[0], sx, sy);
        else frame(sx + 0.5, sy + 0.5, 4, 4, COL.hair);
        regions.push({ name: "ov" + m[0], x: x, y: yy, w: cw - 4, h: rh });
    }
    // spt.rqa line-structure attributes (drag vertically)
    var py2 = y + 54, cw2 = (S - 6) / 2;
    cellRow(P, py2, cw2, 20, "MIN DIAG LEN", "" + LMIN, "lminc");
    cellRow(P + cw2 + 6, py2, cw2, 20, "MIN VERT LEN", "" + VMIN, "vminc");
}
// compact attribute cell: tracked label left, mono value right, one line
function cellRow(x, y, w, h, label, val, name) {
    rect(x, y, w, h, COL.base);
    frame(x + 0.5, y + 0.5, w - 1, h - 1, COL.hair);
    text(x + 6, y + h / 2 + 3, trk(label), COL.faint, 6.5, false);
    text(x + w - 6, y + h / 2 + 4, val, COL.text, 10, true, true);
    regions.push({ name: name, x: x, y: y, w: w, h: h });
}
function fmtMetric(k) {
    var v = M[k];
    if (k === "lmax") return "" + Math.round(v);
    if (k === "tt" || k === "entr") return (Math.round(v * 10) / 10).toFixed(1);
    return v.toFixed(2);
}

// RPDE: hero value + 0..1 bar (periodic ↔ noisy) + T, then the histogram
function drawRpdeBody(y, S) {
    text(P, y + 20, RP.v.toFixed(2), COL.text, 20, false, true);
    var bx = P + 64, bw = S - 64 - 74;
    rect(bx, y + 10, bw, 4, COL.surf2);
    rect(bx, y + 10, bw * RP.v, 4, COL.accent);
    text(bx, y + 22, "0 · " + trk("periodic"), COL.faint, 6.5, false, true);
    text(bx + bw, y + 22, "1 · " + trk("noisy"), COL.faint, 6.5, true, true);
    text(W - P, y + 14, "T = " + Math.round(RP.period), COL.accent, 11, true, true);
    text(W - P, y + 22, trk("mode · smp"), COL.faint, 6.5, true);
    var hy = y + 30, hh = RPDEB - 62; // leave room for the attribute cells below
    rect(P, hy, S, hh, COL.base);
    drawHistogram(P + 4, hy + 12, S - 8, hh - 16);
    text(P + 6, hy + 9, trk("period density · "), COL.faint, 6.5, false);
    text(P + 6 + meas(trk("period density · "), 6.5), hy + 9, "±σ = ENTROPY", COL.accent2, 6.5, false);
    frame(P + 0.5, hy + 0.5, S - 1, hh - 1, COL.hair);
    // spt.rpde embedding/search attributes (drag vertically)
    var py2 = hy + hh + 4, cw2 = (S - 6) / 2;
    cellRow(P, py2, cw2, 20, "τ · DELAY", "" + PTAU, "tauc");
    cellRow(P + cw2 + 6, py2, cw2, 20, "MAX LAG", "" + PTMAX, "tmaxc");
}

// synthesised density (Gaussian at the mode, spread grows with RPDE) — the
// external doesn't export its histogram, so the picture is derived from the
// two metrics it does emit and always agrees with them.
function modeBin() { return clamp(Math.round(RP.period / 200 * NB), 1, NB - 2); }
function drawHistogram(x, y, w, h) {
    var mi = modeBin(), sigma = 2 + RP.v * 12, d = [], i;
    for (var b = 0; b < NB; b++) {
        var v = Math.exp(-Math.pow((b - mi) / sigma, 2))
              + 0.4 * Math.exp(-Math.pow((b - mi * 2) / (sigma * 0.9), 2));
        d.push(Math.min(1, v));
    }
    var sum = 0, wsum = 0;
    for (i = 0; i < NB; i++) { sum += d[i]; wsum += d[i] * i; }
    var mean = sum ? wsum / sum : 0, varc = 0;
    for (i = 0; i < NB; i++) varc += d[i] * (i - mean) * (i - mean);
    var std = sum ? Math.sqrt(varc / sum) : 0;
    var lo = clamp(mean - std, 0, NB), hi = clamp(mean + std, 0, NB);
    var bx = function (bin) { return x + bin / NB * w; };
    rect(bx(lo), y, bx(hi) - bx(lo), h, alpha(COL.accent, 0.13));
    line(bx(lo), y, bx(lo), y + h, alpha(COL.accent2, 0.45), 1);
    line(bx(hi), y, bx(hi), y + h, alpha(COL.accent2, 0.45), 1);
    var bw = w / NB;
    for (i = 0; i < NB; i++) {
        var bh = Math.max(1, d[i] * h);
        rect(x + i * bw, y + h - bh, Math.max(1, bw - 1), bh,
             (i === mi) ? COL.accent : alpha(COL.accent, 0.55));
    }
    line(bx(mi + 0.5), y - 1, bx(mi + 0.5), y + h, COL.accent2, 1.5);
}

// ---------------------------------------------------------------- interaction
function hit(x, y) {
    for (var i = regions.length - 1; i >= 0; i--) {
        var r = regions[i];
        if (x >= r.x && x <= r.x + r.w && y >= r.y && y <= r.y + r.h) return r;
    }
    return null;
}

function onclick(x, y) {
    var r = hit(x, y);
    if (!r) return;
    if (r.name === "rqatoggle") { RQA_ON = RQA_ON ? 0 : 1; sendRqa(); applyHeight(); return; }
    if (r.name === "rpdetoggle") { RPDE_ON = RPDE_ON ? 0 : 1; sendRpde(); applyHeight(); return; }
    if (r.name.indexOf("ov") === 0) {
        var k = r.name.slice(2);
        OV[k] = OV[k] ? 0 : 1;
        sendOv(k);
        if (k === "rr") applyHeight(); // gauge strip folds in/out
        else mgraphics.redraw();
        return;
    }
    drag = { name: r.name, y0: y, eps0: EPS, ds0: DS_I, fs0: FS_I,
             lmin0: LMIN, vmin0: VMIN, tau0: PTAU, tmax0: PTMAX };
}
onclick.local = 1;

// param cells drag vertically, numbox-style (up = increase).
// WINDOW / RESOLUTION update the readout live but only commit to the patch on
// release: each framesize/downsample message re-times jit.catch~'s ring
// buffer, and every commit costs one window of refill (see sendHold), so
// streaming them mid-drag would stack holds for nothing.
function ondrag(x, y, but) {
    if (!drag) return;
    if (but === 0) {
        if (drag.name === "win" && drag.changed) sendDs();
        if (drag.name === "res" && drag.changed) sendFs();
        drag = null;
        return;
    }
    var dy = drag.y0 - y;
    if (drag.name === "thr") {
        var e = clamp(drag.eps0 * Math.exp(dy * 0.012), 0.005, 0.5);
        if (e !== EPS) { EPS = e; sendEps(); mgraphics.redraw(); }
    } else if (drag.name === "win") {
        var di = clamp(Math.round(drag.ds0 + dy / 24), 0, DS_STEPS.length - 1);
        if (di !== DS_I) { DS_I = di; drag.changed = true; mgraphics.redraw(); }
    } else if (drag.name === "res") {
        var fi = clamp(Math.round(drag.fs0 + dy / 24), 0, FS_STEPS.length - 1);
        if (fi !== FS_I) { FS_I = fi; drag.changed = true; mgraphics.redraw(); }
    } else if (drag.name === "lminc") {
        var lv = clamp(Math.round(drag.lmin0 + dy / 16), 2, 12);
        if (lv !== LMIN) { LMIN = lv; sendLmin(); mgraphics.redraw(); }
    } else if (drag.name === "vminc") {
        var vv = clamp(Math.round(drag.vmin0 + dy / 16), 2, 12);
        if (vv !== VMIN) { VMIN = vv; sendVmin(); mgraphics.redraw(); }
    } else if (drag.name === "tauc") {
        var tv = clamp(Math.round(drag.tau0 + dy / 2), 1, 200);
        if (tv !== PTAU) { PTAU = tv; sendTau(); mgraphics.redraw(); }
    } else if (drag.name === "tmaxc") {
        var xv = clamp(Math.round(drag.tmax0 + dy * 4), 100, 2000);
        if (xv !== PTMAX) { PTMAX = xv; sendTmax(); mgraphics.redraw(); }
    }
}
ondrag.local = 1;

// hover: explanation tooltip over the metric cells
function onidle(x, y) {
    var r = hit(x, y), tip = null;
    if (r && r.name.indexOf("ov") === 0) tip = r.name.slice(2);
    if (tip !== hoverTip) { hoverTip = tip; mgraphics.redraw(); }
}
onidle.local = 1;
function onidleout() {
    if (hoverTip) { hoverTip = null; mgraphics.redraw(); }
}
onidleout.local = 1;
