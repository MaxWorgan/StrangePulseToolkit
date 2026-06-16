// attractorFit.js — make AttractorDisplay resizable.
// Reads this bpatcher's own box size in the parent and resizes the embedded
// jit.pwindow (varname "screen") to fill it, re-fitting when the bpatcher is
// dragged. One file now works at any size — no separate "Small" copy needed.
//
// jit.gl.render draws into the named pwindow context, so the 3D view adapts to
// the new size automatically; we just keep the pwindow filling the bpatcher.

autowatch = 1;

var P = this.patcher;          // the patcher loaded inside this bpatcher
var SCREEN = null;             // the jit.pwindow Maxobj (resolved lazily)
var lastW = -1, lastH = -1;
var fitTask = new Task(fit);

function loadbang() { begin(); }   // js/v8 calls this automatically on patch load
function bang() { begin(); }       // also arm/refit from a patched loadbang or manual bang
function begin() {
    fit();
    fitTask.interval = 250;        // poll for bpatcher resize (negligible cost)
    fitTask.repeat();
}
function stop() { fitTask.cancel(); }

function fit() {
    if (!P) return;
    var box = P.box;               // this bpatcher's box in the parent patcher
    if (!box) return;
    var r = box.rect;              // [left, top, right, bottom]
    var w = Math.max(1, Math.round(r[2] - r[0]));
    var h = Math.max(1, Math.round(r[3] - r[1]));
    if (w === lastW && h === lastH) return;
    lastW = w; lastH = h;
    if (!SCREEN) SCREEN = P.getnamed("screen");
    if (!SCREEN) return;
    SCREEN.message("size", w, h);                    // render/display resolution
    SCREEN.rect = [0, 0, w, h];                      // patching rect
    try { SCREEN.presentation_rect = [0, 0, w, h]; } catch (e) {}   // shown in the bpatcher (presentation)
}
