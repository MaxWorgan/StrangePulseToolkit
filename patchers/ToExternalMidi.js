// ToExternalMidi.js — minimal v8ui face for the external-MIDI note sender.
// Trigger (velocity 0..1) -> MIDI note. The keyboard leads: it (or the NUM
// steppers, same note) owns the top of the face. CHAN and GATE are small
// right-sized readouts on one thin control line, deliberately understated so
// they no longer compete with pitch. VEL is a live input meter at the foot.
// The output device is the dark umenu strip below this face (host patcher).
//
// Tabs select how you pick the note:
//   NUM   pitch-class + octave steppers (click ‹ › arrows, or drag a field)
//   KEYS  one-octave mini keyboard; click a key, page octaves with the OCT field
//
// State (note/chan/gate/tab/kbOct) persists two independent ways:
//   · embedmessage(setstate ...) — standalone, no pattrstorage required
//   · getvalueof/setvalueof      — pattr / preset / pattrstorage (one JSON
//     symbol). The wrapper binds a [pattr] to this box, so a host pattrstorage
//     sees it as <instance>::<pattrname>.
//   NB (Max 9.1.1): v8 answers getvalueof only at queue priority, so
//   scheduler-driven store/recall must reach pattrstorage through [deferlow].
//
// In:  "vel <0..1>" (meter).
// Out: "note <0..127>" / "chan <1..16>" / "gate <ms>".

autowatch = 1; inlets = 1; outlets = 1;
mgraphics.init(); mgraphics.relative_coords = 0; mgraphics.autofill = 0;

// Paper Lab — light lab-instrument palette (see design_handoff_paperlab_ui/tokens.md)
var C = { base:[.925,.906,.863,1], surface:[.965,.953,.925,1], surf2:[.886,.863,.808,1],
          hair:[.788,.761,.698,1], text:[.094,.086,.067,1], dim:[.408,.384,.310,1],
          faint:[.639,.612,.541,1], accent:[.863,.227,.106,1], accent2:[.306,.482,.910,1],
          keyWhite:[.99,.985,.965,1] };
var FONT = "Helvetica Neue";
var MONO = "Menlo";
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
function font(s,mono){ mgraphics.select_font_face(mono?MONO:FONT); mgraphics.set_font_size(s); }
function meas(s,z,mono){ font(z,mono); var m=mgraphics.text_measure(""+s); return m&&m.length?m[0]:0; }
function text(x,y,s,c,z,right,ctr,mono){ setc(c); font(z,mono); var wd=ctr?meas(s,z,mono)/2:(right?meas(s,z,mono):0); mgraphics.move_to(x-wd,y); mgraphics.show_text(""+s); }
function trk(s){ return (""+s).toUpperCase().split("").join(" "); }
function pad(){ return clamp(Math.round(W*0.05), 6, 12); }

function pcOf(){ return note % 12; }
function octOf(){ return Math.floor(note/12) - 1; }
function setNote(pc, oct){ note = clamp((oct+1)*12 + pc, 0, 127); outlet(0,"note",note); mgraphics.redraw(); }

function onresize(w,h){ W=w; H=h; mgraphics.redraw(); }
function vel(v){ lastVel = clamp(v,0,1); mgraphics.redraw(); }

// compact ‹ value › field with a subtle surf2 box, right-sized to its width.
// registers down / up / body(drag) hit regions.
function field(nm, label, val, x, y, w) {
    var h = 14;
    rect(x, y, w, h, C.surf2);
    frame(x, y, w, h, C.hair);
    text(x + 5, y + 10, "‹", C.faint, 10, false);
    text(x + w - 5, y + 10, "›", C.faint, 10, true);
    text(x + w/2, y + 10, val, C.text, 10, false, true, true);
    if (label) text(x, y - 2, trk(label), C.faint, 7, false);
    regions.push({ n: nm+"-", x: x, y: y, w: 13, h: h });
    regions.push({ n: nm+"+", x: x+w-13, y: y, w: 13, h: h });
    regions.push({ n: nm, x: x+13, y: y, w: w-26, h: h });   // drag body
}

// plain-text NUM · KEYS tabs at top-right (no boxes; active = accent + rule)
function drawTabs() {
    var items = [["NUM", 0], ["KEYS", 1]], x = W - pad();
    for (var i = items.length - 1; i >= 0; i--) {
        var lab = items[i][0], on = tab === items[i][1], w = meas(lab, 8);
        var x0 = x - w;
        text(x0, 11, lab, on ? C.accent : C.faint, 8, false);
        if (on) rect(x0, 13, w, 1, C.accent);
        regions.push({ n: items[i][1] === 0 ? "tabnum" : "tabkeys", x: x0 - 3, y: 0, w: w + 6, h: 15 });
        if (i > 0) { x = x0 - 8; text(x0 - 5, 11, "·", C.faint, 8, false, true); }
    }
}

