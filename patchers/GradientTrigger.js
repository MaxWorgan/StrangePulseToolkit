// GradientTrigger.js — v8ui face for the SPT gradient-turn trigger detector.
// Dark-editorial. A scrolling signal trace with a faint full-height vertical line
// at each gradient-turn trigger: up-turns white, down-turns green, opacity = velocity.
//
// Engine (gen~ signChange + edge~ + snapshot~) is unchanged; the host feeds:
//   sig <0..1>   polled signal sample (snapshot~ ~20ms)
//   up <0..1>    an up-trigger fired, with its velocity (height/swing)
//   down <0..1>  a down-trigger fired, with its velocity

autowatch = 1;
inlets = 1;
outlets = 0;

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
    accent:  [0.7216, 1.0, 0.3608, 1.0]
};
var FONT = "Helvetica Neue";
var LINE_ALO = 0.06, LINE_AHI = 0.50;     // trigger-line opacity across velocity 0..1

// ---------------------------------------------------------------- layout (recomputed on resize)
var W = 148, H = 94;
var PAD, DX, DY, DW, DH, MIDY, chrome;
function layout() {
    PAD = clamp(Math.round(W * 0.05), 4, 16);
    chrome = H >= 116;                     // chrome now only adds the bottom UP/DN readouts
    var top = 6, bot = chrome ? 22 : 6;
    DX = PAD; DW = Math.max(8, W - 2 * PAD);
    DY = top; DH = Math.max(8, H - top - bot);
    MIDY = DY + DH / 2;
}
function onresize(w, h) { W = w; H = h; layout(); mgraphics.redraw(); }

// ---------------------------------------------------------------- state
var N = 256;
var samp = []; for (var s0 = 0; s0 < N; s0++) samp.push(0.5);
var head = 0, count = 0;
var events = [];                   // { count, vel, dir(+1/-1) }
var lastUp = 0, lastDown = 0;

// ---------------------------------------------------------------- helpers
function setc(c) { mgraphics.set_source_rgba(c[0], c[1], c[2], c[3]); }
function rect(x, y, w, h, c) { setc(c); mgraphics.rectangle(x, y, w, h); mgraphics.fill(); }
function rectb(x, y, w, h, c) { setc(c); mgraphics.set_line_width(1); mgraphics.rectangle(x, y, w, h); mgraphics.stroke(); }
function line(x1, y1, x2, y2, c, lw) { setc(c); mgraphics.set_line_width(lw || 1); mgraphics.move_to(x1, y1); mgraphics.line_to(x2, y2); mgraphics.stroke(); }
function setfont(sz) { mgraphics.select_font_face(FONT); mgraphics.set_font_size(sz); }
function meas(str, sz) { setfont(sz); var m = mgraphics.text_measure("" + str); return (m && m.length) ? m[0] : ("" + str).length * sz * 0.55; }
function txt(x, y, str, c, sz, just) {
    setc(c); setfont(sz);
    var w = (just === 1 || just === 2) ? meas(str, sz) : 0;
    mgraphics.move_to(just === 2 ? x - w : (just === 1 ? x - w / 2 : x), y);
    mgraphics.show_text("" + str);
}
function trk(str) { return ("" + str).toUpperCase().split("").join(" "); }
function clamp(v, lo, hi) { return v < lo ? lo : (v > hi ? hi : v); }
function accentA(a) { return [COL.accent[0], COL.accent[1], COL.accent[2], a]; }

// ---------------------------------------------------------------- messages in
function sig(v) { samp[head] = clamp(v, 0, 1); head = (head + 1) % N; count++; mgraphics.redraw(); }
function up(v) { v = clamp(v, 0, 1); pushEvent(v, 1); lastUp = v; mgraphics.redraw(); }
function down(v) { v = clamp(v, 0, 1); pushEvent(v, -1); lastDown = v; mgraphics.redraw(); }
function pushEvent(vel, dir) {
    events.push({ count: count, vel: vel, dir: dir });
    if (events.length > 160) events.shift();
}

// ---------------------------------------------------------------- paint
function visible(ev) { var age = count - ev.count; return age >= 0 && age < N; }
function evx(ev) { return DX + DW * (1 - (count - ev.count) / N); }

function paint() {
    if (DX === undefined) layout();
    rect(0, 0, W, H, COL.base);
    rect(DX, DY, DW, DH, COL.surface);
    rectb(DX + 0.5, DY + 0.5, DW - 1, DH - 1, COL.hair);
    line(DX, MIDY, DX + DW, MIDY, COL.hair, 1);
    drawTrace();
    drawLines();
    if (chrome) drawReadouts();
}

function drawTrace() {
    var k;
    setc(accentA(0.07)); mgraphics.move_to(DX, MIDY);
    for (k = 0; k < N; k++) mgraphics.line_to(DX + DW * (k / (N - 1)), DY + DH * (1 - samp[(head + k) % N]));
    mgraphics.line_to(DX + DW, MIDY); mgraphics.close_path(); mgraphics.fill();
    setc(accentA(0.5)); mgraphics.set_line_width(1);
    mgraphics.move_to(DX, DY + DH * (1 - samp[head % N]));
    for (k = 1; k < N; k++) mgraphics.line_to(DX + DW * (k / (N - 1)), DY + DH * (1 - samp[(head + k) % N]));
    mgraphics.stroke();
}

// full-height vertical line per trigger: up-turns white, down-turns green, opacity = velocity
function drawLines() {
    var top = DY + 1, bot = DY + DH - 1;
    for (var e = 0; e < events.length; e++) {
        var ev = events[e]; if (!visible(ev)) continue;
        var x = evx(ev), a = LINE_ALO + (LINE_AHI - LINE_ALO) * ev.vel;
        var c = ev.dir > 0 ? [1, 1, 1, a] : [COL.accent[0], COL.accent[1], COL.accent[2], a];
        line(x, top, x, bot, c, 1);
    }
}

function drawReadouts() {
    var y = H - 12, bw = Math.max(36, (W - 2 * PAD - 120) / 2);
    txt(PAD, y, trk("up"), COL.faint, 8); meterBar(PAD + 24, y - 5, bw, lastUp);
    txt(PAD + 24 + bw + 6, y, Math.round(lastUp * 100) + "", COL.accent, 11, 0);
    var rx = W - PAD - 24 - bw - 30;
    txt(rx, y, trk("dn"), COL.faint, 8); meterBar(rx + 24, y - 5, bw, lastDown);
    txt(W - PAD, y, Math.round(lastDown * 100) + "", COL.accent, 11, 2);
}
function meterBar(x, y, w, v) { rect(x, y, w, 6, COL.surf2); rect(x, y, w * clamp(v, 0, 1), 6, COL.accent); }
layout();
