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
        "rect": [ 100.0, 100.0, 420.0, 300.0 ],
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
                    "id": "obj-inm",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 120.0, 30.0, 32.0, 22.0 ],
                    "text": "in 1"
                }
            },
            {
                "box": {
                    "id": "obj-rpde",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "signal", "signal", "signal" ],
                    "patching_rect": [ 40.0, 90.0, 200.0, 22.0 ],
                    "text": "spt.rpde 2048 @hop_size 256 @tau 12 @tmax 1500"
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
            }
        ],
        "lines": [
            { "patchline": { "destination": [ "obj-rpde", 0 ], "source": [ "obj-in1", 0 ] } },
            { "patchline": { "destination": [ "obj-rpde", 0 ], "source": [ "obj-inm", 0 ] } },
            { "patchline": { "destination": [ "obj-out1", 0 ], "source": [ "obj-rpde", 0 ] } },
            { "patchline": { "destination": [ "obj-out2", 0 ], "source": [ "obj-rpde", 1 ] } },
            { "patchline": { "destination": [ "obj-out3", 0 ], "source": [ "obj-rpde", 2 ] } }
        ]
    }
}
