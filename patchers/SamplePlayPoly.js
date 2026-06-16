// SamplePlayPoly.js — v8ui face for the SPT polyphonic sample player.
// Dark-editorial. Draws the buffer waveform, a draggable start/end region, an
// optional play-once A/D amplitude envelope over the waveform, animated
// playheads for the 8 voices, and gain/pan controls. Voices always play once
// (no looping) — the envelope (or a flat gate) shapes and ends each note.
//
// Inlet messages (from the host patch):
//   setbuffer <name>   the buffer~ name to read (e.g. #0-samp, resolved by Max)
//   loaded             buffer contents changed -> re-read + redraw the waveform
//   voice <i>          voice i (0..N-1) just triggered -> launch a playhead
//   bang               a voice triggered (unknown index) -> playhead on next voice
//   gain <f> / pan <f> / start <f> / envon <0|1>    restore values
//
// Outlet 0 messages (to the host patch):
//   gain <0..1>   pan <-1..1>   start <ms>   loop <s_ms> <e_ms>   loopon 0
//   run <i> <level> <ms>                   per-voice gate ramp (arm / fade-out)
//   venv <i> 0 0 1 <atkMs> 0 <decMs>       per-voice A/D envelope (line~ segments)
//   open                                   ask host to open a file dialog

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
var MAXVOICES = 8;          // mcs.poly~ instances available
var NVOICES = 8;            // active voice count (1..MAXVOICES); 1 = mono retrigger

// ---------------------------------------------------------------- state
var bufName = "";
var env = [];           // cached min/max envelope: [ [min,max], ... ] one per column
var frames = 0, durMs = 0, fileName = "";
var gGain = 0.8, gPan = 0.0;
// The amplitude envelope IS the region: startPt/endPt (absolute 0..1 in the buffer)
// set the scanned portion; envA/envD are the attack-peak and sustain-end positions
// as fractions of that region (so the shape rescales when you move start/end). The
// envelope is ALWAYS applied; envShown only toggles drawing/editing it.
//   startPt --attack(curveA)--> envA(peak 1) --sustain--> envD(1) --decay(curveD)--> endPt(0)
var startPt = 0.0, endPt = 1.0, envA = 0.02, envD = 0.98, curveA = 0.0, curveD = 0.0, envShown = 0;
var voices = [];        // active playheads: { s, e, dur, t0, vi(0-based slot), vel }
var nextVoice = 1;      // 1-based round-robin for bare bang/float triggers

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
function voice(vi, vel) { launch(vi, vel); }
function bang() { launch(nextVoice, 1); nextVoice = nextVoice % NVOICES + 1; }
function msg_float(v) { launch(nextVoice, v); nextVoice = nextVoice % NVOICES + 1; }
function gain(v) { gGain = clamp(v, 0, 1); mgraphics.redraw(); }
function pan(v) { gPan = clamp(v, -1, 1); mgraphics.redraw(); }
function start(v) { startPt = clamp(v, 0, 1); mgraphics.redraw(); }

function launch(vi, vel) {
    var vnum = (vi < 1) ? 1 : Math.round(vi);              // poly~ voice number (1-based) = curve~/groove~ target
    var di = (vnum - 1) % MAXVOICES;                        // 0-based slot for dots/animation
    var pk = (vel === undefined) ? 1 : clamp(vel, 0, 1);   // velocity scales the envelope peak
    var dur = durMs * (endPt - startPt);
    if (dur <= 0) dur = durMs;
    voices.push({ s: startPt, e: endPt, dur: dur, t0: nowMs(), vi: di, vel: pk });
    if (voices.length > 24) voices.shift();
    // curve~ segments (always applied): snap 0, attack->peak (curveA), hold, decay->0 (curveD).
    var atk = Math.max(1, Math.round(envA * dur));
    var sus = Math.max(0, Math.round((envD - envA) * dur));
    var dec = Math.max(1, Math.round((1 - envD) * dur));
    var p = Math.round(pk * 1000) / 1000;
    outlet(0, "venv", vnum, 0, 0, 0, p, atk, curveA, p, sus, 0, 0, dec, curveD);   // target the actual voice
    pump();
}
function setVoices(n) { NVOICES = clamp(Math.round(n), 1, MAXVOICES); out("voices", NVOICES); mgraphics.redraw(); }

