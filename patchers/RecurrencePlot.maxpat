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
        "rect": [ 42.0, 107.0, 896.0, 807.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "comment": "",
                    "id": "obj-120",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 31.0, 57.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "activedialcolor": [ 0.976470588235294, 0.780392156862745, 0.309803921568627, 1.0 ],
                    "id": "obj-118",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 141.0, 338.0, 41.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1.0, 1.0, 41.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_exponent": 3.0,
                            "parameter_longname": "live.dial[2]",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "Distance",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "live.dial[2]"
                }
            },
            {
                "box": {
                    "id": "obj-117",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 537.5, 306.0, 116.0, 22.0 ],
                    "text": "script hide building"
                }
            },
            {
                "box": {
                    "id": "obj-114",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 497.0, 338.0, 124.0, 22.0 ],
                    "text": "script show building"
                }
            },
            {
                "box": {
                    "id": "obj-112",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 497.0, 397.0, 100.0, 22.0 ],
                    "save": [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
                    "text": "thispatcher"
                }
            },
            {
                "box": {
                    "fontface": 2,
                    "fontsize": 18.0,
                    "hidden": 1,
                    "id": "obj-111",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 133.0, 388.0, 259.0, 27.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 137.0, 22.0, 259.0, 27.0 ],
                    "text": "rebuilding recurrence matrix...",
                    "textcolor": [ 0.980392156862745, 0.443137254901961, 0.4, 1.0 ],
                    "varname": "building"
                }
            },
            {
                "box": {
                    "id": "obj-109",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 497.0, 279.0, 100.0, 22.0 ],
                    "text": "route 0 1"
                }
            },
            {
                "box": {
                    "activedialcolor": [ 0.976470588235294, 0.780392156862745, 0.309803921568627, 1.0 ],
                    "id": "obj-108",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 236.0, 338.0, 41.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 87.0, 1.0, 41.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_longname": "live.dial[1]",
                            "parameter_mmax": 200.0,
                            "parameter_mmin": 50.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "Size",
                            "parameter_type": 1,
                            "parameter_unitstyle": 0
                        }
                    },
                    "varname": "live.dial[1]"
                }
            },
            {
                "box": {
                    "activedialcolor": [ 0.976470588235294, 0.780392156862745, 0.309803921568627, 1.0 ],
                    "id": "obj-107",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 192.0, 338.0, 27.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 44.0, 1.0, 27.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_longname": "live.dial",
                            "parameter_mmax": 200.0,
                            "parameter_mmin": 5.0,
                            "parameter_modmin": 5.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "Speed",
                            "parameter_type": 1,
                            "parameter_unitstyle": 0
                        }
                    },
                    "varname": "live.dial"
                }
            },
            {
                "box": {
                    "id": "obj-46",
                    "linecount": 2,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 74.0, 306.0, 52.0, 35.0 ],
                    "text": "setprop eps $1"
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "jit.pwindow",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "jit_matrix", "" ],
                    "patching_rect": [ 27.0, 467.0, 404.0, 288.0 ],
                    "presentation": 1,
                    "presentation_rect": [ -4.5, 51.0, 404.0, 288.0 ],
                    "sync": 1
                }
            },
            {
                "box": {
                    "filename": "recplot.js",
                    "id": "obj-14",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 27.0, 351.0, 123.0, 22.0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0
                    },
                    "text": "v8 recplot @embed 1",
                    "textfile": {
                        "text": "// recplot.js (V8-safe, slightly optimised)\ninlets = 1;\noutlets = 1;\n\nvar eps = 0.1;\nvar mat = new JitterMatrix(\"recurrence\");  // use existing or create new\n\nfunction list() {\n    var vals = arrayfromargs(arguments);\n    var N    = vals.length;\n\n    // Ensure matrix is N x N, float32, 1-plane\n    if (mat.dim[0] !== N || mat.dim[1] !== N) {\n        mat.dim = [N, N];\n        mat.planecount = 1;\n        mat.type = \"float32\";\n    }\n\n    // Symmetric recurrence: d(i,j) == d(j,i)\n    for (var i = 0; i < N; i++) {\n        var xi = vals[i];\n        for (var j = i; j < N; j++) {\n            var diff = xi - vals[j];\n            var v = (diff < eps && diff > -eps) ? 1.0 : 0.0;\n\n            // fill upper triangle and mirror into lower triangle\n            mat.setcell2d(i, j, v);\n            if (j !== i) {\n                mat.setcell2d(j, i, v);\n            }\n        }\n    }\n\n    outlet(0, \"jit_matrix\", \"recurrence\");\n}",
                        "filename": "recplot.js",
                        "flags": 1,
                        "embed": 1,
                        "autowatch": 1
                    },
                    "varname": "v8_AA"
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 27.0, 249.0, 100.0, 22.0 ],
                    "text": "zl stream 250"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 27.0, 188.0, 100.0, 22.0 ],
                    "text": "snapshot~ 50"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-12", 1 ],
                    "source": [ "obj-107", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 1 ],
                    "source": [ "obj-108", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-114", 0 ],
                    "source": [ "obj-109", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-117", 0 ],
                    "source": [ "obj-109", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-112", 0 ],
                    "source": [ "obj-114", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-112", 0 ],
                    "source": [ "obj-117", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-118", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "source": [ "obj-120", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-109", 0 ],
                    "source": [ "obj-13", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "source": [ "obj-46", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-107": [ "live.dial", "Speed", 0 ],
            "obj-108": [ "live.dial[1]", "Size", 0 ],
            "obj-118": [ "live.dial[2]", "Distance", 0 ],
            "parameterbanks": {
                "0": {
                    "index": 0,
                    "name": "",
                    "parameters": [ "-", "-", "-", "-", "-", "-", "-", "-" ],
                    "buttons": [ "-", "-", "-", "-", "-", "-", "-", "-" ]
                }
            },
            "inherited_shortname": 1
        },
        "autosave": 0
    }
}