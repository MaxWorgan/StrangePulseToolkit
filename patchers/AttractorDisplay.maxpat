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
        "rect": [ 572.0, 115.0, 446.0, 807.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "filename": "attractorFit.js",
                    "id": "obj-6",
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 574.0, 78.0, 102.0, 28.0 ],
                    "textfile": {
                        "filename": "attractorFit.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    }
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 369.0, 38.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-3",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 339.0, 6.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-2",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 188.5, 11.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-1",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 38.0, 11.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-62",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "erase" ],
                    "patching_rect": [ 369.0, 93.0, 55.0, 22.0 ],
                    "text": "t b erase"
                }
            },
            {
                "box": {
                    "id": "obj-60",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "" ],
                    "patching_rect": [ 369.0, 124.0, 316.0, 22.0 ],
                    "text": "jit.gl.render #0-screen @erase_color 0.925 0.905 0.862 1."
                }
            },
            {
                "box": {
                    "id": "obj-56",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 38.0, 158.0, 921.0, 22.0 ],
                    "text": "jit.gl.path #0-path @interpmode spline @segments 15 @pathstyle line @line_width 2 @color 0.863 0.227 0.106 0.5 @blend_enable 1 @depth_enable 1 @blend colorblend"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "jit_matrix", "" ],
                    "patching_rect": [ 38.0, 125.0, 326.0, 22.0 ],
                    "text": "jit.catch~ 3 @framesize 1024 @mode 2 @downsample 128"
                }
            },
            {
                "box": {
                    "id": "obj-38",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 369.0, 63.0, 100.0, 22.0 ],
                    "text": "qmetro 33"
                }
            },
            {
                "box": {
                    "id": "obj-87",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 358.0, 242.0, 225.0, 22.0 ],
                    "text": "jit.gl.handle #0-screen @auto_rotate 1"
                }
            },
            {
                "box": {
                    "id": "obj-128",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "jit_gl_texture", "", "" ],
                    "patching_rect": [ 358.0, 272.0, 405.0, 22.0 ],
                    "text": "jit.gl.node @name #0-path @capture 1"
                }
            },
            {
                "box": {
                    "bordercolor": [ 0.0, 0.0, 0.0, 0.0 ],
                    "id": "obj-24",
                    "interp": 1,
                    "maxclass": "jit.pwindow",
                    "name": "#0-screen",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "jit_matrix", "" ],
                    "patching_rect": [ 11.0, 249.0, 337.0, 236.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 300.0, 250.0 ],
                    "sync": 1,
                    "varname": "screen"
                }
            },
            {
                "box": {
                    "id": "obj-attr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 364.0, 338.0, 613.0, 22.0 ],
                    "text": "jit.gl.videoplane #0-screen @transform_reset 2 @depth_enable 0 @blend_enable 1 @layer 100 @color 1. 1. 1. 1.",
                    "varname": "attrplane"
                }
            },
            {
                "box": {
                    "id": "obj-gridsk",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 364.0, 389.0, 518.0, 22.0 ],
                    "text": "jit.gl.videoplane #0-screen @transform_reset 2 @depth_enable 0 @blend_enable 1 @layer 101",
                    "varname": "gridplane"
                }
            },
            {
                "box": {
                    "filename": "gridSketch.js",
                    "id": "obj-gridjs",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 374.0, 435.0, 120.0, 22.0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0
                    },
                    "text": "v8 gridSketch.js",
                    "textfile": {
                        "filename": "gridSketch.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    }
                }
            },
            {
                "box": {
                    "id": "obj-78",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "jit_matrix", "" ],
                    "patching_rect": [ 38.0, 125.0, 326.0, 22.0 ],
                    "text": "jit.catch~ 3 @framesize 1048 @mode 2 @downsample 128"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-attr", 0 ],
                    "source": [ "obj-128", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 1 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 2 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 378.5, 87.0, 47.5, 87.0 ],
                    "order": 2,
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-62", 0 ],
                    "midpoints": [ 378.5, 87.0, 378.5, 87.0 ],
                    "order": 1,
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gridjs", 0 ],
                    "order": 0,
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "order": 1,
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "order": 0,
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-56", 0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "midpoints": [ 414.5, 120.0, 378.5, 120.0 ],
                    "source": [ "obj-62", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "midpoints": [ 378.5, 120.0, 378.5, 120.0 ],
                    "source": [ "obj-62", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-128", 0 ],
                    "source": [ "obj-87", 0 ]
                }
            }
        ],
        "autosave": 0,
        "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
        "editing_bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ]
    }
}