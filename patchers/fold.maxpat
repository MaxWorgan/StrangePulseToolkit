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
                    "comment": "",
                    "id": "in",
                    "index": 1,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
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
                    "patching_rect": [ 40.0, 510.0, 90.0, 22.0 ],
                    "text": "onepole~ 100"
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
                        [ "setstate", 5.0754716981132075, 0 ]
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
                    "activebgcolor": [ 0.054901960784314, 0.054901960784314, 0.058823529411765, 1.0 ],
                    "activelinecolor": [ 0.72156862745098, 1.0, 0.36078431372549, 1.0 ],
                    "bgcolor": [ 0.054901960784314, 0.054901960784314, 0.058823529411765, 1.0 ],
                    "gridcolor": [ 0.172549019607843, 0.172549019607843, 0.192156862745098, 1.0 ],
                    "id": "scope",
                    "ignoreclick": 1,
                    "line_width": 1.6,
                    "linecolor": [ 0.72156862745098, 1.0, 0.36078431372549, 1.0 ],
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 330.0, 320.0, 184.0, 68.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 13.0, 29.0, 210.0, 112.0 ],
                    "varname": "scope"
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
                    "destination": [ "scope", 0 ],
                    "order": 0,
                    "source": [ "pong", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "modemsg", 0 ],
                    "source": [ "route", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mul", 1 ],
                    "source": [ "route", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "route", 0 ],
                    "source": [ "ui", 0 ]
                }
            }
        ]
    }
}