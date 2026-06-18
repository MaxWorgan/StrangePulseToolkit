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
        "rect": [ 264.0, 99.0, 578.0, 823.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-7",
                    "linecount": 2,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 532.0, 712.0, 50.0, 35.0 ],
                    "text": "1482.25"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 503.0, 654.0, 121.0, 22.0 ],
                    "text": "expr pow($i1 / 2.0\\, 2)"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 560.0, 413.0, 29.5, 22.0 ],
                    "text": "int"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.054901960784314, 0.054901960784314, 0.058823529411765, 1.0 ],
                    "bordercolor": [ 0.054901960784314, 0.054901960784314, 0.058823529411765, 1.0 ],
                    "id": "obj-bg",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 700.0, 57.0, 404.0, 338.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 349.0, 335.0 ],
                    "rounded": 0
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-hdr",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 700.0, 20.0, 160.0, 17.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 12.0, 14.0, 160.0, 17.0 ],
                    "text": "RECURRENCE",
                    "textcolor": [ 0.541176470588235, 0.541176470588235, 0.56078431372549, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-in",
                    "index": 1,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 31.0, 57.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-catch",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "jit_matrix", "" ],
                    "patching_rect": [ 31.0, 110.0, 312.0, 22.0 ],
                    "text": "jit.catch~ 1 @mode 2 @framesize 128 @downsample 16"
                }
            },
            {
                "box": {
                    "id": "obj-shape",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "jit_matrix", "" ],
                    "patching_rect": [ 31.0, 150.0, 200.0, 22.0 ],
                    "text": "jit.matrix 1 float32 256 1 @interp 0"
                }
            },
            {
                "box": {
                    "id": "obj-up",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "jit_matrix", "" ],
                    "patching_rect": [ 31.0, 190.0, 210.0, 22.0 ],
                    "text": "jit.matrix 1 float32 256 256 @interp 0"
                }
            },
            {
                "box": {
                    "id": "obj-trig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 31.0, 228.0, 60.0, 22.0 ],
                    "text": "t l l"
                }
            },
            {
                "box": {
                    "id": "obj-transpose",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "jit_matrix", "" ],
                    "patching_rect": [ 150.0, 266.0, 90.0, 22.0 ],
                    "text": "jit.transpose"
                }
            },
            {
                "box": {
                    "id": "obj-pix",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "jit_matrix", "" ],
                    "patching_rect": [ 31.0, 306.0, 276.0, 22.0 ],
                    "text": "jit.pix @gen recurrence2 @dim 256 256 @adapt 0"
                }
            },
            {
                "box": {
                    "id": "obj-metro",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 330.0, 110.0, 70.0, 22.0 ],
                    "text": "qmetro 33"
                }
            },
            {
                "box": {
                    "id": "obj-tog",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 330.0, 74.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-loadb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 430.0, 28.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-on",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 330.0, 40.0, 32.0, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "obj-pwin",
                    "maxclass": "jit.pwindow",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "jit_matrix", "" ],
                    "patching_rect": [ 31.0, 360.0, 256.0, 256.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 10.0, 40.0, 256.0, 256.0 ],
                    "sync": 1
                }
            },
            {
                "box": {
                    "activedialcolor": [ 0.72156862745098, 1.0, 0.36078431372549, 1.0 ],
                    "activefgdialcolor": [ 0.925490196078431, 0.925490196078431, 0.925490196078431, 1.0 ],
                    "activeneedlecolor": [ 0.925490196078431, 0.925490196078431, 0.925490196078431, 1.0 ],
                    "bordercolor": [ 0.172549019607843, 0.172549019607843, 0.192156862745098, 1.0 ],
                    "dialcolor": [ 0.125490196078431, 0.125490196078431, 0.141176470588235, 1.0 ],
                    "fgdialcolor": [ 0.541176470588235, 0.541176470588235, 0.56078431372549, 1.0 ],
                    "id": "obj-thr",
                    "maxclass": "live.dial",
                    "needlecolor": [ 0.541176470588235, 0.541176470588235, 0.56078431372549, 1.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 470.0, 360.0, 44.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 285.0, 52.0, 44.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": ""
                        },
                        "activefgdialcolor": {
                            "expression": ""
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "bordercolor": {
                            "expression": ""
                        },
                        "dialcolor": {
                            "expression": ""
                        },
                        "fgdialcolor": {
                            "expression": ""
                        },
                        "needlecolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": ""
                        },
                        "tricolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_longname": "thr",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "Threshold",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "textcolor": [ 0.6, 0.6, 0.62, 1.0 ],
                    "tricolor": [ 0.172549019607843, 0.172549019607843, 0.192156862745098, 1.0 ],
                    "varname": "thr"
                }
            },
            {
                "box": {
                    "activedialcolor": [ 0.72156862745098, 1.0, 0.36078431372549, 1.0 ],
                    "activefgdialcolor": [ 0.925490196078431, 0.925490196078431, 0.925490196078431, 1.0 ],
                    "activeneedlecolor": [ 0.925490196078431, 0.925490196078431, 0.925490196078431, 1.0 ],
                    "bordercolor": [ 0.172549019607843, 0.172549019607843, 0.192156862745098, 1.0 ],
                    "dialcolor": [ 0.125490196078431, 0.125490196078431, 0.141176470588235, 1.0 ],
                    "fgdialcolor": [ 0.541176470588235, 0.541176470588235, 0.56078431372549, 1.0 ],
                    "id": "obj-span",
                    "maxclass": "live.dial",
                    "needlecolor": [ 0.541176470588235, 0.541176470588235, 0.56078431372549, 1.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 478.0, 427.0, 44.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 285.0, 136.0, 44.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": ""
                        },
                        "activefgdialcolor": {
                            "expression": ""
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "bordercolor": {
                            "expression": ""
                        },
                        "dialcolor": {
                            "expression": ""
                        },
                        "fgdialcolor": {
                            "expression": ""
                        },
                        "needlecolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": ""
                        },
                        "tricolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_longname": "span",
                            "parameter_mmax": 100.0,
                            "parameter_mmin": 1.0,
                            "parameter_modmax": 1024.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "Time span",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "textcolor": [ 0.6, 0.6, 0.62, 1.0 ],
                    "tricolor": [ 0.172549019607843, 0.172549019607843, 0.192156862745098, 1.0 ],
                    "varname": "span"
                }
            },
            {
                "box": {
                    "activedialcolor": [ 0.72156862745098, 1.0, 0.36078431372549, 1.0 ],
                    "activefgdialcolor": [ 0.925490196078431, 0.925490196078431, 0.925490196078431, 1.0 ],
                    "activeneedlecolor": [ 0.925490196078431, 0.925490196078431, 0.925490196078431, 1.0 ],
                    "bordercolor": [ 0.172549019607843, 0.172549019607843, 0.192156862745098, 1.0 ],
                    "dialcolor": [ 0.125490196078431, 0.125490196078431, 0.141176470588235, 1.0 ],
                    "fgdialcolor": [ 0.541176470588235, 0.541176470588235, 0.56078431372549, 1.0 ],
                    "id": "obj-res",
                    "maxclass": "live.dial",
                    "needlecolor": [ 0.541176470588235, 0.541176470588235, 0.56078431372549, 1.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 470.0, 520.0, 44.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 285.0, 220.0, 44.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": ""
                        },
                        "activefgdialcolor": {
                            "expression": ""
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "bordercolor": {
                            "expression": ""
                        },
                        "dialcolor": {
                            "expression": ""
                        },
                        "fgdialcolor": {
                            "expression": ""
                        },
                        "needlecolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": ""
                        },
                        "tricolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_longname": "res",
                            "parameter_mmax": 256.0,
                            "parameter_mmin": 16.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "Resolution",
                            "parameter_type": 1,
                            "parameter_unitstyle": 0
                        }
                    },
                    "textcolor": [ 0.6, 0.6, 0.62, 1.0 ],
                    "tricolor": [ 0.172549019607843, 0.172549019607843, 0.192156862745098, 1.0 ],
                    "varname": "res"
                }
            },
            {
                "box": {
                    "id": "obj-thrmsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 560.0, 360.0, 80.0, 22.0 ],
                    "text": "eps $1"
                }
            },
            {
                "box": {
                    "id": "obj-spanmsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 560.0, 440.0, 110.0, 22.0 ],
                    "text": "downsample $1"
                }
            },
            {
                "box": {
                    "id": "obj-resmsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 560.0, 520.0, 100.0, 22.0 ],
                    "text": "framesize $1"
                }
            },
            {
                "box": {
                    "id": "obj-thrinit",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 470.0, 326.0, 40.0, 22.0 ],
                    "text": "0.06"
                }
            },
            {
                "box": {
                    "id": "obj-spaninit",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 470.0, 406.0, 40.0, 22.0 ],
                    "text": "16"
                }
            },
            {
                "box": {
                    "id": "obj-resinit",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 470.0, 486.0, 40.0, 22.0 ],
                    "text": "128"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-spanmsg", 0 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "order": 1,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 1 ],
                    "order": 0,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-shape", 0 ],
                    "source": [ "obj-catch", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-catch", 0 ],
                    "source": [ "obj-in", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-on", 0 ],
                    "order": 3,
                    "source": [ "obj-loadb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-resinit", 0 ],
                    "order": 0,
                    "source": [ "obj-loadb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-spaninit", 0 ],
                    "order": 1,
                    "source": [ "obj-loadb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-thrinit", 0 ],
                    "order": 2,
                    "source": [ "obj-loadb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-catch", 0 ],
                    "source": [ "obj-metro", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-tog", 0 ],
                    "source": [ "obj-on", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pwin", 0 ],
                    "source": [ "obj-pix", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-resmsg", 0 ],
                    "source": [ "obj-res", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-res", 0 ],
                    "source": [ "obj-resinit", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-catch", 0 ],
                    "source": [ "obj-resmsg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-up", 0 ],
                    "source": [ "obj-shape", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-span", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-span", 0 ],
                    "source": [ "obj-spaninit", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-catch", 0 ],
                    "source": [ "obj-spanmsg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-thrmsg", 0 ],
                    "source": [ "obj-thr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-thr", 0 ],
                    "source": [ "obj-thrinit", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pix", 0 ],
                    "source": [ "obj-thrmsg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-metro", 0 ],
                    "source": [ "obj-tog", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pix", 1 ],
                    "source": [ "obj-transpose", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pix", 0 ],
                    "source": [ "obj-trig", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-transpose", 0 ],
                    "source": [ "obj-trig", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-trig", 0 ],
                    "source": [ "obj-up", 0 ]
                }
            }
        ]
    }
}