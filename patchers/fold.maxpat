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
        "rect": [ 41.0, 107.0, 700.0, 600.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "id": "load",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 376.0, 90.0, 58.0, 22.0 ],
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
                    "patching_rect": [ 376.0, 124.0, 138.0, 22.0 ],
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
                    "comment": "",
                    "id": "in",
                    "index": 1,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 40.0, 40.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "route",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 40.0, 320.0, 110.0, 22.0 ],
                    "text": "route drive mode"
                }
            },
            {
                "box": {
                    "id": "modemsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 120.0, 360.0, 70.0, 22.0 ],
                    "text": "mode $1"
                }
            },
            {
                "box": {
                    "id": "mul",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 40.0, 400.0, 80.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "pong",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 40.0, 440.0, 90.0, 22.0 ],
                    "text": "pong~ 0 -1 1"
                }
            },
            {
                "box": {
                    "id": "op",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 40.0, 510.0, 82.0, 22.0 ],
                    "text": "onepole~ 200"
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "out",
                    "index": 1,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 550.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "border": 0,
                    "embedstate": [
                        [ "setstate", 6.816037735849057, 0 ]
                    ],
                    "filename": "fold.js",
                    "id": "ui",
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 40.0, 90.0, 236.0, 200.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 236.0, 200.0 ],
                    "textfile": {
                        "filename": "fold.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "ui"
                }
            },
            {
                "box": {
                    "id": "snFold",
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
                    "id": "zsFold",
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
                    "id": "spFold",
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
                    "id": "prFold",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 430.0, 390.0, 90.0, 22.0 ],
                    "text": "prepend sig"
                }
            },
            {
                "box": {
                    "id": "pDrive",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 40.0, 360.0, 70.0, 22.0 ],
                    "text": "pattr drive",
                    "varname": "drive"
                }
            },
            {
                "box": {
                    "id": "sDrive",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 240.0, 400.0, 100.0, 22.0 ],
                    "text": "prepend sdrive"
                }
            },
            {
                "box": {
                    "id": "pMode",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 120.0, 320.0, 70.0, 22.0 ],
                    "text": "pattr mode",
                    "varname": "mode"
                }
            },
            {
                "box": {
                    "id": "sMode",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 240.0, 440.0, 100.0, 22.0 ],
                    "text": "prepend smode"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "mul", 0 ],
                    "source": [ "in", 0 ]
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
                    "destination": [ "pong", 0 ],
                    "source": [ "modemsg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pong", 0 ],
                    "source": [ "mul", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out", 0 ],
                    "source": [ "op", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "op", 0 ],
                    "order": 1,
                    "source": [ "pong", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "snFold", 0 ],
                    "order": 0,
                    "source": [ "pong", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui", 0 ],
                    "source": [ "prFold", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pMode", 0 ],
                    "source": [ "route", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pDrive", 0 ],
                    "source": [ "route", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mul", 1 ],
                    "source": [ "pDrive", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sDrive", 0 ],
                    "source": [ "pDrive", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui", 0 ],
                    "source": [ "sDrive", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "modemsg", 0 ],
                    "source": [ "pMode", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sMode", 0 ],
                    "source": [ "pMode", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui", 0 ],
                    "source": [ "sMode", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "zsFold", 0 ],
                    "source": [ "snFold", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "prFold", 0 ],
                    "source": [ "spFold", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "route", 0 ],
                    "source": [ "ui", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "spFold", 0 ],
                    "source": [ "zsFold", 0 ]
                }
            }
        ]
    }
}