// ---------------------------------------------------------------- animation pump
var pumpTask = null, pumping = false;
function active() {
    var t = nowMs();
    for (var i = 0; i < voices.length; i++) if (t - voices[i].t0 < voices[i].dur) return true;
    return false;
}
function animTick() {
    var t = nowMs();
    for (var i = voices.length - 1; i >= 0; i--) {
        if (t - voices[i].t0 > voices[i].dur + 60) voices.splice(i, 1);
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

    // playheads (always play-once now)
    var t = nowMs();
    for (var i = 0; i < voices.length; i++) {
        var v = voices[i], prog = (t - v.t0) / Math.max(1, v.dur);
        if (prog > 1) continue;
        var hx = px(v.s + (v.e - v.s) * prog);
        line(hx, WF_Y + 1, hx, WF_Y + WF_H - 1, COL.accent, 1);
        disc(hx, WF_Y + 3, 2, COL.accent);
    }
    region("wave", WF_X, WF_Y, WF_W, WF_H);
    if (envShown) drawEnvelope();               // env handles registered after "wave" -> take priority
}

function fracFromX(x) { return clamp((x - WF_X) / WF_W, 0, 1); }
// Matches curve~'s ramp shape so the drawing equals what you hear.
// phase t in [0,1] -> progress [0,1]; k is the curve~ curve parameter (-1..1).
function cv(t, k) {
    t = clamp(t, 0, 1);
    if (k > -0.001 && k < 0.001) return t;
    var K = k * 6;
    return (1 - Math.exp(t * K)) / (1 - Math.exp(K));
}
// The envelope spans startPt..endPt: attack startPt->aPos, sustain aPos->dPos, decay dPos->endPt.
function envPosToX(f) { return px(startPt + clamp(f, 0, 1) * (endPt - startPt)); }   // region-fraction -> screen x
function regFrac(x) { var span = endPt - startPt; return span > 0.001 ? clamp((fracFromX(x) - startPt) / span, 0, 1) : 0; }
function drawEnvelope() {
    var xS = px(startPt), xA = envPosToX(envA), xD = envPosToX(envD), xE = px(endPt);
    var yb = WF_Y + WF_H - 3, yt = WF_Y + 3, N = 20, i, tt, amp;
    setc(COL.afill); mgraphics.move_to(xS, yb);
    for (i = 0; i <= N; i++) { tt = i / N; amp = cv(tt, curveA); mgraphics.line_to(xS + (xA - xS) * tt, yb + (yt - yb) * amp); }
    mgraphics.line_to(xD, yt);
    for (i = 0; i <= N; i++) { tt = i / N; amp = 1 - cv(tt, curveD); mgraphics.line_to(xD + (xE - xD) * tt, yb + (yt - yb) * amp); }
    mgraphics.line_to(xE, yb); mgraphics.close_path(); mgraphics.fill();
    setc(COL.accent); mgraphics.set_line_width(1.5); mgraphics.move_to(xS, yb);
    for (i = 1; i <= N; i++) { tt = i / N; amp = cv(tt, curveA); mgraphics.line_to(xS + (xA - xS) * tt, yb + (yt - yb) * amp); }
    mgraphics.line_to(xD, yt);
    for (i = 1; i <= N; i++) { tt = i / N; amp = 1 - cv(tt, curveD); mgraphics.line_to(xD + (xE - xD) * tt, yb + (yt - yb) * amp); }
    mgraphics.stroke();
    var hm = WF_Y + WF_H / 2;
    // big grab zones along each slope (registered first so the point handles win at the corners)
    var amx = (xS + xA) / 2, amy = yb + (yt - yb) * cv(0.5, curveA);
    var dmx = (xD + xE) / 2, dmy = yb + (yt - yb) * (1 - cv(0.5, curveD));
    var aw = Math.max(26, Math.abs(xA - xS)), dw = Math.max(26, Math.abs(xE - xD));
    region("curveA", amx - aw / 2, WF_Y, aw, WF_H);
    region("curveD", dmx - dw / 2, WF_Y, dw, WF_H);
    // point handles (small, at the corners; take priority over the slope grab zones)
    disc(xS, yb, 4, COL.accent); region("envS", xS - 8, hm, 16, WF_H / 2 + 3);   // start (bottom)
    disc(xE, yb, 4, COL.accent); region("envE", xE - 8, hm, 16, WF_H / 2 + 3);   // end (bottom)
    disc(xA, yt, 4, COL.accent); region("envA", xA - 8, WF_Y, 16, WF_H / 2);     // attack peak (top)
    disc(xD, yt, 4, COL.accent); region("envD", xD - 8, WF_Y, 16, WF_H / 2);     // sustain end (top)
    // curve handle dots (visual marker on each slope)
    disc(amx, amy, 2.5, COL.accent); ring(amx, amy, 5, COL.accentD, 1);
    disc(dmx, dmy, 2.5, COL.accent); ring(dmx, dmy, 5, COL.accentD, 1);
}

function ring(cx, cy, r, c, lw) { setc(c); mgraphics.set_line_width(lw || 1); mgraphics.ellipse(cx - r, cy - r, r * 2, r * 2); mgraphics.stroke(); }

function drawControls() {
    var y = CTRL_Y;
    // gain fader
    txt(PAD, y + 2, trk("gain"), COL.faint, 8);
    rect(PAD + 38, y - 4, 120, 8, COL.surf2);
    rect(PAD + 38, y - 4, 120 * gGain, 8, COL.accent);
    region("gain", PAD + 38, y - 10, 120, 18);
    // voices count (drag vertical: 1..MAX; 1 = mono retrigger). dot row mirrors it.
    txt(176, y + 4, "" + NVOICES, COL.accent, 13, 0);
    txt(176 + (NVOICES >= 10 ? 18 : 11), y + 4, trk("vox"), COL.faint, 7, 0);
    region("voices", 174, y - 9, 44, 18);
    // voice activity dots (right)
    var t = nowMs();
    for (var vch = 0; vch < NVOICES; vch++) {
        var lit = 0;
        for (var i = 0; i < voices.length; i++) if (voices[i].vi === vch) { var age = t - voices[i].t0; if (age < voices[i].dur) lit = Math.max(lit, clamp(1 - age / voices[i].dur, 0, 1) * (voices[i].vel || 1)); }
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
    // envelope toggle — shows/edits the env (always applied either way)
    var lx = W - PAD - 54;
    rect(lx, y2 - 7, 54, 16, envShown ? COL.afill : COL.surf2);
    rectb(lx + 0.5, y2 - 6.5, 53, 15, envShown ? COL.accent : COL.hair);
    txt(lx + 27, y2 + 4, "env", envShown ? COL.accent : COL.dim, 9, 1);
    region("env", lx, y2 - 7, 54, 16);
}

// ---------------------------------------------------------------- interaction
var drag = null;
function onclick(x, y, but, cmd, shift) {
    var h = hit(x, y);
    if (!h) return;
    if (h.field === "open") { outlet(0, "open"); return; }   // ask host to open a file dialog
    if (h.field === "env") { envShown = envShown ? 0 : 1; mgraphics.redraw(); return; }
    if (h.field === "voices") { drag = { field: "voices", y0: y, startN: NVOICES }; return; }
    if (h.field === "curveA") { drag = { field: "curveA", y0: y, startC: curveA }; return; }
    if (h.field === "curveD") { drag = { field: "curveD", y0: y, startC: curveD }; return; }
    if (h.field === "envS" || h.field === "envA" || h.field === "envD" || h.field === "envE") { drag = { field: h.field }; applyDrag(x, y); return; }
    if (h.field === "wave") {                                  // wave click -> nearest of the four env points
        if (!envShown) return;
        var R = endPt - startPt, f = fracFromX(x);
        var pts = [["envS", startPt], ["envA", startPt + envA * R], ["envD", startPt + envD * R], ["envE", endPt]];
        var best = pts[0], bd = 9; for (var k = 0; k < 4; k++) { var d = Math.abs(f - pts[k][1]); if (d < bd) { bd = d; best = pts[k]; } }
        drag = { field: best[0] }; applyDrag(x, y);
    } else { drag = { field: h.field }; applyDrag(x, y); }
}
onclick.local = 1;
function ondrag(x, y, but) { if (!drag) return; if (but === 0) { drag = null; return; } applyDrag(x, y); }
ondrag.local = 1;

function applyDrag(x, y) {
    var f = fracFromX(x);
    switch (drag.field) {
        case "gain":   gGain = clamp((x - (PAD + 38)) / 120, 0, 1); out("gain", gGain); break;
        case "pan":    gPan = clamp((x - (PAD + 38)) / 120 * 2 - 1, -1, 1); out("pan", gPan); break;
        case "envS":   startPt = clamp(f, 0, endPt - 0.02); emitStart(); emitLoop(); break;     // start = scan start
        case "envA":   envA = clamp(regFrac(x), 0, envD); break;                                // attack peak (frac of region)
        case "envD":   envD = clamp(regFrac(x), envA, 1); break;                                // sustain end (frac of region)
        case "envE":   endPt = clamp(f, startPt + 0.02, 1); emitLoop(); break;                  // end = scan end
        case "curveA": curveA = clamp(drag.startC - (drag.y0 - y) / 140, -0.95, 0.95); break;    // up = fuller (faster attack)
        case "curveD": curveD = clamp(drag.startC + (drag.y0 - y) / 140, -0.95, 0.95); break;    // up = fuller (slower release)
        case "voices": { var nn = clamp(Math.round(drag.startN + (drag.y0 - y) / 14), 1, MAXVOICES); if (nn !== NVOICES) { NVOICES = nn; out("voices", nn); } break; }  // up = more voices
    }
    mgraphics.redraw();
}
function out(sel, v) { outlet(0, sel, v); }
function emitStart() { outlet(0, "start", Math.round(startPt * durMs)); }                       // scan start in ms
function emitLoop() { outlet(0, "loop", Math.round(startPt * durMs), Math.round(endPt * durMs)); } // scanned region in ms
function emitAll() { out("gain", gGain); out("pan", gPan); out("loopon", 0); out("voices", NVOICES); emitLoop(); emitStart(); }  // never loop

// ---------------------------------------------------------------- persistence
function exportState() { return { gain: gGain, pan: gPan, startPt: startPt, endPt: endPt, envA: envA, envD: envD, curveA: curveA, curveD: curveD, envShown: envShown, nvoices: NVOICES }; }
function setstate(s) {
    try {
        var o = JSON.parse(s);
        gGain = o.gain; gPan = o.pan;
        if (o.startPt != null) startPt = o.startPt;
        if (o.endPt != null) endPt = o.endPt;
        if (o.envA != null) envA = o.envA;
        if (o.envD != null) envD = o.envD;
        if (o.curveA != null) curveA = o.curveA;
        if (o.curveD != null) curveD = o.curveD;
        if (o.envShown != null) envShown = o.envShown;
        if (o.nvoices != null) { NVOICES = clamp(o.nvoices, 1, MAXVOICES); out("voices", NVOICES); }
        mgraphics.redraw();
    } catch (e) {}
}
function save() { embedmessage("setstate", JSON.stringify(exportState())); }
