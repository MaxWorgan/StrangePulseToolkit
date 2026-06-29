// ToExternalMidi.js — compact v8ui face for the external-MIDI note sender.
// Trigger (velocity 0..1) -> MIDI note. Two tabs select the pitch the same note:
//   NUM   pitch-class + octave steppers (click the < > arrows, or drag a field)
//   KEYS  one-octave mini keyboard; click a key, page octaves with < >
// CHAN and GATE are compact stepper/scrub readouts; VEL is a live meter. The
// output device is the dark umenu below this face. note/chan/gate/tab persist
// via embedmessage(setstate).
// In:  "vel <0..1>" (meter).
// Out: "note <0..127>" / "chan <1..16>" / "gate <ms>".

autowatch = 1; inlets = 1; outlets = 1;
mgraphics.init(); mgraphics.relative_coords = 0; mgraphics.autofill = 0;

var C = { base:[.055,.055,.059,1], surface:[.086,.086,.094,1], surf2:[.126,.126,.141,1],
          hair:[.173,.173,.192,1], text:[.926,.926,.926,1], dim:[.541,.541,.561,1],
          faint:[.361,.361,.380,1], accent:[.722,1,.361,1] };
var FONT = "Helvetica Neue";
var NAMES = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"];
var WHITE = [0,2,4,5,7,9,11], BLACK = [1,3,6,8,10], BLACKAT = [0,1,3,4,5];
var GMIN = 20, GMAX = 2000;

var W = 156, H = 92;
var note = 60, chan = 1, gate = 500, tab = 0, kbOct = 4;
var lastVel = 0;
var regions = [], scrub = null;          // scrub = {n, y0, v0}

function clamp(v,a,b){ return v<a?a:(v>b?b:v); }
function setc(c){ mgraphics.set_source_rgba(c[0],c[1],c[2],c[3]); }
function alpha(c,a){ return [c[0],c[1],c[2],a]; }
function rect(x,y,w,h,c){ setc(c); mgraphics.rectangle(x,y,w,h); mgraphics.fill(); }
function frame(x,y,w,h,c){ setc(c); mgraphics.set_line_width(1); mgraphics.rectangle(x,y,w,h); mgraphics.stroke(); }
function font(s){ mgraphics.select_font_face(FONT); mgraphics.set_font_size(s); }
function meas(s,z){ font(z); var m=mgraphics.text_measure(""+s); return m&&m.length?m[0]:0; }
function text(x,y,s,c,z,right,ctr){ setc(c); font(z); var wd=ctr?meas(s,z)/2:(right?meas(s,z):0); mgraphics.move_to(x-wd,y); mgraphics.show_text(""+s); }
function trk(s){ return (""+s).toUpperCase().split("").join(" "); }
function pad(){ return clamp(Math.round(W*0.05), 6, 12); }

function pcOf(){ return note % 12; }
function octOf(){ return Math.floor(note/12) - 1; }
function setNote(pc, oct){ note = clamp((oct+1)*12 + pc, 0, 127); outlet(0,"note",note); mgraphics.redraw(); }

function onresize(w,h){ W=w; H=h; mgraphics.redraw(); }
function vel(v){ lastVel = clamp(v,0,1); mgraphics.redraw(); }

// a small <  value  > stepper field; registers down/up/body hit regions
function field(nm, label, val, x, y, w) {
    var h = 15;
    rect(x, y, w, h, C.surf2);
    text(x + 6, y + 11, "‹", C.dim, 11, false);
    text(x + w - 6, y + 11, "›", C.dim, 11, true);
    text(x + w/2, y + 11, val, C.text, 10, false, true);
    if (label) text(x, y - 3, trk(label), C.dim, 7, false);
    regions.push({ n: nm+"-", x: x, y: y, w: 14, h: h });
    regions.push({ n: nm+"+", x: x+w-14, y: y, w: 14, h: h });
    regions.push({ n: nm, x: x+14, y: y, w: w-28, h: h });   // drag body
}

function keyboard(x, y, w, h) {
    var ww = w/7, i, kx, lit = (octOf() === kbOct) ? pcOf() : -1;
    for (i = 0; i < 7; i++) {                     // white keys
        kx = x + i*ww;
        var on = WHITE[i] === lit;
        rect(kx, y, ww-1, h, on ? alpha(C.accent,0.9) : C.surface);
        frame(kx, y, ww-1, h, C.hair);
        regions.push({ n: "key", pc: WHITE[i], x: kx, y: y, w: ww-1, h: h });
    }
    var bw = ww*0.62, bh = h*0.62;
    for (i = 0; i < 5; i++) {                      // black keys (on top)
        kx = x + (BLACKAT[i]+1)*ww - bw/2;
        var bon = BLACK[i] === lit;
        rect(kx, y, bw, bh, bon ? C.accent : C.base);
        frame(kx, y, bw, bh, C.hair);
        regions.push({ n: "key", pc: BLACK[i], x: kx, y: y, w: bw, h: bh });
    }
}

