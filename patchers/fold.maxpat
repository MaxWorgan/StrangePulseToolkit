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
        "rect": [ 41.0, 107.0, 870.0, 807.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "activecolor": [ 0.9764705882352941, 0.5176470588235295, 0.2901960784313726, 1.0 ],
                    "bgcolor": [ 0.125, 0.125, 0.125, 0.0 ],
                    "disabled": [ 0, 0, 0 ],
                    "hint": "Clip Mode\n",
                    "id": "obj-11",
                    "itemtype": 0,
                    "maxclass": "radiogroup",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offset": 26,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 155.0, 193.0, 19.0, 80.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 184.0, 0.5, 18.0, 80.0 ],
                    "shape": 1,
                    "size": 3,
                    "value": 1,
                    "valuepopuplabel": 1
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 151.0, 107.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 112.0, 472.0, 82.0, 22.0 ],
                    "text": "onepole~ 100"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 356.0, 222.0, 56.0, 22.0 ],
                    "restore": {
                        "FoldAmt": [ 3.1032608695652173 ]
                    },
                    "text": "autopattr",
                    "varname": "u565006822"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 252.0, 30.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-25",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 266.0, 318.0, 50.0, 22.0 ],
                    "text": "clip"
                }
            },
            {
                "box": {
                    "id": "obj-23",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 211.0, 318.0, 50.0, 22.0 ],
                    "text": "wrap"
                }
            },
            {
                "box": {
                    "id": "obj-21",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 155.0, 318.0, 50.0, 22.0 ],
                    "text": "fold"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 155.0, 282.0, 183.0, 22.0 ],
                    "text": "route 0 1 2"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 211.0, 372.0, 76.0, 22.0 ],
                    "text": "mode $1"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "fontface": 0,
                    "fontsize": 25.0,
                    "format": 6,
                    "id": "obj-9",
                    "ignoreclick": 1,
                    "maxclass": "flonum",
                    "minimum": 1.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 252.0, 176.0, 64.0, 36.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 69.5, 19.0, 62.0, 36.0 ],
                    "textcolor": [ 0.976470588235294, 0.780392156862745, 0.309803921568627, 1.0 ],
                    "triangle": 0
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 112.0, 162.0, 100.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 112.0, 422.0, 100.0, 22.0 ],
                    "text": "pong~ 0 -1 1"
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-2",
                    "index": 1,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 112.0, 505.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-1",
                    "index": 1,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 66.0, 51.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 0.0 ],
                    "activelinecolor": [ 0.976470588235294, 0.254901960784314, 0.266666666666667, 1.0 ],
                    "grid_line_width": 2.0,
                    "id": "obj-16",
                    "ignoreclick": 1,
                    "line_width": 1.5,
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 66.0, 537.0, 184.0, 68.0 ],
                    "presentation": 1,
                    "presentation_rect": [ -1.0, 1.0, 203.0, 73.0 ]
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 0.0 ],
                    "activelinecolor": [ 0.976470588235294, 0.780392156862745, 0.309803921568627, 1.0 ],
                    "grid_line_width": 2.0,
                    "id": "obj-15",
                    "ignoreclick": 1,
                    "line_width": 1.5,
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 265.0, 537.0, 184.0, 68.0 ],
                    "presentation": 1,
                    "presentation_rect": [ -1.0, 1.25, 203.0, 71.5 ]
                }
            },
            {
                "box": {
                    "contdata": 1,
                    "id": "obj-7",
                    "maxclass": "multislider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "orientation": 0,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 252.0, 75.0, 184.0, 68.0 ],
                    "presentation": 1,
                    "presentation_rect": [ -1.0, 0.0, 203.0, 74.0 ],
                    "setminmax": [ 1.0, 10.0 ],
                    "setstyle": 1,
                    "slidercolor": [ 0.152941176470588, 0.490196078431373, 0.631372549019608, 1.0 ],
                    "style": "spt",
                    "varname": "FoldAmt"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "order": 1,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "order": 0,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "source": [ "obj-17", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 0 ],
                    "source": [ "obj-17", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "source": [ "obj-25", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "order": 0,
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "order": 1,
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 1 ],
                    "order": 1,
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "order": 0,
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "source": [ "obj-8", 0 ]
                }
            }
        ],
        "styles": [
            {
                "name": "spt",
                "default": {
                    "color": [ 0.976470588235294, 0.254901960784314, 0.266666666666667, 1.0 ]
                },
                "parentstyle": "",
                "multi": 0
            }
        ]
    }
}