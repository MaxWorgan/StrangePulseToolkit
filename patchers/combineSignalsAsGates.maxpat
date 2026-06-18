{
  "patcher": {
    "fileversion": 1,
    "appversion": { "major": 9, "minor": 0, "revision": 0, "architecture": "x64", "modernui": 1 },
    "rect": [ 100.0, 100.0, 500.0, 350.0 ],
    "openinpresentation": 1,
    "boxes": [
      { "box": { "id": "in-a", "maxclass": "inlet", "numinlets": 0, "numoutlets": 1, "patching_rect": [ 50.0, 40.0, 30.0, 30.0 ] } },
      { "box": { "id": "in-b", "maxclass": "inlet", "numinlets": 0, "numoutlets": 1, "patching_rect": [ 140.0, 40.0, 30.0, 30.0 ] } },
      { "box": { "id": "in-op", "maxclass": "inlet", "numinlets": 0, "numoutlets": 1, "patching_rect": [ 230.0, 40.0, 30.0, 30.0 ] } },
      { "box": { "id": "impl", "maxclass": "bpatcher", "name": "MotionLogic.maxpat", "varname": "impl", "numinlets": 3, "numoutlets": 2, "outlettype": [ "bang", "bang" ], "patching_rect": [ 50.0, 100.0, 300.0, 204.0 ], "presentation": 1, "presentation_rect": [ 0.0, 0.0, 300.0, 204.0 ], "border": 0, "enablehscroll": 0, "enablevscroll": 0 } },
      { "box": { "id": "rise", "maxclass": "outlet", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 100.0, 315.0, 30.0, 30.0 ] } },
      { "box": { "id": "fall", "maxclass": "outlet", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 270.0, 315.0, 30.0, 30.0 ] } },
      { "box": { "id": "load", "maxclass": "newobj", "text": "loadbang", "numinlets": 1, "numoutlets": 1, "patching_rect": [ 390.0, 40.0, 58.0, 22.0 ] } },
      { "box": { "id": "fit", "maxclass": "newobj", "text": "v8 attractorFit.js impl", "numinlets": 1, "numoutlets": 1, "patching_rect": [ 350.0, 75.0, 138.0, 22.0 ] } }
    ],
    "lines": [
      { "patchline": { "source": [ "in-a", 0 ], "destination": [ "impl", 0 ] } },
      { "patchline": { "source": [ "in-b", 0 ], "destination": [ "impl", 1 ] } },
      { "patchline": { "source": [ "in-op", 0 ], "destination": [ "impl", 2 ] } },
      { "patchline": { "source": [ "impl", 0 ], "destination": [ "rise", 0 ] } },
      { "patchline": { "source": [ "impl", 1 ], "destination": [ "fall", 0 ] } },
      { "patchline": { "source": [ "load", 0 ], "destination": [ "fit", 0 ] } }
    ],
    "dependency_cache": [ { "name": "MotionLogic.maxpat", "type": "JSON", "implicit": 1 }, { "name": "attractorFit.js", "type": "TEXT", "implicit": 1 } ],
    "autosave": 0
  }
}