function paint() {
    var P = pad();
    regions = [];
    rect(0, 0, W, H, C.base);

    text(P, 12, trk("midi out"), C.dim, 9, false);
    // tabs (right): NUM | KEYS
    var tx = W - P;
    var wk = meas("KEYS", 8);
    text(tx, 12, "KEYS", tab===1 ? C.accent : C.faint, 8, true);
    regions.push({ n: "tab1", x: tx-wk-3, y: 2, w: wk+6, h: 14 });
    tx -= wk + 10;
    var wn = meas("NUM", 8);
    text(tx, 12, "NUM", tab===0 ? C.accent : C.faint, 8, true);
    regions.push({ n: "tab0", x: tx-wn-3, y: 2, w: wn+6, h: 14 });

    if (tab === 0) {
        text(P, 34, trk("note"), C.dim, 7, false);
        var fy = 26, fw = 42;
        field("pc",  "", NAMES[pcOf()], W - P - fw*2 - 6, fy, fw);
        field("oct", "", octOf(),       W - P - fw,       fy, fw);
        text(P, 44, note, C.faint, 8, false);
    } else {
        keyboard(P, 24, W - P*2 - 46, 22);
        field("kboct", "OCT", kbOct, W - P - 42, 26, 42);
    }

    // CHAN / GATE row
    var ry = 60, half = (W - P*2 - 6)/2;
    field("chan", "chan", chan, P, ry, half);
    field("gate", "gate", gate + "ms", P + half + 6, ry, half);

    // VEL meter
    var vy = H - 9;
    text(P, vy - 2, trk("vel"), C.dim, 7, false);
    var mx = P + 26, mw = W - P - mx;
    rect(mx, vy - 6, mw, 5, C.surface);
    rect(mx, vy - 6, mw * lastVel, 5, C.accent);
    frame(mx, vy - 6, mw, 5, C.hair);
}

function step(nm, d) {
    if (nm === "pc")   setNote(((pcOf()+d)%12+12)%12, octOf());
    else if (nm === "oct") setNote(pcOf(), clamp(octOf()+d, -1, 9));
    else if (nm === "kboct") { kbOct = clamp(kbOct+d, -1, 9); mgraphics.redraw(); }
    else if (nm === "chan") { chan = clamp(chan+d, 1, 16); outlet(0,"chan",chan); mgraphics.redraw(); }
    else if (nm === "gate") { gate = clamp(gate + d*10, GMIN, GMAX); outlet(0,"gate",gate); mgraphics.redraw(); }
}
function scrubTo(y) {
    var d = Math.round((scrub.y0 - y) / 4);
    if (scrub.n === "pc")   setNote(((scrub.v0+d)%12+12)%12, octOf());
    else if (scrub.n === "oct") setNote(pcOf(), clamp(scrub.v0+d, -1, 9));
    else if (scrub.n === "kboct") { kbOct = clamp(scrub.v0+d, -1, 9); mgraphics.redraw(); }
    else if (scrub.n === "chan") { chan = clamp(scrub.v0+d, 1, 16); outlet(0,"chan",chan); mgraphics.redraw(); }
    else if (scrub.n === "gate") { gate = clamp(scrub.v0 + d*10, GMIN, GMAX); outlet(0,"gate",gate); mgraphics.redraw(); }
}
function startVal(nm){ return nm==="pc"?pcOf() : nm==="oct"?octOf() : nm==="kboct"?kbOct : nm==="chan"?chan : gate; }

function onclick(x, y) {
    scrub = null;
    for (var i = regions.length - 1; i >= 0; i--) {
        var r = regions[i];
        if (x>=r.x && x<=r.x+r.w && y>=r.y && y<=r.y+r.h) {
            if (r.n === "tab0") { tab=0; mgraphics.redraw(); return; }
            if (r.n === "tab1") { tab=1; kbOct=octOf(); mgraphics.redraw(); return; }
            if (r.n === "key")  { setNote(r.pc, kbOct); return; }
            if (r.n.slice(-1) === "-") { step(r.n.slice(0,-1), -1); return; }
            if (r.n.slice(-1) === "+") { step(r.n.slice(0,-1), +1); return; }
            scrub = { n: r.n, y0: y, v0: startVal(r.n) };   // drag body
            return;
        }
    }
}
function ondrag(x, y, but) {
    if (but === 0) { scrub = null; return; }
    if (scrub) scrubTo(y);
}
onclick.local = 1;
ondrag.local = 1;

function emit() { outlet(0,"note",note); outlet(0,"chan",chan); outlet(0,"gate",gate); }
function loadbang() { emit(); }
function bang() { emit(); }

function save() { embedmessage("setstate", note, chan, gate, tab); }
function setstate(n, c, g, t) {
    note = clamp(Math.round(n), 0, 127);
    chan = clamp(Math.round(c), 1, 16);
    gate = clamp(Math.round(g), GMIN, GMAX);
    tab  = (Math.round(t||0) === 1) ? 1 : 0;
    kbOct = octOf();
    emit();
    mgraphics.redraw();
}
