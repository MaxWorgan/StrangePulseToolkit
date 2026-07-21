// StrangeFilter.js — v8ui face for the stereo 64-band StrangeFilter.
// Two overlaid spectral gain curves (L / R), each modulated live by its own
// control signal. Pick L or R to paint; drag the spectrum to shape that
// channel's bands.
//
// EXPAND is a contrast control, not a dry/wet. The patch tracks the running
// min/max of the incoming control-derived band values and normalises them to
// fill 0..1; EXPAND crossfades between the raw values (0) and that normalised
// version (1). Low settings follow the attractor's actual excursion, which may
// only occupy a sliver of the range and filter gently; high settings always
// stretch to full range, so the band contrast stays vivid regardless of how
// small the incoming swing is. (This was `ExpandGain` before the v8ui redesign.)
//
// In:  "curveL <64>" / "curveR <64>" from the two control chains.
// Out: "curveL <64>" / "curveR <64>" (band gains) / "expand <f>".

autowatch = 1;
inlets = 1;
outlets = 1;

var U = require("strangeUi.js");
var C = U.PALETTE;
var clamp = U.clamp, trk = U.trk;

var W = 236, H = 200;
var NB = 64;
var CH = ["L", "R"];

var bands = [[], []], expand = 0.5, active = 0;
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

// editable band gains map straight onto the shared spectrum plot. The footer
// reserve is 38px: one bar (label at y-6, 6px track, hit rect to y+8) plus the
// same 10px breathing room the two-bar layout had. Dropping Q gave the
// spectrum back 28px of height.
function specRect() { return U.specRect(W, H, 38); }

function paint() {
    var P = U.pad(W);
    regions = [];
    rect(0, 0, W, H, C.surface);

    text(P, 16, "06", C.faint, 9, false);
    text(P + 18, 16, trk("filter"), C.dim, 9, false);
    regions = regions.concat(gfx.tabs(CH, active, W - P, 16));   // L / R paint selector

    var s = specRect();
    rect(s.x, s.y, s.w, s.h, C.base);
    gfx.grid(s, 6, 4);                           // cobalt blueprint grid
    gfx.setc(C.hair); mgraphics.set_line_width(1);
    mgraphics.move_to(s.x, s.y + s.h / 2); mgraphics.line_to(s.x + s.w, s.y + s.h / 2); mgraphics.stroke();
    gfx.spectrum(s, bands[1 - active], false);   // inactive (dim) first
    gfx.spectrum(s, bands[active], true);        // active (lit) on top
    frame(s.x, s.y, s.w, s.h, C.hair, 1);
    regions.push({ n: "spec", x: s.x, y: s.y, w: s.w, h: s.h });

    push("expand", gfx.bar("EXPAND", expand.toFixed(2), expand, P, H - 22, W - P * 2));
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
    expand = clamp((x - r.x) / r.w, 0, 1);
    outlet(0, "expand", expand);
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
    if (r.n === "spec") paintSpec(x, y, r); else if (r.n === "expand") setBar(r.n, x, r);
}
onclick.local = 1;
ondrag.local = 1;

function emit() { outlet(0, "expand", expand); sendCurve(0); sendCurve(1); }
function loadbang() { emit(); }
function bang() { emit(); }

function save() { embedmessage("setstate", expand, active); }
function setstate(ex, ac) {
    expand = clamp(ex, 0, 1);
    active = clamp(Math.round(ac || 0), 0, 1);
    emit();
}

// ---------------------------------------------------------------- pattr bank I/O
// [pattr expand] in StrangeFilter.maxpat sits between this face and the filter
// banks, so a host pattrstorage sees it as <instance>::expand. On recall it
// streams back in here to mutate state + redraw ONLY — never re-emit, which
// would loop back into the pattr the value just arrived from.
// The 64-band curves are derived from the incoming attractor signal, not stored.
function sexpand(v) { expand = clamp(v, 0, 1); mgraphics.redraw(); }
