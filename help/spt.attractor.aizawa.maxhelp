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
        "rect": [ 148.0, 99.0, 900.0, 700.0 ],
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
                    "patching_rect": [ 550.0, 242.0, 270.0, 198.0 ],
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
                    "patching_rect": [ 412.0, 642.0, 150.0, 60.0 ]
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
                    "patching_rect": [ 221.0, 642.0, 150.0, 60.0 ]
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
                    "patching_rect": [ 30.0, 642.0, 150.0, 60.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.301961, 0.337255, 0.403922, 1.0 ],
                    "color": [ 0.4, 0.8, 0.6, 1.0 ],
                    "id": "obj-attractor",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 30.0, 562.0, 112.0, 22.0 ],
                    "text": "spt.attractor.aizawa"
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
                    "patching_rect": [ 202.0, 491.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "b",
                    "id": "obj-attr-b",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 202.0, 515.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "c",
                    "id": "obj-attr-c",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 202.0, 539.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "d",
                    "id": "obj-attr-d",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 362.0, 491.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "e",
                    "id": "obj-attr-e",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 362.0, 515.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "f",
                    "id": "obj-attr-f",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 362.0, 539.0, 150.0, 22.0 ]
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
                    "text": "spt.attractor.aizawa",
                    "textcolor": [ 0.4, 0.8, 0.6, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-params",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 202.0, 471.0, 200.0, 20.0 ],
                    "text": "Parameters:",
                    "textcolor": [ 0.4, 0.8, 0.6, 1.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 14.0,
                    "id": "obj-description",
                    "linecount": 23,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 105.0, 489.0, 382.0 ],
                    "text": "Aizawa Attractor -  exhibits quasi-periodic and chaotic behavior. The attractor creates a torus shape with intricate spiral dynamics.\n\nEquations:\ndx/dt = (z - b)x - dy\ndy/dt = dx + (z - b)y\ndz/dt = c + az - z^3/3 - (x^2 + y^2)(1 + ez) + fzx^3\n\nReference:\nOriginal implementaion the source of some uncertainty. Some attribute this to Yoji Aizawa, others to Toshimitsu Aizawa. Neither appears to have published this data.  As remarked in [1], the system was originally proposed in [2] and should probably be called the Langford attractor.\n\n[1] Fleurantin E, James JM. Resonant tori, transport barriers, and chaos in a vector field with a Neimark–Sacker bifurcation. Communications in Nonlinear Science and Numerical Simulation. 2020 Jun 1;85:105226.\n\n[2] W. F. Langford. Numerical studies of torus bifurcations. In Numerical methods for bifurcation problems\n(Dortmund, 1983), volume 70 of Internat. Schriftenreihe Numer. Math., pages 285–295. Birkh¨auser,\nBasel, 1984.\n"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-attractor", 0 ],
                    "midpoints": [ 211.5, 542.0, 39.5, 542.0 ],
                    "source": [ "obj-attr-a", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-attractor", 0 ],
                    "midpoints": [ 211.5, 540.0, 39.5, 540.0 ],
                    "source": [ "obj-attr-b", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-attractor", 0 ],
                    "midpoints": [ 211.5, 561.5, 39.5, 561.5 ],
                    "source": [ "obj-attr-c", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-attractor", 0 ],
                    "midpoints": [ 371.5, 516.0, 354.0, 516.0, 354.0, 573.0, 153.0, 573.0, 153.0, 540.5625, 39.5, 540.5625 ],
                    "source": [ "obj-attr-d", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-attractor", 0 ],
                    "midpoints": [ 371.5, 540.0, 354.0, 540.0, 354.0, 573.0, 153.0, 573.0, 153.0, 539.796875, 39.5, 539.796875 ],
                    "source": [ "obj-attr-e", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-attractor", 0 ],
                    "midpoints": [ 371.5, 573.0, 153.0, 573.0, 153.0, 541.390625, 39.5, 541.390625 ],
                    "source": [ "obj-attr-f", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-display", 2 ],
                    "midpoints": [ 76.7, 592.0, 810.5, 592.0 ],
                    "source": [ "obj-attractor", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-display", 1 ],
                    "midpoints": [ 58.1, 592.0, 685.0, 592.0 ],
                    "source": [ "obj-attractor", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-display", 0 ],
                    "midpoints": [ 39.5, 592.0, 559.5, 592.0 ],
                    "source": [ "obj-attractor", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-scope1", 0 ],
                    "midpoints": [ 95.3, 632.0, 39.5, 632.0 ],
                    "source": [ "obj-attractor", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-scope2", 0 ],
                    "midpoints": [ 113.9, 632.0, 230.5, 632.0 ],
                    "source": [ "obj-attractor", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-scope3", 0 ],
                    "midpoints": [ 132.5, 632.0, 421.5, 632.0 ],
                    "source": [ "obj-attractor", 5 ]
                }
            }
        ],
        "autosave": 0
    }
}