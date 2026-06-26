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
            368.0,
            300.0,
            186.0,
            116.0
        ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "border": 0,
                    "filename": "StrangePan.js",
                    "id": "ui",
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        0.0,
                        0.0,
                        186.0,
                        116.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        0.0,
                        0.0,
                        186.0,
                        116.0
                    ],
                    "textfile": {
                        "filename": "StrangePan.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "ui"
                }
            },
            {
                "box": {
                    "comment": "Audio In (mono duplicated / stereo)",
                    "id": "in_audio",
                    "index": 0,
                    "maxclass": "inlet",
                    "patching_rect": [
                        197.0,
                        24.0,
                        30.0,
                        30.0
                    ],
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "comment": "CtrlSignalL",
                    "id": "obj-36",
                    "index": 0,
                    "maxclass": "inlet",
                    "patching_rect": [
                        429.0,
                        24.0,
                        30.0,
                        30.0
                    ],
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "comment": "CtrlSignalR",
                    "id": "obj-37",
                    "index": 0,
                    "maxclass": "inlet",
                    "patching_rect": [
                        900.0,
                        24.0,
                        30.0,
                        30.0
                    ],
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "comment": "AudioOutR",
                    "id": "obj-35",
                    "index": 0,
                    "maxclass": "outlet",
                    "patching_rect": [
                        352.0,
                        580.0,
                        30.0,
                        30.0
                    ],
                    "numinlets": 1,
                    "numoutlets": 0
                }
            },
            {
                "box": {
                    "comment": "AudioOutL",
                    "id": "obj-34",
                    "index": 0,
                    "maxclass": "outlet",
                    "patching_rect": [
                        197.0,
                        580.0,
                        30.0,
                        30.0
                    ],
                    "numinlets": 1,
                    "numoutlets": 0
                }
            },
            {
                "box": {
                    "id": "unpk",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        197.0,
                        70.0,
                        90.0,
                        22.0
                    ],
                    "text": "mc.unpack~ 2",
                    "outlettype": [
                        "signal",
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "cc",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        300.0,
                        70.0,
                        108.0,
                        22.0
                    ],
                    "text": "mc.channelcount~",
                    "outlettype": [
                        "",
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "ccsnap",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        330.0,
                        100.0,
                        90.0,
                        22.0
                    ],
                    "text": "snapshot~ 100",
                    "outlettype": [
                        "float"
                    ]
                }
            },
            {
                "box": {
                    "id": "ccclip",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        330.0,
                        128.0,
                        56.0,
                        22.0
                    ],
                    "text": "clip 1 2",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "selR",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "patching_rect": [
                        210.0,
                        128.0,
                        74.0,
                        22.0
                    ],
                    "text": "selector~ 2",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [
                        197.0,
                        159.0,
                        174.0,
                        22.0
                    ],
                    "text": "pfft~ StrangePanStereo 4096 2",
                    "outlettype": [
                        "signal",
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        429.0,
                        58.0,
                        74.0,
                        22.0
                    ],
                    "text": "snapshot~ 1",
                    "outlettype": [
                        "float"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [
                        429.0,
                        90.0,
                        87.0,
                        22.0
                    ],
                    "text": "zl.stream 2048",
                    "outlettype": [
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "sortL",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        429.0,
                        122.0,
                        60.0,
                        22.0
                    ],
                    "text": "zl.sort",
                    "outlettype": [
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "slminL",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        429.0,
                        150.0,
                        64.0,
                        22.0
                    ],
                    "text": "zl.slice 1",
                    "outlettype": [
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "slmaxL",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        499.0,
                        150.0,
                        80.0,
                        22.0
                    ],
                    "text": "zl.slice 2047",
                    "outlettype": [
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "sminL",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        429.0,
                        178.0,
                        80.0,
                        22.0
                    ],
                    "text": "slide 10. 10."
                }
            },
            {
                "box": {
                    "id": "smaxL",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        519.0,
                        178.0,
                        80.0,
                        22.0
                    ],
                    "text": "slide 10. 10."
                }
            },
            {
                "box": {
                    "id": "normL",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "patching_rect": [
                        429.0,
                        210.0,
                        330.0,
                        22.0
                    ],
                    "text": "vexpr min(max(($f1 - $f2) / max($f3 - $f2, 0.001), 0.), 1.) @scalarmode 1"
                }
            },
            {
                "box": {
                    "id": "gammaL",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        429.0,
                        238.0,
                        220.0,
                        22.0
                    ],
                    "text": "vexpr pow($f1, $f2) @scalarmode 1"
                }
            },
            {
                "box": {
                    "id": "floorL",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        429.0,
                        266.0,
                        240.0,
                        22.0
                    ],
                    "text": "vexpr $f1 * (1. - $f2) + $f2 @scalarmode 1"
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        429.0,
                        294.0,
                        56.0,
                        22.0
                    ],
                    "text": "listfunnel",
                    "outlettype": [
                        "list"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "patching_rect": [
                        429.0,
                        322.0,
                        90.0,
                        22.0
                    ],
                    "text": "peek~ panBuf1",
                    "outlettype": [
                        "float"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        429.0,
                        440.0,
                        175.0,
                        22.0
                    ],
                    "text": "buffer~ panBuf1 @samps 2048",
                    "outlettype": [
                        "float",
                        "bang"
                    ]
                }
            },
            {
                "box": {
                    "id": "cspdL",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        689.0,
                        238.0,
                        75.0,
                        22.0
                    ],
                    "text": "speedlim 50",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "cpreL",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        689.0,
                        266.0,
                        95.0,
                        22.0
                    ],
                    "text": "prepend curveL",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        900.0,
                        58.0,
                        74.0,
                        22.0
                    ],
                    "text": "snapshot~ 1",
                    "outlettype": [
                        "float"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-28",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [
                        900.0,
                        90.0,
                        87.0,
                        22.0
                    ],
                    "text": "zl.stream 2048",
                    "outlettype": [
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "sortR",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        900.0,
                        122.0,
                        60.0,
                        22.0
                    ],
                    "text": "zl.sort",
                    "outlettype": [
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "slminR",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        900.0,
                        150.0,
                        64.0,
                        22.0
                    ],
                    "text": "zl.slice 1",
                    "outlettype": [
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "slmaxR",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        970.0,
                        150.0,
                        80.0,
                        22.0
                    ],
                    "text": "zl.slice 2047",
                    "outlettype": [
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "sminR",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        900.0,
                        178.0,
                        80.0,
                        22.0
                    ],
                    "text": "slide 10. 10."
                }
            },
            {
                "box": {
                    "id": "smaxR",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        990.0,
                        178.0,
                        80.0,
                        22.0
                    ],
                    "text": "slide 10. 10."
                }
            },
            {
                "box": {
                    "id": "normR",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "patching_rect": [
                        900.0,
                        210.0,
                        330.0,
                        22.0
                    ],
                    "text": "vexpr min(max(($f1 - $f2) / max($f3 - $f2, 0.001), 0.), 1.) @scalarmode 1"
                }
            },
            {
                "box": {
                    "id": "gammaR",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        900.0,
                        238.0,
                        220.0,
                        22.0
                    ],
                    "text": "vexpr pow($f1, $f2) @scalarmode 1"
                }
            },
            {
                "box": {
                    "id": "floorR",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        900.0,
                        266.0,
                        240.0,
                        22.0
                    ],
                    "text": "vexpr $f1 * (1. - $f2) + $f2 @scalarmode 1"
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        900.0,
                        294.0,
                        56.0,
                        22.0
                    ],
                    "text": "listfunnel",
                    "outlettype": [
                        "list"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-27",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "patching_rect": [
                        900.0,
                        322.0,
                        90.0,
                        22.0
                    ],
                    "text": "peek~ panBuf2",
                    "outlettype": [
                        "float"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-25",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        900.0,
                        440.0,
                        175.0,
                        22.0
                    ],
                    "text": "buffer~ panBuf2 @samps 2048",
                    "outlettype": [
                        "float",
                        "bang"
                    ]
                }
            },
            {
                "box": {
                    "id": "cspdR",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        1160.0,
                        238.0,
                        75.0,
                        22.0
                    ],
                    "text": "speedlim 50",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "cpreR",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        1160.0,
                        266.0,
                        95.0,
                        22.0
                    ],
                    "text": "prepend curveR",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "rt",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        300.0,
                        350.0,
                        120.0,
                        22.0
                    ],
                    "text": "route floor gamma",
                    "outlettype": [
                        "",
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "load",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        43.0,
                        338.0,
                        58.0,
                        22.0
                    ],
                    "text": "loadbang",
                    "outlettype": [
                        "bang"
                    ]
                }
            },
            {
                "box": {
                    "id": "fit",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        43.0,
                        372.0,
                        138.0,
                        22.0
                    ],
                    "text": "v8 attractorFit.js ui",
                    "outlettype": [
                        ""
                    ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "source": [
                        "in_audio",
                        0
                    ],
                    "destination": [
                        "unpk",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "in_audio",
                        0
                    ],
                    "destination": [
                        "cc",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "unpk",
                        0
                    ],
                    "destination": [
                        "selR",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "unpk",
                        1
                    ],
                    "destination": [
                        "selR",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "cc",
                        1
                    ],
                    "destination": [
                        "ccsnap",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "ccsnap",
                        0
                    ],
                    "destination": [
                        "ccclip",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "ccclip",
                        0
                    ],
                    "destination": [
                        "selR",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "unpk",
                        0
                    ],
                    "destination": [
                        "obj-2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "selR",
                        0
                    ],
                    "destination": [
                        "obj-2",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-2",
                        0
                    ],
                    "destination": [
                        "obj-34",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-2",
                        1
                    ],
                    "destination": [
                        "obj-35",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-36",
                        0
                    ],
                    "destination": [
                        "obj-7",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-7",
                        0
                    ],
                    "destination": [
                        "obj-8",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-8",
                        0
                    ],
                    "destination": [
                        "sortL",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-8",
                        0
                    ],
                    "destination": [
                        "normL",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "sortL",
                        0
                    ],
                    "destination": [
                        "slminL",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "sortL",
                        0
                    ],
                    "destination": [
                        "slmaxL",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "slminL",
                        0
                    ],
                    "destination": [
                        "sminL",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "slmaxL",
                        1
                    ],
                    "destination": [
                        "smaxL",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "sminL",
                        0
                    ],
                    "destination": [
                        "normL",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "smaxL",
                        0
                    ],
                    "destination": [
                        "normL",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "normL",
                        0
                    ],
                    "destination": [
                        "gammaL",
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
                        "gammaL",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "gammaL",
                        0
                    ],
                    "destination": [
                        "floorL",
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
                        "floorL",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "floorL",
                        0
                    ],
                    "destination": [
                        "obj-14",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-14",
                        0
                    ],
                    "destination": [
                        "obj-13",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "normL",
                        0
                    ],
                    "destination": [
                        "cspdL",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "cspdL",
                        0
                    ],
                    "destination": [
                        "cpreL",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "cpreL",
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
                        "obj-37",
                        0
                    ],
                    "destination": [
                        "obj-29",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-29",
                        0
                    ],
                    "destination": [
                        "obj-28",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-28",
                        0
                    ],
                    "destination": [
                        "sortR",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-28",
                        0
                    ],
                    "destination": [
                        "normR",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "sortR",
                        0
                    ],
                    "destination": [
                        "slminR",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "sortR",
                        0
                    ],
                    "destination": [
                        "slmaxR",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "slminR",
                        0
                    ],
                    "destination": [
                        "sminR",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "slmaxR",
                        1
                    ],
                    "destination": [
                        "smaxR",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "sminR",
                        0
                    ],
                    "destination": [
                        "normR",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "smaxR",
                        0
                    ],
                    "destination": [
                        "normR",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "normR",
                        0
                    ],
                    "destination": [
                        "gammaR",
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
                        "gammaR",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "gammaR",
                        0
                    ],
                    "destination": [
                        "floorR",
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
                        "floorR",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "floorR",
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
                        "obj-26",
                        0
                    ],
                    "destination": [
                        "obj-27",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "normR",
                        0
                    ],
                    "destination": [
                        "cspdR",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "cspdR",
                        0
                    ],
                    "destination": [
                        "cpreR",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "cpreR",
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
                        "ui",
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
                        "load",
                        0
                    ],
                    "destination": [
                        "fit",
                        0
                    ]
                }
            }
        ],
        "autosave": 0,
        "dependency_cache": [
            {
                "name": "StrangePan.js",
                "type": "TEXT",
                "implicit": 1
            },
            {
                "name": "attractorFit.js",
                "type": "TEXT",
                "implicit": 1
            }
        ]
    }
}