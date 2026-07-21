{
  "patcher": {
    "fileversion": 1,
    "appversion": { "major": 9, "minor": 0, "revision": 0, "architecture": "x64", "modernui": 1 },
    "rect": [ 100.0, 100.0, 600.0, 420.0 ],
    "boxes": [
      { "box": { "id": "audio", "maxclass": "inlet", "comment": "Audio In", "numinlets": 0, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 35.0, 35.0, 30.0, 30.0 ] } },
      { "box": { "id": "low", "maxclass": "inlet", "comment": "Low Cut Hz", "numinlets": 0, "numoutlets": 1, "patching_rect": [ 105.0, 35.0, 30.0, 30.0 ] } },
      { "box": { "id": "high", "maxclass": "inlet", "comment": "High Cut Hz", "numinlets": 0, "numoutlets": 1, "patching_rect": [ 175.0, 35.0, 30.0, 30.0 ] } },
      { "box": { "id": "order", "maxclass": "inlet", "comment": "Filter Order", "numinlets": 0, "numoutlets": 1, "patching_rect": [ 245.0, 35.0, 30.0, 30.0 ] } },
      { "box": { "id": "attack", "maxclass": "inlet", "comment": "Attack ms", "numinlets": 0, "numoutlets": 1, "patching_rect": [ 315.0, 35.0, 30.0, 30.0 ] } },
      { "box": { "id": "release", "maxclass": "inlet", "comment": "Release ms", "numinlets": 0, "numoutlets": 1, "patching_rect": [ 385.0, 35.0, 30.0, 30.0 ] } },
      { "box": { "id": "drive", "maxclass": "inlet", "comment": "Drive", "numinlets": 0, "numoutlets": 1, "patching_rect": [ 455.0, 35.0, 30.0, 30.0 ] } },
      { "box": { "id": "gen", "maxclass": "newobj", "text": "gen~ bandFollower", "numinlets": 1, "numoutlets": 1, "patching_rect": [ 190.0, 245.0, 119.0, 22.0 ] } },
      { "box": { "id": "low-msg", "maxclass": "newobj", "text": "prepend low", "numinlets": 1, "numoutlets": 1, "patching_rect": [ 90.0, 110.0, 76.0, 22.0 ] } },
      { "box": { "id": "high-msg", "maxclass": "newobj", "text": "prepend high", "numinlets": 1, "numoutlets": 1, "patching_rect": [ 170.0, 140.0, 82.0, 22.0 ] } },
      { "box": { "id": "order-msg", "maxclass": "newobj", "text": "prepend order", "numinlets": 1, "numoutlets": 1, "patching_rect": [ 250.0, 110.0, 86.0, 22.0 ] } },
      { "box": { "id": "attack-msg", "maxclass": "newobj", "text": "prepend attack", "numinlets": 1, "numoutlets": 1, "patching_rect": [ 335.0, 140.0, 90.0, 22.0 ] } },
      { "box": { "id": "release-msg", "maxclass": "newobj", "text": "prepend release", "numinlets": 1, "numoutlets": 1, "patching_rect": [ 420.0, 110.0, 94.0, 22.0 ] } },
      { "box": { "id": "drive-msg", "maxclass": "newobj", "text": "prepend drive", "numinlets": 1, "numoutlets": 1, "patching_rect": [ 465.0, 170.0, 84.0, 22.0 ] } },
      { "box": { "id": "out", "maxclass": "outlet", "comment": "Follower Signal Out", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 235.0, 335.0, 30.0, 30.0 ] } }
    ],
    "lines": [
      { "patchline": { "source": [ "audio", 0 ], "destination": [ "gen", 0 ] } },
      { "patchline": { "source": [ "low", 0 ], "destination": [ "low-msg", 0 ] } },
      { "patchline": { "source": [ "high", 0 ], "destination": [ "high-msg", 0 ] } },
      { "patchline": { "source": [ "order", 0 ], "destination": [ "order-msg", 0 ] } },
      { "patchline": { "source": [ "attack", 0 ], "destination": [ "attack-msg", 0 ] } },
      { "patchline": { "source": [ "release", 0 ], "destination": [ "release-msg", 0 ] } },
      { "patchline": { "source": [ "drive", 0 ], "destination": [ "drive-msg", 0 ] } },
      { "patchline": { "source": [ "low-msg", 0 ], "destination": [ "gen", 0 ] } },
      { "patchline": { "source": [ "high-msg", 0 ], "destination": [ "gen", 0 ] } },
      { "patchline": { "source": [ "order-msg", 0 ], "destination": [ "gen", 0 ] } },
      { "patchline": { "source": [ "attack-msg", 0 ], "destination": [ "gen", 0 ] } },
      { "patchline": { "source": [ "release-msg", 0 ], "destination": [ "gen", 0 ] } },
      { "patchline": { "source": [ "drive-msg", 0 ], "destination": [ "gen", 0 ] } },
      { "patchline": { "source": [ "gen", 0 ], "destination": [ "out", 0 ] } }
    ],
    "dependency_cache": [ { "name": "bandFollower.gendsp", "type": "GEN", "implicit": 1 } ],
    "autosave": 0
  }
}
