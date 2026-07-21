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
            34.0,
            99.0,
            1200.0,
            823.0
        ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "multichannelsignal"
                    ],
                    "patching_rect": [
                        27.0,
                        527.0,
                        80.0,
                        22.0
                    ],
                    "text": "mc.combine~"
                }
            },
            {
                "box": {
                    "comment": "Audio In (mono duplicated / stereo)",
                    "id": "in_audio",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        27.0,
                        40.0,
                        30.0,
                        30.0
                    ]
                }
            },
            {
                "box": {
                    "comment": "Control L",
                    "id": "in_ctlL",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        240.0,
                        40.0,
                        30.0,
                        30.0
                    ]
                }
            },
            {
                "box": {
                    "comment": "Control R",
                    "id": "in_ctlR",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        470.0,
                        40.0,
                        30.0,
                        30.0
                    ]
                }
            },
            {
                "box": {
                    "comment": "Audio Out L",
                    "id": "out_L",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        27.0,
                        860.0,
                        30.0,
                        30.0
                    ]
                }
            },
            {
                "box": {
                    "id": "unpk",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "signal"
                    ],
                    "patching_rect": [
                        27.0,
                        110.0,
                        100.0,
                        22.0
                    ],
                    "text": "mc.unpack~ 2"
                }
            },
            {
                "box": {
                    "id": "cc",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "int",
                        "signal"
                    ],
                    "patching_rect": [
                        170.0,
                        110.0,
                        120.0,
                        22.0
                    ],
                    "text": "mc.channelcount~"
                }
            },
            {
                "box": {
                    "id": "selR",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        100.0,
                        240.0,
                        90.0,
                        22.0
                    ],
                    "text": "selector~ 2"
                }
            },
            {
                "box": {
                    "id": "fffbL",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "multichannelsignal"
                    ],
                    "patching_rect": [
                        27.0,
                        320.0,
                        150.0,
                        22.0
                    ],
                    "text": "mcs.fffb~ 64 20 H 10"
                }
            },
            {
                "box": {
                    "id": "mixL",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "multichannelsignal"
                    ],
                    "patching_rect": [
                        27.0,
                        380.0,
                        110.0,
                        22.0
                    ],
                    "text": "mc.mixdown~ 1"
                }
            },
            {
                "box": {
                    "id": "fffbR",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "multichannelsignal"
                    ],
                    "patching_rect": [
                        185.0,
                        320.0,
                        150.0,
                        22.0
                    ],
                    "text": "mcs.fffb~ 64 20 H 10"
                }
            },
            {
                "box": {
                    "id": "mixR",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "multichannelsignal"
                    ],
                    "patching_rect": [
                        145.0,
                        380.0,
                        110.0,
                        22.0
                    ],
                    "text": "mc.mixdown~ 1"
                }
            },
            {
                "box": {
                    "id": "powL",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        450.0,
                        300.0,
                        200.0,
                        22.0
                    ],
                    "text": "vexpr pow($f1\\, 3.) @scalarmode 1"
                }
            },
            {
                "box": {
                    "id": "gainL",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        450.0,
                        340.0,
                        110.0,
                        22.0
                    ],
                    "text": "prepend gain 0"
                }
            },
            {
                "box": {
                    "id": "powR",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        680.0,
                        300.0,
                        200.0,
                        22.0
                    ],
                    "text": "vexpr pow($f1\\, 3.) @scalarmode 1"
                }
            },
            {
                "box": {
                    "id": "gainR",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        680.0,
                        340.0,
                        110.0,
                        22.0
                    ],
                    "text": "prepend gain 0"
                }
            },
            {
                "box": {
                    "id": "snap_L",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        250.0,
                        110.0,
                        90.0,
                        22.0
                    ],
                    "text": "snapshot~ 10"
                }
            },
            {
                "box": {
                    "id": "exp_L",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        250.0,
                        150.0,
                        140.0,
                        22.0
                    ],
                    "text": "expr $f1 * 0.5 + 0.5"
                }
            },
            {
                "box": {
                    "id": "stream_L",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        250.0,
                        190.0,
                        90.0,
                        22.0
                    ],
                    "text": "zl.stream 64"
                }
            },
            {
                "box": {
                    "id": "sort_L",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        250.0,
                        230.0,
                        80.0,
                        22.0
                    ],
                    "text": "zl.sort"
                }
            },
            {
                "box": {
                    "id": "slice1_L",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        250.0,
                        270.0,
                        80.0,
                        22.0
                    ],
                    "text": "zl.slice 1"
                }
            },
            {
                "box": {
                    "id": "slice63_L",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        340.0,
                        270.0,
                        90.0,
                        22.0
                    ],
                    "text": "zl.slice 63"
                }
            },
            {
                "box": {
                    "id": "slideA_L",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        250.0,
                        310.0,
                        90.0,
                        22.0
                    ],
                    "text": "slide 10. 10."
                }
            },
            {
                "box": {
                    "id": "slideB_L",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        340.0,
                        310.0,
                        90.0,
                        22.0
                    ],
                    "text": "slide 10. 10."
                }
            },
            {
                "box": {
                    "id": "norm_L",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        250.0,
                        360.0,
                        243.0,
                        22.0
                    ],
                    "text": "vexpr ($f1 - $f2) / ($f3 - $f2) @scalarmode 1"
                }
            },
            {
                "box": {
                    "id": "interp_L",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        250.0,
                        400.0,
                        257.0,
                        22.0
                    ],
                    "text": "vexpr $f1 * (1 - $f3) + $f2 * $f3 @scalarmode 1"
                }
            },
            {
                "box": {
                    "id": "snap_R",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        520.0,
                        110.0,
                        90.0,
                        22.0
                    ],
                    "text": "snapshot~ 10"
                }
            },
            {
                "box": {
                    "id": "exp_R",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        520.0,
                        150.0,
                        140.0,
                        22.0
                    ],
                    "text": "expr $f1 * 0.5 + 0.5"
                }
            },
            {
                "box": {
                    "id": "stream_R",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        520.0,
                        190.0,
                        90.0,
                        22.0
                    ],
                    "text": "zl.stream 64"
                }
            },
            {
                "box": {
                    "id": "sort_R",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        520.0,
                        230.0,
                        80.0,
                        22.0
                    ],
                    "text": "zl.sort"
                }
            },
            {
                "box": {
                    "id": "slice1_R",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        520.0,
                        270.0,
                        80.0,
                        22.0
                    ],
                    "text": "zl.slice 1"
                }
            },
            {
                "box": {
                    "id": "slice63_R",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        610.0,
                        270.0,
                        90.0,
                        22.0
                    ],
                    "text": "zl.slice 63"
                }
            },
            {
                "box": {
                    "id": "slideA_R",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        520.0,
                        310.0,
                        90.0,
                        22.0
                    ],
                    "text": "slide 10. 10."
                }
            },
            {
                "box": {
                    "id": "slideB_R",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        610.0,
                        310.0,
                        90.0,
                        22.0
                    ],
                    "text": "slide 10. 10."
                }
            },
            {
                "box": {
                    "id": "norm_R",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        520.0,
                        360.0,
                        243.0,
                        22.0
                    ],
                    "text": "vexpr ($f1 - $f2) / ($f3 - $f2) @scalarmode 1"
                }
            },
            {
                "box": {
                    "id": "interp_R",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        520.0,
                        400.0,
                        257.0,
                        22.0
                    ],
                    "text": "vexpr $f1 * (1 - $f3) + $f2 * $f3 @scalarmode 1"
                }
            },
            {
                "box": {
                    "border": 0,
                    "embedstate": [
                        [
                            "setstate",
                            0.5,
                            10,
                            0
                        ]
                    ],
                    "filename": "StrangeFilter.js",
                    "id": "ui",
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        800.0,
                        110.0,
                        236.0,
                        200.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        0.0,
                        0.0,
                        236.0,
                        200.0
                    ],
                    "textfile": {
                        "filename": "StrangeFilter.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "ui"
                }
            },
            {
                "box": {
                    "id": "load",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "patching_rect": [
                        800.0,
                        40.0,
                        58.0,
                        22.0
                    ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "fit",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        800.0,
                        74.0,
                        138.0,
                        22.0
                    ],
                    "text": "v8 attractorFit.js ui"
                }
            },
            {
                "box": {
                    "id": "precurveL",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        250.0,
                        460.0,
                        110.0,
                        22.0
                    ],
                    "text": "prepend curveL"
                }
            },
            {
                "box": {
                    "id": "precurveR",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        520.0,
                        460.0,
                        110.0,
                        22.0
                    ],
                    "text": "prepend curveR"
                }
            },
            {
                "box": {
                    "id": "route",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 4,
                    "outlettype": [
                        "",
                        "",
                        "",
                        ""
                    ],
                    "patching_rect": [
                        800.0,
                        360.0,
                        200.0,
                        22.0
                    ],
                    "text": "route curveL curveR expand"
                }
            },
            {
                "box": {
                    "id": "ccsnap",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        170.0,
                        150.0,
                        100.0,
                        22.0
                    ],
                    "text": "snapshot~ 100"
                }
            },
            {
                "box": {
                    "id": "ccclip",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        170.0,
                        190.0,
                        60.0,
                        22.0
                    ],
                    "text": "clip 1 2"
                }
            },
            {
                "box": {
                    "id": "pMix",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        800.0,
                        400.0,
                        60.0,
                        22.0
                    ],
                    "text": "pattr expand",
                    "varname": "expand"
                }
            },
            {
                "box": {
                    "id": "sMix",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        800.0,
                        440.0,
                        90.0,
                        22.0
                    ],
                    "text": "prepend sexpand"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [
                        "fit",
                        0
                    ],
                    "source": [
                        "load",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ccsnap",
                        0
                    ],
                    "source": [
                        "cc",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "selR",
                        0
                    ],
                    "source": [
                        "ccclip",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ccclip",
                        0
                    ],
                    "source": [
                        "ccsnap",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "stream_L",
                        0
                    ],
                    "source": [
                        "exp_L",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "stream_R",
                        0
                    ],
                    "source": [
                        "exp_R",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "mixL",
                        0
                    ],
                    "source": [
                        "fffbL",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "mixR",
                        0
                    ],
                    "source": [
                        "fffbR",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "fffbL",
                        0
                    ],
                    "source": [
                        "gainL",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "fffbR",
                        0
                    ],
                    "source": [
                        "gainR",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "cc",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "in_audio",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "unpk",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "in_audio",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "snap_L",
                        0
                    ],
                    "source": [
                        "in_ctlL",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "snap_R",
                        0
                    ],
                    "source": [
                        "in_ctlR",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "precurveL",
                        0
                    ],
                    "source": [
                        "interp_L",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "precurveR",
                        0
                    ],
                    "source": [
                        "interp_R",
                        0
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
                        "mixL",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-1",
                        1
                    ],
                    "source": [
                        "mixR",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "interp_L",
                        1
                    ],
                    "source": [
                        "norm_L",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "interp_R",
                        1
                    ],
                    "source": [
                        "norm_R",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_L",
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
                        "gainL",
                        0
                    ],
                    "source": [
                        "powL",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "gainR",
                        0
                    ],
                    "source": [
                        "powR",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui",
                        0
                    ],
                    "source": [
                        "precurveL",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui",
                        0
                    ],
                    "source": [
                        "precurveR",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "pMix",
                        0
                    ],
                    "source": [
                        "route",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "interp_L",
                        2
                    ],
                    "order": 1,
                    "source": [
                        "pMix",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "interp_R",
                        2
                    ],
                    "order": 0,
                    "source": [
                        "pMix",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "sMix",
                        0
                    ],
                    "order": 2,
                    "source": [
                        "pMix",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui",
                        0
                    ],
                    "source": [
                        "sMix",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "powL",
                        0
                    ],
                    "source": [
                        "route",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "powR",
                        0
                    ],
                    "source": [
                        "route",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "fffbR",
                        0
                    ],
                    "source": [
                        "selR",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "slideA_L",
                        0
                    ],
                    "source": [
                        "slice1_L",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "slideA_R",
                        0
                    ],
                    "source": [
                        "slice1_R",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "slideB_L",
                        0
                    ],
                    "source": [
                        "slice63_L",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "slideB_R",
                        0
                    ],
                    "source": [
                        "slice63_R",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "norm_L",
                        1
                    ],
                    "source": [
                        "slideA_L",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "norm_R",
                        1
                    ],
                    "source": [
                        "slideA_R",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "norm_L",
                        2
                    ],
                    "source": [
                        "slideB_L",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "norm_R",
                        2
                    ],
                    "source": [
                        "slideB_R",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "exp_L",
                        0
                    ],
                    "source": [
                        "snap_L",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "exp_R",
                        0
                    ],
                    "source": [
                        "snap_R",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "slice1_L",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "sort_L",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "slice63_L",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "sort_L",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "slice1_R",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "sort_R",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "slice63_R",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "sort_R",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "interp_L",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "stream_L",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "norm_L",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "stream_L",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "sort_L",
                        0
                    ],
                    "order": 2,
                    "source": [
                        "stream_L",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "interp_R",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "stream_R",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "norm_R",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "stream_R",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "sort_R",
                        0
                    ],
                    "order": 2,
                    "source": [
                        "stream_R",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "route",
                        0
                    ],
                    "source": [
                        "ui",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "fffbL",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "unpk",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "selR",
                        2
                    ],
                    "source": [
                        "unpk",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "selR",
                        1
                    ],
                    "order": 0,
                    "source": [
                        "unpk",
                        0
                    ]
                }
            }
        ],
        "autosave": 0
    }
}
