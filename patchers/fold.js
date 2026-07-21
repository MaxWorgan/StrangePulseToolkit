// fold.js — resizable v8ui face for the [fold] wavefolder.
// One combined view: the folded output is drawn in-face as a bright trace over a
// faint fold/wrap/clip transfer curve, so the whole plot resizes as one object
// (no separate live.scope~ to keep in sync). Drag the plot horizontally to set
// drive, click a mode word to switch shaping.
// In:  "sig <window>" — recent samples of the folded output, ~-1..1.
// Out: "drive <f>" / "mode <sym>".

autowatch = 1;
inlets = 1;
outlets = 1;

// Paper Lab — light lab-instrument palette (see design_handoff_paperlab_ui/tokens.md)
var C = {
    base:   [0.925, 0.906, 0.863, 1], surface: [0.965, 0.953, 0.925, 1],
    surf2:  [0.886, 0.863, 0.808, 1], hair:    [0.788, 0.761, 0.698, 1],
    text:   [0.094, 0.086, 0.067, 1], dim:     [0.408, 0.384, 0.310, 1],
    faint:  [0.639, 0.612, 0.541, 1], accent:  [0.863, 0.227, 0.106, 1],
    accent2:[0.306, 0.482, 0.910, 1]
};
var FONT = "Helvetica Neue";
var MONO = "Menlo";
var W = 236, H = 200;
var MODES = ["fold", "wrap", "clip"];
var DMIN = 1, DMAX = 10;

var drive = 4.2, mode = 0;
var sigBuf = [];
var regions = [], drag = -1;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

function clamp(v, a, b) { return v < a ? a : (v > b ? b : v); }
function setc(c) { mgraphics.set_source_rgba(c[0], c[1], c[2], c[3]); }
function alpha(c, a) { return [c[0], c[1], c[2], a]; }
function rect(x, y, w, h, c) { setc(c); mgraphics.rectangle(x, y, w, h); mgraphics.fill(); }
function frame(x, y, w, h, c, lw) { setc(c); mgraphics.set_line_width(lw || 1); mgraphics.rectangle(x, y, w, h); mgraphics.stroke(); }
function line(x1, y1, x2, y2, c, lw) { setc(c); mgraphics.set_line_width(lw || 1); mgraphics.move_to(x1, y1); mgraphics.line_to(x2, y2); mgraphics.stroke(); }
function font(s, mono) { mgraphics.select_font_face(mono ? MONO : FONT); mgraphics.set_font_size(s); }
function meas(s, z, mono) { font(z, mono); var m = mgraphics.text_measure("" + s); return m && m.length ? m[0] : 0; }
function text(x, y, s, c, z, right, mono) { setc(c); font(z, mono); if (right) x -= meas(s, z, mono); mgraphics.move_to(x, y); mgraphics.show_text("" + s); }
function trk(s) { return ("" + s).toUpperCase().split("").join(" "); }

// Wavefolder transfer: drive-scaled input folded back into [-1, 1].
function shape(x) {
    var u = drive * x, lo = -1, hi = 1, range = hi - lo;
    if (mode === 2) return clamp(u, lo, hi);                      // clip
    if (mode === 1) { var m = (u - lo) % range; if (m < 0) m += range; return lo + m; } // wrap
    var r = range * 2, p = (u - lo) % r; if (p < 0) p += r; if (p > range) p = r - p;    // fold
    return lo + p;
}

function onresize(w, h) { W = w; H = h; mgraphics.redraw(); }
function sig() { sigBuf = arrayfromargs(arguments); mgraphics.redraw(); }

