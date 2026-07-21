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
        "rect": [ 34.0, 99.0, 1402.0, 823.0 ],
        "style": "StrangeStyle",
        "boxes": [
            {
                "box": {
                    "id": "obj-25",
                    "linecount": 6,
                    "maxclass": "newobj",
                    "numinlets": 7,
                    "numoutlets": 2,
                    "outlettype": [ "multichannelsignal", "multichannelsignal" ],
                    "patching_rect": [ 501.0, 1768.0, 158.0, 81.0 ],
                    "text": "mc.abl.dsp.darkhall~ @basscrossover 440. @damping 0.5 @mod 0.5 @mix 0.25 @freeze 0 @decay 0.2 @bassmult 1. @shape 0.5 @size 0.823"
                }
            },
            {
                "box": {
                    "id": "obj-21",
                    "lastchannelcount": 2,
                    "maxclass": "mc.live.gain~",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "multichannelsignal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 708.0, 1606.0, 48.0, 136.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "mc.live.gain~",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "mc.live.gain~",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "varname": "mc.live.gain~"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-22",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 339.0, 290.0, 87.0, 21.0 ],
                    "text": "loadmess dt 1."
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1236.0, 227.0, 50.0, 21.0 ],
                    "text": "zl.sub 1"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-59",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 1299.0, 221.0, 29.5, 20.0 ],
                    "text": "+ 1"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-55",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1170.0, 272.0, 85.33333587646484, 20.0 ],
                    "text": "switch"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "tll",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1202.0, 94.0, 48.50000116229057, 21.0 ],
                    "text": "t l l"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "mask",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1299.0, 133.0, 78.0, 21.0 ],
                    "text": "vexpr $f1 > 0"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "sum",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1299.0, 163.0, 60.0, 21.0 ],
                    "text": "zl.sum"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "sel1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 1299.0, 188.0, 33.0, 20.0 ],
                    "text": "== 1"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-23",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 438.0, 44.0, 113.0, 21.0 ],
                    "text": "loadmess 0.75 0.15"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1318.0, 344.0, 135.0, 21.0 ],
                    "text": "loadmess recall 1"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-19",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 792.0, 1424.0, 70.0, 21.0 ],
                    "text": "loadmess 1"
                }
            },
            {
                "box": {
                    "id": "obj-137",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ -102.0, 1512.0, 150.0, 42.0 ],
                    "text": "Simple Reverb with rate modulated by x param of attractor"
                }
            },
            {
                "box": {
                    "fontname": "Helvetica Neue",
                    "fontsize": 18.0,
                    "id": "obj-124",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 847.0, 82.0, 226.0, 27.0 ],
                    "text": "Attractor Display",
                    "textcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "fontname": "Helvetica Neue",
                    "fontsize": 18.0,
                    "id": "obj-123",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 453.0, 77.0, 224.0, 27.0 ],
                    "text": "Preset Morphing",
                    "textcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "fontname": "Helvetica Neue",
                    "fontsize": 18.0,
                    "id": "obj-122",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 80.0, 77.0, 228.0, 27.0 ],
                    "text": "Attractor Parameters",
                    "textcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-118",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 249.0, 388.0, 41.0, 21.0 ],
                    "text": "s~ _z"
                }
            },
            {
                "box": {
                    "id": "obj-111",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 78.0, 1631.0, 167.0, 21.0 ],
                    "text": "mc.pack~ 2"
                }
            },
            {
                "box": {
                    "id": "obj-105",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "orientation": 1,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 963.0, 1554.0, 136.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "mc.live.gain~[16]",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "mc.live.gain~[14]",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "showname": 0,
                    "shownumber": 0,
                    "varname": "Sound3Gain"
                }
            },
            {
                "box": {
                    "id": "obj-104",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "orientation": 1,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 963.0, 1512.0, 136.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "mc.live.gain~[15]",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "mc.live.gain~[14]",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "showname": 0,
                    "shownumber": 0,
                    "varname": "Sound2Gain"
                }
            },
            {
                "box": {
                    "id": "obj-103",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "orientation": 1,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 963.0, 1468.0, 136.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "mc.live.gain~[14]",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "mc.live.gain~[14]",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "showname": 0,
                    "shownumber": 0,
                    "varname": "Sound1Gain"
                }
            },
            {
                "box": {
                    "clipheight": 32.0,
                    "data": {
                        "clips": [
                            {
                                "absolutepath": "extra_sound3.wav",
                                "filename": "extra_sound3.wav",
                                "filekind": "audiofile",
                                "id": "u846010231",
                                "loop": 1,
                                "content_state": {
                                    "loop": 1
                                }
                            }
                        ]
                    },
                    "id": "obj-101",
                    "maxclass": "playlist~",
                    "mode": "basic",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "signal", "", "dictionary" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 798.0, 1532.0, 150.0, 32.0 ],
                    "quality": "basic",
                    "saved_attribute_attributes": {
                        "candicane2": {
                            "expression": ""
                        },
                        "candicane3": {
                            "expression": ""
                        },
                        "candicane4": {
                            "expression": ""
                        },
                        "candicane5": {
                            "expression": ""
                        },
                        "candicane6": {
                            "expression": ""
                        },
                        "candicane7": {
                            "expression": ""
                        },
                        "candicane8": {
                            "expression": ""
                        }
                    }
                }
            },
            {
                "box": {
                    "clipheight": 32.0,
                    "data": {
                        "clips": [
                            {
                                "absolutepath": "extra_sound2.wav",
                                "filename": "extra_sound2.wav",
                                "filekind": "audiofile",
                                "id": "u667010059",
                                "loop": 1,
                                "content_state": {
                                    "loop": 1
                                }
                            }
                        ]
                    },
                    "id": "obj-98",
                    "maxclass": "playlist~",
                    "mode": "basic",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "signal", "", "dictionary" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 798.0, 1498.0, 150.0, 32.0 ],
                    "quality": "basic",
                    "saved_attribute_attributes": {
                        "candicane2": {
                            "expression": ""
                        },
                        "candicane3": {
                            "expression": ""
                        },
                        "candicane4": {
                            "expression": ""
                        },
                        "candicane5": {
                            "expression": ""
                        },
                        "candicane6": {
                            "expression": ""
                        },
                        "candicane7": {
                            "expression": ""
                        },
                        "candicane8": {
                            "expression": ""
                        }
                    }
                }
            },
            {
                "box": {
                    "clipheight": 32.0,
                    "data": {
                        "clips": [
                            {
                                "absolutepath": "extra_sound1.wav",
                                "filename": "extra_sound1.wav",
                                "filekind": "audiofile",
                                "id": "u839009523",
                                "loop": 1,
                                "content_state": {
                                    "loop": 1
                                }
                            }
                        ]
                    },
                    "id": "obj-97",
                    "maxclass": "playlist~",
                    "mode": "basic",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "signal", "", "dictionary" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 798.0, 1466.0, 150.0, 32.0 ],
                    "quality": "basic",
                    "saved_attribute_attributes": {
                        "candicane2": {
                            "expression": ""
                        },
                        "candicane3": {
                            "expression": ""
                        },
                        "candicane4": {
                            "expression": ""
                        },
                        "candicane5": {
                            "expression": ""
                        },
                        "candicane6": {
                            "expression": ""
                        },
                        "candicane7": {
                            "expression": ""
                        },
                        "candicane8": {
                            "expression": ""
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-49",
                    "linecount": 2,
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 501.0, 1570.0, 140.0, 33.0 ],
                    "text": "mc.abl.dsp.compander~ @shape 0.5"
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "linecount": 7,
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 501.0, 1663.0, 156.99995708465576, 93.0 ],
                    "text": "abl.device.drumbuss~ @compressor 1 @transients 1. @drive 0.2 @mix 0.75. @input 0. @crunch 0.5 @output 0.2 @distortion 1 @decay 1. @boomsolo 0 @boom 0.1",
                    "varname": "abl.device.drumbuss~_AA"
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "linecount": 4,
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 78.0, 1570.0, 157.0, 57.0 ],
                    "text": "abl.dsp.tides~ @tides 1. @mix 1. @damping 0.3 @decay 4.4 @size 0.37 @ins rate @rate 0.8",
                    "varname": "abl.dsp.tides~_AA"
                }
            },
            {
                "box": {
                    "id": "obj-94",
                    "lastchannelcount": 2,
                    "maxclass": "mc.live.gain~",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "multichannelsignal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1109.0, 1124.0, 47.0, 179.0 ],
                    "saved_attribute_attributes": {
                        "slidercolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_longname": "mc.live.gain~[13]",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "mc.live.gain~[7]",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "showname": 0,
                    "shownumber": 0,
                    "slidercolor": [ 0.3058823529411765, 0.4823529411764706, 0.9098039215686274, 1.0 ],
                    "varname": "mc.live.gain~[7]"
                }
            },
            {
                "box": {
                    "id": "obj-38",
                    "lastchannelcount": 2,
                    "maxclass": "mc.live.gain~",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "multichannelsignal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 340.0, 1124.0, 60.0, 180.0 ],
                    "saved_attribute_attributes": {
                        "slidercolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_longname": "mc.live.gain~[12]",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "mc.live.gain~[7]",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "showname": 0,
                    "shownumber": 0,
                    "slidercolor": [ 0.3058823529411765, 0.4823529411764706, 0.9098039215686274, 1.0 ],
                    "varname": "mc.live.gain~[6]"
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "lastchannelcount": 2,
                    "maxclass": "mc.live.gain~",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "multichannelsignal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 352.0, 929.0, 35.0, 180.0 ],
                    "saved_attribute_attributes": {
                        "slidercolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_longname": "mc.live.gain~[11]",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "mc.live.gain~[7]",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "showname": 0,
                    "shownumber": 0,
                    "slidercolor": [ 0.3058823529411765, 0.4823529411764706, 0.9098039215686274, 1.0 ],
                    "varname": "mc.live.gain~[5]"
                }
            },
            {
                "box": {
                    "id": "obj-28",
                    "lastchannelcount": 2,
                    "maxclass": "mc.live.gain~",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "multichannelsignal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 722.0, 1124.0, 39.0, 180.0 ],
                    "saved_attribute_attributes": {
                        "slidercolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_longname": "mc.live.gain~[10]",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "mc.live.gain~[7]",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "showname": 0,
                    "shownumber": 0,
                    "slidercolor": [ 0.3058823529411765, 0.4823529411764706, 0.9098039215686274, 1.0 ],
                    "varname": "mc.live.gain~[4]"
                }
            },
            {
                "box": {
                    "id": "obj-68",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1053.0, 1680.0, 78.0, 21.0 ],
                    "text": "mc.s~ reverb"
                }
            },
            {
                "box": {
                    "id": "obj-69",
                    "lastchannelcount": 2,
                    "maxclass": "mc.live.gain~",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "multichannelsignal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1053.0, 1582.0, 38.0, 88.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "mc.live.gain~[9]",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "mc.live.gain~[7]",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "showname": 0,
                    "shownumber": 0,
                    "varname": "mc.live.gain~[3]"
                }
            },
            {
                "box": {
                    "id": "obj-64",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 558.0, 1364.0, 78.0, 21.0 ],
                    "text": "mc.s~ reverb"
                }
            },
            {
                "box": {
                    "id": "obj-67",
                    "lastchannelcount": 2,
                    "maxclass": "mc.live.gain~",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "multichannelsignal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1112.0, 932.0, 39.0, 180.0 ],
                    "saved_attribute_attributes": {
                        "slidercolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_longname": "mc.live.gain~[8]",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "mc.live.gain~[7]",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "showname": 0,
                    "shownumber": 0,
                    "slidercolor": [ 0.3058823529411765, 0.4823529411764706, 0.9098039215686274, 1.0 ],
                    "varname": "mc.live.gain~[2]"
                }
            },
            {
                "box": {
                    "id": "obj-57",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 78.0, 1543.0, 90.0, 21.0 ],
                    "text": "mc.unpack~ 2"
                }
            },
            {
                "box": {
                    "id": "obj-56",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 78.0, 1515.0, 90.0, 21.0 ],
                    "text": "mc.r~ reverb 2"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-93",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 204.0, 388.0, 41.0, 21.0 ],
                    "text": "s~ _y"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-92",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 159.0, 388.0, 41.0, 21.0 ],
                    "text": "s~ _x"
                }
            },
            {
                "box": {
                    "id": "obj-91",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1005.0, 1606.0, 55.0, 21.0 ],
                    "text": "r~ _y"
                }
            },
            {
                "box": {
                    "id": "obj-90",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 897.0, 1606.0, 51.0, 21.0 ],
                    "text": "r~ _x"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-89",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "StrangeFilter.maxpat",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 788.0, 1634.0, 236.0, 200.0 ],
                    "varname": "StrangeFilter",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "hidden": 1,
                    "id": "obj-29",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1313.0, 280.0, 108.0, 23.0 ],
                    "text": "loadmess 1 2 3 4"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "hidden": 1,
                    "id": "obj-30",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1170.0, 305.0, 162.0, 23.0 ],
                    "text": "vexpr ($f1*0.9999)+$f2"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "hidden": 1,
                    "id": "obj-79",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1170.0, 343.0, 122.0, 23.0 ],
                    "text": "prepend recallmulti"
                }
            },
            {
                "box": {
                    "candycane": 4,
                    "candycane2": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 0.67 ],
                    "candycane3": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 0.53 ],
                    "candycane4": [ 0.847468376159668, 0.8226896524429321, 0.771217942237854, 0.64 ],
                    "candycane5": [ 0.341176470588235, 0.458823529411765, 0.564705882352941, 1.0 ],
                    "clickmoveinactive": 0,
                    "displayknob": 1,
                    "id": "obj-78",
                    "knobcolor": [ 0.3058823529411765, 0.4823529411764706, 0.9098039215686274, 1.0 ],
                    "maxclass": "nodes",
                    "mousemode": 2,
                    "nodecolor": [ 0.3058823529411765, 0.4823529411764706, 0.9098039215686274, 0.59 ],
                    "nodenumber": 4,
                    "nodesnames": [ "1", "2", "3", "4" ],
                    "nsize": [ 0.4, 0.4, 0.4, 0.4 ],
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 438.0, 118.0, 255.0, 199.0 ],
                    "xplace": [ 0.747169811320755, 0.773584905660377, 0.241509433962264, 0.2490566037735849 ],
                    "yplace": [ 0.123152709359606, 0.733990147783251, 0.768472906403941, 0.21674876847290642 ]
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-77",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "MultiModTrigger.maxpat",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 33.0, 696.0, 384.0, 107.0 ],
                    "varname": "MultiModTrigger",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "obj-76",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 501.0, 1634.0, 58.0, 21.0 ],
                    "text": "mc.sum~"
                }
            },
            {
                "box": {
                    "id": "obj-75",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 596.0, 1634.0, 75.0, 21.0 ],
                    "text": "mc.sum~"
                }
            },
            {
                "box": {
                    "id": "obj-66",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 503.0, 1858.0, 154.99995708465576, 20.0 ],
                    "text": "dac~"
                }
            },
            {
                "box": {
                    "id": "obj-65",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "multichannelsignal", "multichannelsignal" ],
                    "patching_rect": [ 501.0, 1606.0, 112.0, 21.0 ],
                    "text": "mc.deinterleave~ 2"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-50",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "MultiModTrigger.maxpat",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 795.0, 696.0, 384.0, 65.0 ],
                    "varname": "MultiModTrigger[6]",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-36",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "combineSignalsAsGates.maxpat",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 808.0, 413.0, 290.0, 160.0 ],
                    "varname": "combineSignalsAsGates[2]",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-48",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 265.0, 343.0, 38.0, 21.0 ],
                    "text": "e $1"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-47",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 214.0, 343.0, 38.0, 21.0 ],
                    "text": "d $1"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-46",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 165.0, 343.0, 37.0, 21.0 ],
                    "text": "c $1"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-45",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 114.0, 343.0, 38.0, 21.0 ],
                    "text": "b $1"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-44",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 63.0, 343.0, 38.0, 21.0 ],
                    "text": "a $1"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-18",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "float", "float", "float", "float", "float" ],
                    "patching_rect": [ 63.0, 317.0, 226.0, 21.0 ],
                    "text": "unpack 0. 0. 0. 0. 0."
                }
            },
            {
                "box": {
                    "candicane2": [ 0.3058823529411765, 0.4823529411764706, 0.9098039215686274, 1.0 ],
                    "candicane3": [ 0.847468376159668, 0.8226896524429321, 0.771217942237854, 1.0 ],
                    "candicane4": [ 0.40784313725490196, 0.3843137254901961, 0.30980392156862746, 1.0 ],
                    "candicane5": [ 0.9647058823529412, 0.9529411764705882, 0.9254901960784314, 1.0 ],
                    "candycane": 6,
                    "contdata": 1,
                    "id": "obj-17",
                    "maxclass": "multislider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 63.0, 118.0, 255.0, 199.0 ],
                    "setminmax": [ 0.0, 10.0 ],
                    "setstyle": 1,
                    "size": 5,
                    "slidercolor": [ 0.976470588235294, 0.254901960784314, 0.266666666666667, 1.0 ],
                    "style": "spt",
                    "varname": "DadrasParams"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-43",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "MultiModTrigger.maxpat",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 33.0, 824.0, 384.0, 65.0 ],
                    "varname": "MultiModTrigger[5]",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-42",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "MultiModTrigger.maxpat",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 795.0, 614.0, 384.0, 65.0 ],
                    "varname": "MultiModTrigger[4]",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-41",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "MultiModTrigger.maxpat",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 408.0, 696.0, 384.0, 65.0 ],
                    "varname": "MultiModTrigger[3]",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-40",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "MultiModTrigger.maxpat",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 410.0, 614.0, 384.0, 65.0 ],
                    "varname": "MultiModTrigger[2]",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-37",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1167.0, 416.0, 89.0, 20.0 ],
                    "text": "storagewindow"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-9",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "MultiModTrigger.maxpat",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 32.0, 614.0, 384.0, 65.0 ],
                    "varname": "MultiModTrigger[1]",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-8",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1170.0, 386.0, 229.0, 21.0 ],
                    "saved_object_attributes": {
                        "client_rect": [ 100, 171, 483, 533 ],
                        "parameter_enable": 0,
                        "parameter_mappable": 0,
                        "storage_rect": [ 100, 171, 998, 769 ]
                    },
                    "text": "pattrstorage demoStorage @savemode 2",
                    "varname": "demoStorage"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 1172.0, 49.0, 56.0, 20.0 ],
                    "restore": {
                        "DadrasParams": [ 2.651515151515151, 1.287878787878788, 3.409090909090909, 5.833333333333333, 5.833333333333333 ],
                        "Sound1Gain": [ -70.0 ],
                        "Sound2Gain": [ -25.2355046528275 ],
                        "Sound3Gain": [ -70.0 ],
                        "mc.live.gain~": [ -29.411315853559525 ],
                        "mc.live.gain~[1]": [ -70.0 ],
                        "mc.live.gain~[2]": [ -43.600831146106735 ],
                        "mc.live.gain~[3]": [ -70.0 ],
                        "mc.live.gain~[4]": [ -70.0 ],
                        "mc.live.gain~[5]": [ -70.0 ],
                        "mc.live.gain~[6]": [ -70.0 ],
                        "mc.live.gain~[7]": [ -42.110892388451404 ]
                    },
                    "text": "autopattr",
                    "varname": "u172004583"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-24",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "combineSignalsAsGates.maxpat",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 423.0, 416.0, 290.0, 160.0 ],
                    "varname": "combineSignalsAsGates",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-16",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "combineSignalsAsGates.maxpat",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 45.0, 419.0, 290.0, 160.0 ],
                    "varname": "combineSignalsAsGates[1]",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-14",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "AttractorDisplay.maxpat",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 825.0, 113.0, 255.0, 199.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "newobj",
                    "numinlets": 8,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 501.0, 1538.0, 92.5, 21.0 ],
                    "text": "mc.combine~ 8"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-11",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 493.0, 329.0, 145.0, 25.0 ],
                    "text": "spt.attractor.dadras",
                    "varname": "attractor"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-6",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "SamplePlayPoly.maxpat",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 794.0, 1124.0, 315.0, 180.0 ],
                    "varname": "SamplePlayPoly",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-5",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "SamplePlayPoly.maxpat",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 795.0, 932.0, 315.0, 180.0 ],
                    "varname": "SamplePlayPoly[1]",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-4",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "SamplePlayPoly.maxpat",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 408.0, 1124.0, 315.0, 180.0 ],
                    "varname": "SamplePlayPoly[2]",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-3",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "SamplePlayPoly.maxpat",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 410.0, 929.0, 315.0, 180.0 ],
                    "varname": "SamplePlayPoly[3]",
                    "viewvisibility": 1
                }
            },
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
                    "name": "SamplePlayPoly.maxpat",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 40.0, 1124.0, 315.0, 180.0 ],
                    "varname": "SamplePlayPoly[4]",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-1",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "SamplePlayPoly.maxpat",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 32.0, 929.0, 315.0, 180.0 ],
                    "varname": "SamplePlayPoly[5]",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-34",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1261.0, 416.0, 77.0, 20.0 ],
                    "text": "clientwindow"
                }
            },
            {
                "box": {
                    "id": "obj-60",
                    "lastchannelcount": 2,
                    "maxclass": "mc.live.gain~",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "multichannelsignal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 722.0, 929.0, 39.0, 180.0 ],
                    "saved_attribute_attributes": {
                        "slidercolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_longname": "mc.live.gain~[7]",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "mc.live.gain~[7]",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "showname": 0,
                    "shownumber": 0,
                    "slidercolor": [ 0.3058823529411765, 0.4823529411764706, 0.9098039215686274, 1.0 ],
                    "varname": "mc.live.gain~[1]"
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 3,
                    "bordercolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ],
                    "id": "obj-116",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 481.0, 1509.0, 212.0, 399.0 ],
                    "proportion": 0.5
                }
            },
            {
                "box": {
                    "id": "sp_mcpack",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 788.0, 1606.0, 88.0, 21.0 ],
                    "text": "mc.pack~ 2"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "hidden": 1,
                    "order": 1,
                    "source": [ "mask", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sum", 0 ],
                    "hidden": 1,
                    "order": 0,
                    "source": [ "mask", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "midpoints": [ 41.5, 1117.9736802577972, 23.473684549331665, 1117.9736802577972, 23.473684549331665, 1483.9736802577972, 510.5, 1483.9736802577972 ],
                    "order": 0,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "midpoints": [ 41.5, 1108.9736802577972, 17.473684549331665, 1108.9736802577972, 17.473684549331665, 913.9736802577972, 361.5, 913.9736802577972 ],
                    "order": 1,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "hidden": 1,
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-105", 1 ],
                    "midpoints": [ 840.25, 1576.1582860946655, 955.4651193618774, 1576.1582860946655, 955.4651193618774, 1540.1582860946655, 1089.5, 1540.1582860946655 ],
                    "source": [ "obj-101", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-105", 0 ],
                    "midpoints": [ 807.5, 1567.1582860946655, 783.4768381118774, 1567.1582860946655, 783.4768381118774, 1462.1582860946655, 960.4768381118774, 1462.1582860946655, 960.4768381118774, 1537.1582860946655, 972.5, 1537.1582860946655 ],
                    "source": [ "obj-101", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sp_mcpack", 1 ],
                    "source": [ "obj-103", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sp_mcpack", 0 ],
                    "source": [ "obj-103", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sp_mcpack", 1 ],
                    "source": [ "obj-104", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sp_mcpack", 0 ],
                    "source": [ "obj-104", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sp_mcpack", 1 ],
                    "source": [ "obj-105", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sp_mcpack", 0 ],
                    "source": [ "obj-105", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-118", 0 ],
                    "hidden": 1,
                    "order": 0,
                    "source": [ "obj-11", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 2 ],
                    "hidden": 1,
                    "midpoints": [ 552.9, 416.3188726902008, 1086.3729015523568, 416.3188726902008, 1086.3729015523568, 44.318872690200806, 1070.5, 44.318872690200806 ],
                    "order": 1,
                    "source": [ "obj-11", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 1 ],
                    "hidden": 1,
                    "midpoints": [ 527.7, 416.3188726902008, 1086.492144977674, 416.3188726902008, 1086.492144977674, 44.318872690200806, 952.5, 44.318872690200806 ],
                    "order": 2,
                    "source": [ "obj-11", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "hidden": 1,
                    "midpoints": [ 502.5, 416.3188726902008, 1086.730631828308, 416.3188726902008, 1086.730631828308, 53.318872690200806, 834.5, 53.318872690200806 ],
                    "order": 3,
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 1 ],
                    "order": 1,
                    "source": [ "obj-11", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "order": 2,
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 1 ],
                    "order": 3,
                    "source": [ "obj-11", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 0 ],
                    "order": 3,
                    "source": [ "obj-11", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 1 ],
                    "order": 2,
                    "source": [ "obj-11", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 0 ],
                    "order": 1,
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-92", 0 ],
                    "hidden": 1,
                    "order": 0,
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-93", 0 ],
                    "hidden": 1,
                    "order": 0,
                    "source": [ "obj-11", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 6 ],
                    "midpoints": [ 87.5, 1673.9572171261534, 471.97683811187744, 1673.9572171261534, 471.97683811187744, 1500.4039709568024, 573.5, 1500.4039709568024 ],
                    "source": [ "obj-111", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-55", 2 ],
                    "hidden": 1,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 0 ],
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-111", 1 ],
                    "source": [ "obj-15", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-111", 0 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-43", 0 ],
                    "midpoints": [ 325.5, 598.9736802577972, 17.473684549331665, 598.9736802577972, 17.473684549331665, 820.9736802577972, 42.5, 820.9736802577972 ],
                    "source": [ "obj-16", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-77", 0 ],
                    "midpoints": [ 54.5, 598.9736802577972, 17.473684549331665, 598.9736802577972, 17.473684549331665, 691.9736802577972, 42.5, 691.9736802577972 ],
                    "order": 1,
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "midpoints": [ 54.5, 598.9736802577972, 41.5, 598.9736802577972 ],
                    "order": 0,
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "hidden": 1,
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-44", 0 ],
                    "hidden": 1,
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 0 ],
                    "hidden": 1,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "hidden": 1,
                    "source": [ "obj-18", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-47", 0 ],
                    "hidden": 1,
                    "source": [ "obj-18", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "hidden": 1,
                    "source": [ "obj-18", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-101", 0 ],
                    "hidden": 1,
                    "order": 0,
                    "source": [ "obj-19", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-97", 0 ],
                    "hidden": 1,
                    "order": 2,
                    "source": [ "obj-19", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-98", 0 ],
                    "hidden": 1,
                    "order": 1,
                    "source": [ "obj-19", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 3 ],
                    "midpoints": [ 49.5, 1421.210522532463, 542.0, 1421.210522532463 ],
                    "order": 0,
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "midpoints": [ 49.5, 1303.9736802577972, 23.473684549331665, 1303.9736802577972, 23.473684549331665, 1117.9736802577972, 349.5, 1117.9736802577972 ],
                    "order": 1,
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 1 ],
                    "source": [ "obj-20", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 0 ],
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 7 ],
                    "midpoints": [ 717.5, 1534.0, 584.0, 1534.0 ],
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "hidden": 1,
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-78", 0 ],
                    "hidden": 1,
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-40", 0 ],
                    "midpoints": [ 432.5, 598.9736802577972, 419.5, 598.9736802577972 ],
                    "source": [ "obj-24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-41", 0 ],
                    "midpoints": [ 703.5, 598.9736802577972, 395.47368454933167, 598.9736802577972, 395.47368454933167, 691.9736802577972, 417.5, 691.9736802577972 ],
                    "source": [ "obj-24", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-66", 1 ],
                    "source": [ "obj-25", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-66", 0 ],
                    "source": [ "obj-25", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 0 ],
                    "midpoints": [ 731.5, 1348.9736802577972, 567.5, 1348.9736802577972 ],
                    "source": [ "obj-28", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30", 1 ],
                    "hidden": 1,
                    "midpoints": [ 1322.5, 303.18730902671814, 1322.5, 303.18730902671814 ],
                    "source": [ "obj-29", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 1 ],
                    "midpoints": [ 419.5, 1120.9736802577972, 404.47368454933167, 1120.9736802577972, 404.47368454933167, 1522.9736802577972, 521.0, 1522.9736802577972 ],
                    "order": 1,
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "midpoints": [ 419.5, 1108.9736802577972, 404.47368454933167, 1108.9736802577972, 404.47368454933167, 913.9736802577972, 731.5, 913.9736802577972 ],
                    "order": 0,
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-79", 0 ],
                    "hidden": 1,
                    "source": [ "obj-30", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 0 ],
                    "midpoints": [ 361.5, 1117.9736802577972, 401.47368454933167, 1117.9736802577972, 401.47368454933167, 1348.9736802577972, 567.5, 1348.9736802577972 ],
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "hidden": 1,
                    "midpoints": [ 1270.5, 448.8452024459839, 1155.999651670456, 448.8452024459839, 1155.999651670456, 376.8452024459839, 1179.5, 376.8452024459839 ],
                    "source": [ "obj-34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 0 ],
                    "midpoints": [ 817.5, 598.9736802577972, 804.5, 598.9736802577972 ],
                    "source": [ "obj-36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 0 ],
                    "midpoints": [ 1088.5, 598.9736802577972, 779.4736845493317, 598.9736802577972, 779.4736845493317, 691.9736802577972, 804.5, 691.9736802577972 ],
                    "source": [ "obj-36", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "hidden": 1,
                    "midpoints": [ 1176.5, 441.8452024459839, 1152.831682920456, 441.8452024459839, 1152.831682920456, 381.8452024459839, 1179.5, 381.8452024459839 ],
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 0 ],
                    "midpoints": [ 349.5, 1348.9736802577972, 567.5, 1348.9736802577972 ],
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 4 ],
                    "midpoints": [ 417.5, 1522.9736802577972, 552.5, 1522.9736802577972 ],
                    "order": 1,
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 0 ],
                    "midpoints": [ 417.5, 1315.9736802577972, 770.4736845493317, 1315.9736802577972, 770.4736845493317, 1120.9736802577972, 731.5, 1120.9736802577972 ],
                    "order": 0,
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 419.5, 676.9736802577972, 392.47368454933167, 676.9736802577972, 392.47368454933167, 913.9736802577972, 804.5, 913.9736802577972 ],
                    "source": [ "obj-40", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "midpoints": [ 417.5, 913.9736802577972, 17.473684549331665, 913.9736802577972, 17.473684549331665, 1117.9736802577972, 49.5, 1117.9736802577972 ],
                    "source": [ "obj-41", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "midpoints": [ 804.5, 676.9736802577972, 734.4736845493317, 676.9736802577972, 734.4736845493317, 913.9736802577972, 404.47368454933167, 913.9736802577972, 404.47368454933167, 1117.9736802577972, 417.5, 1117.9736802577972 ],
                    "source": [ "obj-42", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "midpoints": [ 42.5, 892.6872925758362, 419.5, 892.6872925758362 ],
                    "source": [ "obj-43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "hidden": 1,
                    "source": [ "obj-44", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "hidden": 1,
                    "source": [ "obj-45", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "hidden": 1,
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "hidden": 1,
                    "source": [ "obj-47", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "hidden": 1,
                    "source": [ "obj-48", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-65", 0 ],
                    "source": [ "obj-49", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 2 ],
                    "midpoints": [ 804.5, 1111.9736802577972, 770.4736845493317, 1111.9736802577972, 770.4736845493317, 1411.9736802577972, 531.5, 1411.9736802577972 ],
                    "order": 1,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-67", 0 ],
                    "midpoints": [ 804.5, 1111.9736802577972, 779.4736845493317, 1111.9736802577972, 779.4736845493317, 916.9736802577972, 1121.5, 916.9736802577972 ],
                    "order": 0,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "midpoints": [ 804.5, 916.9736802577972, 779.4736845493317, 916.9736802577972, 779.4736845493317, 1120.9736802577972, 803.5, 1120.9736802577972 ],
                    "source": [ "obj-50", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30", 0 ],
                    "hidden": 1,
                    "source": [ "obj-55", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-57", 0 ],
                    "source": [ "obj-56", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 1 ],
                    "source": [ "obj-57", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-57", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-55", 0 ],
                    "hidden": 1,
                    "source": [ "obj-59", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 5 ],
                    "midpoints": [ 803.5, 1411.9736802577972, 563.0, 1411.9736802577972 ],
                    "order": 1,
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-94", 0 ],
                    "midpoints": [ 803.5, 1315.9736802577972, 1166.4736845493317, 1315.9736802577972, 1166.4736845493317, 1120.9736802577972, 1118.5, 1120.9736802577972 ],
                    "order": 0,
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 0 ],
                    "midpoints": [ 731.5, 1111.9736802577972, 770.4736845493317, 1111.9736802577972, 770.4736845493317, 1348.9736802577972, 567.5, 1348.9736802577972 ],
                    "source": [ "obj-60", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-75", 0 ],
                    "source": [ "obj-65", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-76", 0 ],
                    "source": [ "obj-65", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 0 ],
                    "midpoints": [ 1121.5, 1111.9736802577972, 1166.4736845493317, 1111.9736802577972, 1166.4736845493317, 1348.9736802577972, 567.5, 1348.9736802577972 ],
                    "source": [ "obj-67", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-68", 0 ],
                    "source": [ "obj-69", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 1 ],
                    "source": [ "obj-75", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 0 ],
                    "source": [ "obj-76", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "midpoints": [ 42.5, 811.9736802577972, 17.473684549331665, 811.9736802577972, 17.473684549331665, 913.9736802577972, 41.5, 913.9736802577972 ],
                    "source": [ "obj-77", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tll", 0 ],
                    "hidden": 1,
                    "midpoints": [ 447.5, 329.6872925758362, 1090.6779880523682, 329.6872925758362, 1090.6779880523682, 85.53494882583618, 1211.5, 85.53494882583618 ],
                    "source": [ "obj-78", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "hidden": 1,
                    "source": [ "obj-79", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-37", 0 ],
                    "hidden": 1,
                    "source": [ "obj-8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "midpoints": [ 797.5, 1837.0, 717.5, 1837.0 ],
                    "order": 1,
                    "source": [ "obj-89", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-69", 0 ],
                    "midpoints": [ 797.5, 1837.0, 774.0, 1837.0, 774.0, 1591.0, 1050.0, 1591.0, 1050.0, 1582.0, 1062.5, 1582.0 ],
                    "order": 0,
                    "source": [ "obj-89", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "midpoints": [ 41.5, 676.9736802577972, 17.473684549331665, 676.9736802577972, 17.473684549331665, 913.9736802577972, 41.5, 913.9736802577972 ],
                    "source": [ "obj-9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 1 ],
                    "source": [ "obj-90", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 2 ],
                    "source": [ "obj-91", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 0 ],
                    "midpoints": [ 1118.5, 1348.9736802577972, 567.5, 1348.9736802577972 ],
                    "source": [ "obj-94", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-103", 1 ],
                    "midpoints": [ 840.25, 1462.1582860946655, 1089.5, 1462.1582860946655 ],
                    "source": [ "obj-97", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-103", 0 ],
                    "midpoints": [ 807.5, 1498.1582860946655, 795.4768381118774, 1498.1582860946655, 795.4768381118774, 1462.1582860946655, 969.4768381118774, 1462.1582860946655, 969.4768381118774, 1468.1582860946655, 972.5, 1468.1582860946655 ],
                    "source": [ "obj-97", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-104", 1 ],
                    "midpoints": [ 840.25, 1576.1582860946655, 960.4768381118774, 1576.1582860946655, 960.4768381118774, 1498.1582860946655, 1089.5, 1498.1582860946655 ],
                    "source": [ "obj-98", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-104", 0 ],
                    "midpoints": [ 807.5, 1531.1582860946655, 783.4768381118774, 1531.1582860946655, 783.4768381118774, 1461.3887548446655, 960.4768381118774, 1461.3887548446655, 960.4768381118774, 1507.1582860946655, 972.5, 1507.1582860946655 ],
                    "source": [ "obj-98", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-59", 0 ],
                    "hidden": 1,
                    "source": [ "sel1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 0 ],
                    "source": [ "sp_mcpack", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sel1", 0 ],
                    "hidden": 1,
                    "source": [ "sum", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mask", 0 ],
                    "hidden": 1,
                    "source": [ "tll", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-55", 1 ],
                    "hidden": 1,
                    "source": [ "tll", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-103": [ "mc.live.gain~[14]", "mc.live.gain~[14]", 0 ],
            "obj-104": [ "mc.live.gain~[15]", "mc.live.gain~[14]", 0 ],
            "obj-105": [ "mc.live.gain~[16]", "mc.live.gain~[14]", 0 ],
            "obj-1::obj-23": [ "sample", "sample", 0 ],
            "obj-21": [ "mc.live.gain~", "mc.live.gain~", 0 ],
            "obj-28": [ "mc.live.gain~[10]", "mc.live.gain~[7]", 0 ],
            "obj-2::obj-23": [ "sample[1]", "sample", 0 ],
            "obj-33": [ "mc.live.gain~[11]", "mc.live.gain~[7]", 0 ],
            "obj-38": [ "mc.live.gain~[12]", "mc.live.gain~[7]", 0 ],
            "obj-3::obj-23": [ "sample[2]", "sample", 0 ],
            "obj-4::obj-23": [ "sample[3]", "sample", 0 ],
            "obj-5::obj-23": [ "sample[4]", "sample", 0 ],
            "obj-60": [ "mc.live.gain~[7]", "mc.live.gain~[7]", 0 ],
            "obj-67": [ "mc.live.gain~[8]", "mc.live.gain~[7]", 0 ],
            "obj-69": [ "mc.live.gain~[9]", "mc.live.gain~[7]", 0 ],
            "obj-6::obj-23": [ "sample[5]", "sample", 0 ],
            "obj-94": [ "mc.live.gain~[13]", "mc.live.gain~[7]", 0 ],
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
        "autosave": 0,
        "styles": [
            {
                "name": "StrangeStyle",
                "default": {
                    "bgcolor": [ 0.9647058823529412, 0.9529411764705882, 0.9254901960784314, 1.0 ],
                    "editing_bgcolor": [ 0.9673275351524353, 0.9524412751197815, 0.9268162250518799, 1.0 ],
                    "fontface": [ 0 ],
                    "fontname": [ "Sana" ],
                    "fontsize": [ 12.0 ],
                    "locked_bgcolor": [ 0.9673275351524353, 0.9524412751197815, 0.9268162250518799, 1.0 ],
                    "syntax_objargcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ],
                    "syntax_objectcolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                },
                "parentstyle": "",
                "multi": 0
            }
        ]
    }
}