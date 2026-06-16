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
   193.0,
   99.0,
   791.0,
   823.0
  ],
  "openinpresentation": 1,
  "boxes": [
   {
    "box": {
     "id": "obj-62",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "bang"
     ],
     "patching_rect": [
      32.0,
      93.0,
      32.0,
      22.0
     ],
     "text": "t b b"
    }
   },
   {
    "box": {
     "id": "obj-49",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      183.0,
      418.0,
      88.0,
      22.0
     ],
     "text": "set #0-samp"
    }
   },
   {
    "box": {
     "id": "obj-40",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      128.5,
      418.0,
      49.0,
      22.0
     ],
     "text": "target 0"
    }
   },
   {
    "box": {
     "id": "obj-32",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "bang"
     ],
     "patching_rect": [
      132.0,
      388.0,
      32.0,
      22.0
     ],
     "text": "t b b"
    }
   },
   {
    "box": {
     "id": "obj-21",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "bang"
     ],
     "patching_rect": [
      132.0,
      356.0,
      58.0,
      22.0
     ],
     "text": "loadbang"
    }
   },
   {
    "box": {
     "id": "obj-50",
     "maxclass": "newobj",
     "numinlets": 5,
     "numoutlets": 4,
     "outlettype": [
      "int",
      "",
      "",
      "int"
     ],
     "patching_rect": [
      45.0,
      373.0,
      79.0,
      22.0
     ],
     "text": "counter 0 1 8"
    }
   },
   {
    "box": {
     "id": "obj-47",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      45.0,
      411.0,
      56.0,
      22.0
     ],
     "text": "target $1"
    }
   },
   {
    "box": {
     "id": "obj-15",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "multichannelsignal"
     ],
     "patching_rect": [
      42.5,
      507.0,
      153.0,
      22.0
     ],
     "text": "mcs.poly~ polySampPlay 8"
    }
   },
   {
    "box": {
     "id": "obj-13",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      258.0,
      169.0,
      35.0,
      22.0
     ],
     "text": "clear"
    }
   },
   {
    "box": {
     "id": "obj-30",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      112.5,
      156.0,
      32.0,
      22.0
     ],
     "text": "gate"
    }
   },
   {
    "box": {
     "id": "obj-28",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      79.5,
      128.0,
      29.5,
      22.0
     ],
     "text": "> 1"
    }
   },
   {
    "box": {
     "id": "obj-24",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      79.5,
      105.0,
      74.0,
      22.0
     ],
     "text": "string.length"
    }
   },
   {
    "box": {
     "id": "obj-22",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      179.5,
      97.0,
      29.5,
      22.0
     ],
     "text": "t l l"
    }
   },
   {
    "box": {
     "id": "obj-29",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      377.0,
      138.0,
      60.0,
      22.0
     ],
     "text": "zl.change"
    }
   },
   {
    "box": {
     "id": "obj-19",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "multichannelsignal"
     ],
     "patching_rect": [
      42.5,
      652.0,
      149.0,
      22.0
     ],
     "text": "mc.pack~ 2"
    }
   },
   {
    "box": {
     "id": "obj-17",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "signal"
     ],
     "patching_rect": [
      42.5,
      572.0,
      84.0,
      22.0
     ],
     "text": "mc.unpack~ 2"
    }
   },
   {
    "box": {
     "id": "obj-16",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "signal"
     ],
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
       59.0,
       118.0,
       640.0,
       480.0
      ],
      "boxes": [
       {
        "box": {
         "id": "obj-10",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "patching_rect": [
          187.25,
          240.0,
          29.5,
          22.0
         ],
         "text": "*~"
        }
       },
       {
        "box": {
         "id": "obj-9",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "patching_rect": [
          116.0,
          240.0,
          29.5,
          22.0
         ],
         "text": "*~"
        }
       },
       {
        "box": {
         "comment": "",
         "id": "obj-8",
         "index": 2,
         "maxclass": "outlet",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          187.0,
          361.0,
          30.0,
          30.0
         ]
        }
       },
       {
        "box": {
         "comment": "",
         "id": "obj-7",
         "index": 1,
         "maxclass": "outlet",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          116.0,
          361.0,
          30.0,
          30.0
         ]
        }
       },
       {
        "box": {
         "comment": "",
         "id": "obj-6",
         "index": 2,
         "maxclass": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "patching_rect": [
          187.0,
          23.0,
          30.0,
          30.0
         ]
        }
       },
       {
        "box": {
         "comment": "",
         "id": "obj-4",
         "index": 1,
         "maxclass": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "patching_rect": [
          116.0,
          23.0,
          30.0,
          30.0
         ]
        }
       },
       {
        "box": {
         "comment": "",
         "id": "obj-3",
         "index": 3,
         "maxclass": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "patching_rect": [
          271.0,
          23.0,
          30.0,
          30.0
         ]
        }
       },
       {
        "box": {
         "id": "obj-20",
         "linecount": 5,
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          506.0,
          179.0,
          93.0,
          74.0
         ],
         "text": "exponent:\n0.25 = 1.5 dB\n0.5   = 3 dB\n0.75 = 4.5 dB\n1 = 6dB (linear)"
        }
       },
       {
        "box": {
         "id": "obj-11",
         "maxclass": "message",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          ""
         ],
         "patching_rect": [
          271.0,
          161.0,
          41.0,
          22.0
         ],
         "text": "$1 20"
        }
       },
       {
        "box": {
         "id": "obj-12",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 2,
         "outlettype": [
          "signal",
          "bang"
         ],
         "patching_rect": [
          271.0,
          192.0,
          36.0,
          22.0
         ],
         "text": "line~"
        }
       },
       {
        "box": {
         "id": "obj-13",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 1,
         "outlettype": [
          ""
         ],
         "patching_rect": [
          271.0,
          133.0,
          131.0,
          22.0
         ],
         "text": "expr pow((1.-$f1)\\,0.75)"
        }
       },
       {
        "box": {
         "id": "obj-15",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 1,
         "outlettype": [
          ""
         ],
         "patching_rect": [
          436.0,
          133.0,
          109.0,
          22.0
         ],
         "text": "expr pow($f1\\,0.75)"
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
          436.0,
          161.0,
          41.0,
          22.0
         ],
         "text": "$1 20"
        }
       },
       {
        "box": {
         "id": "obj-26",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 2,
         "outlettype": [
          "signal",
          "bang"
         ],
         "patching_rect": [
          436.0,
          192.0,
          36.0,
          22.0
         ],
         "text": "line~"
        }
       }
      ],
      "lines": [
       {
        "patchline": {
         "destination": [
          "obj-8",
          0
         ],
         "source": [
          "obj-10",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-12",
          0
         ],
         "source": [
          "obj-11",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-9",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-11",
          0
         ],
         "source": [
          "obj-13",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-5",
          0
         ],
         "source": [
          "obj-15",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-10",
          1
         ],
         "source": [
          "obj-26",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-13",
          0
         ],
         "order": 1,
         "source": [
          "obj-3",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-15",
          0
         ],
         "order": 0,
         "source": [
          "obj-3",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-9",
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
          "obj-26",
          0
         ],
         "source": [
          "obj-5",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-10",
          0
         ],
         "source": [
          "obj-6",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-7",
          0
         ],
         "source": [
          "obj-9",
          0
         ]
        }
       }
      ]
     },
     "patching_rect": [
      42.5,
      612.0,
      149.0,
      22.0
     ],
     "text": "p balance"
    }
   },
   {
    "box": {
     "id": "obj-23",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ],
     "patching_rect": [
      407.0,
      67.0,
      75.0,
      22.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_invisible": 1,
       "parameter_longname": "sample",
       "parameter_modmode": 0,
       "parameter_shortname": "sample",
       "parameter_type": 3
      }
     },
     "saved_object_attributes": {
      "initial": [
       ""
      ],
      "parameter_enable": 1,
      "parameter_mappable": 0
     },
     "text": "pattr sample",
     "varname": "sample"
    }
   },
   {
    "box": {
     "comment": "Bang to trigger sound",
     "id": "obj-27",
     "index": 1,
     "maxclass": "inlet",
     "numinlets": 0,
     "numoutlets": 1,
     "outlettype": [
      "bang"
     ],
     "patching_rect": [
      30.0,
      15.0,
      30.0,
      30.0
     ]
    }
   },
   {
    "box": {
     "comment": "Audio Out (multichannel)",
     "id": "obj-26",
     "index": 1,
     "maxclass": "outlet",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      42.5,
      755.0,
      30.0,
      30.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-3",
     "maxclass": "dropfile",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      111.0,
      15.0,
      180.0,
      60.0
     ],
     "presentation": 1,
     "presentation_rect": [
      146.0,
      6.0,
      110.0,
      20.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-4",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      112.5,
      186.0,
      95.0,
      22.0
     ],
     "text": "prepend replace"
    }
   },
   {
    "box": {
     "id": "obj-1",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "bang"
     ],
     "patching_rect": [
      112.5,
      215.0,
      109.0,
      22.0
     ],
     "text": "buffer~ #0-samp",
     "varname": "buffer"
    }
   },
   {
    "box": {
     "maxclass": "v8ui",
     "filename": "SamplePlayPoly.js",
     "id": "ui",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "border": 0,
     "patching_rect": [
      300.0,
      40.0,
      320.0,
      196.0
     ],
     "presentation": 1,
     "presentation_rect": [
      0.0,
      0.0,
      320.0,
      196.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route gain pan start loop loopon run open",
     "id": "vrt",
     "numinlets": 1,
     "numoutlets": 8,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      300.0,
      250.0,
      260.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "f",
     "id": "startf",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "float"
     ],
     "patching_rect": [
      460.0,
      300.0,
      30.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "pack 0. 20",
     "id": "gpk",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      300.0,
      300.0,
      70.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "id": "gln",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      300.0,
      330.0,
      46.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "mc.*~",
     "id": "gmul",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "multichannelsignal"
     ],
     "patching_rect": [
      120.0,
      560.0,
      60.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "* 0.5",
     "id": "pan1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "float"
     ],
     "patching_rect": [
      380.0,
      300.0,
      40.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "+ 0.5",
     "id": "pan2",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "float"
     ],
     "patching_rect": [
      380.0,
      330.0,
      40.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "setbuffer #0-samp",
     "id": "setb",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      640.0,
      300.0,
      120.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "loaded",
     "id": "ld",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      640.0,
      340.0,
      60.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "voice $1",
     "id": "vm",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      210.0,
      160.0,
      60.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "target 0, setloop $1 $2",
     "id": "lpmsg",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      300.0,
      400.0,
      150.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "target 0, loop $1",
     "id": "lpomsg",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      460.0,
      400.0,
      110.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "target $1, run $2",
     "id": "runmsg",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      580.0,
      400.0,
      120.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "replace",
     "id": "repmsg",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      710.0,
      250.0,
      60.0,
      22.0
     ]
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "destination": [
      "obj-1",
      0
     ],
     "source": [
      "obj-13",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-17",
      0
     ],
     "source": [
      "obj-15",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-19",
      1
     ],
     "source": [
      "obj-16",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-19",
      0
     ],
     "source": [
      "obj-16",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-16",
      1
     ],
     "source": [
      "obj-17",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-16",
      0
     ],
     "source": [
      "obj-17",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-32",
      0
     ],
     "source": [
      "obj-21",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-24",
      0
     ],
     "source": [
      "obj-22",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-30",
      1
     ],
     "source": [
      "obj-22",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-29",
      0
     ],
     "source": [
      "obj-23",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-28",
      0
     ],
     "source": [
      "obj-24",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-62",
      0
     ],
     "source": [
      "obj-27",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-30",
      0
     ],
     "source": [
      "obj-28",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-22",
      0
     ],
     "order": 1,
     "source": [
      "obj-29",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-23",
      0
     ],
     "source": [
      "obj-3",
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
     "source": [
      "obj-30",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-40",
      0
     ],
     "source": [
      "obj-32",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-49",
      0
     ],
     "source": [
      "obj-32",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-1",
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
      "obj-15",
      0
     ],
     "source": [
      "obj-40",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-15",
      0
     ],
     "source": [
      "obj-47",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-15",
      0
     ],
     "source": [
      "obj-49",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-47",
      0
     ],
     "source": [
      "obj-50",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-50",
      0
     ],
     "source": [
      "obj-62",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "ui",
      0
     ],
     "destination": [
      "vrt",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "vrt",
      0
     ],
     "destination": [
      "gpk",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gpk",
      0
     ],
     "destination": [
      "gln",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gln",
      0
     ],
     "destination": [
      "gmul",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-19",
      0
     ],
     "destination": [
      "gmul",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gmul",
      0
     ],
     "destination": [
      "obj-26",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "vrt",
      1
     ],
     "destination": [
      "pan1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pan1",
      0
     ],
     "destination": [
      "pan2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pan2",
      0
     ],
     "destination": [
      "obj-16",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "vrt",
      2
     ],
     "destination": [
      "startf",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-62",
      0
     ],
     "destination": [
      "startf",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "startf",
      0
     ],
     "destination": [
      "obj-15",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "vrt",
      3
     ],
     "destination": [
      "lpmsg",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "lpmsg",
      0
     ],
     "destination": [
      "obj-15",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "vrt",
      4
     ],
     "destination": [
      "lpomsg",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "lpomsg",
      0
     ],
     "destination": [
      "obj-15",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-50",
      0
     ],
     "destination": [
      "vm",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "vm",
      0
     ],
     "destination": [
      "ui",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-21",
      0
     ],
     "destination": [
      "setb",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "setb",
      0
     ],
     "destination": [
      "ui",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-1",
      1
     ],
     "destination": [
      "ld",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "ld",
      0
     ],
     "destination": [
      "ui",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "vrt",
      5
     ],
     "destination": [
      "runmsg",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "runmsg",
      0
     ],
     "destination": [
      "obj-15",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "vrt",
      6
     ],
     "destination": [
      "repmsg",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "repmsg",
      0
     ],
     "destination": [
      "obj-1",
      0
     ]
    }
   }
  ]
 }
}