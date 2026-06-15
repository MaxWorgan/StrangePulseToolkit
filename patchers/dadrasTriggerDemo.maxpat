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
   60.0,
   80.0,
   720.0,
   760.0
  ],
  "openinpresentation": 0,
  "default_fontsize": 12.0,
  "autosave": 0,
  "boxes": [
   {
    "box": {
     "id": "obj-1",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20.0,
      12.0,
      360.0,
      30.0
     ],
     "text": "Dadras \u2192 Triggers \u2192 MIDI",
     "fontsize": 20.0
    }
   },
   {
    "box": {
     "id": "obj-2",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20.0,
      40.0,
      620.0,
      76.0
     ],
     "text": "Each Dadras axis (x / y / z) is turned into note triggers by GradientTrigger, given controllable variation by MultiModTrigger (choose a mod mode + amount in each), then sent out as MIDI notes by ToExternalMidi.\nClick the ezdac~ (speaker) to start DSP \u2014 the signal-rate triggering needs audio running. In each ToExternalMidi set the note, channel and MIDI output device."
    }
   },
   {
    "box": {
     "id": "obj-3",
     "maxclass": "ezdac~",
     "numinlets": 2,
     "numoutlets": 0,
     "patching_rect": [
      470.0,
      150.0,
      45.0,
      45.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-3b",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      520.0,
      160.0,
      120.0,
      20.0
     ],
     "text": "click \u2192 DSP on"
    }
   },
   {
    "box": {
     "id": "obj-4",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 6,
     "outlettype": [
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal"
     ],
     "patching_rect": [
      40.0,
      150.0,
      151.0,
      22.0
     ],
     "text": "spt.attractor.dadras",
     "varname": "dadras"
    }
   },
   {
    "box": {
     "id": "obj-lab0",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      40.0,
      210.0,
      80.0,
      20.0
     ],
     "text": "x axis"
    }
   },
   {
    "box": {
     "id": "obj-lab1",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      240.0,
      210.0,
      80.0,
      20.0
     ],
     "text": "y axis"
    }
   },
   {
    "box": {
     "id": "obj-lab2",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      440.0,
      210.0,
      80.0,
      20.0
     ],
     "text": "z axis"
    }
   },
   {
    "box": {
     "bgmode": 0,
     "border": 0,
     "clickthrough": 0,
     "enablehscroll": 0,
     "enablevscroll": 0,
     "id": "obj-g0",
     "lockeddragscroll": 0,
     "lockedsize": 0,
     "maxclass": "bpatcher",
     "name": "GradientTrigger.maxpat",
     "numinlets": 1,
     "numoutlets": 2,
     "offset": [
      0.0,
      0.0
     ],
     "patching_rect": [
      40.0,
      232.0,
      148.0,
      94.0
     ],
     "varname": "grad_x",
     "viewvisibility": 1,
     "outlettype": [
      "bang",
      "bang"
     ]
    }
   },
   {
    "box": {
     "bgmode": 0,
     "border": 0,
     "clickthrough": 0,
     "enablehscroll": 0,
     "enablevscroll": 0,
     "id": "obj-g1",
     "lockeddragscroll": 0,
     "lockedsize": 0,
     "maxclass": "bpatcher",
     "name": "GradientTrigger.maxpat",
     "numinlets": 1,
     "numoutlets": 2,
     "offset": [
      0.0,
      0.0
     ],
     "patching_rect": [
      240.0,
      232.0,
      148.0,
      94.0
     ],
     "varname": "grad_y",
     "viewvisibility": 1,
     "outlettype": [
      "bang",
      "bang"
     ]
    }
   },
   {
    "box": {
     "bgmode": 0,
     "border": 0,
     "clickthrough": 0,
     "enablehscroll": 0,
     "enablevscroll": 0,
     "id": "obj-g2",
     "lockeddragscroll": 0,
     "lockedsize": 0,
     "maxclass": "bpatcher",
     "name": "GradientTrigger.maxpat",
     "numinlets": 1,
     "numoutlets": 2,
     "offset": [
      0.0,
      0.0
     ],
     "patching_rect": [
      440.0,
      232.0,
      148.0,
      94.0
     ],
     "varname": "grad_z",
     "viewvisibility": 1,
     "outlettype": [
      "bang",
      "bang"
     ]
    }
   },
   {
    "box": {
     "bgmode": 0,
     "border": 0,
     "clickthrough": 0,
     "enablehscroll": 0,
     "enablevscroll": 0,
     "id": "obj-m0",
     "lockeddragscroll": 0,
     "lockedsize": 0,
     "maxclass": "bpatcher",
     "name": "MultiModTrigger.maxpat",
     "numinlets": 1,
     "numoutlets": 2,
     "offset": [
      0.0,
      0.0
     ],
     "patching_rect": [
      40.0,
      340.0,
      100.0,
      301.0
     ],
     "varname": "mmt_x",
     "viewvisibility": 1,
     "outlettype": [
      "bang",
      "bang"
     ]
    }
   },
   {
    "box": {
     "bgmode": 0,
     "border": 0,
     "clickthrough": 0,
     "enablehscroll": 0,
     "enablevscroll": 0,
     "id": "obj-m1",
     "lockeddragscroll": 0,
     "lockedsize": 0,
     "maxclass": "bpatcher",
     "name": "MultiModTrigger.maxpat",
     "numinlets": 1,
     "numoutlets": 2,
     "offset": [
      0.0,
      0.0
     ],
     "patching_rect": [
      240.0,
      340.0,
      100.0,
      301.0
     ],
     "varname": "mmt_y",
     "viewvisibility": 1,
     "outlettype": [
      "bang",
      "bang"
     ]
    }
   },
   {
    "box": {
     "bgmode": 0,
     "border": 0,
     "clickthrough": 0,
     "enablehscroll": 0,
     "enablevscroll": 0,
     "id": "obj-m2",
     "lockeddragscroll": 0,
     "lockedsize": 0,
     "maxclass": "bpatcher",
     "name": "MultiModTrigger.maxpat",
     "numinlets": 1,
     "numoutlets": 2,
     "offset": [
      0.0,
      0.0
     ],
     "patching_rect": [
      440.0,
      340.0,
      100.0,
      301.0
     ],
     "varname": "mmt_z",
     "viewvisibility": 1,
     "outlettype": [
      "bang",
      "bang"
     ]
    }
   },
   {
    "box": {
     "bgmode": 0,
     "border": 0,
     "clickthrough": 0,
     "enablehscroll": 0,
     "enablevscroll": 0,
     "id": "obj-x0",
     "lockeddragscroll": 0,
     "lockedsize": 0,
     "maxclass": "bpatcher",
     "name": "ToExternalMidi.maxpat",
     "numinlets": 1,
     "numoutlets": 0,
     "offset": [
      0.0,
      0.0
     ],
     "patching_rect": [
      40.0,
      660.0,
      101.0,
      48.0
     ],
     "varname": "midi_x",
     "viewvisibility": 1
    }
   },
   {
    "box": {
     "bgmode": 0,
     "border": 0,
     "clickthrough": 0,
     "enablehscroll": 0,
     "enablevscroll": 0,
     "id": "obj-x1",
     "lockeddragscroll": 0,
     "lockedsize": 0,
     "maxclass": "bpatcher",
     "name": "ToExternalMidi.maxpat",
     "numinlets": 1,
     "numoutlets": 0,
     "offset": [
      0.0,
      0.0
     ],
     "patching_rect": [
      240.0,
      660.0,
      101.0,
      48.0
     ],
     "varname": "midi_y",
     "viewvisibility": 1
    }
   },
   {
    "box": {
     "bgmode": 0,
     "border": 0,
     "clickthrough": 0,
     "enablehscroll": 0,
     "enablevscroll": 0,
     "id": "obj-x2",
     "lockeddragscroll": 0,
     "lockedsize": 0,
     "maxclass": "bpatcher",
     "name": "ToExternalMidi.maxpat",
     "numinlets": 1,
     "numoutlets": 0,
     "offset": [
      0.0,
      0.0
     ],
     "patching_rect": [
      440.0,
      660.0,
      101.0,
      48.0
     ],
     "varname": "midi_z",
     "viewvisibility": 1
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "velocity source",
     "id": "obj-vmlbl",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20.0,
      122.0,
      100.0,
      18.0
     ],
     "fontsize": 12.0
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "off = height   \u00b7   on = swing amplitude",
     "id": "obj-vmlbl2",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      154.0,
      123.0,
      200.0,
      18.0
     ],
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "maxclass": "toggle",
     "id": "obj-vmtog",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      124.0,
      118.0,
      24.0,
      24.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s spt_velmode",
     "id": "obj-vmsend",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      360.0,
      119.0,
      95.0,
      22.0
     ]
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "destination": [
      "obj-g0",
      0
     ],
     "source": [
      "obj-4",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-g1",
      0
     ],
     "source": [
      "obj-4",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-g2",
      0
     ],
     "source": [
      "obj-4",
      2
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-m0",
      0
     ],
     "source": [
      "obj-g0",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-m1",
      0
     ],
     "source": [
      "obj-g1",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-m2",
      0
     ],
     "source": [
      "obj-g2",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-x0",
      0
     ],
     "source": [
      "obj-m0",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-x1",
      0
     ],
     "source": [
      "obj-m1",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-x2",
      0
     ],
     "source": [
      "obj-m2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-vmtog",
      0
     ],
     "destination": [
      "obj-vmsend",
      0
     ]
    }
   }
  ]
 }
}