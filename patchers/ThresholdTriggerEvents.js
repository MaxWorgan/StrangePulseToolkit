// Drains cumulative Gen crossing counters without losing events between scheduler ticks.
autowatch = 1;
inlets = 2;
outlets = 2;

var seen = [0, 0];

function msg_int(v) { drain(inlet, v); }
function msg_float(v) { drain(inlet, v); }

function drain(which, value) {
    var current = Math.floor(Number(value));
    if (!isFinite(current)) return;
    if (current < seen[which]) {
        seen[which] = current;
        return;
    }
    var pending = current - seen[which];
    seen[which] = current;
    for (var i = 0; i < pending; i++) outlet(which, "bang");
}
