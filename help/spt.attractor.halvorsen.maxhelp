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
        "rect": [ 499.0, 127.0, 900.0, 700.0 ],
        "boxes": [
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-display",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "AttractorDisplay.maxpat",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 555.0, 150.0, 270.0, 198.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "activelinecolor": [ 0.2429931462, 0.5804384947, 0.4775273204, 1.0 ],
                    "id": "obj-scope3",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 412.0, 550.0, 150.0, 60.0 ]
                }
            },
            {
                "box": {
                    "activelinecolor": [ 0.976470588235294, 0.780392156862745, 0.309803921568627, 1.0 ],
                    "id": "obj-scope2",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 221.0, 550.0, 150.0, 60.0 ]
                }
            },
            {
                "box": {
                    "activelinecolor": [ 0.976470588235294, 0.254901960784314, 0.266666666666667, 1.0 ],
                    "id": "obj-scope1",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 30.0, 550.0, 150.0, 60.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.301961, 0.337255, 0.403922, 1.0 ],
                    "color": [ 0.8, 0.4, 0.6, 1.0 ],
                    "id": "obj-attractor",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 30.0, 470.0, 127.0, 22.0 ],
                    "text": "spt.attractor.halvorsen"
                }
            },
            {
                "box": {
                    "attr": "a",
                    "id": "obj-attr-a",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 200.0, 360.0, 200.0, 22.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-author",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 68.0, 349.0, 20.0 ],
                    "text": "written by Max Worgan (c) 2025, MIT Licence"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 40.0,
                    "id": "obj-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 15.0, 500.0, 51.0 ],
                    "text": "spt.attractor.halvorsen",
                    "textcolor": [ 0.8, 0.4, 0.6, 1.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 14.0,
                    "id": "obj-description",
                    "linecount": 11,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 105.0, 489.0, 179.0 ],
                    "text": "Halvorsen Attractor - a cyclic attractor with 3-fold rotational symmetry.\n\nEquations:\ndx/dt = -ax - 4y - 4z - y^2\ndy/dt = -ay - 4z - 4x - z^2\ndz/dt = -az - 4x - 4y - x^2\n\nReference:\nUnpublished, but first posted by Arne Dehli Halvorsen on the sci.fractals newsgroup:\nhttps://groups.google.com/g/sci.fractals/c/DFXmbItZO-I/m/KaefyC2sIGUJ"
                }
            },
            {
                "box": {
                    "id": "obj-params",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 340.0, 200.0, 20.0 ],
                    "text": "Parameter (try 1.3 - 2.5):",
                    "textcolor": [ 0.8, 0.4, 0.6, 1.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-attractor", 0 ],
                    "midpoints": [ 209.5, 450.0, 39.5, 450.0 ],
                    "source": [ "obj-attr-a", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-display", 2 ],
                    "midpoints": [ 82.7, 500.0, 815.5, 500.0 ],
                    "source": [ "obj-attractor", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-display", 1 ],
                    "midpoints": [ 61.1, 500.0, 690.0, 500.0 ],
                    "source": [ "obj-attractor", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-display", 0 ],
                    "midpoints": [ 39.5, 500.0, 564.5, 500.0 ],
                    "source": [ "obj-attractor", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-scope1", 0 ],
                    "midpoints": [ 104.3, 540.0, 39.5, 540.0 ],
                    "source": [ "obj-attractor", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-scope2", 0 ],
                    "midpoints": [ 125.9, 540.0, 230.5, 540.0 ],
                    "source": [ "obj-attractor", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-scope3", 0 ],
                    "midpoints": [ 147.5, 540.0, 421.5, 540.0 ],
                    "source": [ "obj-attractor", 5 ]
                }
            }
        ],
        "autosave": 0
    }
}