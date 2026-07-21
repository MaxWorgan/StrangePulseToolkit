// AttenuateAndScale.js — resizable v8ui face for the AttenuateAndScale gen~.
// DSP (unchanged):  out = slide( in * scale + offset , smoothup, smoothdown )
// The scope is drawn in-face (so it resizes): the unmodified input is a dim
// trace behind, the processed output the bright accent trace in front. Four bars
// drive the gen~ params:
//   SCALE   -2..+2  (gain, bipolar)        OFFSET  -1..+1  (DC add, bipolar)
//   UP / DN slew time on the rising / falling edge (slide samples, shown in ms)
// Layout reflows with size; state persists via embedmessage(setstate).
// In:  "rawsig <window>" (input) / "outsig <window>" (processed) — each a list of
//      recent samples, ~-1..1.
// Out: "scale <f>" / "offset <f>" / "smoothup <samp>" / "smoothdown <samp>".

autowatch = 1; inlets = 1; outlets = 1;
mgraphics.init(); mgraphics.relative_coords = 0; mgraphics.autofill = 0;

// Paper Lab — light lab-instrument palette (see design_handoff_paperlab_ui/tokens.md)
var C = { base:[.925,.906,.863,1], surface:[.965,.953,.925,1], surf2:[.886,.863,.808,1],
          hair:[.788,.761,.698,1], text:[.094,.086,.067,1], dim:[.408,.384,.310,1],
          faint:[.639,.612,.541,1], accent:[.863,.227,.106,1], accent2:[.306,.482,.910,1] };
var FONT = "Helvetica Neue";
var MONO = "Menlo";
var SMAX = 40000, SR = 44.1;             // slew max (slide samples); ~ms divisor

var W = 200, H = 168;
var scale = 1, offset = 0, upT = 0, dnT = 0;
var inBuf = [], outBuf = [];
var regions = [], drag = -1;

function clamp(v,a,b){ return v<a?a:(v>b?b:v); }
function setc(c){ mgraphics.set_source_rgba(c[0],c[1],c[2],c[3]); }
function rect(x,y,w,h,c){ setc(c); mgraphics.rectangle(x,y,w,h); mgraphics.fill(); }
function frame(x,y,w,h,c){ setc(c); mgraphics.set_line_width(1); mgraphics.rectangle(x,y,w,h); mgraphics.stroke(); }
function line(x1,y1,x2,y2,c,lw){ setc(c); mgraphics.set_line_width(lw||1); mgraphics.move_to(x1,y1); mgraphics.line_to(x2,y2); mgraphics.stroke(); }
function font(s,mono){ mgraphics.select_font_face(mono?MONO:FONT); mgraphics.set_font_size(s); }
function meas(s,z,mono){ font(z,mono); var m=mgraphics.text_measure(""+s); return m&&m.length?m[0]:0; }
function text(x,y,s,c,z,right,mono){ setc(c); font(z,mono); if(right) x-=meas(s,z,mono); mgraphics.move_to(x,y); mgraphics.show_text(""+s); }
function fillWave(buf,x,y,w,h,c){ var n=buf.length; if(n<2)return; var cy=y+h/2,amp=h/2*0.92; setc(c); mgraphics.move_to(x,cy); for(var i=0;i<n;i++){var px=x+i/(n-1)*w,py=cy-clamp(buf[i],-1,1)*amp; mgraphics.line_to(px,py);} mgraphics.line_to(x+w,cy); mgraphics.close_path(); mgraphics.fill(); }
function trk(s){ return (""+s).toUpperCase().split("").join(" "); }
function alpha(c,a){ return [c[0],c[1],c[2],a]; }
function pad(){ return clamp(Math.round(W*0.05), 7, 12); }
function samps(t){ return Math.round(t*t*SMAX); }
function msStr(t){ return Math.round(samps(t)/SR) + "ms"; }

function onresize(w,h){ W=w; H=h; mgraphics.redraw(); }
function rawsig(){ inBuf = arrayfromargs(arguments); mgraphics.redraw(); }
function outsig(){ outBuf = arrayfromargs(arguments); mgraphics.redraw(); }

function wave(buf, x, y, w, h, c, lw) {
    var n = buf.length, i; if (n < 2) return;
    var cy = y + h/2, amp = h/2 * 0.92;
    setc(c); mgraphics.set_line_width(lw);
    for (i = 0; i < n; i++) {
        var px = x + i/(n-1)*w, py = cy - clamp(buf[i], -1, 1)*amp;
        if (i === 0) mgraphics.move_to(px, py); else mgraphics.line_to(px, py);
    }
    mgraphics.stroke();
}

