// StrangeFilter.js — v8ui face for the stereo 64-band StrangeFilter.
// Two overlaid spectral gain curves (L / R), each modulated live by its own
// control signal. Pick L or R to paint; drag the spectrum to shape that
// channel's bands. MIX blends in the control-derived curve; Q sets resonance.
// In:  "curveL <64>" / "curveR <64>" from the two control chains.
// Out: "curveL <64>" / "curveR <64>" (band gains) / "mix <f>" / "q <f>".

autowatch = 1;
inlets = 1;
outlets = 1;

var U = require("strangeUi.js");
var C = U.PALETTE;
var clamp = U.clamp, trk = U.trk;

var W = 236, H = 200;
var NB = 64;
var QMIN = 10, QMAX = 110;
var CH = ["L", "R"];

var bands = [[], []], mix = 0.5, q = 10, active = 0;
var regions = [], drag = -1, lastBand = -1;
for (var c = 0; c < 2; c++) for (var b = 0; b < NB; b++) bands[c].push(1.0);

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var gfx = U.painter(mgraphics);
var rect = gfx.rect, frame = gfx.frame, text = gfx.text;

function onresize(w, h) { W = w; H = h; mgraphics.redraw(); }

function takeCurve(ch, args) {
    var a = [], i;
    for (i = 0; i < args.length; i++) a.push(args[i]);
    var n = Math.min(a.length, NB);
    for (i = 0; i < n; i++) bands[ch][i] = clamp(a[i], 0, 1);
    sendCurve(ch);
    mgraphics.redraw();
}
function curveL() { takeCurve(0, arrayfromargs(arguments)); }
function curveR() { takeCurve(1, arrayfromargs(arguments)); }
function sendCurve(ch) { outlet(0, ch === 0 ? "curveL" : "curveR", bands[ch]); }

// editable band gains map straight onto the shared spectrum plot
function specRect() { return U.specRect(W, H, 66); }

function paint() {
    var P = U.pad(W);
    regions = [];
    rect(0, 0, W, H, C.base);

    text(P, 16, trk("filter"), C.dim, 9, false);
    regions = regions.concat(gfx.tabs(CH, active, W - P, 16));   // L / R paint selector

    var s = specRect();
    rect(s.x, s.y, s.w, s.h, C.surface);
    gfx.spectrum(s, bands[1 - active], false);   // inactive (dim) first
    gfx.spectrum(s, bands[active], true);        // active (lit) on top
    frame(s.x, s.y, s.w, s.h, C.hair, 1);
    regions.push({ n: "spec", x: s.x, y: s.y, w: s.w, h: s.h });

    push("mix", gfx.bar("MIX", mix.toFixed(2), mix, P, H - 50, W - P * 2));
    push("q", gfx.bar("Q", Math.round(q), (q - QMIN) / (QMAX - QMIN), P, H - 22, W - P * 2));
}

function push(name, r) { r.n = name; regions.push(r); }

function paintSpec(x, y, s) {
    var band = clamp(Math.floor((x - s.x) / s.w * NB), 0, NB - 1);
    var g = clamp(1 - (y - s.y) / s.h, 0, 1);
    var lo = lastBand < 0 ? band : Math.min(lastBand, band);
    var hi = lastBand < 0 ? band : Math.max(lastBand, band);
    for (var i = lo; i <= hi; i++) bands[active][i] = g;
    lastBand = band;
    sendCurve(active);
    mgraphics.redraw();
}
function setBar(name, x, r) {
    var t = clamp((x - r.x) / r.w, 0, 1);
    if (name === "mix") { mix = t; outlet(0, "mix", mix); }
    else { q = QMIN + t * (QMAX - QMIN); outlet(0, "q", q); }
    mgraphics.redraw();
}

function onclick(x, y) {
    for (var i = regions.length - 1; i >= 0; i--) {
        var r = regions[i];
        if (x >= r.x && x <= r.x + r.w && y >= r.y && y <= r.y + r.h) {
            if (r.n === "chan") { active = r.i; mgraphics.redraw(); return; }
            if (r.n === "spec") { drag = i; lastBand = -1; paintSpec(x, y, r); return; }
            drag = i; setBar(r.n, x, r); return;
        }
    }
}
function ondrag(x, y, but) {
    if (but === 0) { drag = -1; lastBand = -1; return; }
    if (drag < 0) return;
    var r = regions[drag];
    if (r.n === "spec") paintSpec(x, y, r); else if (r.n === "mix" || r.n === "q") setBar(r.n, x, r);
}
onclick.local = 1;
ondrag.local = 1;

function emit() { outlet(0, "mix", mix); outlet(0, "q", q); sendCurve(0); sendCurve(1); }
function loadbang() { emit(); }
function bang() { emit(); }

function save() { embedmessage("setstate", mix, q, active); }
function setstate(mx, qq, ac) {
    mix = clamp(mx, 0, 1);
    q = clamp(qq, QMIN, QMAX);
    active = clamp(Math.round(ac || 0), 0, 1);
    emit();
}
