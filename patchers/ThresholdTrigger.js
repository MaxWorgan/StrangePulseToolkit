// ThresholdTrigger.js — dark-editorial v8ui for the SPT dual-threshold detector.
// Drag either horizontal threshold line. Outlet 0 = high, outlet 1 = low.

autowatch = 1;
inlets = 1;
outlets = 2;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

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
var W = 190, H = 85;
var DX = 6, DY = 20, DW = 178, DH = 53;
var high = 0, low = 0, dragTarget = "";
var N = 160, samples = [], head = 0;
var hiFlash = 0, loFlash = 0;
for (var i = 0; i < N; i++) samples.push(0);

function clamp(v, lo, hi) { return v < lo ? lo : (v > hi ? hi : v); }
function setc(c) { mgraphics.set_source_rgba(c[0], c[1], c[2], c[3]); }
function rect(x, y, w, h, c) { setc(c); mgraphics.rectangle(x, y, w, h); mgraphics.fill(); }
function rectb(x, y, w, h, c) { setc(c); mgraphics.set_line_width(1); mgraphics.rectangle(x, y, w, h); mgraphics.stroke(); }
function line(x1, y1, x2, y2, c, lw) { setc(c); mgraphics.set_line_width(lw || 1); mgraphics.move_to(x1, y1); mgraphics.line_to(x2, y2); mgraphics.stroke(); }
function font(sz) { mgraphics.select_font_face(FONT); mgraphics.set_font_size(sz); }
function measure(s, sz) { font(sz); var m = mgraphics.text_measure("" + s); return m && m.length ? m[0] : 0; }
function text(x, y, s, c, sz, right) { setc(c); font(sz); if (right) x -= measure(s, sz); mgraphics.move_to(x, y); mgraphics.show_text("" + s); }
function trk(s) { return ("" + s).toUpperCase().split("").join(" "); }
function alpha(c, a) { return [c[0], c[1], c[2], a]; }
function valueY(v) { return DY + (1 - (clamp(v, -1, 1) + 1) * 0.5) * DH; }
function yValue(y) { return clamp(1 - 2 * ((y - DY) / DH), -1, 1); }
function fmt(v) { var s = Math.abs(v) < 0.0005 ? "0.00" : v.toFixed(2); return v > 0 ? "+" + s : s; }

function layout() {
    DX = 6; DY = 20; DW = Math.max(40, W - 12); DH = Math.max(28, H - 32);
}
function onresize(w, h) { W = w; H = h; layout(); mgraphics.redraw(); }

function upper(v) { high = clamp(v, -1, 1); mgraphics.redraw(); }
function lower(v) { low = clamp(v, -1, 1); mgraphics.redraw(); }
function sig(v) { samples[head] = clamp(v, -1, 1); head = (head + 1) % N; decay(); mgraphics.redraw(); }
function hi() { hiFlash = 12; mgraphics.redraw(); }
function lo() { loFlash = 12; mgraphics.redraw(); }
function decay() { if (hiFlash > 0) hiFlash--; if (loFlash > 0) loFlash--; }

function paint() {
    layout();
    rect(0, 0, W, H, COL.base);
    text(6, 14, trk("threshold"), COL.dim, 9, false);
    text(W - 6, 14, "LO  LEFT  /  RIGHT  HI", COL.faint, 8, true);
    rect(DX, DY, DW, DH, COL.surface);
    rectb(DX + 0.5, DY + 0.5, DW - 1, DH - 1, COL.hair);
    line(DX, valueY(0), DX + DW, valueY(0), COL.hair, 1);
    drawTrace();
    drawThreshold(low, "LO", COL.accent, loFlash > 0, false);
    drawThreshold(high, "HI", COL.text, hiFlash > 0, true);
    drawOutputs();
}

function drawTrace() {
    setc(alpha(COL.accent, 0.08));
    mgraphics.move_to(DX, valueY(0));
    for (var k = 0; k < N; k++) {
        var v = samples[(head + k) % N];
        mgraphics.line_to(DX + DW * k / (N - 1), valueY(v));
    }
    mgraphics.line_to(DX + DW, valueY(0)); mgraphics.close_path(); mgraphics.fill();
    setc(alpha(COL.accent, 0.52)); mgraphics.set_line_width(1);
    mgraphics.move_to(DX, valueY(samples[head % N]));
    for (k = 1; k < N; k++) mgraphics.line_to(DX + DW * k / (N - 1), valueY(samples[(head + k) % N]));
    mgraphics.stroke();
}

function drawThreshold(v, label, color, active, right) {
    var y = valueY(v), c = active ? COL.accent : color;
    if (active) rect(DX + 1, y - 5, DW - 2, 10, alpha(COL.accent, 0.12));
    line(DX, y, DX + DW, y, alpha(c, active ? 1 : 0.72), active ? 2 : 1);
    var bx = right ? DX + DW - 54 : DX + 5;
    rect(bx, y - 7, 49, 14, COL.surf2);
    text(bx + 4, y + 4, label, c, 8, false);
    text(bx + 45, y + 4, fmt(v), c, 10, true);
    rect(right ? DX + DW - 4 : DX - 4, y - 4, 8, 8, c);
}

function drawOutputs() {
    var y = H - 3;
    text(DX, y, trk("high"), COL.faint, 8, false);
    rect(DX + 39, y - 6, 6, 6, hiFlash > 0 ? COL.accent : COL.hair);
    text(DX + 60, y, trk("low"), COL.faint, 8, false);
    rect(DX + 92, y - 6, 6, 6, loFlash > 0 ? COL.accent : COL.hair);
}

function setFromY(y) {
    var v = yValue(y);
    if (dragTarget === "high") { high = v; outlet(0, v); }
    else if (dragTarget === "low") { low = v; outlet(1, v); }
    mgraphics.redraw();
}
function onclick(x, y) {
    if (x < DX || x > DX + DW || y < DY - 8 || y > DY + DH + 8) return;
    // Large, deterministic targets: left half edits LO, right half edits HI.
    dragTarget = x < DX + DW / 2 ? "low" : "high";
    setFromY(y);
}
function ondrag(x, y, but) { if (!but) { dragTarget = ""; return; } if (dragTarget) setFromY(y); }
onclick.local = 1;
ondrag.local = 1;

layout();