function keyboard(x, y, w, h) {
    var ww = w/7, i, kx, lit = (octOf() === kbOct) ? pcOf() : -1;
    for (i = 0; i < 7; i++) {                     // white keys
        kx = x + i*ww;
        var on = WHITE[i] === lit;
        rect(kx, y, ww-1, h, on ? C.accent : C.keyWhite);
        frame(kx, y, ww-1, h, C.hair);
        regions.push({ n: "key", pc: WHITE[i], x: kx, y: y, w: ww-1, h: h });
    }
    var bw = ww*0.62, bh = h*0.62;
    for (i = 0; i < 5; i++) {                      // black keys (on top)
        kx = x + (BLACKAT[i]+1)*ww - bw/2;
        var bon = BLACK[i] === lit;
        rect(kx, y, bw, bh, bon ? C.accent : C.text);
        frame(kx, y, bw, bh, C.hair);
        regions.push({ n: "key", pc: BLACK[i], x: kx, y: y, w: bw, h: bh });
    }
}

function paint() {
    var P = pad();
    regions = [];
    rect(0, 0, W, H, C.surface);

    // header
    text(P, 12, "08", C.faint, 9, false);
    text(P + 18, 12, trk("midi out"), C.dim, 9, false);
    drawTabs();

    // bands scale with the (menu-less) face height; keyboard is the hero
    var topY = Math.round(H * 0.20);
    var topH = Math.max(22, Math.round(H * 0.35));
    var ctlY = Math.round(H * 0.66);
    var velY = H - Math.max(7, Math.round(H * 0.08));

    // — note entry (top, gets the space) —
    if (tab === 0) {
        text(P, topY + 2, trk("note"), C.dim, 7, false);
        var pcW = 46, octW = 38, gap = 8, fy = topY + 12;
        field("pc",  "", NAMES[pcOf()], P, fy, pcW);
        field("oct", "", octOf(), P + pcW + gap, fy, octW);
        text(P + pcW + gap + octW + 8, fy + 10, "· " + note, C.faint, 8, false);
    } else {
        keyboard(P, topY, W - P*2, topH);
    }

    // — thin control line: context (note readout / OCT) left, CHAN·GATE right —
    var gateW = 54, chanW = 34, gg = 6;
    var gx = W - P - gateW, cx = gx - gg - chanW;
    field("chan", "chan", chan, cx, ctlY, chanW);
    field("gate", "gate", gate + "ms", gx, ctlY, gateW);
    // KEYS puts the octave pager here; NUM already shows pitch/oct up top, so
    // its control line stays clean (just chan/gate).
    if (tab === 1) field("kboct", "oct", kbOct, P, ctlY, 38);

    // — VEL meter —
    text(P, velY, trk("vel"), C.faint, 7, false);
    var mx = P + 26, mw = W - P - mx;
    rect(mx, velY - 6, mw, 5, C.surf2);
    rect(mx, velY - 6, mw * lastVel, 5, C.accent);
    frame(mx, velY - 6, mw, 5, C.hair);
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
            if (r.n === "tabnum")  { tab=0; markDirty(); mgraphics.redraw(); return; }
            if (r.n === "tabkeys") { tab=1; kbOct=octOf(); markDirty(); mgraphics.redraw(); return; }
            if (r.n === "key")  { setNote(r.pc, kbOct); markDirty(); return; }
            if (r.n.slice(-1) === "-") { step(r.n.slice(0,-1), -1); markDirty(); return; }
            if (r.n.slice(-1) === "+") { step(r.n.slice(0,-1), +1); markDirty(); return; }
            scrub = { n: r.n, y0: y, v0: startVal(r.n) };   // drag body
            return;
        }
    }
}
function ondrag(x, y, but) {
    if (but === 0) { if (scrub) { scrub = null; markDirty(); } return; }
    if (scrub) scrubTo(y);
}
onclick.local = 1;
ondrag.local = 1;

function emit() { outlet(0,"note",note); outlet(0,"chan",chan); outlet(0,"gate",gate); }
function loadbang() { emit(); }
function bang() { emit(); }

// ---------------------------------------------------------------- persistence
// standalone embed (unchanged 4-arg shape — old patches still load); kbOct is
// re-derived from the note on load.
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

// ---------------------------------------------------------------- pattr / preset
// Whole face state as one compact JSON symbol; same values as save(), plus the
// keyboard octave. See the header note on the queue-priority caveat.
function stateObj() { return { note: note, chan: chan, gate: gate, tab: tab, kbOct: kbOct }; }
function getvalueof() { return JSON.stringify(stateObj()); }
function setvalueof(v) {
    // compact JSON is one symbol; rejoin if a client hands it over split up
    var s = arguments.length > 1 ? Array.prototype.slice.call(arguments).join("") : v;
    try { applyStateObj(JSON.parse("" + s)); }
    catch (e) { post("ToExternalMidi: unreadable pattr/preset value\n"); }
}
function applyStateObj(o) {
    if (!o) return;
    if (o.note !== undefined) note = clamp(Math.round(o.note), 0, 127);
    if (o.chan !== undefined) chan = clamp(Math.round(o.chan), 1, 16);
    if (o.gate !== undefined) gate = clamp(Math.round(o.gate), GMIN, GMAX);
    tab = (Math.round(o.tab || 0) === 1) ? 1 : 0;
    kbOct = (o.kbOct !== undefined) ? clamp(Math.round(o.kbOct), -1, 9) : octOf();
    emit();
    mgraphics.redraw();
}
// mark the pattr value dirty after a committed edit so bound clients re-read
function markDirty() { if (typeof notifyclients === "function") notifyclients(); }
