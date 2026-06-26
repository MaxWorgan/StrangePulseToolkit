// StrangePan.js — v8ui face for StrangePan.
// Scopes the recent motion of each pan control signal (L / R). The patch samples
// the attractor X/Y trajectory over a ~2 s window (snapshot~ 1 × 2048-tap buffer) and
// auto-normalizes it to its own min..max, so the plot fills the vertical range and the
// shape of the motion reads clearly. That trajectory is what gets smeared across the pan bins;
// two controls shape how it drives the audio mask — they don't reshape the scope:
//   FLOOR  minimum pan gain 0..1 — keeps body, no fully-cut bins (drawn as a guide)
//   GAMMA  contrast exponent — <1 lifts lows (fuller), >1 crushes (punchier)
// In:  "curveL <n...>" / "curveR <n...>" (normalized 0..1 trajectory windows).
// Out: "floor <0..1>" / "gamma <0.25..4>".

autowatch = 1;
inlets = 1;
outlets = 1;

var U = require("strangeUi.js");
var C = U.PALETTE;
var clamp = U.clamp, alpha = U.alpha, trk = U.trk;

var W = 186, H = 116, NB = 128;          // NB = display columns
var GMIN = 0.25, GMAX = 4;               // gamma/contrast exponent range (1 = linear)
var bands = [[], []], active = 0, floor = 0.4, gamma = 1;
var regions = [], drag = -1;
for (var c = 0; c < 2; c++) for (var b = 0; b < NB; b++) bands[c].push(0);

function gammaToT(g) { return clamp(Math.log(g / GMIN) / Math.log(GMAX / GMIN), 0, 1); }
function tToGamma(t) { return GMIN * Math.pow(GMAX / GMIN, clamp(t, 0, 1)); }

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var gfx = U.painter(mgraphics);
var setc = gfx.setc, rect = gfx.rect, frame = gfx.frame, text = gfx.text;

function onresize(w, h) { W = w; H = h; mgraphics.redraw(); }

// block-average an incoming normalized curve down to NB display columns
function takeCurve(ch, arr) {
    var n = arr.length;
    if (n < 1) return;
    var out = [], i, j;
    for (i = 0; i < NB; i++) {
        var a = Math.floor(i * n / NB), e = Math.floor((i + 1) * n / NB);
        if (e <= a) e = a + 1;
        var s = 0, cnt = 0;
        for (j = a; j < e && j < n; j++) { s += Number(arr[j]); cnt++; }
        out.push(cnt ? s / cnt : 0);
    }
    bands[ch] = out;
    mgraphics.redraw();
}
function curveL() { takeCurve(0, arrayfromargs(arguments)); }
function curveR() { takeCurve(1, arrayfromargs(arguments)); }

// display-only scope of the normalized control trajectory window
function specRect() { return U.specRect(W, H, 54); }

function paint() {
    var P = U.pad(W);
    regions = [];
    rect(0, 0, W, H, C.base);

    text(P, 16, trk("pan"), C.dim, 9, false);
    regions = regions.concat(gfx.tabs(["L", "R"], active, W - P, 16));

    var s = specRect();
    rect(s.x, s.y, s.w, s.h, C.surface);
    var fy = s.y + (1 - floor) * s.h;   // FLOOR guide: where the audio mask bottoms out
    setc(alpha(C.dim, 0.5)); mgraphics.set_line_width(1); mgraphics.move_to(s.x, fy); mgraphics.line_to(s.x + s.w, fy); mgraphics.stroke();
    gfx.spectrum(s, bands[1 - active], false);   // inactive (dim) behind
    gfx.spectrum(s, bands[active], true);        // active (lit) on top
    frame(s.x, s.y, s.w, s.h, C.hair);

    push("floor", gfx.bar("FLOOR", Math.round(floor * 100) + "%", floor, P, H - 32, W - P * 2));
    push("gamma", gfx.bar("GAMMA", gamma.toFixed(2), gammaToT(gamma), P, H - 14, W - P * 2));
}

function push(name, r) { r.n = name; regions.push(r); }

function setBar(name, x, r) {
    var t = clamp((x - r.x) / r.w, 0, 1);
    if (name === "floor") { floor = t; outlet(0, "floor", floor); }
    else { gamma = tToGamma(t); outlet(0, "gamma", gamma); }
    mgraphics.redraw();
}

function onclick(x, y) {
    for (var i = regions.length - 1; i >= 0; i--) {
        var r = regions[i];
        if (x >= r.x && x <= r.x + r.w && y >= r.y && y <= r.y + r.h) {
            if (r.n === "chan") { active = r.i; mgraphics.redraw(); return; }
            if (r.n === "floor" || r.n === "gamma") { drag = i; setBar(r.n, x, r); return; }
        }
    }
}
function ondrag(x, y, but) {
    if (but === 0) { drag = -1; return; }
    if (drag < 0) return;
    var r = regions[drag];
    if (r.n === "floor" || r.n === "gamma") setBar(r.n, x, r);
}
onclick.local = 1;
ondrag.local = 1;

function emit() { outlet(0, "floor", floor); outlet(0, "gamma", gamma); }
function loadbang() { emit(); }
function bang() { emit(); }

function save() { embedmessage("setstate", floor, gamma, active); }
function setstate(fl, gm, ac) {
    floor = clamp(fl, 0, 1);
    gamma = clamp(gm, GMIN, GMAX);
    active = clamp(Math.round(ac || 0), 0, 1);
    emit();
    mgraphics.redraw();
}
