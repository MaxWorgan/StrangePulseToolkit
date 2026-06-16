// SamplePlayPoly.js — v8ui face for the SPT polyphonic sample player.
// Dark-editorial. Draws the buffer waveform, a draggable start point + loop
// region, animated playheads for the 8 voices, and gain/pan controls.
//
// Inlet messages (from the host patch):
//   setbuffer <name>   the buffer~ name to read (e.g. #0-samp, resolved by Max)
//   loaded             buffer contents changed -> re-read + redraw the waveform
//   voice <i>          voice i (0..N-1) just triggered -> launch a playhead
//   bang               a voice triggered (unknown index) -> playhead on next voice
//   gain <f> / pan <f> / start <f> / loopon <0|1>   restore values (from pattr)
//
// Outlet 0 messages (to the host patch):
//   gain <0..1>   pan <-1..1>   start <0..1>   loop <s> <e>   loopon <0|1>
//
// (Looping/start are honoured by the groove~-based voice in polySampPlay.)

autowatch = 1;
inlets = 1;
outlets = 1;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

// ---------------------------------------------------------------- tokens
var COL = {
    base:    [0.0549, 0.0549, 0.0588, 1.0],
    surface: [0.0863, 0.0863, 0.0941, 1.0],
    surf2:   [0.1255, 0.1255, 0.1412, 1.0],
    hair:    [0.1725, 0.1725, 0.1922, 1.0],
    text:    [0.9255, 0.9255, 0.9255, 1.0],
    dim:     [0.5412, 0.5412, 0.5608, 1.0],
    faint:   [0.3608, 0.3608, 0.3804, 1.0],
    accent:  [0.7216, 1.0, 0.3608, 1.0],
    accentD: [0.7216, 1.0, 0.3608, 0.30],
    afill:   [0.7216, 1.0, 0.3608, 0.14],
    warn:    [0.878, 0.639, 0.227, 1.0]
};
var FONT = "Helvetica Neue";
var NVOICES = 8;

// ---------------------------------------------------------------- state
var bufName = "";
var env = [];           // cached min/max envelope: [ [min,max], ... ] one per column
var frames = 0, durMs = 0, fileName = "";
var gGain = 0.8, gPan = 0.0, startPt = 0.0, endPt = 1.0, loopOn = 0;   // start/end region always active; loop just toggles looping
var voices = [];        // active playheads: { start, dur, t0, vi }
var nextVoice = 0;

var W = 320, H = 196, PAD = 16;
var WF_X = PAD, WF_W = W - 2 * PAD, WF_Y = 46, WF_H = 84;   // waveform rect
var CTRL_Y = WF_Y + WF_H + 14;

// ---------------------------------------------------------------- draw helpers
function setc(c) { mgraphics.set_source_rgba(c[0], c[1], c[2], c[3]); }
function rect(x, y, w, h, c) { setc(c); mgraphics.rectangle(x, y, w, h); mgraphics.fill(); }
function rectb(x, y, w, h, c) { setc(c); mgraphics.set_line_width(1); mgraphics.rectangle(x, y, w, h); mgraphics.stroke(); }
function line(x1, y1, x2, y2, c, lw) { setc(c); mgraphics.set_line_width(lw || 1); mgraphics.move_to(x1, y1); mgraphics.line_to(x2, y2); mgraphics.stroke(); }
function disc(cx, cy, r, c) { setc(c); mgraphics.ellipse(cx - r, cy - r, r * 2, r * 2); mgraphics.fill(); }
function setfont(s) { mgraphics.select_font_face(FONT); mgraphics.set_font_size(s); }
function meas(s, sz) { setfont(sz); var m = mgraphics.text_measure("" + s); return (m && m.length) ? m[0] : ("" + s).length * sz * 0.55; }
function txt(x, y, s, c, sz, just) {
    setc(c); setfont(sz);
    var w = (just === 1 || just === 2) ? meas(s, sz) : 0;
    mgraphics.move_to(just === 2 ? x - w : (just === 1 ? x - w / 2 : x), y);
    mgraphics.show_text("" + s);
}
function trk(s) { return ("" + s).toUpperCase().split("").join(" "); }
function clamp(v, lo, hi) { return v < lo ? lo : (v > hi ? hi : v); }
function lerp(a, b, t) { return [a[0] + (b[0] - a[0]) * t, a[1] + (b[1] - a[1]) * t, a[2] + (b[2] - a[2]) * t, a[3] + (b[3] - a[3]) * t]; }
function nowMs() { return (new Date()).getTime(); }

