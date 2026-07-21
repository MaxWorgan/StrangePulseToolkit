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
        "rect": [ 136.0, 180.0, 493.0, 361.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 1,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "dsp.gen",
                        "rect": [ 610.0, 475.0, 574.0, 365.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-8",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 66.0, 125.0, 41.0, 22.0 ],
                                    "text": "fixnan"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-10",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 433.0, 17.0, 114.0, 22.0 ],
                                    "text": "param smoothdown"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-9",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 66.0, 152.0, 161.0, 22.0 ],
                                    "text": "slide smoothup smoothdown"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-7",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 325.0, 17.0, 99.0, 22.0 ],
                                    "text": "param smoothup"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-6",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 66.0, 101.0, 48.0, 22.0 ],
                                    "text": "+ offset"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-5",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 66.0, 65.0, 45.0, 22.0 ],
                                    "text": "* scale"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-4",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 66.0, 184.0, 25.0, 22.0 ],
                                    "text": "out"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-3",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 66.0, 29.0, 28.0, 22.0 ],
                                    "text": "in 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-2",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 239.0, 17.0, 75.0, 22.0 ],
                                    "text": "param offset"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 156.0, 17.0, 74.0, 22.0 ],
                                    "text": "param scale"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-6", 0 ],
                                    "source": [ "obj-5", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-8", 0 ],
                                    "source": [ "obj-6", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-9", 0 ],
                                    "source": [ "obj-8", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-4", 0 ],
                                    "source": [ "obj-9", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 162.0, 565.0, 175.0, 22.0 ],
                    "text": "gen~ @title AttenuateAndScale"
                }
            },
            {
                "box": {
                    "comment": "Signal Out",
                    "id": "obj-5",
                    "index": 1,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 162.0, 611.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "annotation": "Audio Signal In",
                    "comment": "Signal In",
                    "hint": "Audio Signal In",
                    "id": "obj-4",
                    "index": 1,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 170.0, 23.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "border": 0,
                    "embedstate": [
                        [ "setstate", -1.0641509433962264, 0, 0.10566037735849057, 0 ]
                    ],
                    "filename": "AttenuateAndScale.js",
                    "id": "ui",
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 101.0, 18.0, 289.0, 213.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 289.0, 213.0 ],
                    "textfile": {
                        "filename": "AttenuateAndScale.js",
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
                    "id": "obj-fit",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 40.0, 520.0, 140.0, 22.0 ],
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
                    "id": "snIn",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 300.0, 300.0, 90.0, 22.0 ],
                    "text": "snapshot~ 1"
                }
            },
            {
                "box": {
                    "id": "zsIn",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 300.0, 330.0, 100.0, 22.0 ],
                    "text": "zl.stream 512"
                }
            },
            {
                "box": {
                    "id": "spIn",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 360.0, 80.0, 22.0 ],
                    "text": "speedlim 33"
                }
            },
            {
                "box": {
                    "id": "prIn",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 390.0, 110.0, 22.0 ],
                    "text": "prepend rawsig"
                }
            },
            {
                "box": {
                    "id": "snOut",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 430.0, 300.0, 90.0, 22.0 ],
                    "text": "snapshot~ 1"
                }
            },
            {
                "box": {
                    "id": "zsOut",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 430.0, 330.0, 100.0, 22.0 ],
                    "text": "zl.stream 512"
                }
            },
            {
                "box": {
                    "id": "spOut",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 430.0, 360.0, 80.0, 22.0 ],
                    "text": "speedlim 33"
                }
            },
            {
                "box": {
                    "id": "prOut",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 430.0, 390.0, 110.0, 22.0 ],
                    "text": "prepend outsig"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "order": 1,
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "snOut", 0 ],
                    "order": 0,
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "order": 1,
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "snIn", 0 ],
                    "order": 0,
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui", 0 ],
                    "source": [ "prIn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui", 0 ],
                    "source": [ "prOut", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "zsIn", 0 ],
                    "source": [ "snIn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "zsOut", 0 ],
                    "source": [ "snOut", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "prIn", 0 ],
                    "source": [ "spIn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "prOut", 0 ],
                    "source": [ "spOut", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "source": [ "ui", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "spIn", 0 ],
                    "source": [ "zsIn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "spOut", 0 ],
                    "source": [ "zsOut", 0 ]
                }
            }
        ]
    }
}