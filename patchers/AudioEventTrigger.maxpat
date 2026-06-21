{
  "patcher": {
    "fileversion": 1,
    "appversion": { "major": 9, "minor": 0, "revision": 0, "architecture": "x64", "modernui": 1 },
    "rect": [ 100.0, 100.0, 560.0, 400.0 ],
    "boxes": [
      { "box": { "id": "signal", "maxclass": "inlet", "comment": "Follower Signal In", "numinlets": 0, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 40.0, 35.0, 30.0, 30.0 ] } },
      { "box": { "id": "threshold", "maxclass": "inlet", "comment": "Threshold", "numinlets": 0, "numoutlets": 1, "patching_rect": [ 140.0, 35.0, 30.0, 30.0 ] } },
      { "box": { "id": "hysteresis", "maxclass": "inlet", "comment": "Hysteresis", "numinlets": 0, "numoutlets": 1, "patching_rect": [ 240.0, 35.0, 30.0, 30.0 ] } },
      { "box": { "id": "holdoff", "maxclass": "inlet", "comment": "Holdoff ms", "numinlets": 0, "numoutlets": 1, "patching_rect": [ 340.0, 35.0, 30.0, 30.0 ] } },
      { "box": { "id": "gen", "maxclass": "newobj", "text": "gen~ audioEventTrigger", "numinlets": 1, "numoutlets": 1, "patching_rect": [ 175.0, 205.0, 142.0, 22.0 ] } },
      { "box": { "id": "thresh-msg", "maxclass": "newobj", "text": "prepend threshold", "numinlets": 1, "numoutlets": 1, "patching_rect": [ 110.0, 105.0, 108.0, 22.0 ] } },
      { "box": { "id": "hyst-msg", "maxclass": "newobj", "text": "prepend hysteresis", "numinlets": 1, "numoutlets": 1, "patching_rect": [ 220.0, 135.0, 112.0, 22.0 ] } },
      { "box": { "id": "hold-msg", "maxclass": "newobj", "text": "prepend holdoff", "numinlets": 1, "numoutlets": 1, "patching_rect": [ 335.0, 105.0, 101.0, 22.0 ] } },
      { "box": { "id": "snap", "maxclass": "newobj", "text": "snapshot~ 1", "numinlets": 2, "numoutlets": 1, "patching_rect": [ 175.0, 255.0, 75.0, 22.0 ] } },
      { "box": { "id": "drain", "maxclass": "newobj", "text": "v8 AudioEventDrain.js", "numinlets": 1, "numoutlets": 1, "patching_rect": [ 175.0, 295.0, 135.0, 22.0 ] } },
      { "box": { "id": "out", "maxclass": "outlet", "comment": "Event Out", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 225.0, 345.0, 30.0, 30.0 ] } }
    ],
    "lines": [
      { "patchline": { "source": [ "signal", 0 ], "destination": [ "gen", 0 ] } },
      { "patchline": { "source": [ "threshold", 0 ], "destination": [ "thresh-msg", 0 ] } },
      { "patchline": { "source": [ "hysteresis", 0 ], "destination": [ "hyst-msg", 0 ] } },
      { "patchline": { "source": [ "holdoff", 0 ], "destination": [ "hold-msg", 0 ] } },
      { "patchline": { "source": [ "thresh-msg", 0 ], "destination": [ "gen", 0 ] } },
      { "patchline": { "source": [ "hyst-msg", 0 ], "destination": [ "gen", 0 ] } },
      { "patchline": { "source": [ "hold-msg", 0 ], "destination": [ "gen", 0 ] } },
      { "patchline": { "source": [ "gen", 0 ], "destination": [ "snap", 0 ] } },
      { "patchline": { "source": [ "snap", 0 ], "destination": [ "drain", 0 ] } },
      { "patchline": { "source": [ "drain", 0 ], "destination": [ "out", 0 ] } }
    ],
    "dependency_cache": [ { "name": "audioEventTrigger.gendsp", "type": "GEN", "implicit": 1 }, { "name": "AudioEventDrain.js", "type": "TEXT", "implicit": 1 } ],
    "autosave": 0
  }
}
