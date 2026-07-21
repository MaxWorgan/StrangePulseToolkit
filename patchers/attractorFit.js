// attractorFit.js — make an embedded display fill its bpatcher, so the patch
// works at any size (no separate hand-sized copy). Reads this bpatcher's own box
// size in the parent and resizes a named child object to fill it, re-fitting when
// the bpatcher is dragged.
//
//   [v8 attractorFit.js]             -> fits the object named "screen" (default)
//   [v8 attractorFit.js ui]          -> fits the object named "ui"
//   [v8 attractorFit.js screen grid] -> fits several stacked objects (all to fill)
//
// Works for jit.pwindow (also sets its render size) and v8ui (whose onresize
// then re-lays-out). One file now covers any size.

autowatch = 1;

var P = this.patcher; // patcher inside this bpatcher
var TARGET_NAMES =
  jsarguments.length > 1
    ? [].slice.call(jsarguments, 1).map(function (s) {
        return "" + s;
      })
    : ["screen"];
var TARGETS = null;
var lastW = -1,
  lastH = -1;
var fitTask = new Task(fit);

function loadbang() {
  begin();
} // js/v8 calls this automatically on patch load
function bang() {
  begin();
} // also arm/refit from a patched loadbang or manual bang
function begin() {
  fit();
  fitTask.interval = 250; // poll for bpatcher resize (negligible cost)
  fitTask.repeat();
}
function stop() {
  fitTask.cancel();
}

function fit() {
  if (!P) return;
  var box = P.box; // this bpatcher's box in the parent patcher
  if (!box) return;
  var r = box.rect; // [left, top, right, bottom]
  var w = Math.max(1, Math.round(r[2] - r[0]));
  var h = Math.max(1, Math.round(r[3] - r[1]));
  if (w === lastW && h === lastH) return;
  lastW = w;
  lastH = h;
  if (!TARGETS) {
    TARGETS = [];
    for (var i = 0; i < TARGET_NAMES.length; i++) {
      var t = P.getnamed(TARGET_NAMES[i]);
      if (t) TARGETS.push(t);
    }
  }
  for (var j = 0; j < TARGETS.length; j++) {
    var T = TARGETS[j];
    if (T.maxclass === "jit.pwindow") T.message("size", w, h); // render/display resolution
    T.rect = [0, 0, w, h]; // patching rect
    try {
      T.presentation_rect = [0, 0, w, h];
    } catch (e) {} // shown in the bpatcher
  }
}
