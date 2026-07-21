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
            59.0,
            118.0,
            440.0,
            520.0
        ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "patching_rect": [
                        186.0,
                        232.0,
                        58.0,
                        22.0
                    ],
                    "text": "loadbang"
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
                        146.0,
                        275.0,
                        130.0,
                        22.0
                    ],
                    "saved_object_attributes": {
                        "parameter_enable": 0
                    },
                    "text": "v8 attractorFit.js mmt_ui",
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
                    "comment": "trigger in",
                    "id": "obj-in",
                    "index": 1,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        40.0,
                        20.0,
                        30.0,
                        30.0
                    ]
                }
            },
            {
                "box": {
                    "border": 0,
                    "embedstate": [
                        [
                            "setstate",
                            "{\"stages\":[{\"mode\":0,\"modulo\":1,\"prob\":100,\"euSteps\":8,\"euEvents\":5,\"euPattern\":[1,0,1,1,0,1,1,0],\"repeats\":3,\"repInterval\":200,\"repDecay\":0.72,\"quantDiv\":4,\"delay\":200,\"thresh\":0.5,\"curve\":0,\"gap\":100,\"xmapAmt\":6,\"xmapInt\":120},{\"mode\":2,\"modulo\":4,\"prob\":100,\"euSteps\":8,\"euEvents\":5,\"euPattern\":[1,0,1,1,0,1,1,0],\"repeats\":3,\"repInterval\":200,\"repDecay\":0.72,\"quantDiv\":4,\"delay\":200,\"thresh\":0.5,\"curve\":0,\"gap\":100,\"xmapAmt\":6,\"xmapInt\":120}],\"tempo\":120}"
                        ]
                    ],
                    "filename": "MultiModTrigger.js",
                    "id": "obj-ui",
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "",
                        "",
                        ""
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        40.0,
                        70.0,
                        384.0,
                        108.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        0.0,
                        0.0,
                        384.0,
                        108.0
                    ],
                    "textfile": {
                        "filename": "MultiModTrigger.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "mmt_ui"
                }
            },
            {
                "box": {
                    "comment": "fired trigger",
                    "id": "obj-out0",
                    "index": 1,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40.0,
                        500.0,
                        30.0,
                        30.0
                    ]
                }
            },
            {
                "box": {
                    "comment": "alternate trigger",
                    "id": "obj-out1",
                    "index": 2,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        120.0,
                        500.0,
                        30.0,
                        30.0
                    ]
                }
            },
            {
                "box": {
                    "id": "proute",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 10,
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
                        ""
                    ],
                    "patching_rect": [
                        40.0,
                        200.0,
                        360.0,
                        22.0
                    ],
                    "text": "route pmodulo pprob peuSteps peuEvents prepeats prepInterval pdelay pquantDiv pmode"
                }
            },
            {
                "box": {
                    "id": "pat_modulo",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        40.0,
                        340.0,
                        120.0,
                        22.0
                    ],
                    "text": "pattr modulo",
                    "varname": "modulo"
                }
            },
            {
                "box": {
                    "id": "pre_modulo",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40.0,
                        370.0,
                        110.0,
                        22.0
                    ],
                    "text": "prepend smodulo"
                }
            },
            {
                "box": {
                    "id": "pat_prob",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        84.0,
                        340.0,
                        120.0,
                        22.0
                    ],
                    "text": "pattr prob",
                    "varname": "prob"
                }
            },
            {
                "box": {
                    "id": "pre_prob",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        84.0,
                        370.0,
                        110.0,
                        22.0
                    ],
                    "text": "prepend sprob"
                }
            },
            {
                "box": {
                    "id": "pat_euSteps",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        128.0,
                        340.0,
                        120.0,
                        22.0
                    ],
                    "text": "pattr euSteps",
                    "varname": "euSteps"
                }
            },
            {
                "box": {
                    "id": "pre_euSteps",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        128.0,
                        370.0,
                        110.0,
                        22.0
                    ],
                    "text": "prepend seuSteps"
                }
            },
            {
                "box": {
                    "id": "pat_euEvents",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        172.0,
                        340.0,
                        120.0,
                        22.0
                    ],
                    "text": "pattr euEvents",
                    "varname": "euEvents"
                }
            },
            {
                "box": {
                    "id": "pre_euEvents",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        172.0,
                        370.0,
                        110.0,
                        22.0
                    ],
                    "text": "prepend seuEvents"
                }
            },
            {
                "box": {
                    "id": "pat_repeats",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        216.0,
                        340.0,
                        120.0,
                        22.0
                    ],
                    "text": "pattr repeats",
                    "varname": "repeats"
                }
            },
            {
                "box": {
                    "id": "pre_repeats",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        216.0,
                        370.0,
                        110.0,
                        22.0
                    ],
                    "text": "prepend srepeats"
                }
            },
            {
                "box": {
                    "id": "pat_repInterval",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        260.0,
                        340.0,
                        120.0,
                        22.0
                    ],
                    "text": "pattr repInterval",
                    "varname": "repInterval"
                }
            },
            {
                "box": {
                    "id": "pre_repInterval",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        260.0,
                        370.0,
                        110.0,
                        22.0
                    ],
                    "text": "prepend srepInterval"
                }
            },
            {
                "box": {
                    "id": "pat_delay",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        304.0,
                        340.0,
                        120.0,
                        22.0
                    ],
                    "text": "pattr delay",
                    "varname": "delay"
                }
            },
            {
                "box": {
                    "id": "pre_delay",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        304.0,
                        370.0,
                        110.0,
                        22.0
                    ],
                    "text": "prepend sdelay"
                }
            },
            {
                "box": {
                    "id": "pat_quantDiv",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        348.0,
                        340.0,
                        120.0,
                        22.0
                    ],
                    "text": "pattr quantDiv",
                    "varname": "quantDiv"
                }
            },
            {
                "box": {
                    "id": "pre_quantDiv",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        348.0,
                        370.0,
                        110.0,
                        22.0
                    ],
                    "text": "prepend squantDiv"
                }
            },
            {
                "box": {
                    "id": "pat_mode",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        392.0,
                        340.0,
                        120.0,
                        22.0
                    ],
                    "text": "pattr mode",
                    "varname": "mode"
                }
            },
            {
                "box": {
                    "id": "pre_mode",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        392.0,
                        370.0,
                        110.0,
                        22.0
                    ],
                    "text": "prepend smode"
                }
            },
            {
                "box": {
                    "id": "pstate",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        60.0,
                        440.0,
                        180.0,
                        22.0
                    ],
                    "text": "pattr state @bindto mmt_ui",
                    "varname": "state"
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
                        "obj-1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-ui",
                        0
                    ],
                    "source": [
                        "obj-in",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-out0",
                        0
                    ],
                    "source": [
                        "obj-ui",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-out1",
                        0
                    ],
                    "source": [
                        "obj-ui",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-ui",
                        2
                    ],
                    "destination": [
                        "proute",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "proute",
                        0
                    ],
                    "destination": [
                        "pat_modulo",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "pat_modulo",
                        0
                    ],
                    "destination": [
                        "pre_modulo",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "pre_modulo",
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
                        "proute",
                        1
                    ],
                    "destination": [
                        "pat_prob",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "pat_prob",
                        0
                    ],
                    "destination": [
                        "pre_prob",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "pre_prob",
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
                        "proute",
                        2
                    ],
                    "destination": [
                        "pat_euSteps",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "pat_euSteps",
                        0
                    ],
                    "destination": [
                        "pre_euSteps",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "pre_euSteps",
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
                        "proute",
                        3
                    ],
                    "destination": [
                        "pat_euEvents",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "pat_euEvents",
                        0
                    ],
                    "destination": [
                        "pre_euEvents",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "pre_euEvents",
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
                        "proute",
                        4
                    ],
                    "destination": [
                        "pat_repeats",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "pat_repeats",
                        0
                    ],
                    "destination": [
                        "pre_repeats",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "pre_repeats",
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
                        "proute",
                        5
                    ],
                    "destination": [
                        "pat_repInterval",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "pat_repInterval",
                        0
                    ],
                    "destination": [
                        "pre_repInterval",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "pre_repInterval",
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
                        "proute",
                        6
                    ],
                    "destination": [
                        "pat_delay",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "pat_delay",
                        0
                    ],
                    "destination": [
                        "pre_delay",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "pre_delay",
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
                        "proute",
                        7
                    ],
                    "destination": [
                        "pat_quantDiv",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "pat_quantDiv",
                        0
                    ],
                    "destination": [
                        "pre_quantDiv",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "pre_quantDiv",
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
                        "proute",
                        8
                    ],
                    "destination": [
                        "pat_mode",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "pat_mode",
                        0
                    ],
                    "destination": [
                        "pre_mode",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "pre_mode",
                        0
                    ],
                    "destination": [
                        "obj-ui",
                        0
                    ]
                }
            }
        ]
    }
}