// ---------------------------------------------------------------- buffer read
function readBuffer() {
    env = []; frames = 0;
    if (!bufName) return;
    var b;
    try { b = new Buffer(bufName); } catch (e) { return; }
    frames = b.framecount();
    if (!frames || frames < 1) { frames = 0; return; }
    durMs = b.length ? b.length() : (frames / 44100 * 1000);   // Buffer.length() = ms
    // 2x oversample columns then we plot a filled contour -> smooth, not jagged.
    var cols = WF_W * 2;
    for (var c = 0; c < cols; c++) {
        var s0 = Math.floor(c / cols * frames), s1 = Math.floor((c + 1) / cols * frames);
        var span = s1 - s0;
        var stride = Math.max(1, Math.floor(span / 256));   // dense read -> true peaks per column
        var mn = 1, mx = -1;
        for (var s = s0; s < s1; s += stride) {
            var v = b.peek(0, s);
            if (v < mn) mn = v; if (v > mx) mx = v;
        }
        if (mn > mx) { mn = 0; mx = 0; }
        env.push([mn, mx]);
    }
    mgraphics.redraw();
    emitAll();          // push ms-correct loop/start to the voices now the duration is known
}

// ---------------------------------------------------------------- messages in
function setbuffer(name) { bufName = "" + name; readBuffer(); }
function loaded() { readBuffer(); }
function filename(n) { fileName = "" + n; mgraphics.redraw(); }
function voice(vi) { launch(vi); }
function bang() { launch(nextVoice); nextVoice = (nextVoice + 1) % NVOICES; }
function msg_float() { launch(nextVoice); nextVoice = (nextVoice + 1) % NVOICES; }
function gain(v) { gGain = clamp(v, 0, 1); mgraphics.redraw(); }
function pan(v) { gPan = clamp(v, -1, 1); mgraphics.redraw(); }
function start(v) { startPt = clamp(v, 0, 1); mgraphics.redraw(); }
function loopon(v) { loopOn = v ? 1 : 0; mgraphics.redraw(); }

var stopTasks = [];                                  // per-voice scheduled "run 0"
function cancelStop(idx) { if (stopTasks[idx]) { stopTasks[idx].cancel(); stopTasks[idx] = null; } }
function scheduleStop(idx, dur) {
    cancelStop(idx);
    var t = new Task(function () { outlet(0, "run", idx, 0); stopTasks[idx] = null; });
    stopTasks[idx] = t;
    t.schedule(dur);
}

function launch(vi) {
    var idx = vi % NVOICES;
    var s = startPt, e = endPt;
    var dur = durMs * (e - s);
    if (dur <= 0) dur = durMs;
    voices.push({ s: s, e: e, dur: dur, t0: nowMs(), vi: idx, loop: loopOn });
    if (voices.length > 24) voices.shift();
    cancelStop(idx);
    outlet(0, "run", idx, 1);                         // arm + 5ms fade-in (declick)
    if (!loopOn && dur > 0) scheduleStop(idx, dur);   // one-shot: fade out at the end marker
    pump();
}

// ---------------------------------------------------------------- animation pump
var pumpTask = null, pumping = false;
function active() {
    var t = nowMs();
    for (var i = 0; i < voices.length; i++) {
        var v = voices[i];
        if (v.loop || t - v.t0 < v.dur) return true;
    }
    return false;
}
function animTick() {
    var t = nowMs();
    for (var i = voices.length - 1; i >= 0; i--) {
        var v = voices[i];
        if (!v.loop && t - v.t0 > v.dur + 60) voices.splice(i, 1);
    }
    mgraphics.redraw();
    if (!active()) { pumping = false; if (pumpTask) pumpTask.cancel(); }
}
function pump() {
    if (pumping) return;
    pumping = true;
    if (!pumpTask) pumpTask = new Task(animTick);
    pumpTask.interval = 33; pumpTask.repeat();
}

// ---------------------------------------------------------------- paint
var regions = [];
function region(field, x, y, w, h) { regions.push({ field: field, x: x, y: y, w: w, h: h }); }
function hit(px, py) { for (var i = regions.length - 1; i >= 0; i--) { var r = regions[i]; if (px >= r.x && px <= r.x + r.w && py >= r.y && py <= r.y + r.h) return r; } return null; }

function paint() {
    regions = [];
    rect(0, 0, W, H, COL.base);
    // header
    txt(PAD, 24, trk("SAMPLE"), COL.dim, 9);
    drawLoader();
    line(PAD, 32, W - PAD, 32, COL.hair, 1);

    drawWaveform();
    drawControls();
}

