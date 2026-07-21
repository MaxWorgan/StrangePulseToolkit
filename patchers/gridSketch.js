// gridSketch.js — a faint cobalt "blueprint" grid overlaid on the AttractorDisplay.
// A 2D object can't composite over a native jit.pwindow, and modern jit.gl.sketch
// dropped the immediate-mode GL matrix calls, so instead we BUILD the grid as an
// ARGB matrix at the current display size and hand it to a screen-filling
// [jit.gl.videoplane @transform_reset 2 @blend_enable 1] named "gridplane". The
// videoplane fills the viewport (Max handles the aspect) and stays flat while
// jit.gl.handle rotates the attractor behind it.
//
// Line count follows a target cell size, so the grid keeps a consistent density
// as the view is stretched (more lines when wider/taller, ~square cells).
//
//   bang               driven off the render qmetro; rebuilds when size settles
//   "spacing <px>"     target cell size (default 44)
//   "alpha <0..1>"     grid strength (default 0.16)

autowatch = 1;

var PLANE = null, MAT = null;
var SPACING = 44;                       // target px per cell (line count adapts)
var A = 0.09;                           // grid strength (faint)
var CENTER_A = 0.22;                    // horizontal centre line — a touch stronger
var COBALT = [78, 123, 232];           // accent2 #4E7BE8 as 8-bit RGB
var lastW = -1, lastH = -1, need = true, settle = 0;

function loadbang() { need = true; }
function bang() {
    var d = dispSize();
    if (!d) return;
    if (d[0] !== lastW || d[1] !== lastH) { lastW = d[0]; lastH = d[1]; need = true; settle = 0; return; }
    if (need) { if (++settle >= 4 && build()) { need = false; } }   // rebuild once size holds ~4 frames
}
function spacing(px) { SPACING = Math.max(6, px); need = true; settle = 4; }
function alpha(a) { A = a < 0 ? 0 : (a > 1 ? 1 : a); need = true; settle = 4; }
function center(a) { CENTER_A = a < 0 ? 0 : (a > 1 ? 1 : a); need = true; settle = 4; }

function getPlane() {
    if (!PLANE) { try { PLANE = this.patcher.getnamed("gridplane"); } catch (e) {} }
    return PLANE;
}
function dispSize() {
    try {
        var scr = this.patcher.getnamed("screen");
        if (scr) { var r = scr.rect; return [Math.round(r[2] - r[0]), Math.round(r[3] - r[1])]; }
    } catch (e) {}
    return null;
}

function build() {
    var p = getPlane(), d = dispSize();
    if (!p || !d) return false;
    var w = d[0], h = d[1];
    if (w < 2 || h < 2) return false;

    if (!MAT) MAT = new JitterMatrix(4, "char", w, h);
    else MAT.dim = [w, h];
    MAT.setall(0, 0, 0, 0);                             // transparent (plane0 = alpha)

    var a8 = Math.round(A * 255), ac = Math.round(CENTER_A * 255);
    var r = COBALT[0], g = COBALT[1], b = COBALT[2];
    var nx = Math.max(1, Math.round(w / SPACING));
    // even row count so a grid line lands exactly on the centre (i === mid)
    var ny = 2 * Math.max(1, Math.round(h / (SPACING * 2))), mid = ny / 2;
    var i, x, y, av;
    for (i = 1; i < nx; i++) {                          // vertical lines
        x = Math.min(w - 1, Math.round(w * i / nx));
        for (y = 0; y < h; y++) MAT.setcell2d(x, y, a8, r, g, b);
    }
    for (i = 1; i < ny; i++) {                          // horizontal lines; centre one stronger
        y = Math.min(h - 1, Math.round(h * i / ny));
        av = (i === mid) ? ac : a8;
        for (x = 0; x < w; x++) MAT.setcell2d(x, y, av, r, g, b);
    }
    p.message("jit_matrix", MAT.name);                 // texture the videoplane
    return true;
}
