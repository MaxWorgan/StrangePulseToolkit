// sptAudioReactiveFit.js — resize the main v8ui to fill the bpatcher and place the
// native envelope editor + LENGTH slider in the jsui's reserved right-hand panel.
//
// NOTE: Max's JS rect/presentation_rect take [left, top, right, bottom] — NOT
// [x, y, w, h]. Passing width/height in the right/bottom slots (as the old code
// did) makes an inverted rect that Max clamps to ~10x10 — which is why the
// envelope came back squashed on every reopen.
autowatch = 1;
var P = this.patcher, ui = null, env = null, len = null, lastW = -1, lastH = -1, task = new Task(fit);

function loadbang() { begin(); }
function bang() { begin(); }
function begin() { fit(); task.interval = 250; task.repeat(); }
function stop() { task.cancel(); }
function clamp(v, a, b) { return v < a ? a : (v > b ? b : v); }

// place an object at (l,t) sized (w,h). Max's JS uses DIFFERENT formats:
//   rect              = [left, top, right, bottom]
//   presentation_rect = [x, y, width, height]
// Writing right/bottom to presentation_rect makes it oversized (runs off the edge).
function place(o, l, t, w, h) {
    if (!o) return;
    o.rect = [l, t, l + w, t + h];
    try { o.presentation_rect = [l, t, w, h]; } catch (e) {}
}

function fit() {
    if (!P || !P.box) return;
    var r = P.box.rect, w = Math.max(1, Math.round(r[2] - r[0])), h = Math.max(1, Math.round(r[3] - r[1]));
    if (w === lastW && h === lastH) return;
    lastW = w; lastH = h;
    if (!ui) ui = P.getnamed("ui");
    if (!env) env = P.getnamed("EnvelopeEditor");
    if (!len) len = P.getnamed("envlen");

    place(ui, 0, 0, w, h);

    // mirror sptAudioReactive.js drawControls: envelope panel = right 39% of the control grid
    var pad = clamp(Math.round(w * 0.02), 6, 12),
        scopeH = Math.max(54, Math.min(92, h * 0.28)),
        controlsY = 24 + scopeH + 7 + 35,
        controlsH = h - controlsY - pad,
        contentW = w - pad * 2,
        left = contentW * 0.61, gap = 8,
        envX = pad + left + gap, envW = contentW - left - gap,
        envY = controlsY + 16, envH = Math.max(20, controlsH - 16),
        slotH = 14, m = 10;   // slider height + margin (gap above it and below the panel foot)

    place(env, envX, envY, envW, Math.max(20, envH - slotH - m * 2));   // function editor (top)
    place(len, envX, envY + envH - slotH - m, envW, slotH);            // LENGTH slider (margin all round)
}