// Loader chip in the header: [ drop zone | OPEN ].
// The left cell is covered by the host's dropfile object (drag-drop a sample);
// the right cell is a v8ui click region that asks the host to open a file dialog.
var LD_X = 146, LD_Y = 6, LD_W = 160, LD_H = 20, LD_DIV = 258;   // dropfile cell = LD_X..LD_DIV
function drawLoader() {
    rect(LD_X, LD_Y, LD_W, LD_H, COL.surface);
    rect(LD_DIV, LD_Y, LD_X + LD_W - LD_DIV, LD_H, COL.surf2);     // open button cell
    rectb(LD_X + 0.5, LD_Y + 0.5, LD_W - 1, LD_H - 1, COL.hair);
    line(LD_DIV, LD_Y, LD_DIV, LD_Y + LD_H, COL.hair, 1);
    var by = LD_Y + 14;
    txt((LD_X + LD_DIV) / 2, by, fileName ? fileName : trk("drop"), fileName ? COL.text : COL.faint, 8, 1);
    txt((LD_DIV + LD_X + LD_W) / 2, by, trk("open"), COL.accent, 8, 1);
    region("open", LD_DIV, LD_Y, LD_X + LD_W - LD_DIV, LD_H);
}

function px(frac) { return WF_X + WF_W * clamp(frac, 0, 1); }

// Filled waveform contour over column range [c0,c1): trace the max envelope
// left->right, then the min envelope back, and fill. Smooth, no per-pixel gaps.
function fillEnv(c0, c1, n, mid, h2, g, c) {
    if (c1 <= c0) return;
    var dx = WF_W / n;
    setc(c);
    mgraphics.move_to(WF_X + c0 * dx, mid - env[c0][1] * h2 * g);
    for (var i = c0 + 1; i < c1; i++) mgraphics.line_to(WF_X + i * dx, mid - env[i][1] * h2 * g);
    for (var j = c1 - 1; j >= c0; j--) mgraphics.line_to(WF_X + j * dx, mid - env[j][0] * h2 * g);
    mgraphics.close_path();
    mgraphics.fill();
}

function drawWaveform() {
    rect(WF_X, WF_Y, WF_W, WF_H, COL.surface);
    rectb(WF_X + 0.5, WF_Y + 0.5, WF_W - 1, WF_H - 1, COL.hair);
    var mid = WF_Y + WF_H / 2;
    line(WF_X, mid, WF_X + WF_W, mid, COL.hair, 1);

    if (!frames || !env.length) {
        region("wave", WF_X, WF_Y, WF_W, WF_H);
        return;
    }
    // active start..end region brighter; rest dimmed (independent of loop mode)
    var as = startPt, ae = endPt;
    rect(px(as), WF_Y + 1, px(ae) - px(as), WF_H - 2, COL.afill);

    // waveform envelope — gain scales the drawn height
    var n = env.length, h2 = (WF_H - 6) / 2, g = clamp(gGain, 0, 1);
    fillEnv(0, n, n, mid, h2, g, COL.faint);                                  // full, dimmed
    fillEnv(Math.round(as * n), Math.round(ae * n), n, mid, h2, g, COL.accent); // active, bright

    // start + end handles (both always present; loop just toggles looping)
    handle(startPt, COL.accent);
    handle(endPt, COL.accent);

    // playheads
    var t = nowMs();
    for (var i = 0; i < voices.length; i++) {
        var v = voices[i], prog = v.loop ? ((t - v.t0) % Math.max(1, v.dur)) / Math.max(1, v.dur) : (t - v.t0) / Math.max(1, v.dur);
        if (prog > 1) continue;
        var hx = px(v.s + (v.e - v.s) * prog);
        line(hx, WF_Y + 1, hx, WF_Y + WF_H - 1, COL.accent, 1);
        disc(hx, WF_Y + 3, 2, COL.accent);
    }
    region("wave", WF_X, WF_Y, WF_W, WF_H);
}

function handle(frac, c) {
    var x = px(frac);
    line(x, WF_Y, x, WF_Y + WF_H, c, 1.5);
    setc(c); mgraphics.move_to(x - 4, WF_Y); mgraphics.line_to(x + 4, WF_Y); mgraphics.line_to(x, WF_Y + 6); mgraphics.close_path(); mgraphics.fill();
}

