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
            42.0,
            107.0,
            1386.0,
            808.0
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
                    "id": "vt",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "bang",
                        "float"
                    ],
                    "patching_rect": [
                        32.0,
                        60.0,
                        40.0,
                        22.0
                    ],
                    "text": "t b f"
                }
            },
            {
                "box": {
                    "id": "vsel",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "bang",
                        ""
                    ],
                    "patching_rect": [
                        234.0,
                        67.0,
                        44.0,
                        22.0
                    ],
                    "text": "sel 0."
                }
            },
            {
                "box": {
                    "id": "vone",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        234.0,
                        98.0,
                        28.0,
                        22.0
                    ],
                    "text": "1."
                }
            },
            {
                "box": {
                    "id": "vpack",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        154.0,
                        291.0,
                        80.0,
                        22.0
                    ],
                    "text": "pack 0 1."
                }
            },
            {
                "box": {
                    "id": "vpre",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        154.0,
                        315.0,
                        90.0,
                        22.0
                    ],
                    "text": "prepend voice"
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
                        155.0,
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
                        109.5,
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
                    "numoutlets": 3,
                    "outlettype": [
                        "bang",
                        "bang",
                        "bang"
                    ],
                    "patching_rect": [
                        132.0,
                        388.0,
                        58.0,
                        22.0
                    ],
                    "text": "t b b b"
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
                        79.5,
                        181.0,
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
                        149.0,
                        139.0,
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
                        683.0,
                        128.0,
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
                        683.0,
                        90.0,
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
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
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
                    "index": 0,
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
                        683.0,
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
                        79.5,
                        211.0,
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
                        79.5,
                        240.0,
                        109.0,
                        22.0
                    ],
                    "text": "buffer~ #0-samp",
                    "varname": "buffer"
                }
            },
            {
                "box": {
                    "id": "chinfo",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 10,
                    "outlettype": [
                        "float",
                        "list",
                        "float",
                        "float",
                        "float",
                        "float",
                        "float",
                        "",
                        "int",
                        ""
                    ],
                    "patching_rect": [
                        210.0,
                        240.0,
                        96.0,
                        22.0
                    ],
                    "text": "info~ #0-samp"
                }
            },
            {
                "box": {
                    "id": "chclip",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        210.0,
                        275.0,
                        50.0,
                        22.0
                    ],
                    "text": "clip 1 2"
                }
            },
            {
                "box": {
                    "id": "rchmsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        210.0,
                        310.0,
                        120.0,
                        22.0
                    ],
                    "text": "target 0, rch $1"
                }
            },
            {
                "box": {
                    "border": 0,
                    "embedstate": [
                        [
                            "setstate",
                            "{\"gain\":0,\"pan\":0,\"startPt\":0,\"endPt\":1,\"envA\":0,\"envD\":0.98,\"curveA\":0,\"curveD\":0,\"envShown\":1,\"nvoices\":8,\"moddepth\":0.25}"
                        ]
                    ],
                    "filename": "SamplePlayPoly.js",
                    "id": "ui",
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        280.0,
                        52.0,
                        320.0,
                        196.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        0.0,
                        0.0,
                        320.0,
                        196.0
                    ],
                    "textfile": {
                        "filename": "SamplePlayPoly.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "ui"
                }
            },
            {
                "box": {
                    "filename": "attractorFit.js",
                    "id": "fit",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        640.0,
                        52.0,
                        150.0,
                        22.0
                    ],
                    "saved_object_attributes": {
                        "parameter_enable": 0
                    },
                    "text": "v8 attractorFit.js ui",
                    "textfile": {
                        "filename": "attractorFit.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    }
                }
            },
            {
                "box": {
                    "id": "vrt",
                    "maxclass": "newobj",
                    "numinlets": 12,
                    "numoutlets": 12,
                    "outlettype": [
                        "",
                        "",
                        "",
                        "",
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
                        400.0,
                        22.0
                    ],
                    "text": "route gain pan start loop loopon run open venv voices modscale modmax"
                }
            },
            {
                "box": {
                    "id": "vmax",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        560.0,
                        290.0,
                        60.0,
                        22.0
                    ],
                    "text": "max $1"
                }
            },
            {
                "box": {
                    "id": "startf",
                    "maxclass": "newobj",
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
                    ],
                    "text": "f"
                }
            },
            {
                "box": {
                    "id": "gpk",
                    "maxclass": "newobj",
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
                    ],
                    "text": "pack 0. 20"
                }
            },
            {
                "box": {
                    "id": "gln",
                    "maxclass": "newobj",
                    "numinlets": 2,
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
                    ],
                    "text": "line~"
                }
            },
            {
                "box": {
                    "id": "gmul",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "multichannelsignal"
                    ],
                    "patching_rect": [
                        43.0,
                        704.0,
                        60.0,
                        22.0
                    ],
                    "text": "mc.*~"
                }
            },
            {
                "box": {
                    "id": "pan1",
                    "maxclass": "newobj",
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
                    ],
                    "text": "* 0.5"
                }
            },
            {
                "box": {
                    "id": "pan2",
                    "maxclass": "newobj",
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
                    ],
                    "text": "+ 0.5"
                }
            },
            {
                "box": {
                    "id": "setb",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        280.0,
                        10.0,
                        120.0,
                        22.0
                    ],
                    "text": "setbuffer #0-samp"
                }
            },
            {
                "box": {
                    "id": "ld",
                    "maxclass": "message",
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
                    ],
                    "text": "loaded"
                }
            },
            {
                "box": {
                    "id": "lpmsg",
                    "maxclass": "message",
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
                    ],
                    "text": "target 0, setloop $1 $2"
                }
            },
            {
                "box": {
                    "id": "lpomsg",
                    "maxclass": "message",
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
                    ],
                    "text": "target 0, loop $1"
                }
            },
            {
                "box": {
                    "id": "runmsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        580.0,
                        400.0,
                        130.0,
                        22.0
                    ],
                    "text": "target $1, run $2 $3"
                }
            },
            {
                "box": {
                    "id": "tll",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        580.0,
                        430.0,
                        40.0,
                        22.0
                    ],
                    "text": "t l l"
                }
            },
            {
                "box": {
                    "id": "slL",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        560.0,
                        460.0,
                        70.0,
                        22.0
                    ],
                    "text": "zl.slice 1"
                }
            },
            {
                "box": {
                    "id": "ptgt",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        560.0,
                        490.0,
                        90.0,
                        22.0
                    ],
                    "text": "prepend target"
                }
            },
            {
                "box": {
                    "id": "slR",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        660.0,
                        460.0,
                        70.0,
                        22.0
                    ],
                    "text": "zl.slice 1"
                }
            },
            {
                "box": {
                    "id": "prun",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        660.0,
                        490.0,
                        80.0,
                        22.0
                    ],
                    "text": "prepend run"
                }
            },
            {
                "box": {
                    "id": "repmsg",
                    "maxclass": "message",
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
                    ],
                    "text": "replace"
                }
            },
            {
                "box": {
                    "comment": "Start mod (-1..1 signal)",
                    "id": "modin",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        900.0,
                        300.0,
                        30.0,
                        30.0
                    ]
                }
            },
            {
                "box": {
                    "id": "modsnap",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        900.0,
                        345.0,
                        90.0,
                        22.0
                    ],
                    "text": "snapshot~ 50"
                }
            },
            {
                "box": {
                    "id": "modchg",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "",
                        "int",
                        "int"
                    ],
                    "patching_rect": [
                        900.0,
                        380.0,
                        61.0,
                        22.0
                    ],
                    "text": "change 0."
                }
            },
            {
                "box": {
                    "id": "modpre",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        900.0,
                        415.0,
                        110.0,
                        22.0
                    ],
                    "text": "prepend startmod"
                }
            },
            {
                "box": {
                    "id": "modexpr",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        460.0,
                        345.0,
                        208.0,
                        22.0
                    ],
                    "text": "expr min(max($f1 + $f2 * $f3\\, 0.)\\, $f4)"
                }
            },
            {
                "box": {
                    "id": "loadrt",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        30.0,
                        33.0,
                        90.0,
                        22.0
                    ],
                    "text": "route load"
                }
            },
            {
                "box": {
                    "id": "gpat",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        300.0,
                        470.0,
                        130.0,
                        22.0
                    ],
                    "text": "pattr gain",
                    "varname": "gain"
                }
            },
            {
                "box": {
                    "id": "gdb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        300.0,
                        500.0,
                        50.0,
                        22.0
                    ],
                    "text": "dbtoa"
                }
            },
            {
                "box": {
                    "id": "gpre",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        360.0,
                        500.0,
                        80.0,
                        22.0
                    ],
                    "text": "prepend gain"
                }
            },
            {
                "box": {
                    "id": "ppat",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        470.0,
                        470.0,
                        120.0,
                        22.0
                    ],
                    "text": "pattr pan",
                    "varname": "pan"
                }
            },
            {
                "box": {
                    "id": "ppre",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        470.0,
                        500.0,
                        80.0,
                        22.0
                    ],
                    "text": "prepend pan"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [
                        "rchmsg",
                        0
                    ],
                    "source": [
                        "chclip",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "chclip",
                        0
                    ],
                    "source": [
                        "chinfo",
                        8
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "gmul",
                        1
                    ],
                    "source": [
                        "gln",
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
                        "gmul",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "gln",
                        0
                    ],
                    "source": [
                        "gpk",
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
                        "ld",
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
                        "loadrt",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "vt",
                        0
                    ],
                    "source": [
                        "loadrt",
                        1
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
                        "lpmsg",
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
                        "lpomsg",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "modpre",
                        0
                    ],
                    "source": [
                        "modchg",
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
                        "modexpr",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "modsnap",
                        0
                    ],
                    "source": [
                        "modin",
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
                        "modpre",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "modchg",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "modsnap",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "modexpr",
                        1
                    ],
                    "order": 1,
                    "source": [
                        "modsnap",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "chinfo",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "obj-1",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ld",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "obj-1",
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
                        "gmul",
                        0
                    ],
                    "source": [
                        "obj-19",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "fit",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "obj-21",
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
                    "order": 1,
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
                        "loadrt",
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
                        "setb",
                        0
                    ],
                    "source": [
                        "obj-32",
                        2
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
                    "order": 1,
                    "source": [
                        "obj-50",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "vpack",
                        0
                    ],
                    "order": 0,
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
                    "destination": [
                        "startf",
                        0
                    ],
                    "source": [
                        "obj-62",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "pan2",
                        0
                    ],
                    "source": [
                        "pan1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-16",
                        2
                    ],
                    "source": [
                        "pan2",
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
                        "prun",
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
                        "ptgt",
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
                        "rchmsg",
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
                        "repmsg",
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
                        "runmsg",
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
                        "setb",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ptgt",
                        0
                    ],
                    "source": [
                        "slL",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "prun",
                        0
                    ],
                    "source": [
                        "slR",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "modexpr",
                        0
                    ],
                    "source": [
                        "startf",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "slL",
                        0
                    ],
                    "source": [
                        "tll",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "slR",
                        0
                    ],
                    "source": [
                        "tll",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "vrt",
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
                        "obj-50",
                        0
                    ],
                    "source": [
                        "vmax",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "vpack",
                        1
                    ],
                    "source": [
                        "vone",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "vpre",
                        0
                    ],
                    "source": [
                        "vpack",
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
                        "vpre",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "gpat",
                        0
                    ],
                    "source": [
                        "vrt",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "gdb",
                        0
                    ],
                    "source": [
                        "gpat",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "gpk",
                        0
                    ],
                    "source": [
                        "gdb",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "gpre",
                        0
                    ],
                    "source": [
                        "gpat",
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
                        "gpre",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "lpmsg",
                        0
                    ],
                    "source": [
                        "vrt",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "lpomsg",
                        0
                    ],
                    "source": [
                        "vrt",
                        4
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "modexpr",
                        3
                    ],
                    "source": [
                        "vrt",
                        10
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "modexpr",
                        2
                    ],
                    "source": [
                        "vrt",
                        9
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ppat",
                        0
                    ],
                    "source": [
                        "vrt",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "pan1",
                        0
                    ],
                    "source": [
                        "ppat",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ppre",
                        0
                    ],
                    "source": [
                        "ppat",
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
                        "ppre",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "repmsg",
                        0
                    ],
                    "source": [
                        "vrt",
                        6
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "runmsg",
                        0
                    ],
                    "source": [
                        "vrt",
                        5
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "startf",
                        1
                    ],
                    "source": [
                        "vrt",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "tll",
                        0
                    ],
                    "source": [
                        "vrt",
                        7
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "vmax",
                        0
                    ],
                    "source": [
                        "vrt",
                        8
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "vone",
                        0
                    ],
                    "source": [
                        "vsel",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "vpack",
                        1
                    ],
                    "source": [
                        "vsel",
                        1
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
                        "vt",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "vsel",
                        0
                    ],
                    "source": [
                        "vt",
                        1
                    ]
                }
            }
        ],
        "parameters": {
            "obj-23": [
                "sample",
                "sample",
                0
            ],
            "parameterbanks": {
                "0": {
                    "index": 0,
                    "name": "",
                    "parameters": [
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-"
                    ],
                    "buttons": [
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-"
                    ]
                }
            },
            "inherited_shortname": 1
        },
        "autosave": 0
    }
}