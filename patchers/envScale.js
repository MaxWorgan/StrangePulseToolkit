// envScale.js — rescale a [function]'s curve~ output so the envelope plays over
// a target total length (ms) WITHOUT touching the function's drawn shape, domain
// or UI. Sits between [function] outlet 1 and [curve~].
//
//   inlet 0 (list)        the envelope segment list from [function] -> rescaled
//                         so its segment times sum to the target length, then
//                         passed straight to [curve~].
//   inlet 1 (int/float)   the target total length in ms.
//   debug 1               post the next incoming list to the Max console.
//
// The function->curve~ list is groups of (target, time, curve). Some builds
// prepend a lone start value, so we detect the layout before scaling.

autowatch = 1;
inlets = 2;
outlets = 1;

var targetLen = 400;   // ms
var dbg = 0;

// Length only ever comes in the right inlet; ignore stray numbers the function
// may emit on the left inlet so they can never zero out the duration.
function msg_int(v)   { if (inlet === 1) targetLen = v; }
function msg_float(v) { if (inlet === 1) targetLen = v; }
function debug(v)     { dbg = v; }

function list() {
    var a = arrayfromargs(arguments);
    if (dbg) { post("envScale in:", a.join(" "), "\n"); }

    // Triplet stride of 3 (target, time, curve). A clean triplet list has
    // length % 3 === 0; otherwise there is a leading lone start value.
    var start = (a.length % 3 === 0) ? 0 : 1;

    var sum = 0, i;
    for (i = start + 1; i < a.length; i += 3) sum += a[i];

    // Only rescale when we have a sane positive target and a real duration;
    // otherwise pass the envelope through at its natural timing.
    if (targetLen > 0 && sum > 0) {
        var f = targetLen / sum;
        for (i = start + 1; i < a.length; i += 3) a[i] *= f;
    }
    outlet(0, a);
}
