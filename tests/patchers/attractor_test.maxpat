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
        "rect": [ 100.0, 100.0, 1200.0, 800.0 ],
        "openinpresentation": 0,
        "boxes": [
            {
                "box": {
                    "id": "obj-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 10.0, 400.0, 20.0 ],
                    "text": "Attractor Test Patch - Tests all 6 attractors with display"
                }
            },
            {
                "box": {
                    "id": "obj-startall",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 40.0, 80.0, 22.0 ],
                    "text": "startwindow"
                }
            },
            {
                "box": {
                    "id": "obj-stopall",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 110.0, 40.0, 35.0, 22.0 ],
                    "text": "stop"
                }
            },
            {
                "box": {
                    "id": "obj-dac",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 70.0, 35.0, 22.0 ],
                    "text": "dac~"
                }
            },
            {
                "box": {
                    "id": "obj-halvorsen-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 110.0, 180.0, 20.0 ],
                    "text": "HALVORSEN (dt=1, sp=0.05/0.5)"
                }
            },
            {
                "box": {
                    "id": "obj-halvorsen",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 20.0, 135.0, 160.0, 22.0 ],
                    "text": "spt.attractor.halvorsen~"
                }
            },
            {
                "box": {
                    "id": "obj-halvorsen-display",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 165.0, 110.0, 22.0 ],
                    "text": "AttractorDisplay"
                }
            },
            {
                "box": {
                    "id": "obj-aizawa-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 220.0, 110.0, 180.0, 20.0 ],
                    "text": "AIZAWA (dt=1, sp=0.05/0.5)"
                }
            },
            {
                "box": {
                    "id": "obj-aizawa",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 220.0, 135.0, 140.0, 22.0 ],
                    "text": "spt.attractor.aizawa~"
                }
            },
            {
                "box": {
                    "id": "obj-aizawa-display",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 220.0, 165.0, 110.0, 22.0 ],
                    "text": "AttractorDisplay"
                }
            },
            {
                "box": {
                    "id": "obj-rabinovich-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 420.0, 110.0, 180.0, 20.0 ],
                    "text": "RABINOVICH (dt=0.5, sp=3/30)"
                }
            },
            {
                "box": {
                    "id": "obj-rabinovich",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 420.0, 135.0, 160.0, 22.0 ],
                    "text": "spt.attractor.rabinovich~"
                }
            },
            {
                "box": {
                    "id": "obj-rabinovich-display",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 420.0, 165.0, 110.0, 22.0 ],
                    "text": "AttractorDisplay"
                }
            },
            {
                "box": {
                    "id": "obj-dadras-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 410.0, 180.0, 20.0 ],
                    "text": "DADRAS (dt=1, sp=0.05/0.5)"
                }
            },
            {
                "box": {
                    "id": "obj-dadras",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 20.0, 435.0, 140.0, 22.0 ],
                    "text": "spt.attractor.dadras~"
                }
            },
            {
                "box": {
                    "id": "obj-dadras-display",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 465.0, 110.0, 22.0 ],
                    "text": "AttractorDisplay"
                }
            },
            {
                "box": {
                    "id": "obj-lorenz-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 220.0, 410.0, 180.0, 20.0 ],
                    "text": "LORENZ (dt=1, sp=0.2/2)"
                }
            },
            {
                "box": {
                    "id": "obj-lorenz",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 220.0, 435.0, 140.0, 22.0 ],
                    "text": "spt.attractor.lorenz~"
                }
            },
            {
                "box": {
                    "id": "obj-lorenz-display",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 220.0, 465.0, 110.0, 22.0 ],
                    "text": "AttractorDisplay"
                }
            },
            {
                "box": {
                    "id": "obj-thomas-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 420.0, 410.0, 180.0, 20.0 ],
                    "text": "THOMAS (dt=1, sp=0.1/1)"
                }
            },
            {
                "box": {
                    "id": "obj-thomas",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 420.0, 435.0, 140.0, 22.0 ],
                    "text": "spt.attractor.thomas~"
                }
            },
            {
                "box": {
                    "id": "obj-thomas-display",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 420.0, 465.0, 110.0, 22.0 ],
                    "text": "AttractorDisplay"
                }
            },
            {
                "box": {
                    "id": "obj-sig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 620.0, 40.0, 35.0, 22.0 ],
                    "text": "sig~ 0"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-dac", 0 ],
                    "source": [ "obj-startall", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dac", 0 ],
                    "source": [ "obj-stopall", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-halvorsen-display", 0 ],
                    "source": [ "obj-halvorsen", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-halvorsen-display", 1 ],
                    "source": [ "obj-halvorsen", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-halvorsen-display", 2 ],
                    "source": [ "obj-halvorsen", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-aizawa-display", 0 ],
                    "source": [ "obj-aizawa", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-aizawa-display", 1 ],
                    "source": [ "obj-aizawa", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-aizawa-display", 2 ],
                    "source": [ "obj-aizawa", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rabinovich-display", 0 ],
                    "source": [ "obj-rabinovich", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rabinovich-display", 1 ],
                    "source": [ "obj-rabinovich", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rabinovich-display", 2 ],
                    "source": [ "obj-rabinovich", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dadras-display", 0 ],
                    "source": [ "obj-dadras", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dadras-display", 1 ],
                    "source": [ "obj-dadras", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dadras-display", 2 ],
                    "source": [ "obj-dadras", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-lorenz-display", 0 ],
                    "source": [ "obj-lorenz", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-lorenz-display", 1 ],
                    "source": [ "obj-lorenz", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-lorenz-display", 2 ],
                    "source": [ "obj-lorenz", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-thomas-display", 0 ],
                    "source": [ "obj-thomas", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-thomas-display", 1 ],
                    "source": [ "obj-thomas", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-thomas-display", 2 ],
                    "source": [ "obj-thomas", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-halvorsen", 0 ],
                    "source": [ "obj-sig", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-aizawa", 0 ],
                    "source": [ "obj-sig", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rabinovich", 0 ],
                    "source": [ "obj-sig", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dadras", 0 ],
                    "source": [ "obj-sig", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-lorenz", 0 ],
                    "source": [ "obj-sig", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-thomas", 0 ],
                    "source": [ "obj-sig", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}
