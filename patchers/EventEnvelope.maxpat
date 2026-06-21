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
        "rect": [ 649.0, 371.0, 445.0, 551.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 118.0, 22.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "comment": "Event In",
                    "id": "event",
                    "index": 1,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 45.0, 35.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "Length (ms)",
                    "id": "len",
                    "index": 2,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 200.0, 35.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "filename": "envScale.js",
                    "id": "setdom",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 80.0, 110.0, 22.0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0
                    },
                    "text": "v8 envScale.js",
                    "textfile": {
                        "filename": "envScale.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    }
                }
            },
            {
                "box": {
                    "addpoints_with_curve": [ 0.0, 0.0, 0, 0.0, 219.21546961325967, 0.6336633663366337, 0, 0.4, 705.2588548903966, 0.798498507773522, 0, 0.0, 760.8066298342542, 0.26732673267326734, 0, 0.6449999999999998, 1167.0, 0.0, 0, 0.0 ],
                    "bgcolor": [ 0.0863, 0.0863, 0.0941, 0.0 ],
                    "classic_curve": 1,
                    "domain": 1167.0,
                    "gridcolor": [ 0.1725, 0.1725, 0.1922, 1.0 ],
                    "id": "function",
                    "linecolor": [ 0.7216, 1.0, 0.3608, 1.0 ],
                    "maxclass": "function",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "float", "", "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 96.0, 136.0, 197.0, 107.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 197.0, 107.0 ],
                    "textcolor": [ 0.26666666666666666, 0.26666666666666666, 0.26666666666666666, 1.0 ],
                    "varname": "Envelope"
                }
            },
            {
                "box": {
                    "id": "curve",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 96.0, 314.0, 50.0, 22.0 ],
                    "text": "curve~"
                }
            },
            {
                "box": {
                    "comment": "Envelope Signal Out",
                    "id": "out",
                    "index": 1,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 78.0, 402.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "load",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 405.0, 35.0, 58.0, 22.0 ],
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
                    "outlettype": [ "" ],
                    "patching_rect": [ 355.0, 250.0, 160.0, 22.0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0
                    },
                    "text": "v8 attractorFit.js Envelope",
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
                    "id": "auto",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 466.0, 143.0, 56.0, 22.0 ],
                    "restore": {
                        "Envelope": [ 1167.0, 0.0, 1.0, 0.0, 0.0, 0, 0.0, 219.21546961325967, 0.6336633663366337, 0, 0.4, 705.2588548903966, 0.798498507773522, 0, 0.0, 760.8066298342542, 0.26732673267326734, 0, 0.6449999999999998, 1167.0, 0.0, 0, 0.0, "curve" ]
                    },
                    "text": "autopattr",
                    "varname": "uEventEnvelope"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "out", 0 ],
                    "source": [ "curve", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "function", 0 ],
                    "source": [ "event", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "setdom", 0 ],
                    "source": [ "function", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "setdom", 1 ],
                    "source": [ "len", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "fit", 0 ],
                    "source": [ "load", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "function", 0 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "curve", 0 ],
                    "source": [ "setdom", 0 ]
                }
            }
        ]
    }
}