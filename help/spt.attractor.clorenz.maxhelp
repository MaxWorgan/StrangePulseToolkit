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
        "rect": [ 83.0, 99.0, 900.0, 750.0 ],
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
                    "patching_rect": [ 550.0, 150.0, 270.0, 198.0 ],
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
                    "patching_rect": [ 412.0, 600.0, 150.0, 60.0 ]
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
                    "patching_rect": [ 221.0, 600.0, 150.0, 60.0 ]
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
                    "patching_rect": [ 30.0, 600.0, 150.0, 60.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.301961, 0.337255, 0.403922, 1.0 ],
                    "color": [ 0.6, 0.5, 0.9, 1.0 ],
                    "id": "obj-attractor",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 30.0, 520.0, 113.0, 22.0 ],
                    "text": "spt.attractor.clorenz"
                }
            },
            {
                "box": {
                    "attr": "sigma",
                    "id": "obj-attr-sigma",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 200.0, 380.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "beta",
                    "id": "obj-attr-beta",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 200.0, 404.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "r1",
                    "id": "obj-attr-r1",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 360.0, 380.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "r2",
                    "id": "obj-attr-r2",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 360.0, 404.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "epsilon",
                    "id": "obj-attr-epsilon",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 200.0, 428.0, 150.0, 22.0 ]
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
                    "patching_rect": [ 30.0, 15.0, 450.0, 51.0 ],
                    "text": "spt.attractor.clorenz",
                    "textcolor": [ 0.6, 0.5, 0.9, 1.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 14.0,
                    "id": "obj-description",
                    "linecount": 16,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 105.0, 512.0, 257.0 ],
                    "text": "Coupled Lorenz Attractor - Multi-scroll chaotic system.\n\nTwo coupled Lorenz oscillators where the second is driven by the first through a coupling term. This creates complex multi-scroll dynamics.\n\nOscillator 1 (driving):\ndx1/dt = sigma(y1-x1)\ndy1/dt = r1*x1 - y1 - x1*z1\ndz1/dt = x1*y1 - beta*z1\n\nOscillator 2 (coupled, output):\ndx2/dt = sigma(y2-x2) + epsilon(x1-x2)\ndy2/dt = r2*x2 - y2 - x2*z2\ndz2/dt = x2*y2 - beta*z2\n\nThe epsilon parameter controls the coupling strength between the oscillators."
                }
            },
            {
                "box": {
                    "id": "obj-params",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 360.0, 200.0, 20.0 ],
                    "text": "Parameters:",
                    "textcolor": [ 0.6, 0.5, 0.9, 1.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-attractor", 0 ],
                    "midpoints": [ 209.5, 500.0, 39.5, 500.0 ],
                    "source": [ "obj-attr-beta", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-attractor", 0 ],
                    "midpoints": [ 209.5, 500.0, 39.5, 500.0 ],
                    "source": [ "obj-attr-epsilon", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-attractor", 0 ],
                    "midpoints": [ 369.5, 500.0, 39.5, 500.0 ],
                    "source": [ "obj-attr-r1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-attractor", 0 ],
                    "midpoints": [ 369.5, 500.0, 39.5, 500.0 ],
                    "source": [ "obj-attr-r2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-attractor", 0 ],
                    "midpoints": [ 209.5, 500.0, 39.5, 500.0 ],
                    "source": [ "obj-attr-sigma", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-display", 2 ],
                    "midpoints": [ 77.1, 550.0, 810.5, 550.0 ],
                    "source": [ "obj-attractor", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-display", 1 ],
                    "midpoints": [ 58.3, 550.0, 685.0, 550.0 ],
                    "source": [ "obj-attractor", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-display", 0 ],
                    "midpoints": [ 39.5, 550.0, 559.5, 550.0 ],
                    "source": [ "obj-attractor", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-scope1", 0 ],
                    "midpoints": [ 95.9, 590.0, 39.5, 590.0 ],
                    "source": [ "obj-attractor", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-scope2", 0 ],
                    "midpoints": [ 114.7, 590.0, 230.5, 590.0 ],
                    "source": [ "obj-attractor", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-scope3", 0 ],
                    "midpoints": [ 133.5, 590.0, 421.5, 590.0 ],
                    "source": [ "obj-attractor", 5 ]
                }
            }
        ],
        "autosave": 0
    }
}