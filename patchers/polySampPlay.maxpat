{
 "patcher": {
  "fileversion": 1,
  "appversion": {
   "major": 9,
   "minor": 0,
   "revision": 0,
   "architecture": "x64",
   "modernui": 1
  },
  "classnamespace": "dsp.box",
  "rect": [
   100.0,
   100.0,
   400.0,
   340.0
  ],
  "gridonopen": 1,
  "gridsize": [
   15.0,
   15.0
  ],
  "boxes": [
   {
    "box": {
     "maxclass": "newobj",
     "text": "in 1",
     "id": "in1",
     "numinlets": 0,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      40.0,
      30.0,
      40.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route run",
     "id": "rt",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      40.0,
      66.0,
      80.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "pack 0. 5",
     "id": "pk",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      40.0,
      102.0,
      60.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "id": "ln",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      40.0,
      138.0,
      46.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "sig~ 1",
     "id": "sig",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      200.0,
      66.0,
      46.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "groove~ buffer 2",
     "id": "gr",
     "numinlets": 3,
     "numoutlets": 3,
     "outlettype": [
      "signal",
      "signal",
      "signal"
     ],
     "patching_rect": [
      140.0,
      138.0,
      120.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~",
     "id": "gl",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      140.0,
      210.0,
      46.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~",
     "id": "gR",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      210.0,
      210.0,
      46.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "out~ 1",
     "id": "o1",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      140.0,
      270.0,
      46.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "out~ 2",
     "id": "o2",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      210.0,
      270.0,
      46.0,
      22.0
     ]
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "source": [
      "in1",
      0
     ],
     "destination": [
      "rt",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "rt",
      0
     ],
     "destination": [
      "pk",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "rt",
      1
     ],
     "destination": [
      "gr",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pk",
      0
     ],
     "destination": [
      "ln",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "ln",
      0
     ],
     "destination": [
      "gl",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "ln",
      0
     ],
     "destination": [
      "gR",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sig",
      0
     ],
     "destination": [
      "gr",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gr",
      0
     ],
     "destination": [
      "gl",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gr",
      1
     ],
     "destination": [
      "gR",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gl",
      0
     ],
     "destination": [
      "o1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gR",
      0
     ],
     "destination": [
      "o2",
      0
     ]
    }
   }
  ]
 }
}
