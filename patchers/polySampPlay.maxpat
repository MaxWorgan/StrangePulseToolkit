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
     "text": "route run rch",
     "id": "rt",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
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
     "text": "curve~",
     "id": "ln",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      40.0,
      138.0,
      52.0,
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
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "selector~ 2",
     "id": "rsel",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      210.0,
      168.0,
      66.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "loadbang",
     "id": "rdef",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "bang"
     ],
     "patching_rect": [
      300.0,
      30.0,
      60.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "2",
     "id": "rdefm",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      300.0,
      66.0,
      32.0,
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
      "ln",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "rt",
      2
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
   },
   {
    "patchline": {
     "source": [
      "rt",
      1
     ],
     "destination": [
      "rsel",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "rdef",
      0
     ],
     "destination": [
      "rdefm",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "rdefm",
      0
     ],
     "destination": [
      "rsel",
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
      "rsel",
      1
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
      "rsel",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "rsel",
      0
     ],
     "destination": [
      "gR",
      0
     ]
    }
   }
  ]
 }
}