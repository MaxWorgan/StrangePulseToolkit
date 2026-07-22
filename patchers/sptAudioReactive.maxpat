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
            134.0,
            171.0,
            980.0,
            720.0
        ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "id": "lenadd",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "patching_rect": [
                        600.0,
                        440.0,
                        40.0,
                        22.0
                    ],
                    "text": "+ 10"
                }
            },
            {
                "box": {
                    "id": "leninit",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        540.0,
                        360.0,
                        40.0,
                        22.0
                    ],
                    "text": "390"
                }
            },
            {
                "box": {
                    "id": "lenpre",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        660.0,
                        470.0,
                        90.0,
                        22.0
                    ],
                    "text": "prepend length"
                }
            },
            {
                "box": {
                    "comment": "Audio In",
                    "id": "audio",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40.0,
                        35.0,
                        30.0,
                        30.0
                    ]
                }
            },
            {
                "box": {
                    "id": "follower",
                    "maxclass": "newobj",
                    "numinlets": 7,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        150.0,
                        265.0,
                        105.0,
                        22.0
                    ],
                    "text": "BandFollower~"
                }
            },
            {
                "box": {
                    "id": "trigger",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        150.0,
                        345.0,
                        118.0,
                        22.0
                    ],
                    "text": "AudioEventTrigger"
                }
            },
            {
                "box": {
                    "bgcolor": [
                        0.886,
                        0.863,
                        0.808,
                        1.0
                    ],
                    "elementcolor": [
                        0.863,
                        0.227,
                        0.106,
                        1.0
                    ],
                    "id": "envlen",
                    "knobcolor": [
                        0.863,
                        0.227,
                        0.106,
                        1.0
                    ],
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "orientation": 1,
                    "outlettype": [
                        ""
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        600.0,
                        400.0,
                        178.0,
                        16.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        306.56999999999994,
                        283.0,
                        178.0,
                        16.0
                    ],
                    "size": 1991.0,
                    "varname": "envlen"
                }
            },
            {
                "box": {
                    "comment": "Event Out",
                    "id": "event-out",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        80.0,
                        625.0,
                        30.0,
                        30.0
                    ]
                }
            },
            {
                "box": {
                    "comment": "Envelope Signal Out",
                    "id": "env-out",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        185.0,
                        625.0,
                        30.0,
                        30.0
                    ]
                }
            },
            {
                "box": {
                    "comment": "Follower Signal Out",
                    "id": "follow-out",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        300.0,
                        625.0,
                        30.0,
                        30.0
                    ]
                }
            },
            {
                "box": {
                    "id": "route",
                    "maxclass": "newobj",
                    "numinlets": 10,
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
                        420.0,
                        75.0,
                        432.0,
                        22.0
                    ],
                    "text": "route low high order attack release drive threshold hysteresis holdoff"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "low",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        420.0,
                        120.0,
                        50.0,
                        22.0
                    ],
                    "varname": "LowHz"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "high",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        475.0,
                        120.0,
                        50.0,
                        22.0
                    ],
                    "varname": "HighHz"
                }
            },
            {
                "box": {
                    "id": "order",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        530.0,
                        120.0,
                        45.0,
                        22.0
                    ],
                    "varname": "FilterOrder"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "attack",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        580.0,
                        120.0,
                        50.0,
                        22.0
                    ],
                    "varname": "FollowerAttack"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "release",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        635.0,
                        120.0,
                        50.0,
                        22.0
                    ],
                    "varname": "FollowerRelease"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "drive",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        690.0,
                        120.0,
                        50.0,
                        22.0
                    ],
                    "varname": "Drive"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "threshold",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        745.0,
                        120.0,
                        50.0,
                        22.0
                    ],
                    "varname": "Threshold"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "hysteresis",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        800.0,
                        120.0,
                        50.0,
                        22.0
                    ],
                    "varname": "Hysteresis"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "holdoff",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        855.0,
                        120.0,
                        50.0,
                        22.0
                    ],
                    "varname": "Holdoff"
                }
            },
            {
                "box": {
                    "id": "p-low",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        420.0,
                        180.0,
                        76.0,
                        22.0
                    ],
                    "text": "prepend low"
                }
            },
            {
                "box": {
                    "id": "p-high",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        500.0,
                        180.0,
                        82.0,
                        22.0
                    ],
                    "text": "prepend high"
                }
            },
            {
                "box": {
                    "id": "p-order",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        585.0,
                        180.0,
                        86.0,
                        22.0
                    ],
                    "text": "prepend order"
                }
            },
            {
                "box": {
                    "id": "p-attack",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        675.0,
                        180.0,
                        90.0,
                        22.0
                    ],
                    "text": "prepend attack"
                }
            },
            {
                "box": {
                    "id": "p-release",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        770.0,
                        180.0,
                        95.0,
                        22.0
                    ],
                    "text": "prepend release"
                }
            },
            {
                "box": {
                    "id": "p-drive",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        870.0,
                        180.0,
                        84.0,
                        22.0
                    ],
                    "text": "prepend drive"
                }
            },
            {
                "box": {
                    "id": "p-threshold",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        420.0,
                        215.0,
                        108.0,
                        22.0
                    ],
                    "text": "prepend threshold"
                }
            },
            {
                "box": {
                    "id": "p-hysteresis",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        535.0,
                        215.0,
                        112.0,
                        22.0
                    ],
                    "text": "prepend hysteresis"
                }
            },
            {
                "box": {
                    "id": "p-holdoff",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        655.0,
                        215.0,
                        101.0,
                        22.0
                    ],
                    "text": "prepend holdoff"
                }
            },
            {
                "box": {
                    "id": "snap-level",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        300.0,
                        305.0,
                        81.0,
                        22.0
                    ],
                    "text": "snapshot~ 20"
                }
            },
            {
                "box": {
                    "id": "snap-env",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        350.0,
                        455.0,
                        81.0,
                        22.0
                    ],
                    "text": "snapshot~ 20"
                }
            },
            {
                "box": {
                    "id": "level-msg",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        395.0,
                        305.0,
                        86.0,
                        22.0
                    ],
                    "text": "prepend level"
                }
            },
            {
                "box": {
                    "id": "env-msg",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        445.0,
                        455.0,
                        80.0,
                        22.0
                    ],
                    "text": "prepend env"
                }
            },
            {
                "box": {
                    "id": "event-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        300.0,
                        385.0,
                        41.0,
                        22.0
                    ],
                    "text": "event"
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
                        270.0,
                        35.0,
                        58.0,
                        22.0
                    ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "filename": "sptAudioReactiveFit.js",
                    "id": "fit",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        245.0,
                        75.0,
                        137.0,
                        22.0
                    ],
                    "saved_object_attributes": {
                        "parameter_enable": 0
                    },
                    "text": "v8 sptAudioReactiveFit.js",
                    "textfile": {
                        "filename": "sptAudioReactiveFit.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    }
                }
            },
            {
                "box": {
                    "id": "auto",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [
                        "",
                        "",
                        "",
                        ""
                    ],
                    "patching_rect": [
                        350.0,
                        35.0,
                        56.0,
                        22.0
                    ],
                    "restore": {
                        "Drive": [
                            8.452159027092705
                        ],
                        "FilterOrder": [
                            2
                        ],
                        "FollowerAttack": [
                            3.0804358957105116
                        ],
                        "FollowerRelease": [
                            160.64671923463462
                        ],
                        "HighHz": [
                            8000.0
                        ],
                        "Holdoff": [
                            100.0
                        ],
                        "Hysteresis": [
                            0.05975670484456143
                        ],
                        "LowHz": [
                            80.0
                        ],
                        "Threshold": [
                            0.09665718147542154
                        ],
                        "envlen": [
                            390
                        ]
                    },
                    "text": "autopattr",
                    "varname": "uAudioReactive"
                }
            },
            {
                "box": {
                    "bgcolor": [
                        0.925,
                        0.906,
                        0.863,
                        1.0
                    ],
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "envelope",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "EventEnvelope.maxpat",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "offset": [
                        0.0,
                        0.0
                    ],
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        307.14,
                        172.44,
                        176.86,
                        122.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        307.14,
                        172.44,
                        176.86,
                        140.56
                    ],
                    "varname": "EnvelopeEditor",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "sptAudioReactive.js",
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
                        494.0,
                        323.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        0.0,
                        0.0,
                        494.0,
                        323.0
                    ],
                    "textfile": {
                        "filename": "sptAudioReactive.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "ui"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [
                        "follower",
                        4
                    ],
                    "order": 1,
                    "source": [
                        "attack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "p-attack",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "attack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "follower",
                        0
                    ],
                    "source": [
                        "audio",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "follower",
                        6
                    ],
                    "order": 1,
                    "source": [
                        "drive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "p-drive",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "drive",
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
                        "env-msg",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "env-out",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "envelope",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "snap-env",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "envelope",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "lenadd",
                        0
                    ],
                    "source": [
                        "envlen",
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
                        "event-msg",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "follow-out",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "follower",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "snap-level",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "follower",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "trigger",
                        0
                    ],
                    "order": 2,
                    "source": [
                        "follower",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "follower",
                        2
                    ],
                    "order": 1,
                    "source": [
                        "high",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "p-high",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "high",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "p-holdoff",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "holdoff",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "trigger",
                        3
                    ],
                    "order": 1,
                    "source": [
                        "holdoff",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "p-hysteresis",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "hysteresis",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "trigger",
                        2
                    ],
                    "order": 1,
                    "source": [
                        "hysteresis",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "envelope",
                        1
                    ],
                    "order": 1,
                    "source": [
                        "lenadd",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "lenpre",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "lenadd",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "envlen",
                        0
                    ],
                    "source": [
                        "leninit",
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
                        "lenpre",
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
                        "level-msg",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "attack",
                        0
                    ],
                    "order": 5,
                    "source": [
                        "load",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "drive",
                        0
                    ],
                    "order": 3,
                    "source": [
                        "load",
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
                    "order": 10,
                    "source": [
                        "load",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "high",
                        0
                    ],
                    "order": 8,
                    "source": [
                        "load",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "holdoff",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "load",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "hysteresis",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "load",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "leninit",
                        0
                    ],
                    "order": 6,
                    "source": [
                        "load",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "low",
                        0
                    ],
                    "order": 9,
                    "source": [
                        "load",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "order",
                        0
                    ],
                    "order": 7,
                    "source": [
                        "load",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "release",
                        0
                    ],
                    "order": 4,
                    "source": [
                        "load",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "threshold",
                        0
                    ],
                    "order": 2,
                    "source": [
                        "load",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "follower",
                        1
                    ],
                    "order": 1,
                    "source": [
                        "low",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "p-low",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "low",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "follower",
                        3
                    ],
                    "order": 1,
                    "source": [
                        "order",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "p-order",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "order",
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
                        "p-attack",
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
                        "p-drive",
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
                        "p-high",
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
                        "p-holdoff",
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
                        "p-hysteresis",
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
                        "p-low",
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
                        "p-order",
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
                        "p-release",
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
                        "p-threshold",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "follower",
                        5
                    ],
                    "order": 1,
                    "source": [
                        "release",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "p-release",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "release",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "attack",
                        0
                    ],
                    "source": [
                        "route",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "drive",
                        0
                    ],
                    "source": [
                        "route",
                        5
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "high",
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
                        "holdoff",
                        0
                    ],
                    "source": [
                        "route",
                        8
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "hysteresis",
                        0
                    ],
                    "source": [
                        "route",
                        7
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "low",
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
                        "order",
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
                        "release",
                        0
                    ],
                    "source": [
                        "route",
                        4
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "threshold",
                        0
                    ],
                    "source": [
                        "route",
                        6
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "env-msg",
                        0
                    ],
                    "source": [
                        "snap-env",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "level-msg",
                        0
                    ],
                    "source": [
                        "snap-level",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "p-threshold",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "threshold",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "trigger",
                        1
                    ],
                    "order": 1,
                    "source": [
                        "threshold",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "envelope",
                        0
                    ],
                    "order": 2,
                    "source": [
                        "trigger",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "event-msg",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "trigger",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "event-out",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "trigger",
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
            }
        ],
        "autosave": 0
    }
}
