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
        "rect": [ 100.0, 99.0, 578.0, 823.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "activebgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 0.0 ],
                    "bordercolor": [ 0.09803920239210129, 0.09803920239210129, 0.09803920239210129, 0.0 ],
                    "focusbordercolor": [ 0.4470588235294118, 0.4470588235294118, 0.4470588235294118, 0.0 ],
                    "fontname": "Menlo",
                    "fontsize": 11.0,
                    "id": "obj-thr",
                    "maxclass": "live.numbox",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 470.0, 360.0, 74.0, 16.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 17.857143729925156, 329.94507107138634, 67.66466981172562, 16.0 ],
                    "saved_attribute_attributes": {
                        "activebgcolor": {
                            "expression": ""
                        },
                        "bordercolor": {
                            "expression": ""
                        },
                        "focusbordercolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": ""
                        },
                        "tricolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_exponent": 2.0,
                            "parameter_longname": "thr",
                            "parameter_mmax": 1.0,
                            "parameter_modmax": 1.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "Threshold",
                            "parameter_steps": 1000,
                            "parameter_type": 0,
                            "parameter_units": "%.3f",
                            "parameter_unitstyle": 9
                        }
                    },
                    "textcolor": [ 0.862745098039216, 0.227450980392157, 0.105882352941176, 1.0 ],
                    "textjustification": 0,
                    "tricolor": [ 0.788235294117647, 0.76078431372549, 0.698039215686275, 1.0 ],
                    "valuepopup": 1,
                    "valuepopuplabel": 4,
                    "varname": "thr"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 532.0, 712.0, 50.0, 22.0 ],
                    "text": "2025."
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
                    "bgcolor": [ 0.964705882352941, 0.952941176470588, 0.925490196078431, 1.0 ],
                    "border": 1,
                    "bordercolor": [ 0.788235294117647, 0.76078431372549, 0.698039215686275, 1.0 ],
                    "id": "obj-bg",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 700.0, 57.0, 404.0, 338.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 300.0, 358.0 ],
                    "rounded": 0
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.925490196078431, 0.905882352941176, 0.862745098039216, 1.0 ],
                    "border": 1,
                    "bordercolor": [ 0.788235294117647, 0.76078431372549, 0.698039215686275, 1.0 ],
                    "id": "obj-plotframe",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 700.0, 400.0, 274.0, 274.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 13.0, 33.0, 274.0, 274.0 ],
                    "rounded": 0
                }
            },
            {
                "box": {
                    "fontsize": 9.0,
                    "id": "obj-idx",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 700.0, 4.0, 24.0, 17.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 14.0, 13.0, 20.0, 17.0 ],
                    "text": "14",
                    "textcolor": [ 0.63921568627451, 0.611764705882353, 0.541176470588235, 1.0 ]
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
                    "presentation_rect": [ 33.0, 13.0, 170.0, 17.0 ],
                    "text": "RECURRENCE PLOT",
                    "textcolor": [ 0.407843137254902, 0.384313725490196, 0.309803921568627, 1.0 ]
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
                    "border": 1.0,
                    "bordercolor": [ 0.789483368396759, 0.7597718834877014, 0.6996591091156006, 1.0 ],
                    "id": "obj-pwin",
                    "maxclass": "jit.pwindow",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "jit_matrix", "" ],
                    "patching_rect": [ 31.0, 360.0, 256.0, 256.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 14.0, 34.0, 272.0, 272.0 ],
                    "sync": 1
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.925490196078431, 0.905882352941176, 0.862745098039216, 1.0 ],
                    "border": 1,
                    "bordercolor": [ 0.788235294117647, 0.76078431372549, 0.698039215686275, 1.0 ],
                    "id": "obj-thrcell",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 470.0, 360.0, 86.0, 34.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 14.0, 314.0, 86.0, 34.0 ],
                    "rounded": 0
                }
            },
            {
                "box": {
                    "bubble_outlinecolor": [ 0.85, 0.85, 0.85, 0.0 ],
                    "fontsize": 7.0,
                    "id": "obj-thrlbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 470.0, 396.0, 80.0, 14.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 17.03296786546707, 317.85715839266777, 74.0, 14.0 ],
                    "text": "THRESHOLD",
                    "textcolor": [ 0.63921568627451, 0.611764705882353, 0.541176470588235, 1.0 ]
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.925490196078431, 0.905882352941176, 0.862745098039216, 1.0 ],
                    "border": 1,
                    "bordercolor": [ 0.788235294117647, 0.76078431372549, 0.698039215686275, 1.0 ],
                    "id": "obj-spancell",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 478.0, 427.0, 86.0, 34.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 106.0, 314.0, 86.0, 34.0 ],
                    "rounded": 0
                }
            },
            {
                "box": {
                    "fontsize": 7.0,
                    "id": "obj-spanlbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 478.0, 463.0, 80.0, 14.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 112.0, 318.0, 74.0, 14.0 ],
                    "text": "WINDOW",
                    "textcolor": [ 0.63921568627451, 0.611764705882353, 0.541176470588235, 1.0 ]
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "bordercolor": [ 0.09803921568627451, 0.09803921568627451, 0.09803921568627451, 0.0 ],
                    "focusbordercolor": [ 0.4470588235294118, 0.4470588235294118, 0.4470588235294118, 0.0 ],
                    "fontname": "Menlo",
                    "fontsize": 11.0,
                    "id": "obj-span",
                    "maxclass": "live.numbox",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 478.0, 427.0, 74.0, 16.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 112.3892208635807, 330.0, 75.22155827283859, 16.0 ],
                    "saved_attribute_attributes": {
                        "activebgcolor": {
                            "expression": ""
                        },
                        "bordercolor": {
                            "expression": ""
                        },
                        "focusbordercolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": ""
                        },
                        "tricolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_longname": "window",
                            "parameter_mmax": 100.0,
                            "parameter_mmin": 1.0,
                            "parameter_modmax": 1024.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "Window",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ],
                    "textjustification": 0,
                    "tricolor": [ 0.788235294117647, 0.76078431372549, 0.698039215686275, 1.0 ],
                    "valuepopup": 1,
                    "valuepopuplabel": 4,
                    "varname": "span"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.925490196078431, 0.905882352941176, 0.862745098039216, 1.0 ],
                    "border": 1,
                    "bordercolor": [ 0.788235294117647, 0.76078431372549, 0.698039215686275, 1.0 ],
                    "id": "obj-rescell",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 470.0, 520.0, 86.0, 34.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 198.0, 314.0, 86.0, 34.0 ],
                    "rounded": 0
                }
            },
            {
                "box": {
                    "fontsize": 7.0,
                    "id": "obj-reslbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 470.0, 556.0, 80.0, 14.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 208.38323092460632, 317.96406787633896, 74.0, 14.0 ],
                    "text": "RESOLUTION",
                    "textcolor": [ 0.63921568627451, 0.611764705882353, 0.541176470588235, 1.0 ]
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "bordercolor": [ 0.09803921568627451, 0.09803921568627451, 0.09803921568627451, 0.0 ],
                    "focusbordercolor": [ 0.4470588235294118, 0.4470588235294118, 0.4470588235294118, 0.0 ],
                    "fontname": "Menlo",
                    "fontsize": 11.0,
                    "id": "obj-res",
                    "maxclass": "live.numbox",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 470.0, 520.0, 74.0, 16.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 208.9820333123207, 329.9401156306267, 75.44910085201263, 16.0 ],
                    "saved_attribute_attributes": {
                        "activebgcolor": {
                            "expression": ""
                        },
                        "bordercolor": {
                            "expression": ""
                        },
                        "focusbordercolor": {
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
                    "textcolor": [ 0.10980392156862745, 0.10980392156862745, 0.10980392156862745, 1.0 ],
                    "textjustification": 0,
                    "tricolor": [ 0.788235294117647, 0.76078431372549, 0.698039215686275, 1.0 ],
                    "valuepopup": 1,
                    "valuepopuplabel": 4,
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
                    "angle": 270.0,
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "border": 1,
                    "bordercolor": [ 0.789483368396759, 0.7597718834877014, 0.6996591091156006, 1.0 ],
                    "id": "obj-6",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 173.05389004945755, 363.1736481487751, 128.0, 128.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 13.772454917430878, 314.97005593776703, 81.4371247291565, 36.526945650577545 ],
                    "proportion": 0.5,
                    "rounded": 1
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "border": 1,
                    "bordercolor": [ 0.789483368396759, 0.7597718834877014, 0.6996591091156006, 1.0 ],
                    "id": "obj-8",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 188.05389004945755, 378.1736481487751, 128.0, 128.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 108.28143763542175, 314.97005593776703, 81.4371247291565, 36.526945650577545 ],
                    "proportion": 0.5,
                    "rounded": 1
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "border": 1,
                    "bordercolor": [ 0.789483368396759, 0.7597718834877014, 0.6996591091156006, 1.0 ],
                    "id": "obj-9",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 203.05389004945755, 393.1736481487751, 128.0, 128.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 204.0, 314.97005593776703, 81.4371247291565, 36.526945650577545 ],
                    "proportion": 0.5,
                    "rounded": 1
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