{
 "patcher": {
  "fileversion": 1,
  "appversion": {
   "major": 9,
   "minor": 1,
   "revision": 1,
   "architecture": "x64",
   "modernui": 1
  },
  "classnamespace": "box",
  "rect": [
   638.0,
   119.0,
   663.0,
   680.0
  ],
  "openinpresentation": 1,
  "boxes": [
   {
    "box": {
     "comment": "Upward Triggers",
     "id": "obj-3",
     "index": 3,
     "maxclass": "outlet",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      178.0,
      394.0,
      30.0,
      30.0
     ]
    }
   },
   {
    "box": {
     "comment": "Downward Triggers",
     "id": "obj-4",
     "index": 4,
     "maxclass": "outlet",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      261.0,
      394.0,
      30.0,
      30.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-5",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      328.0,
      21.0,
      63.0,
      22.0
     ],
     "text": "size $1 $2"
    }
   },
   {
    "box": {
     "comment": "",
     "id": "obj-1",
     "index": 2,
     "maxclass": "inlet",
     "numinlets": 0,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      102.0,
      5.0,
      30.0,
      30.0
     ]
    }
   },
   {
    "box": {
     "activebgcolor": [
      0.0,
      0.0,
      0.0,
      0.0
     ],
     "activelinecolor": [
      1.0,
      0.819607843137255,
      0.4,
      1.0
     ],
     "grid_line_width": 0.3,
     "id": "obj-2",
     "interval": 3.63,
     "line_width": 0.4,
     "maxclass": "live.scope~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "bang"
     ],
     "patching_rect": [
      178.0,
      48.0,
      148.0,
      94.0
     ],
     "presentation": 1,
     "presentation_rect": [
      0.0,
      0.0,
      148.0,
      94.0
     ],
     "range": [
      0.0,
      1.0
     ],
     "rounded": 0.0,
     "samples": 40000.0,
     "smooth": 0
    }
   },
   {
    "box": {
     "id": "obj-190",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "bang"
     ],
     "patching_rect": [
      89.0,
      301.0,
      42.0,
      22.0
     ],
     "text": "edge~"
    }
   },
   {
    "box": {
     "id": "obj-113",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "bang"
     ],
     "patching_rect": [
      6.0,
      301.0,
      42.0,
      22.0
     ],
     "text": "edge~"
    }
   },
   {
    "box": {
     "id": "obj-102",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 4,
     "outlettype": [
      "signal",
      "signal",
      "signal",
      "signal"
     ],
     "patching_rect": [
      6.0,
      171.0,
      103.0,
      22.0
     ],
     "text": "gen~ signChange"
    }
   },
   {
    "box": {
     "activebgcolor": [
      0.0,
      0.0,
      0.0,
      0.0
     ],
     "activelinecolor": [
      0.023529411764706,
      0.83921568627451,
      0.627450980392157,
      1.0
     ],
     "grid_line_width": 0.3,
     "id": "obj-94",
     "interval": 3.63,
     "line_width": 0.4,
     "maxclass": "live.scope~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "bang"
     ],
     "patching_rect": [
      178.0,
      202.0,
      148.0,
      94.0
     ],
     "presentation": 1,
     "presentation_rect": [
      0.0,
      0.0,
      148.0,
      94.0
     ],
     "range": [
      0.0,
      1.0
     ],
     "rounded": 0.0,
     "samples": 40000.0,
     "smooth": 0
    }
   },
   {
    "box": {
     "id": "obj-67",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      6.0,
      123.0,
      32.0,
      22.0
     ],
     "text": "/~ 2."
    }
   },
   {
    "box": {
     "id": "obj-30",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      6.0,
      84.0,
      33.0,
      22.0
     ],
     "text": "+~ 1"
    }
   },
   {
    "box": {
     "activebgcolor": [
      0.177664712071419,
      0.185375183820724,
      0.199880793690681,
      1.0
     ],
     "activelinecolor": [
      0.937254901960784,
      0.27843137254902,
      0.435294117647059,
      1.0
     ],
     "id": "obj-364",
     "maxclass": "live.scope~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "bang"
     ],
     "patching_rect": [
      331.0,
      106.0,
      248.0,
      128.0
     ],
     "presentation": 1,
     "presentation_rect": [
      0.0,
      0.0,
      148.0,
      94.0
     ],
     "rounded": 0.0,
     "samples": 40000.0
    }
   },
   {
    "box": {
     "comment": "",
     "id": "obj-191",
     "index": 1,
     "maxclass": "inlet",
     "numinlets": 0,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      6.0,
      5.0,
      30.0,
      30.0
     ]
    }
   },
   {
    "box": {
     "comment": "Upward velocity (height 0-1)",
     "id": "obj-202",
     "index": 1,
     "maxclass": "outlet",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      7.0,
      394.0,
      30.0,
      30.0
     ]
    }
   },
   {
    "box": {
     "comment": "Downward velocity (height 0-1)",
     "id": "obj-206",
     "index": 2,
     "maxclass": "outlet",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      90.0,
      394.0,
      30.0,
      30.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "snapshot~",
     "id": "obj-snapU",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "float"
     ],
     "patching_rect": [
      6.0,
      345.0,
      66.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "snapshot~",
     "id": "obj-snapD",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "float"
     ],
     "patching_rect": [
      89.0,
      345.0,
      66.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "r spt_velmode",
     "id": "obj-rvm",
     "numinlets": 0,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      200.0,
      90.0,
      90.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "velmode $1",
     "id": "obj-vmmsg",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      200.0,
      125.0,
      72.0,
      22.0
     ]
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "destination": [
      "obj-5",
      0
     ],
     "source": [
      "obj-1",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-113",
      0
     ],
     "order": 2,
     "source": [
      "obj-102",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-190",
      0
     ],
     "order": 2,
     "source": [
      "obj-102",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-2",
      0
     ],
     "order": 1,
     "source": [
      "obj-102",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-3",
      0
     ],
     "order": 0,
     "source": [
      "obj-102",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-4",
      0
     ],
     "order": 0,
     "source": [
      "obj-102",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-94",
      0
     ],
     "order": 1,
     "source": [
      "obj-102",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-30",
      0
     ],
     "order": 1,
     "source": [
      "obj-191",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-364",
      0
     ],
     "order": 0,
     "source": [
      "obj-191",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-67",
      0
     ],
     "source": [
      "obj-30",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-2",
      0
     ],
     "order": 2,
     "source": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-364",
      0
     ],
     "order": 0,
     "source": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-94",
      0
     ],
     "order": 1,
     "source": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-102",
      0
     ],
     "source": [
      "obj-67",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-113",
      0
     ],
     "destination": [
      "obj-snapU",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-snapU",
      0
     ],
     "destination": [
      "obj-202",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-190",
      0
     ],
     "destination": [
      "obj-snapD",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-snapD",
      0
     ],
     "destination": [
      "obj-206",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-102",
      2
     ],
     "destination": [
      "obj-snapU",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-102",
      3
     ],
     "destination": [
      "obj-snapD",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-rvm",
      0
     ],
     "destination": [
      "obj-vmmsg",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-vmmsg",
      0
     ],
     "destination": [
      "obj-102",
      0
     ]
    }
   }
  ]
 }
}