function bar(nm, label, shown, t, x, y, w, bip) {
    text(x, y - 6, trk(label), C.faint, 8, false);
    text(x + w, y - 6, shown, C.accent, 9, true, true);
    rect(x, y, w, 5, C.surf2);
    if (bip) {
        var cx = x + w/2, fx = x + w * clamp(t, 0, 1);
        if (fx >= cx) rect(cx, y, fx - cx, 5, C.accent); else rect(fx, y, cx - fx, 5, C.accent);
        rect(cx, y - 2, 1, 9, C.hair);
    } else {
        rect(x, y, w * clamp(t, 0, 1), 5, C.accent);
    }
    regions.push({ n: nm, x: x, y: y - 8, w: w, h: 16 });
}

function paint() {
    var P = pad(), bw = W - P * 2;
    regions = [];
    rect(0, 0, W, H, C.surface);
    text(P, 13, trk("att · scale"), C.dim, 9, false);

    // bottom-anchored control bars (so the scope takes the slack on resize)
    var bp = 20, r3 = H - 12, r2 = r3 - bp, r1 = r2 - bp, r0 = r1 - bp;

    // scope fills the space between the title and the top bar (18px clear so the
    // SCALE label never touches the scope frame)
    var sx = P, sy = 22, sw = bw, sh = Math.max(24, r0 - 18 - sy);
    rect(sx, sy, sw, sh, C.base);
    var g, gc = alpha(C.accent2, 0.13);                       // cobalt blueprint grid
    for (g = 1; g < 8; g++) line(sx + sw*g/8, sy+1, sx + sw*g/8, sy+sh-1, gc, 1);
    for (g = 1; g < 4; g++) line(sx, sy + sh*g/4, sx + sw, sy + sh*g/4, gc, 1);
    line(sx, sy + sh/2, sx + sw, sy + sh/2, C.hair, 1);
    wave(inBuf,  sx, sy, sw, sh, alpha(C.dim, 0.38), 1.0);    // unmodified input ghost, behind
    fillWave(outBuf, sx, sy, sw, sh, alpha(C.accent, 0.13));  // afill fill-under
    wave(outBuf, sx, sy, sw, sh, alpha(C.accent, 0.9), 1.4);  // processed output, front
    frame(sx, sy, sw, sh, C.hair);

    bar("scale",  "scale",  (scale>=0?"+":"") + scale.toFixed(2) + "×", (scale+2)/4, P, r0, bw, true);
    bar("offset", "offset", (offset>=0?"+":"") + offset.toFixed(2),     (offset+1)/2, P, r1, bw, true);
    bar("up",     "slew ↑", msStr(upT), upT, P, r2, bw, false);
    bar("dn",     "slew ↓", msStr(dnT), dnT, P, r3, bw, false);
}

function send(sel, v){ outlet(0, sel, v); }
function setBar(nm, x, r) {
    var t = clamp((x - r.x) / r.w, 0, 1);
    if (nm === "scale")  { scale = t*4 - 2; send("scale", scale); }
    else if (nm === "offset") { offset = t*2 - 1; send("offset", offset); }
    else if (nm === "up") { upT = t; send("smoothup", samps(t)); }
    else { dnT = t; send("smoothdown", samps(t)); }
    mgraphics.redraw();
}

function onclick(x, y) {
    for (var i = regions.length - 1; i >= 0; i--) {
        var r = regions[i];
        if (x>=r.x && x<=r.x+r.w && y>=r.y && y<=r.y+r.h) { drag = i; setBar(r.n, x, r); return; }
    }
}
function ondrag(x, y, but) {
    if (but === 0) { drag = -1; return; }
    if (drag < 0) return;
    setBar(regions[drag].n, x, regions[drag]);
}
onclick.local = 1;
ondrag.local = 1;

function emit() {
    send("scale", scale); send("offset", offset);
    send("smoothup", samps(upT)); send("smoothdown", samps(dnT));
}
function loadbang() { emit(); }
function bang() { emit(); }

function save() { embedmessage("setstate", scale, offset, upT, dnT); }
function setstate(sc, of, u, dn) {
    scale = clamp(sc, -2, 2);
    offset = clamp(of, -1, 1);
    upT = clamp(u, 0, 1);
    dnT = clamp(dn, 0, 1);
    emit();
    mgraphics.redraw();
}
