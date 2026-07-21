// ThresholdTrigger.js — dark-editorial v8ui for the SPT dual-threshold detector.
// Drag either horizontal threshold line. Outlet 0 = high, outlet 1 = low.

autowatch = 1;
inlets = 1;
outlets = 2;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

// Paper Lab — light lab-instrument palette (see design_handoff_paperlab_ui/tokens.md)
var COL = {
    base:    [0.925, 0.906, 0.863, 1.0],
    surface: [0.965, 0.953, 0.925, 1.0],
    surf2:   [0.886, 0.863, 0.808, 1.0],
    hair:    [0.788, 0.761, 0.698, 1.0],
    text:    [0.094, 0.086, 0.067, 1.0],
    dim:     [0.408, 0.384, 0.310, 1.0],
    faint:   [0.639, 0.612, 0.541, 1.0],
    accent:  [0.863, 0.227, 0.106, 1.0],
    accent2: [0.306, 0.482, 0.910, 1.0]
};
var FONT = "Helvetica Neue";
var MONO = "Menlo";
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
function font(sz, mono) { mgraphics.select_font_face(mono ? MONO : FONT); mgraphics.set_font_size(sz); }
function measure(s, sz, mono) { font(sz, mono); var m = mgraphics.text_measure("" + s); return m && m.length ? m[0] : 0; }
function text(x, y, s, c, sz, right, mono) { setc(c); font(sz, mono); if (right) x -= measure(s, sz, mono); mgraphics.move_to(x, y); mgraphics.show_text("" + s); }
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
    rect(0, 0, W, H, COL.surface);
    text(6, 14, "03", COL.faint, 9, false);
    text(26, 14, trk("threshold"), COL.dim, 9, false);
    text(W - 6, 14, "LO ◂ / ▸ HI", COL.faint, 8, true, true);
    rect(DX, DY, DW, DH, COL.base);
    drawGrid();
    line(DX, valueY(0), DX + DW, valueY(0), COL.hair, 1);
    drawTrace();
    drawThreshold(low, "LO", COL.accent, loFlash > 0, false);
    drawThreshold(high, "HI", COL.text, hiFlash > 0, true);
    rectb(DX + 0.5, DY + 0.5, DW - 1, DH - 1, COL.hair);
    drawOutputs();
}

// faint cobalt blueprint grid behind the trace
function drawGrid() {
    var i, gc = alpha(COL.accent2, 0.13);
    for (i = 1; i < 8; i++) line(DX + DW * i / 8, DY + 1, DX + DW * i / 8, DY + DH - 1, gc, 1);
    for (i = 1; i < 4; i++) line(DX, DY + DH * i / 4, DX + DW, DY + DH * i / 4, gc, 1);
}

function drawTrace() {
    setc(alpha(COL.accent, 0.13));
    mgraphics.move_to(DX, valueY(0));
    for (var k = 0; k < N; k++) {
        var v = samples[(head + k) % N];
        mgraphics.line_to(DX + DW * k / (N - 1), valueY(v));
    }
    mgraphics.line_to(DX + DW, valueY(0)); mgraphics.close_path(); mgraphics.fill();
    setc(alpha(COL.accent, 0.85)); mgraphics.set_line_width(1.2);
    mgraphics.move_to(DX, valueY(samples[head % N]));
    for (k = 1; k < N; k++) mgraphics.line_to(DX + DW * k / (N - 1), valueY(samples[(head + k) % N]));
    mgraphics.stroke();
}

function drawThreshold(v, label, color, active, right) {
    var y = valueY(v);
    if (active) rect(DX + 1, y - 5, DW - 2, 10, alpha(COL.accent, 0.13));
    line(DX, y, DX + DW, y, active ? COL.accent : color, active ? 2 : 1.5);
    var c = active ? COL.accent : color;
    var bx = right ? DX + DW - 54 : DX + 5;
    rect(bx, y - 8, 49, 15, COL.surf2);
    text(bx + 5, y + 4, label, c, 8, false);
    text(bx + 45, y + 4, fmt(v), c, 10, true, true);
    rect(right ? DX + DW - 4 : DX - 4, y - 4, 8, 8, c);
}

function drawOutputs() {
    var y = H - 3;
    text(DX, y, trk("high"), COL.faint, 8, false);
    if (hiFlash > 0) rect(DX + 39, y - 6, 7, 7, COL.accent);
    else { rect(DX + 39, y - 6, 7, 7, COL.surf2); rectb(DX + 39.5, y - 5.5, 6, 6, COL.hair); }
    text(DX + 62, y, trk("low"), COL.faint, 8, false);
    if (loFlash > 0) rect(DX + 92, y - 6, 7, 7, COL.accent);
    else { rect(DX + 92, y - 6, 7, 7, COL.surf2); rectb(DX + 92.5, y - 5.5, 6, 6, COL.hair); }
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