function drawControls() {
    var y = CTRL_Y;
    // gain fader
    txt(PAD, y + 2, trk("gain"), COL.faint, 8);
    rect(PAD + 38, y - 4, 120, 8, COL.surf2);
    rect(PAD + 38, y - 4, 120 * gGain, 8, COL.accent);
    region("gain", PAD + 38, y - 10, 120, 18);
    // voice activity dots (right)
    var t = nowMs();
    for (var vch = 0; vch < NVOICES; vch++) {
        var lit = 0;
        for (var i = 0; i < voices.length; i++) if (voices[i].vi === vch) { var age = t - voices[i].t0; if (voices[i].loop || age < voices[i].dur) lit = Math.max(lit, voices[i].loop ? 0.7 : clamp(1 - age / voices[i].dur, 0, 1)); }
        disc(W - PAD - 6 - vch * 11, y - 1, 2.5, lerp(COL.surf2, COL.accent, lit));
    }
    // pan
    var y2 = y + 22;
    txt(PAD, y2 + 2, trk("pan"), COL.faint, 8);
    var pcx = PAD + 38, pcw = 120, pmid = pcx + pcw / 2;
    rect(pcx, y2 - 4, pcw, 8, COL.surf2);
    line(pmid, y2 - 6, pmid, y2 + 4, COL.hair, 1);
    var phx = pmid + (pcw / 2) * gPan;
    rect(Math.min(pmid, phx), y2 - 4, Math.abs(phx - pmid), 8, COL.afill);
    disc(phx, y2, 4, COL.accent);
    region("pan", pcx, y2 - 10, pcw, 18);
    // loop toggle
    var lx = W - PAD - 54;
    rect(lx, y2 - 7, 54, 16, loopOn ? COL.afill : COL.surf2);
    rectb(lx + 0.5, y2 - 6.5, 53, 15, loopOn ? COL.accent : COL.hair);
    txt(lx + 27, y2 + 4, "loop", loopOn ? COL.accent : COL.dim, 9, 1);
    region("loop", lx, y2 - 7, 54, 16);
}

// ---------------------------------------------------------------- interaction
var drag = null;
function onclick(x, y, but, cmd, shift) {
    var h = hit(x, y);
    if (!h) return;
    if (h.field === "open") { outlet(0, "open"); return; }   // ask host to open a file dialog
    if (h.field === "loop") { loopOn = loopOn ? 0 : 1; out("loopon", loopOn); emitStart(); mgraphics.redraw(); return; }
    if (h.field === "wave") {
        // pick nearest handle to drag — start or end
        var frac = clamp((x - WF_X) / WF_W, 0, 1);
        drag = { field: Math.abs(frac - startPt) <= Math.abs(frac - endPt) ? "start" : "end" };
    } else drag = { field: h.field };
    applyDrag(x, y);
}
onclick.local = 1;
function ondrag(x, y, but) { if (!drag) return; if (but === 0) { drag = null; return; } applyDrag(x, y); }
ondrag.local = 1;

function applyDrag(x, y) {
    var fracX = clamp((x - WF_X) / WF_W, 0, 1);
    switch (drag.field) {
        case "gain":  gGain = clamp((x - (PAD + 38)) / 120, 0, 1); out("gain", gGain); break;
        case "pan":   gPan = clamp((x - (PAD + 38)) / 120 * 2 - 1, -1, 1); out("pan", gPan); break;
        case "start": startPt = Math.min(fracX, endPt - 0.01); emitLoop(); emitStart(); break;
        case "end":   endPt = Math.max(fracX, startPt + 0.01); emitLoop(); break;
    }
    mgraphics.redraw();
}
function out(sel, v) { outlet(0, sel, v); }
function emitStart() { outlet(0, "start", Math.round(startPt * durMs)); }                       // start position in ms
function emitLoop() { outlet(0, "loop", Math.round(startPt * durMs), Math.round(endPt * durMs)); } // region in ms
function emitAll() { out("gain", gGain); out("pan", gPan); out("loopon", loopOn); emitLoop(); emitStart(); }

// ---------------------------------------------------------------- persistence
function exportState() { return { gain: gGain, pan: gPan, startPt: startPt, endPt: endPt, loopOn: loopOn }; }
function setstate(s) {
    try {
        var o = JSON.parse(s);
        gGain = o.gain; gPan = o.pan; loopOn = o.loopOn;
        startPt = (o.startPt != null) ? o.startPt : (o.loopS != null ? o.loopS : 0.0);   // back-compat w/ old loopS/loopE
        endPt = (o.endPt != null) ? o.endPt : (o.loopE != null ? o.loopE : 1.0);
        mgraphics.redraw();
    } catch (e) {}
}
function save() { embedmessage("setstate", JSON.stringify(exportState())); }
