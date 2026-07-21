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
            99.0,
            1080.0,
            720.0
        ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "comment": "(signal) x \u2014 plot + RPDE + RQA. Also: attribute messages",
                    "id": "obj-inx",
                    "index": 1,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        40.0,
                        25.0,
                        30.0,
                        30.0
                    ]
                }
            },
            {
                "box": {
                    "comment": "(signal) y \u2014 RQA",
                    "id": "obj-iny",
                    "index": 2,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        90.0,
                        25.0,
                        30.0,
                        30.0
                    ]
                }
            },
            {
                "box": {
                    "comment": "(signal) z \u2014 RQA",
                    "id": "obj-inz",
                    "index": 3,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        140.0,
                        25.0,
                        30.0,
                        30.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-lb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "patching_rect": [
                        960.0,
                        25.0,
                        58.0,
                        22.0
                    ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-qmon",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        960.0,
                        55.0,
                        24.0,
                        22.0
                    ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "obj-qm",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "patching_rect": [
                        960.0,
                        85.0,
                        70.0,
                        22.0
                    ],
                    "text": "qmetro 25"
                }
            },
            {
                "box": {
                    "id": "obj-tgt",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        850.0,
                        55.0,
                        52.0,
                        22.0
                    ],
                    "text": "target 1"
                }
            },
            {
                "box": {
                    "id": "obj-pwname",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        740.0,
                        55.0,
                        86.0,
                        22.0
                    ],
                    "text": "name #0-rl"
                }
            },
            {
                "box": {
                    "id": "obj-catch",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "jit_matrix",
                        ""
                    ],
                    "patching_rect": [
                        40.0,
                        130.0,
                        312.0,
                        22.0
                    ],
                    "text": "jit.catch~ 1 @mode 2 @framesize 128 @downsample 16"
                }
            },
            {
                "box": {
                    "id": "obj-shape",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "jit_matrix",
                        ""
                    ],
                    "patching_rect": [
                        40.0,
                        165.0,
                        200.0,
                        22.0
                    ],
                    "text": "jit.matrix 1 float32 256 1 @interp 0"
                }
            },
            {
                "box": {
                    "id": "obj-pix",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "jit_gl_texture",
                        ""
                    ],
                    "patching_rect": [
                        40.0,
                        310.0,
                        380.0,
                        22.0
                    ],
                    "text": "jit.gl.pix @gen recurrence1d @drawto #0-rl @dim 256 256 @adapt 0 @automatic 0"
                }
            },
            {
                "box": {
                    "id": "obj-tbe",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "bang",
                        "bang",
                        "erase"
                    ],
                    "patching_rect": [
                        850.0,
                        115.0,
                        60.0,
                        22.0
                    ],
                    "text": "t b b erase"
                }
            },
            {
                "box": {
                    "id": "obj-render",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "bang",
                        ""
                    ],
                    "patching_rect": [
                        850.0,
                        150.0,
                        300.0,
                        22.0
                    ],
                    "text": "jit.gl.render #0-rl @erase_color 0.925 0.906 0.863 1."
                }
            },
            {
                "box": {
                    "id": "obj-pwin",
                    "maxclass": "jit.pwindow",
                    "name": "#0-rl",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "jit_matrix",
                        ""
                    ],
                    "patching_rect": [
                        850.0,
                        185.0,
                        256.0,
                        256.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        13.0,
                        25.0,
                        314.0,
                        314.0
                    ],
                    "sync": 1
                }
            },
            {
                "box": {
                    "border": 0,
                    "embedstate": [
                        [
                            "setstate",
                            "{\"eps\":0.06,\"fs\":4,\"ds\":6,\"rqa\":0,\"rpde\":0,\"ov\":{\"rr\":0,\"det\":0,\"lmax\":0,\"entr\":0,\"lam\":0,\"tt\":0},\"lmin\":2,\"vmin\":2,\"ptau\":150,\"ptmax\":1500}"
                        ]
                    ],
                    "filename": "RecurrenceLab.js",
                    "id": "obj-ui",
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        400.0,
                        350.0,
                        340.0,
                        424.0
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        0.0,
                        0.0,
                        340.0,
                        424.0
                    ],
                    "textfile": {
                        "filename": "RecurrenceLab.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "ui"
                }
            },
            {
                "box": {
                    "id": "obj-route",
                    "maxclass": "newobj",
                    "numinlets": 16,
                    "numoutlets": 16,
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
                        "",
                        "",
                        "",
                        "",
                        ""
                    ],
                    "patching_rect": [
                        400.0,
                        90.0,
                        620.0,
                        22.0
                    ],
                    "text": "route eps framesize downsample rqaon rpdeon ovdet ovlam ovlmax ovtt oventr lmin vmin tau tmax hold"
                }
            },
            {
                "box": {
                    "id": "obj-mlmin",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1020.0,
                        125.0,
                        180.0,
                        22.0
                    ],
                    "text": "diagonal_line_min_length $1"
                }
            },
            {
                "box": {
                    "id": "obj-mvmin",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1020.0,
                        155.0,
                        172.0,
                        22.0
                    ],
                    "text": "vertical_line_min_length $1"
                }
            },
            {
                "box": {
                    "id": "obj-mrtau",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1020.0,
                        185.0,
                        52.0,
                        22.0
                    ],
                    "text": "tau $1"
                }
            },
            {
                "box": {
                    "id": "obj-mrtmax",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1020.0,
                        215.0,
                        60.0,
                        22.0
                    ],
                    "text": "tmax $1"
                }
            },
            {
                "box": {
                    "id": "obj-mlmax",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        950.0,
                        125.0,
                        58.0,
                        22.0
                    ],
                    "text": "lmax $1"
                }
            },
            {
                "box": {
                    "id": "obj-mtt",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        950.0,
                        155.0,
                        44.0,
                        22.0
                    ],
                    "text": "tt $1"
                }
            },
            {
                "box": {
                    "id": "obj-mentr",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        950.0,
                        185.0,
                        54.0,
                        22.0
                    ],
                    "text": "entr $1"
                }
            },
            {
                "box": {
                    "id": "obj-mdet",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        880.0,
                        125.0,
                        50.0,
                        22.0
                    ],
                    "text": "det $1"
                }
            },
            {
                "box": {
                    "id": "obj-mlam",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        880.0,
                        155.0,
                        52.0,
                        22.0
                    ],
                    "text": "lam $1"
                }
            },
            {
                "box": {
                    "id": "obj-meps",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        400.0,
                        125.0,
                        50.0,
                        22.0
                    ],
                    "text": "eps $1"
                }
            },
            {
                "box": {
                    "id": "obj-mepsilon",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        400.0,
                        155.0,
                        72.0,
                        22.0
                    ],
                    "text": "epsilon $1"
                }
            },
            {
                "box": {
                    "id": "obj-mthresh",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        400.0,
                        185.0,
                        82.0,
                        22.0
                    ],
                    "text": "threshold $1"
                }
            },
            {
                "box": {
                    "id": "obj-mfs",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        490.0,
                        125.0,
                        86.0,
                        22.0
                    ],
                    "text": "framesize $1"
                }
            },
            {
                "box": {
                    "id": "obj-mds",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        590.0,
                        125.0,
                        96.0,
                        22.0
                    ],
                    "text": "downsample $1"
                }
            },
            {
                "box": {
                    "id": "obj-msub",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        590.0,
                        155.0,
                        130.0,
                        22.0
                    ],
                    "text": "subsample_factor $1"
                }
            },
            {
                "box": {
                    "id": "obj-invrqa",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "patching_rect": [
                        700.0,
                        125.0,
                        36.0,
                        22.0
                    ],
                    "text": "!- 1"
                }
            },
            {
                "box": {
                    "id": "obj-mmuterqa",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        700.0,
                        155.0,
                        68.0,
                        22.0
                    ],
                    "text": "mute 1 $1"
                }
            },
            {
                "box": {
                    "id": "obj-invrpde",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "patching_rect": [
                        790.0,
                        125.0,
                        36.0,
                        22.0
                    ],
                    "text": "!- 1"
                }
            },
            {
                "box": {
                    "id": "obj-mmuterpde",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        790.0,
                        155.0,
                        68.0,
                        22.0
                    ],
                    "text": "mute 1 $1"
                }
            },
            {
                "box": {
                    "id": "obj-prpde",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "signal",
                        "signal",
                        "signal"
                    ],
                    "patching_rect": [
                        40.0,
                        640.0,
                        130.0,
                        22.0
                    ],
                    "text": "poly~ _rpdePoly 1"
                }
            },
            {
                "box": {
                    "id": "obj-prqa",
                    "maxclass": "newobj",
                    "numinlets": 3,
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
                        220.0,
                        640.0,
                        160.0,
                        22.0
                    ],
                    "text": "poly~ _rqaPoly 1"
                }
            },
            {
                "box": {
                    "id": "obj-snp0",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        40.0,
                        680.0,
                        90.0,
                        22.0
                    ],
                    "text": "snapshot~ 50"
                }
            },
            {
                "box": {
                    "id": "obj-snp1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        140.0,
                        680.0,
                        90.0,
                        22.0
                    ],
                    "text": "snapshot~ 50"
                }
            },
            {
                "box": {
                    "id": "obj-snp2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        240.0,
                        680.0,
                        90.0,
                        22.0
                    ],
                    "text": "snapshot~ 50"
                }
            },
            {
                "box": {
                    "id": "obj-prr0",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40.0,
                        712.0,
                        88.0,
                        22.0
                    ],
                    "text": "prepend rpde"
                }
            },
            {
                "box": {
                    "id": "obj-prr1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        140.0,
                        712.0,
                        95.0,
                        22.0
                    ],
                    "text": "prepend period"
                }
            },
            {
                "box": {
                    "id": "obj-prr2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        240.0,
                        712.0,
                        85.0,
                        22.0
                    ],
                    "text": "prepend diag"
                }
            },
            {
                "box": {
                    "id": "obj-snq0",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        400.0,
                        500.0,
                        90.0,
                        22.0
                    ],
                    "text": "snapshot~ 50"
                }
            },
            {
                "box": {
                    "id": "obj-snq1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        500.0,
                        500.0,
                        90.0,
                        22.0
                    ],
                    "text": "snapshot~ 50"
                }
            },
            {
                "box": {
                    "id": "obj-snq2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        600.0,
                        500.0,
                        90.0,
                        22.0
                    ],
                    "text": "snapshot~ 50"
                }
            },
            {
                "box": {
                    "id": "obj-snq3",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        700.0,
                        500.0,
                        90.0,
                        22.0
                    ],
                    "text": "snapshot~ 50"
                }
            },
            {
                "box": {
                    "id": "obj-snq4",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        800.0,
                        500.0,
                        90.0,
                        22.0
                    ],
                    "text": "snapshot~ 50"
                }
            },
            {
                "box": {
                    "id": "obj-snq5",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        900.0,
                        500.0,
                        90.0,
                        22.0
                    ],
                    "text": "snapshot~ 50"
                }
            },
            {
                "box": {
                    "id": "obj-prq0",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        400.0,
                        532.0,
                        75.0,
                        22.0
                    ],
                    "text": "prepend rr"
                }
            },
            {
                "box": {
                    "id": "obj-prq1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        500.0,
                        532.0,
                        80.0,
                        22.0
                    ],
                    "text": "prepend det"
                }
            },
            {
                "box": {
                    "id": "obj-prq2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        600.0,
                        532.0,
                        90.0,
                        22.0
                    ],
                    "text": "prepend lmax"
                }
            },
            {
                "box": {
                    "id": "obj-prq3",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        700.0,
                        532.0,
                        88.0,
                        22.0
                    ],
                    "text": "prepend entr"
                }
            },
            {
                "box": {
                    "id": "obj-prq4",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        800.0,
                        532.0,
                        85.0,
                        22.0
                    ],
                    "text": "prepend lam"
                }
            },
            {
                "box": {
                    "id": "obj-prq5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        900.0,
                        532.0,
                        75.0,
                        22.0
                    ],
                    "text": "prepend tt"
                }
            },
            {
                "box": {
                    "comment": "metric messages: rpde/period/diag/rr/det/lmax/entr/lam/tt <v>",
                    "id": "obj-out",
                    "index": 1,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        540.0,
                        620.0,
                        30.0,
                        30.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-vp",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "jit_matrix",
                        ""
                    ],
                    "patching_rect": [
                        40.0,
                        345.0,
                        320.0,
                        22.0
                    ],
                    "text": "jit.gl.videoplane #0-rl @transform_reset 2 @interp 0"
                }
            },
            {
                "box": {
                    "id": "obj-gate",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        760.0,
                        115.0,
                        60.0,
                        22.0
                    ],
                    "text": "gate 1 1",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-holdt",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        1120.0,
                        125.0,
                        50.0,
                        22.0
                    ],
                    "text": "t b f",
                    "outlettype": [
                        "bang",
                        "float"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-holddel",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        1120.0,
                        185.0,
                        60.0,
                        22.0
                    ],
                    "text": "del 500",
                    "outlettype": [
                        "bang"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-g0",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        1180.0,
                        155.0,
                        30.0,
                        22.0
                    ],
                    "text": "0",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-g1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        1120.0,
                        215.0,
                        30.0,
                        22.0
                    ],
                    "text": "1",
                    "outlettype": [
                        ""
                    ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [
                        "obj-shape",
                        0
                    ],
                    "source": [
                        "obj-catch",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mmuterpde",
                        0
                    ],
                    "source": [
                        "obj-invrpde",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mmuterqa",
                        0
                    ],
                    "source": [
                        "obj-invrqa",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-catch",
                        0
                    ],
                    "order": 2,
                    "source": [
                        "obj-inx",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prpde",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "obj-inx",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prqa",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "obj-inx",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prqa",
                        1
                    ],
                    "source": [
                        "obj-iny",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prqa",
                        2
                    ],
                    "source": [
                        "obj-inz",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-qmon",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "obj-lb",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-tgt",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "obj-lb",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-pwname",
                        0
                    ],
                    "source": [
                        "obj-lb",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-pwin",
                        0
                    ],
                    "source": [
                        "obj-pwname",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-pix",
                        0
                    ],
                    "source": [
                        "obj-mdet",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-catch",
                        0
                    ],
                    "source": [
                        "obj-mds",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-pix",
                        0
                    ],
                    "source": [
                        "obj-mentr",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-pix",
                        0
                    ],
                    "source": [
                        "obj-meps",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prpde",
                        0
                    ],
                    "source": [
                        "obj-mepsilon",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-catch",
                        0
                    ],
                    "source": [
                        "obj-mfs",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-pix",
                        0
                    ],
                    "source": [
                        "obj-mlam",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-pix",
                        0
                    ],
                    "source": [
                        "obj-mlmax",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prqa",
                        0
                    ],
                    "source": [
                        "obj-mlmin",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prpde",
                        0
                    ],
                    "source": [
                        "obj-mmuterpde",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prqa",
                        0
                    ],
                    "source": [
                        "obj-mmuterqa",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prpde",
                        0
                    ],
                    "source": [
                        "obj-mrtau",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prpde",
                        0
                    ],
                    "source": [
                        "obj-mrtmax",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prpde",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "obj-msub",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prqa",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "obj-msub",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prqa",
                        0
                    ],
                    "source": [
                        "obj-mthresh",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-pix",
                        0
                    ],
                    "source": [
                        "obj-mtt",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prqa",
                        0
                    ],
                    "source": [
                        "obj-mvmin",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-snp0",
                        0
                    ],
                    "source": [
                        "obj-prpde",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-snp1",
                        0
                    ],
                    "source": [
                        "obj-prpde",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-snp2",
                        0
                    ],
                    "source": [
                        "obj-prpde",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-out",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "obj-prq0",
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
                    "order": 1,
                    "source": [
                        "obj-prq0",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-out",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "obj-prq1",
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
                    "order": 1,
                    "source": [
                        "obj-prq1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-out",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "obj-prq2",
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
                    "order": 1,
                    "source": [
                        "obj-prq2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-out",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "obj-prq3",
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
                    "order": 1,
                    "source": [
                        "obj-prq3",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-out",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "obj-prq4",
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
                    "order": 1,
                    "source": [
                        "obj-prq4",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-out",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "obj-prq5",
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
                    "order": 1,
                    "source": [
                        "obj-prq5",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-snq0",
                        0
                    ],
                    "source": [
                        "obj-prqa",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-snq1",
                        0
                    ],
                    "source": [
                        "obj-prqa",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-snq2",
                        0
                    ],
                    "source": [
                        "obj-prqa",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-snq3",
                        0
                    ],
                    "source": [
                        "obj-prqa",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-snq4",
                        0
                    ],
                    "source": [
                        "obj-prqa",
                        4
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-snq5",
                        0
                    ],
                    "source": [
                        "obj-prqa",
                        5
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-out",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "obj-prr0",
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
                    "order": 1,
                    "source": [
                        "obj-prr0",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-out",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "obj-prr1",
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
                    "order": 1,
                    "source": [
                        "obj-prr1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-out",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "obj-prr2",
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
                    "order": 1,
                    "source": [
                        "obj-prr2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-tbe",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "obj-qm",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-qm",
                        0
                    ],
                    "source": [
                        "obj-qmon",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-invrpde",
                        0
                    ],
                    "source": [
                        "obj-route",
                        4
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-invrqa",
                        0
                    ],
                    "source": [
                        "obj-route",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mdet",
                        0
                    ],
                    "source": [
                        "obj-route",
                        5
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mds",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "obj-route",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mentr",
                        0
                    ],
                    "source": [
                        "obj-route",
                        9
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-meps",
                        0
                    ],
                    "order": 2,
                    "source": [
                        "obj-route",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mepsilon",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "obj-route",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mfs",
                        0
                    ],
                    "source": [
                        "obj-route",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mlam",
                        0
                    ],
                    "source": [
                        "obj-route",
                        6
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mlmax",
                        0
                    ],
                    "source": [
                        "obj-route",
                        7
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mlmin",
                        0
                    ],
                    "source": [
                        "obj-route",
                        10
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mrtau",
                        0
                    ],
                    "source": [
                        "obj-route",
                        12
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mrtmax",
                        0
                    ],
                    "source": [
                        "obj-route",
                        13
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-msub",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "obj-route",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mthresh",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "obj-route",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mtt",
                        0
                    ],
                    "source": [
                        "obj-route",
                        8
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-mvmin",
                        0
                    ],
                    "source": [
                        "obj-route",
                        11
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prr0",
                        0
                    ],
                    "source": [
                        "obj-snp0",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prr1",
                        0
                    ],
                    "source": [
                        "obj-snp1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prr2",
                        0
                    ],
                    "source": [
                        "obj-snp2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prq0",
                        0
                    ],
                    "source": [
                        "obj-snq0",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prq1",
                        0
                    ],
                    "source": [
                        "obj-snq1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prq2",
                        0
                    ],
                    "source": [
                        "obj-snq2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prq3",
                        0
                    ],
                    "source": [
                        "obj-snq3",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prq4",
                        0
                    ],
                    "source": [
                        "obj-snq4",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prq5",
                        0
                    ],
                    "source": [
                        "obj-snq5",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prpde",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "obj-tgt",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prqa",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "obj-tgt",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-route",
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
                        "obj-render",
                        0
                    ],
                    "source": [
                        "obj-tbe",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-gate",
                        1
                    ],
                    "source": [
                        "obj-tbe",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-render",
                        0
                    ],
                    "source": [
                        "obj-tbe",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-pix",
                        0
                    ],
                    "source": [
                        "obj-shape",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-vp",
                        0
                    ],
                    "source": [
                        "obj-pix",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-gate",
                        0
                    ],
                    "destination": [
                        "obj-catch",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route",
                        14
                    ],
                    "destination": [
                        "obj-holdt",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-holdt",
                        1
                    ],
                    "destination": [
                        "obj-holddel",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-holdt",
                        0
                    ],
                    "destination": [
                        "obj-g0",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-holdt",
                        0
                    ],
                    "destination": [
                        "obj-holddel",
                        0
                    ],
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-g0",
                        0
                    ],
                    "destination": [
                        "obj-gate",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-holddel",
                        0
                    ],
                    "destination": [
                        "obj-g1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-g1",
                        0
                    ],
                    "destination": [
                        "obj-gate",
                        0
                    ]
                }
            }
        ]
    }
}