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
        "rect": [ 100.0, 100.0, 560.0, 300.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-in1",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 40.0, 30.0, 40.0, 22.0 ],
                    "text": "in~ 1"
                }
            },
            {
                "box": {
                    "id": "obj-in2",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 100.0, 30.0, 40.0, 22.0 ],
                    "text": "in~ 2"
                }
            },
            {
                "box": {
                    "id": "obj-in3",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 160.0, 30.0, 40.0, 22.0 ],
                    "text": "in~ 3"
                }
            },
            {
                "box": {
                    "id": "obj-inm",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 220.0, 30.0, 32.0, 22.0 ],
                    "text": "in 1"
                }
            },
            {
                "box": {
                    "id": "obj-rqa",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 40.0, 90.0, 130.0, 22.0 ],
                    "text": "spt.rqa 1024"
                }
            },
            {
                "box": {
                    "id": "obj-out1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 160.0, 48.0, 22.0 ],
                    "text": "out~ 1"
                }
            },
            {
                "box": {
                    "id": "obj-out2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 110.0, 160.0, 48.0, 22.0 ],
                    "text": "out~ 2"
                }
            },
            {
                "box": {
                    "id": "obj-out3",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 180.0, 160.0, 48.0, 22.0 ],
                    "text": "out~ 3"
                }
            },
            {
                "box": {
                    "id": "obj-out4",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 250.0, 160.0, 48.0, 22.0 ],
                    "text": "out~ 4"
                }
            },
            {
                "box": {
                    "id": "obj-out5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 320.0, 160.0, 48.0, 22.0 ],
                    "text": "out~ 5"
                }
            },
            {
                "box": {
                    "id": "obj-out6",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 390.0, 160.0, 48.0, 22.0 ],
                    "text": "out~ 6"
                }
            }
        ],
        "lines": [
            { "patchline": { "destination": [ "obj-rqa", 0 ], "source": [ "obj-in1", 0 ] } },
            { "patchline": { "destination": [ "obj-rqa", 1 ], "source": [ "obj-in2", 0 ] } },
            { "patchline": { "destination": [ "obj-rqa", 2 ], "source": [ "obj-in3", 0 ] } },
            { "patchline": { "destination": [ "obj-rqa", 0 ], "source": [ "obj-inm", 0 ] } },
            { "patchline": { "destination": [ "obj-out1", 0 ], "source": [ "obj-rqa", 0 ] } },
            { "patchline": { "destination": [ "obj-out2", 0 ], "source": [ "obj-rqa", 1 ] } },
            { "patchline": { "destination": [ "obj-out3", 0 ], "source": [ "obj-rqa", 2 ] } },
            { "patchline": { "destination": [ "obj-out4", 0 ], "source": [ "obj-rqa", 3 ] } },
            { "patchline": { "destination": [ "obj-out5", 0 ], "source": [ "obj-rqa", 4 ] } },
            { "patchline": { "destination": [ "obj-out6", 0 ], "source": [ "obj-rqa", 5 ] } }
        ]
    }
}
