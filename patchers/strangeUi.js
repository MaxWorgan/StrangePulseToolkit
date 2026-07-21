// strangeUi.js — shared palette + drawing helpers for the SPT v8ui faces.
// Pure data and math helpers are exported directly. Helpers that need a drawing
// context are built by painter(mgraphics), so each face binds its own canvas
// without relying on how Max shares globals across required modules.

// Paper Lab — light lab-instrument palette (see design_handoff_paperlab_ui/tokens.md).
// Superset of the keys used by the individual faces; extra keys are harmless.
exports.PALETTE = {
    base:    [0.925, 0.906, 0.863, 1],
    surface: [0.965, 0.953, 0.925, 1],
    surf2:   [0.886, 0.863, 0.808, 1],
    hair:    [0.788, 0.761, 0.698, 1],
    text:    [0.094, 0.086, 0.067, 1],
    dim:     [0.408, 0.384, 0.310, 1],
    faint:   [0.639, 0.612, 0.541, 1],
    accent:  [0.863, 0.227, 0.106, 1],
    accent2: [0.306, 0.482, 0.910, 1]
};

exports.FONT = "Helvetica Neue";
exports.MONO = "Menlo";

exports.clamp = function (v, a, b) { return v < a ? a : (v > b ? b : v); };
exports.alpha = function (c, a) { return [c[0], c[1], c[2], a]; };
exports.trk   = function (s) { return ("" + s).toUpperCase().split("").join(" "); };

// Symmetric inner padding both Strange faces use, derived from current width.
exports.pad = function (w) { return exports.clamp(Math.round(w * 0.05), 8, 16); };

// Spectrum plot rectangle: full-width band below the title row, leaving `bottom`
// px clear at the foot for the control sliders. Shared by every spectral face.
exports.specRect = function (w, h, bottom) {
    var p = exports.pad(w);
    return { x: p, y: 28, w: w - p * 2, h: h - 28 - bottom };
};

// Build the mgraphics-bound drawing helpers for a given context.
exports.painter = function (mg) {
    var C = exports.PALETTE;
    function setc(c) { mg.set_source_rgba(c[0], c[1], c[2], c[3]); }
    function font(s, mono) { mg.select_font_face(mono ? exports.MONO : exports.FONT); mg.set_font_size(s); }
    function meas(s, z, mono) { font(z, mono); var m = mg.text_measure("" + s); return m && m.length ? m[0] : 0; }
    function rect(x, y, w, h, c) { setc(c); mg.rectangle(x, y, w, h); mg.fill(); }
    function frame(x, y, w, h, c, lw) { setc(c); mg.set_line_width(lw || 1); mg.rectangle(x, y, w, h); mg.stroke(); }
    function text(x, y, s, c, z, right, mono) { setc(c); font(z, mono); if (right) x -= meas(s, z, mono); mg.move_to(x, y); mg.show_text("" + s); }
    // Faint cobalt blueprint measurement grid behind a plot rect `s`.
    function grid(s, nx, ny) {
        var i, gc = exports.alpha(C.accent2, 0.13);
        setc(gc); mg.set_line_width(1);
        for (i = 1; i < nx; i++) { mg.move_to(s.x + s.w * i / nx, s.y + 1); mg.line_to(s.x + s.w * i / nx, s.y + s.h - 1); }
        for (i = 1; i < ny; i++) { mg.move_to(s.x, s.y + s.h * i / ny); mg.line_to(s.x + s.w, s.y + s.h * i / ny); }
        mg.stroke();
    }

    // Draw a 0..1 value series as a spectral curve inside rect `s`. When `lit`
    // the area below is filled and the stroke is brighter; otherwise it reads as
    // a dim background layer. Column count follows the supplied array length.
    function spectrum(s, vals, lit) {
        var n = vals.length, i, X, Y;
        if (!n) return;
        if (lit) {
            setc(exports.alpha(C.accent, 0.13));
            mg.move_to(s.x, s.y + s.h);
            for (i = 0; i < n; i++) mg.line_to(s.x + (i + 0.5) / n * s.w, s.y + (1 - vals[i]) * s.h);
            mg.line_to(s.x + s.w, s.y + s.h);
            mg.close_path(); mg.fill();
        }
        setc(exports.alpha(C.accent, lit ? 0.95 : 0.4));
        mg.set_line_width(lit ? 1.5 : 1.0);
        for (i = 0; i < n; i++) {
            X = s.x + (i + 0.5) / n * s.w; Y = s.y + (1 - vals[i]) * s.h;
            if (i === 0) mg.move_to(X, Y); else mg.line_to(X, Y);
        }
        mg.stroke();
    }

    // Labelled horizontal slider: tracked label at left, value at right, fill bar
    // proportional to `t` (0..1). Returns the hit rect for the caller to tag.
    function bar(label, shown, t, x, y, w) {
        text(x, y - 6, exports.trk(label), C.faint, 8, false);
        text(x + w, y - 6, shown, C.accent, 11, true, true);
        rect(x, y, w, 6, C.surf2);
        rect(x, y, w * exports.clamp(t, 0, 1), 6, C.accent);
        return { x: x, y: y - 8, w: w, h: 16 };
    }

    // Right-aligned channel tabs (e.g. L / R). Returns hit regions tagged "chan"
    // with the channel index `i`, laid out right-to-left from `rightX`.
    function tabs(labels, active, rightX, y) {
        var regs = [], mx = rightX, k, lab, wseg;
        for (k = labels.length - 1; k >= 0; k--) {
            lab = labels[k]; wseg = meas(lab, 9);
            text(mx, y, lab, k === active ? C.accent : C.faint, 9, true);
            regs.push({ n: "chan", i: k, x: mx - wseg - 4, y: y - 12, w: wseg + 8, h: 16 });
            mx -= wseg + 12;
        }
        return regs;
    }

    return {
        setc: setc, font: font, meas: meas, rect: rect, frame: frame, text: text,
        spectrum: spectrum, bar: bar, tabs: tabs, grid: grid
    };
};
