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
  "classnamespace": "box",
  "rect": [
   59.0,
   118.0,
   440.0,
   520.0
  ],
  "bglocked": 0,
  "openinpresentation": 1,
  "default_fontsize": 12.0,
  "default_fontface": 0,
  "default_fontname": "Arial",
  "gridonopen": 1,
  "gridsize": [
   15.0,
   15.0
  ],
  "gridsnaponopen": 1,
  "objectsnaponopen": 1,
  "statusbarvisible": 2,
  "toolbarvisible": 1,
  "lefttoolbarpinned": 0,
  "toptoolbarpinned": 0,
  "righttoolbarpinned": 0,
  "bottomtoolbarpinned": 0,
  "toolbars_unpinned_last_save": 0,
  "tallnewobj": 0,
  "boxanimatetime": 200,
  "enablehscroll": 1,
  "enablevscroll": 1,
  "devicewidth": 0.0,
  "description": "",
  "digest": "",
  "tags": "",
  "style": "",
  "subpatcher_template": "",
  "assistshowspatchername": 0,
  "boxes": [
   {
    "box": {
     "maxclass": "inlet",
     "id": "obj-in",
     "numinlets": 0,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      40.0,
      20.0,
      30.0,
      30.0
     ],
     "comment": "trigger in"
    }
   },
   {
    "box": {
     "maxclass": "v8ui",
     "filename": "MultiModTrigger.js",
     "id": "obj-ui",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "parameter_enable": 0,
     "border": 0,
     "patching_rect": [
      40.0,
      70.0,
      384.0,
      396.0
     ],
     "presentation": 1,
     "presentation_rect": [
      0.0,
      0.0,
      384.0,
      396.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "outlet",
     "id": "obj-out0",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      40.0,
      500.0,
      30.0,
      30.0
     ],
     "comment": "fired trigger"
    }
   },
   {
    "box": {
     "maxclass": "outlet",
     "id": "obj-out1",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      120.0,
      500.0,
      30.0,
      30.0
     ],
     "comment": "alternate trigger"
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "source": [
      "obj-in",
      0
     ],
     "destination": [
      "obj-ui",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-ui",
      0
     ],
     "destination": [
      "obj-out0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-ui",
      1
     ],
     "destination": [
      "obj-out1",
      0
     ]
    }
   }
  ]
 }
}