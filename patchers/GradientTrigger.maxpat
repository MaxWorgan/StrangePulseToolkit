{
    "patcher": {
        "fileversion": 1,
        "appversion": { "major": 9, "minor": 1, "revision": 1, "architecture": "x64", "modernui": 1 },
        "classnamespace": "box",
        "rect": [ 638.0, 119.0, 700.0, 560.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "comment": "",
                    "id": "obj-191",
                    "index": 1,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 20.0, 20.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-30",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 20.0, 70.0, 33.0, 22.0 ],
                    "text": "+~ 1"
                }
            },
            {
                "box": {
                    "id": "obj-67",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 20.0, 105.0, 32.0, 22.0 ],
                    "text": "/~ 2."
                }
            },
            {
                "box": {
                    "id": "obj-rvm",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 210.0, 70.0, 90.0, 22.0 ],
                    "text": "r spt_velmode"
                }
            },
            {
                "box": {
                    "id": "obj-vmmsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 210.0, 105.0, 72.0, 22.0 ],
                    "text": "velmode $1"
                }
            },
            {
                "box": {
                    "id": "obj-102",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 20.0, 145.0, 103.0, 22.0 ],
                    "text": "gen~ signChange"
                }
            },
            {
                "box": {
                    "id": "obj-113",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 20.0, 188.0, 42.0, 22.0 ],
                    "text": "edge~"
                }
            },
            {
                "box": {
                    "id": "obj-190",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 92.0, 188.0, 42.0, 22.0 ],
                    "text": "edge~"
                }
            },
            {
                "box": {
                    "maxclass": "newobj",
                    "text": "snapshot~",
                    "id": "obj-snapU",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 20.0, 228.0, 66.0, 22.0 ]
                }
            },
            {
                "box": {
                    "maxclass": "newobj",
                    "text": "snapshot~",
                    "id": "obj-snapD",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 92.0, 228.0, 66.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "upPre",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 268.0, 75.0, 22.0 ],
                    "text": "prepend up"
                }
            },
            {
                "box": {
                    "id": "downPre",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 285.0, 268.0, 90.0, 22.0 ],
                    "text": "prepend down"
                }
            },
            {
                "box": {
                    "id": "sigPoll",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 320.0, 145.0, 90.0, 22.0 ],
                    "text": "snapshot~ 20"
                }
            },
            {
                "box": {
                    "id": "sigPre",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 320.0, 180.0, 75.0, 22.0 ],
                    "text": "prepend sig"
                }
            },
            {
                "box": {
                    "maxclass": "v8ui",
                    "filename": "GradientTrigger.js",
                    "id": "ui",
                    "varname": "ui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "border": 0,
                    "patching_rect": [ 360.0, 230.0, 148.0, 94.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 148.0, 94.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-lb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 540.0, 145.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "fit",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 540.0, 180.0, 150.0, 22.0 ],
                    "text": "v8 attractorFit.js ui"
                }
            },
            {
                "box": {
                    "comment": "Upward velocity (height 0-1)",
                    "id": "obj-202",
                    "index": 1,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 320.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "Downward velocity (height 0-1)",
                    "id": "obj-206",
                    "index": 2,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 92.0, 320.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "Upward Triggers",
                    "id": "obj-3",
                    "index": 3,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 164.0, 320.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "Downward Triggers",
                    "id": "obj-4",
                    "index": 4,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 236.0, 320.0, 30.0, 30.0 ]
                }
            }
        ],
        "lines": [
            { "patchline": { "source": [ "obj-191", 0 ], "destination": [ "obj-30", 0 ] } },
            { "patchline": { "source": [ "obj-30", 0 ], "destination": [ "obj-67", 0 ] } },
            { "patchline": { "source": [ "obj-67", 0 ], "destination": [ "obj-102", 0 ] } },
            { "patchline": { "source": [ "obj-67", 0 ], "destination": [ "sigPoll", 0 ] } },
            { "patchline": { "source": [ "obj-rvm", 0 ], "destination": [ "obj-vmmsg", 0 ] } },
            { "patchline": { "source": [ "obj-vmmsg", 0 ], "destination": [ "obj-102", 0 ] } },
            { "patchline": { "source": [ "obj-102", 0 ], "destination": [ "obj-113", 0 ] } },
            { "patchline": { "source": [ "obj-102", 1 ], "destination": [ "obj-190", 0 ] } },
            { "patchline": { "source": [ "obj-102", 0 ], "destination": [ "obj-3", 0 ] } },
            { "patchline": { "source": [ "obj-102", 1 ], "destination": [ "obj-4", 0 ] } },
            { "patchline": { "source": [ "obj-102", 2 ], "destination": [ "obj-snapU", 0 ] } },
            { "patchline": { "source": [ "obj-102", 3 ], "destination": [ "obj-snapD", 0 ] } },
            { "patchline": { "source": [ "obj-113", 0 ], "destination": [ "obj-snapU", 0 ] } },
            { "patchline": { "source": [ "obj-190", 0 ], "destination": [ "obj-snapD", 0 ] } },
            { "patchline": { "source": [ "obj-snapU", 0 ], "destination": [ "obj-202", 0 ] } },
            { "patchline": { "source": [ "obj-snapD", 0 ], "destination": [ "obj-206", 0 ] } },
            { "patchline": { "source": [ "obj-snapU", 0 ], "destination": [ "upPre", 0 ] } },
            { "patchline": { "source": [ "obj-snapD", 0 ], "destination": [ "downPre", 0 ] } },
            { "patchline": { "source": [ "upPre", 0 ], "destination": [ "ui", 0 ] } },
            { "patchline": { "source": [ "downPre", 0 ], "destination": [ "ui", 0 ] } },
            { "patchline": { "source": [ "sigPoll", 0 ], "destination": [ "sigPre", 0 ] } },
            { "patchline": { "source": [ "sigPre", 0 ], "destination": [ "ui", 0 ] } },
            { "patchline": { "source": [ "obj-lb", 0 ], "destination": [ "fit", 0 ] } }
        ]
    }
}