function paint() {
    var P = clamp(Math.round(W * 0.05), 8, 16);
    regions = [];
    var cx = P, cy = 28, cw = W - P * 2, ch = H - cy - 58;

    rect(0, 0, W, H, C.surface);
    rect(cx, cy, cw, ch, C.base);        // scope well (scope drawn in-face)

    // header: index + name + mode selector
    text(P, 16, "05", C.faint, 9, false);
    text(P + 20, 16, trk("fold"), C.dim, 9, false);
    var mx = W - P;
    for (var i = MODES.length - 1; i >= 0; i--) {
        var lab = trk(MODES[i]), wseg = meas(lab, 8);
        text(mx, 16, lab, i === mode ? C.accent : C.faint, 8, true);
        regions.push({ n: "mode", i: i, x: mx - wseg - 4, y: 4, w: wseg + 8, h: 16 });
        mx -= wseg + 14;
    }

    // faint unity diagonal (identity)
    line(cx, cy + ch, cx + cw, cy, alpha(C.dim, 0.22), 1);

    // live folded output as a cobalt input-signal ghost, drawn in-face so it resizes
    var n = sigBuf.length;
    if (n > 1) {
        setc(alpha(C.accent2, 0.35)); mgraphics.set_line_width(1.0);
        for (var k2 = 0; k2 < n; k2++) {
            var wx = cx + k2 / (n - 1) * cw, wy = cy + (1 - (clamp(sigBuf[k2], -1, 1) + 1) / 2) * ch;
            if (k2 === 0) mgraphics.move_to(wx, wy); else mgraphics.line_to(wx, wy);
        }
        mgraphics.stroke();
    }

    // bold folded transfer curve
    setc(C.accent); mgraphics.set_line_width(1.6);
    var N = 220, k;
    for (k = 0; k <= N; k++) {
        var x = -1 + 2 * k / N, y = shape(x);
        var X = cx + (x + 1) / 2 * cw, Y = cy + (1 - (y + 1) / 2) * ch;
        if (k === 0) mgraphics.move_to(X, Y); else mgraphics.line_to(X, Y);
    }
    mgraphics.stroke();

    frame(cx, cy, cw, ch, C.hair, 1);
    regions.push({ n: "drive", x: cx, y: cy, w: cw, h: ch });

    // drive readout: label + hero mono numeric + progress bar
    text(P, H - 26, trk("drive"), C.faint, 8, false);
    text(W - P, H - 20, drive.toFixed(2), C.text, 12, true, true);
    var brw = W - P * 2;
    rect(P, H - 14, brw, 4, C.surf2);
    rect(P, H - 14, brw * (drive - DMIN) / (DMAX - DMIN), 4, C.accent);
    regions.push({ n: "drive", x: P, y: H - 20, w: brw, h: 16 });
}

function setDrive(x, r) {
    drive = DMIN + clamp((x - r.x) / r.w, 0, 1) * (DMAX - DMIN);
    outlet(0, "drive", drive);
    mgraphics.redraw();
}
function setMode(m) { mode = m; outlet(0, "mode", MODES[mode]); mgraphics.redraw(); }

function onclick(x, y) {
    for (var i = regions.length - 1; i >= 0; i--) {
        var r = regions[i];
        if (x >= r.x && x <= r.x + r.w && y >= r.y && y <= r.y + r.h) {
            if (r.n === "mode") { setMode(r.i); return; }
            if (r.n === "drive") { drag = i; setDrive(x, r); return; }
        }
    }
}
function ondrag(x, y, but) {
    if (but === 0) { drag = -1; return; }
    if (drag >= 0 && regions[drag] && regions[drag].n === "drive") setDrive(x, regions[drag]);
}
onclick.local = 1;
ondrag.local = 1;

function emit() { outlet(0, "drive", drive); outlet(0, "mode", MODES[mode]); }
function loadbang() { emit(); }
function bang() { emit(); }

function save() { embedmessage("setstate", drive, mode); }
function setstate(d, m) {
    drive = clamp(d, DMIN, DMAX);
    mode = clamp(Math.round(m), 0, 2);
    emit();
}

// ---------------------------------------------------------------- pattr bank I/O
// [pattr drive] / [pattr mode] in fold.maxpat sit between this face and the
// engine, so a host pattrstorage sees them as <instance>::drive / ::mode. On
// recall the pattrs stream back in here to mutate state + redraw ONLY — never
// re-emit, which would loop straight back into the pattr they arrived from.
// mode travels as a symbol so pattrstorage snaps it rather than interpolating.
function sdrive(v) { drive = clamp(v, DMIN, DMAX); mgraphics.redraw(); }
function smode(m) {
    var i = (typeof m === "string") ? MODES.indexOf(m) : Math.round(m);
    if (i < 0) return;
    mode = clamp(i, 0, MODES.length - 1);
    mgraphics.redraw();
}
