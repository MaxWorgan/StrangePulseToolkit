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
        "rect": [ 46.0, 99.0, 1085.0, 823.0 ],
        "showrootpatcherontab": 0,
        "showontab": 0,
        "boxes": [
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
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
                        "rect": [ 46.0, 125.0, 1085.0, 797.0 ],
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "bgmode": 0,
                                    "border": 0,
                                    "clickthrough": 0,
                                    "enablehscroll": 0,
                                    "enablevscroll": 0,
                                    "id": "obj-2",
                                    "lockeddragscroll": 0,
                                    "lockedsize": 0,
                                    "maxclass": "bpatcher",
                                    "name": "AttractorDisplay.maxpat",
                                    "numinlets": 3,
                                    "numoutlets": 0,
                                    "offset": [ 0.0, 0.0 ],
                                    "patching_rect": [ 479.0, 262.0, 265.0, 204.0 ],
                                    "viewvisibility": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-7",
                                    "maxclass": "live.scope~",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 230.0, 520.0, 184.0, 68.0 ],
                                    "range": [ 0.0, 1.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-3",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 230.0, 444.0, 52.0, 22.0 ],
                                    "text": "spt.rpde"
                                }
                            },
                            {
                                "box": {
                                    "activelinecolor": [ 0.023529411764706, 0.83921568627451, 0.627450980392157, 1.0 ],
                                    "id": "obj-21",
                                    "maxclass": "live.scope~",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 412.0, 636.0, 184.0, 68.0 ]
                                }
                            },
                            {
                                "box": {
                                    "activelinecolor": [ 0.937254901960784, 0.27843137254902, 0.435294117647059, 1.0 ],
                                    "id": "obj-20",
                                    "maxclass": "live.scope~",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 221.0, 636.0, 184.0, 68.0 ]
                                }
                            },
                            {
                                "box": {
                                    "activelinecolor": [ 1.0, 0.819607843137255, 0.4, 1.0 ],
                                    "id": "obj-6",
                                    "maxclass": "live.scope~",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 30.0, 636.0, 184.0, 68.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-13",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 565.0, 479.5, 173.0, 33.0 ],
                                    "text": "Select some presets to see different behaviours"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-9",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 760.0, 322.0, 173.0, 33.0 ],
                                    "text": "Drag the AttractorView display to see the 3D space"
                                }
                            },
                            {
                                "box": {
                                    "bubblesize": 22,
                                    "id": "obj-48",
                                    "maxclass": "preset",
                                    "numinlets": 1,
                                    "numoutlets": 5,
                                    "outlettype": [ "preset", "int", "preset", "int", "" ],
                                    "patching_rect": [ 489.0, 480.0, 58.0, 32.0 ],
                                    "preset_data": [
                                        {
                                            "number": 1,
                                            "data": [ 5, "obj-12", "attrui", "attr", "speed_secondary", 5, "obj-12", "attrui", "float", 1.0, 5, "obj-18", "attrui", "attr", "e", 5, "obj-18", "attrui", "float", 9.0, 5, "obj-17", "attrui", "attr", "d", 5, "obj-17", "attrui", "float", 2.0, 5, "obj-16", "attrui", "attr", "c", 5, "obj-16", "attrui", "float", 1.7, 5, "obj-15", "attrui", "attr", "b", 5, "obj-15", "attrui", "float", 2.7, 5, "obj-8", "attrui", "attr", "a", 5, "obj-8", "attrui", "float", 4.5 ]
                                        },
                                        {
                                            "number": 2,
                                            "data": [ 5, "obj-12", "attrui", "attr", "speed_secondary", 5, "obj-12", "attrui", "float", 1.0, 5, "obj-18", "attrui", "attr", "e", 5, "obj-18", "attrui", "float", 9.0, 5, "obj-17", "attrui", "attr", "d", 5, "obj-17", "attrui", "float", 2.0, 5, "obj-16", "attrui", "attr", "c", 5, "obj-16", "attrui", "float", 1.7, 5, "obj-15", "attrui", "attr", "b", 5, "obj-15", "attrui", "float", 2.7, 5, "obj-8", "attrui", "attr", "a", 5, "obj-8", "attrui", "float", 6.2 ]
                                        },
                                        {
                                            "number": 3,
                                            "data": [ 5, "obj-18", "attrui", "attr", "e", 5, "obj-18", "attrui", "float", 1.91, 5, "obj-17", "attrui", "attr", "d", 5, "obj-17", "attrui", "float", 2.11, 5, "obj-16", "attrui", "attr", "c", 5, "obj-16", "attrui", "float", 2.973000000000001, 5, "obj-15", "attrui", "attr", "b", 5, "obj-15", "attrui", "float", 1.11, 5, "obj-8", "attrui", "attr", "a", 5, "obj-8", "attrui", "float", 5.9 ]
                                        },
                                        {
                                            "number": 4,
                                            "data": [ 5, "obj-18", "attrui", "attr", "e", 5, "obj-18", "attrui", "float", 4.470000000000001, 5, "obj-17", "attrui", "attr", "d", 5, "obj-17", "attrui", "float", 4.670000000000001, 5, "obj-16", "attrui", "attr", "c", 5, "obj-16", "attrui", "float", 2.740000000000001, 5, "obj-15", "attrui", "attr", "b", 5, "obj-15", "attrui", "float", 0.76, 5, "obj-8", "attrui", "attr", "a", 5, "obj-8", "attrui", "float", 1.3 ]
                                        },
                                        {
                                            "number": 5,
                                            "data": [ 5, "obj-18", "attrui", "attr", "e", 5, "obj-18", "attrui", "float", 4.470000000000001, 5, "obj-17", "attrui", "attr", "d", 5, "obj-17", "attrui", "float", 4.670000000000001, 5, "obj-16", "attrui", "attr", "c", 5, "obj-16", "attrui", "float", 2.740000000000001, 5, "obj-15", "attrui", "attr", "b", 5, "obj-15", "attrui", "float", 0.58, 5, "obj-8", "attrui", "attr", "a", 5, "obj-8", "attrui", "float", 1.3 ]
                                        }
                                    ],
                                    "style": "default"
                                }
                            },
                            {
                                "box": {
                                    "bgcolor": [ 0.952941, 0.564706, 0.098039, 1.0 ],
                                    "id": "obj-5",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 6,
                                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                                    "patching_rect": [ 23.0, 379.0, 111.0, 22.0 ],
                                    "text": "spt.attractor.dadras"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-88",
                                    "linecount": 9,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 105.0, 423.0, 127.0 ],
                                    "text": "An object that implements the Recurrence period density entropy (RPDE) method. It measures the repetitiveness of the phase space of the given system allowing us to meausure how 'chaotic' the attractor currently is.\n\nThe method is very sensitive to both the speed of the input signals, as well as epsilon and tau which are the neighbourhood size and embedding delay respectively. See https://en.wikipedia.org/wiki/Recurrence_period_density_entropy for further details",
                                    "textcolor": [ 0.8392156862745098, 0.8431372549019608, 0.8509803921568627, 1.0 ]
                                }
                            },
                            {
                                "box": {
                                    "fontface": 1,
                                    "fontsize": 12.0,
                                    "id": "obj-76",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 68.0, 349.0, 20.0 ],
                                    "text": "written by Max Worgan (c) 2025, www.mxwn.io, MIT Licence"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 40.0,
                                    "id": "obj-22",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 15.0, 432.0, 51.0 ],
                                    "text": "spt.rpde",
                                    "textcolor": [ 0.952941176470588, 0.447058823529412, 0.172549019607843, 1.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "a",
                                    "id": "obj-8",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 263.0, 274.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "b",
                                    "id": "obj-15",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 263.0, 298.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "c",
                                    "id": "obj-16",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 263.0, 322.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "d",
                                    "id": "obj-17",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 263.0, 345.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "e",
                                    "id": "obj-18",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 263.0, 369.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "speed_secondary",
                                    "id": "obj-12",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 23.0, 349.0, 150.0, 22.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "source": [ "obj-12", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 272.5, 322.0, 188.0, 322.0, 188.0, 349.0, 32.5, 349.0 ],
                                    "source": [ "obj-15", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 272.5, 348.0, 32.5, 348.0 ],
                                    "source": [ "obj-16", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 272.5, 370.0, 188.0, 370.0, 188.0, 349.0, 32.5, 349.0 ],
                                    "source": [ "obj-17", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 272.5, 395.0, 188.0, 395.0, 188.0, 349.0, 32.5, 349.0 ],
                                    "source": [ "obj-18", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-7", 0 ],
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-2", 2 ],
                                    "midpoints": [ 69.3, 411.0, 460.81796875, 411.0, 460.81796875, 252.0, 734.5, 252.0 ],
                                    "source": [ "obj-5", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-2", 1 ],
                                    "midpoints": [ 50.9, 411.0, 447.00859375, 411.0, 447.00859375, 252.0, 611.5, 252.0 ],
                                    "source": [ "obj-5", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-2", 0 ],
                                    "midpoints": [ 32.5, 411.0, 431.1015625, 411.0, 431.1015625, 252.0, 488.5, 252.0 ],
                                    "source": [ "obj-5", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-20", 0 ],
                                    "midpoints": [ 106.1, 629.5, 230.5, 629.5 ],
                                    "source": [ "obj-5", 4 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-21", 0 ],
                                    "midpoints": [ 124.5, 627.5, 421.5, 627.5 ],
                                    "source": [ "obj-5", 5 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-3", 0 ],
                                    "order": 0,
                                    "source": [ "obj-5", 3 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-6", 0 ],
                                    "midpoints": [ 87.7, 630.5, 39.5, 630.5 ],
                                    "order": 1,
                                    "source": [ "obj-5", 3 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 272.5, 298.0, 188.0, 298.0, 188.0, 349.0, 32.5, 349.0 ],
                                    "source": [ "obj-8", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 165.0, 148.0, 48.0, 22.0 ],
                    "text": "p Basic"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
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
                        "rect": [ 0.0, 26.0, 1085.0, 797.0 ],
                        "showontab": 1,
                        "boxes": [],
                        "lines": []
                    },
                    "patching_rect": [ 454.0, 84.0, 100.0, 22.0 ],
                    "text": "p ?"
                }
            }
        ],
        "lines": [],
        "autosave": 0
    }
}