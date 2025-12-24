autowatch = 1;

var noteMap = [
    // Whole note
    { beats: 4.0, name: "1n" },
    { beats: 6.0, name: "1nd" },      // dotted whole
    { beats: 2.6667, name: "1nt" },   // whole triplet

    // Half note
    { beats: 2.0, name: "2n" },
    { beats: 3.0, name: "2nd" },      // dotted half
    { beats: 1.3333, name: "2nt" },   // half triplet

    // Quarter note
    { beats: 1.0, name: "4n" },
    { beats: 1.5, name: "4nd" },      // dotted quarter
    { beats: 0.6667, name: "4nt" },   // quarter triplet

    // Eighth note
    { beats: 0.5, name: "8n" },
    { beats: 0.75, name: "8nd" },     // dotted eighth
    { beats: 0.3333, name: "8nt" },   // eighth triplet

    // Sixteenth note
    { beats: 0.25, name: "16n" },
    { beats: 0.375, name: "16nd" },   // dotted sixteenth
    { beats: 0.1667, name: "16nt" },  // sixteenth triplet

    // Thirty-second note
    { beats: 0.125, name: "32n" },
    { beats: 0.1875, name: "32nd" },  // dotted 32nd
    { beats: 0.0833, name: "32nt" }   // 32nd triplet
];
// Input: ms bpm
function list(ms, bpm) {
    if (bpm <= 0 || ms < 0) {
        outlet(0, "invalid");
        return;
    }

    var beats = (ms / 60000) * bpm;

    // Find nearest note value
    var closest = noteMap[0];
    var minDiff = Math.abs(beats - closest.beats);

    for (var i = 1; i < noteMap.length; i++) {
        var diff = Math.abs(beats - noteMap[i].beats);
        if (diff < minDiff) {
            closest = noteMap[i];
            minDiff = diff;
        }
    }

    outlet(0, closest.name);
}