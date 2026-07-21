// midiOutFit.js — resize coordinator for the ToExternalMidi bpatcher.
// Same idiom as attractorFit.js (a separate [v8 …] object that reads this
// bpatcher's own box size in the parent and resizes named children), but it
// lays out TWO objects: the v8ui face ("ui") on top, and the device umenu
// ("umenu") as a strip along the foot. Re-fits when the bpatcher is dragged.
//
//   [v8 midiOutFit.js]        fits "ui" + "umenu" (default names)
//   [v8 midiOutFit.js a b]    fits face "a" + menu "b"

autowatch = 1;

var P = this.patcher;                                   // patcher inside this bpatcher
var FACE_NAME = (jsarguments.length > 1) ? ("" + jsarguments[1]) : "ui";
var MENU_NAME = (jsarguments.length > 2) ? ("" + jsarguments[2]) : "umenu";
var FACE = null, MENU = null;
var lastW = -1, lastH = -1;
var fitTask = new Task(fit);

function loadbang() { begin(); }   // v8 calls this automatically on patch load
function bang() { begin(); }
function begin() {
    fit();
    fitTask.interval = 200;        // poll for bpatcher resize (negligible cost)
    fitTask.repeat();
}
function stop() { fitTask.cancel(); }

function fit() {
    if (!P) return;
    var box = P.box;               // this bpatcher's box in the parent patcher
    if (!box) return;              // opened standalone -> leave the authored layout
    var r = box.rect;              // [left, top, right, bottom]
    var w = Math.max(120, Math.round(r[2] - r[0]));
    var h = Math.max(70, Math.round(r[3] - r[1]));
    if (w === lastW && h === lastH) return;
    lastW = w; lastH = h;

    var menuH = Math.max(18, Math.min(24, Math.round(h * 0.16)));
    var faceH = Math.max(50, h - menuH);

    if (!FACE) FACE = P.getnamed(FACE_NAME);
    if (!MENU) MENU = P.getnamed(MENU_NAME);

    if (FACE) {                    // face fills the top; its onresize re-lays-out
        FACE.rect = [0, 0, w, faceH];
        try { FACE.presentation_rect = [0, 0, w, faceH]; } catch (e) {}
    }
    if (MENU) {                    // device umenu = strip along the foot
        MENU.rect = [0, faceH, w, h];
        try { MENU.presentation_rect = [0, faceH, w, menuH]; } catch (e2) {}
    }
}
