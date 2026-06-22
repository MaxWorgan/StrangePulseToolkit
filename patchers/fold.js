// fold.js — v8ui face for the [fold] wavefolder.
// One combined view: a live.scope~ (layered behind this object in the host
// patch) shows the folded signal, and this v8ui draws the fold/wrap/clip
// transfer curve on top. The plot interior is left unpainted (transparent) so
// the scope behind shows through. Drag the plot horizontally to set drive,
// click a mode word to switch shaping. Outlet: "drive <f>" / "mode <sym>".

autowatch = 1;
inlets = 1;
outlets = 1;

var C = {
    base:   [0.055, 0.055, 0.059, 1], surface: [0.086, 0.086, 0.094, 1],
    surf2:  [0.126, 0.126, 0.141, 1], hair:    [0.173, 0.173, 0.192, 1],
    text:   [0.926, 0.926, 0.926, 1], dim:     [0.541, 0.541, 0.561, 1],
    faint:  [0.361, 0.361, 0.380, 1], accent:  [0.722, 1, 0.361, 1]
};
var FONT = "Helvetica Neue";
var W = 236, H = 200;
var MODES = ["fold", "wrap", "clip"];
var DMIN = 1, DMAX = 10;

var drive = 4.2, mode = 0;
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
function font(s) { mgraphics.select_font_face(FONT); mgraphics.set_font_size(s); }
function meas(s, z) { font(z); var m = mgraphics.text_measure("" + s); return m && m.length ? m[0] : 0; }
function text(x, y, s, c, z, right) { setc(c); font(z); if (right) x -= meas(s, z); mgraphics.move_to(x, y); mgraphics.show_text("" + s); }
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

function paint() {
    var P = clamp(Math.round(W * 0.05), 8, 16);
    regions = [];
    var cx = P, cy = 28, cw = W - P * 2, ch = H - cy - 58;

    // Fill everything EXCEPT the plot interior, so the live.scope~ layered
    // behind this object shows through the (unpainted, transparent) plot.
    rect(0, 0, W, cy, C.base);
    rect(0, cy + ch, W, H - (cy + ch), C.base);
    rect(0, cy, cx, ch, C.base);
    rect(cx + cw, cy, W - (cx + cw), ch, C.base);

    // header + mode selector
    text(P, 16, trk("fold"), C.dim, 9, false);
    var mx = W - P;
    for (var i = MODES.length - 1; i >= 0; i--) {
        var lab = trk(MODES[i]), wseg = meas(lab, 8);
        text(mx, 16, lab, i === mode ? C.accent : C.faint, 8, true);
        regions.push({ n: "mode", i: i, x: mx - wseg - 4, y: 4, w: wseg + 8, h: 16 });
        mx -= wseg + 14;
    }

    // transfer curve over the live scope
    line(cx, cy + ch, cx + cw, cy, alpha(C.dim, 0.22), 1);   // unity diagonal
    setc(alpha(C.accent, 0.35)); mgraphics.set_line_width(1.0);
    var N = 220, k;
    for (k = 0; k <= N; k++) {
        var x = -1 + 2 * k / N, y = shape(x);
        var X = cx + (x + 1) / 2 * cw, Y = cy + (1 - (y + 1) / 2) * ch;
        if (k === 0) mgraphics.move_to(X, Y); else mgraphics.line_to(X, Y);
    }
    mgraphics.stroke();
    frame(cx, cy, cw, ch, C.hair, 1);
    regions.push({ n: "drive", x: cx, y: cy, w: cw, h: ch });

    // drive readout + bar
    text(P, H - 28, trk("drive"), C.dim, 8, false);
    text(W - P, H - 24, drive.toFixed(2), C.text, 17, true);
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
