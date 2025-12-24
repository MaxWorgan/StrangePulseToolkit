autowatch = 1;

function scale_buffer(bufname) {
    var b = new Buffer(bufname);
    if (!b) {
        post("buffer not found\n");
        return;
    }

    var frames = b.framecount();
    var min = Infinity;
    var max = -Infinity;

    // First pass: find min and max
    for (var i = 0; i < frames; i++) {
        var val = b.peek(0, i);
        if (val < min) min = val;
        if (val > max) max = val;
    }

    var range = max - min;
    if (range === 0) {
        post("buffer has no variation\n");
        return;
    }

    // Second pass: scale to [-1, 1]
    for (var i = 0; i < frames; i++) {
        var val = b.peek(0, i);
        var norm = ((val - min) / range) * 2 - 1;
        b.poke(0, i, norm);
    }

    post("buffer scaled to [-1, 1]\n");
}
