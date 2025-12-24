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
        "rect": [ 34.0, 99.0, 1016.0, 823.0 ],
        "style": "spt",
        "boxes": [
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1037.0, 233.1579098701477, 50.0, 22.0 ],
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
                    "patching_rect": [ 1100.0, 228.1579098701477, 29.5, 22.0 ],
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
                    "patching_rect": [ 970.0, 278.1579098701477, 85.33333587646484, 22.0 ],
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
                    "patching_rect": [ 1003.0, 101.1579098701477, 48.50000116229057, 22.0 ],
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
                    "patching_rect": [ 1100.0, 139.1579098701477, 78.0, 22.0 ],
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
                    "patching_rect": [ 1100.0, 169.1579098701477, 60.0, 22.0 ],
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
                    "patching_rect": [ 1100.0, 195.1579098701477, 33.0, 22.0 ],
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
                    "patching_rect": [ 330.52632761001587, 56.0, 113.0, 22.0 ],
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
                    "patching_rect": [ 1119.0, 351.1579098701477, 135.0, 22.0 ],
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
                    "patching_rect": [ 1028.0, 1174.0, 70.0, 22.0 ],
                    "text": "loadmess 1"
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 3,
                    "bordercolor": [ 0.1530902088, 0.4896173477, 0.6329272389, 1.0 ],
                    "id": "obj-139",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 43.157896280288696, 423.1579098701477, 748.4210793972015, 488.8420901298523 ],
                    "proportion": 0.5
                }
            },
            {
                "box": {
                    "id": "obj-138",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 595.7894949913025, 1503.0, 320.0000114440918, 47.0 ],
                    "text": "Some samples run through an fft panning effect inspired by the slink filter but using the attractor signals https://hypnusrecords.com/shop/p/slink"
                }
            },
            {
                "box": {
                    "id": "obj-137",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 120.0, 1490.5, 150.0, 47.0 ],
                    "text": "Simple Reverb with rate modulated by x param of attractor"
                }
            },
            {
                "box": {
                    "id": "obj-136",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 395.5, 1535.7895286083221, 150.0, 20.0 ],
                    "text": "Basic little master chain"
                }
            },
            {
                "box": {
                    "id": "obj-134",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 941.0526652336121, 1049.0, 151.0, 33.0 ],
                    "text": "Drop your own samples in here if you wish"
                }
            },
            {
                "box": {
                    "id": "obj-133",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 808.4210815429688, 751.0, 150.0, 20.0 ],
                    "text": "Alter the rhythm modifiers"
                }
            },
            {
                "box": {
                    "id": "obj-132",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 796.8421337604523, 490.52633333206177, 150.0, 33.0 ],
                    "text": "Adjust the gate combination agorithm"
                }
            },
            {
                "box": {
                    "id": "obj-130",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 100.6578962802887, 331.5789592266083, 150.0, 33.0 ],
                    "text": "Adjust the attractor parmeters - careful!"
                }
            },
            {
                "box": {
                    "id": "obj-129",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 395.0, 326.0789592266083, 150.0, 33.0 ],
                    "text": "Morph between 4 saved presets"
                }
            },
            {
                "box": {
                    "id": "obj-128",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 684.8684434890747, 335.7894856929779, 150.0, 47.0 ],
                    "text": "Drag the display to explore the phase space of the current parameters"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-124",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 662.3684434890747, 95.05263590812683, 195.0, 24.0 ],
                    "text": "Attractor Display",
                    "textcolor": [ 0.976470588235294, 0.780392156862745, 0.309803921568627, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-123",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 365.52632761001587, 95.89474034309387, 195.0, 24.0 ],
                    "text": "Preset Morphing",
                    "textcolor": [ 0.976470588235294, 0.780392156862745, 0.309803921568627, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-122",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 76.6578962802887, 95.89474034309387, 198.0, 24.0 ],
                    "text": "Attractor Parameters",
                    "textcolor": [ 0.976470588235294, 0.780392156862745, 0.309803921568627, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "fontsize": 22.0,
                    "id": "obj-120",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 36.0, 21.0, 265.0, 31.0 ],
                    "text": "SPT Demo 1",
                    "textcolor": [ 0.952941176470588, 0.447058823529412, 0.172549019607843, 1.0 ]
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-118",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 229.47369241714478, 389.4736981391907, 38.0, 22.0 ],
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
                    "patching_rect": [ 61.0, 1413.0, 187.0, 22.0 ],
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
                    "patching_rect": [ 761.0, 1333.2632081508636, 136.0, 26.0 ],
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
                    "patching_rect": [ 761.0, 1292.0, 136.0, 26.0 ],
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
                    "patching_rect": [ 761.0, 1248.0, 136.0, 26.0 ],
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
                    "patching_rect": [ 596.0, 1313.0, 150.0, 32.0 ],
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
                    "patching_rect": [ 596.0, 1279.0, 150.0, 32.0 ],
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
                    "patching_rect": [ 596.0, 1245.0, 150.0, 32.0 ],
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
                    "patching_rect": [ 392.0, 1287.5, 140.0, 35.0 ],
                    "text": "mc.abl.dsp.compander~ @shape 0.5"
                }
            },
            {
                "box": {
                    "id": "obj-35",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 207.0, 1305.0, 101.0, 22.0 ],
                    "text": "scale~ -1. 1. 0. 5."
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 207.0, 1279.0, 36.0, 22.0 ],
                    "text": "r~ _x"
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
                    "patching_rect": [ 392.0, 1382.0, 153.0, 102.0 ],
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
                    "patching_rect": [ 61.0, 1352.0, 165.0, 62.0 ],
                    "text": "abl.dsp.tides~ @tides 1. @mix 1. @damping 0.3 @decay 4.4 @size 0.37 @ins rate",
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
                    "patching_rect": [ 769.0, 1102.0, 38.0, 88.0 ],
                    "saved_attribute_attributes": {
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
                    "patching_rect": [ 248.0, 1093.0, 38.0, 88.0 ],
                    "saved_attribute_attributes": {
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
                    "patching_rect": [ 248.0, 953.0, 38.0, 88.0 ],
                    "saved_attribute_attributes": {
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
                    "patching_rect": [ 499.0, 1102.0, 38.0, 88.0 ],
                    "saved_attribute_attributes": {
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
                    "varname": "mc.live.gain~[4]"
                }
            },
            {
                "box": {
                    "id": "obj-70",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 587.0, 1453.0, 214.0, 22.0 ],
                    "text": "mc.pack~ 2"
                }
            },
            {
                "box": {
                    "id": "obj-68",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 828.0, 1459.0, 78.0, 22.0 ],
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
                    "patching_rect": [ 828.0, 1361.2632081508636, 38.0, 88.0 ],
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
                    "patching_rect": [ 820.0, 1060.0, 78.0, 22.0 ],
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
                    "patching_rect": [ 756.7895014286041, 948.0, 38.0, 88.0 ],
                    "saved_attribute_attributes": {
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
                    "patching_rect": [ 61.0, 1305.0, 90.0, 22.0 ],
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
                    "patching_rect": [ 61.0, 1279.0, 90.0, 22.0 ],
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
                    "patching_rect": [ 185.26316452026367, 388.42106652259827, 38.0, 22.0 ],
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
                    "patching_rect": [ 140.00000500679016, 388.42106652259827, 38.0, 22.0 ],
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
                    "patching_rect": [ 782.0, 1390.0, 36.0, 22.0 ],
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
                    "patching_rect": [ 717.0, 1390.0, 36.0, 22.0 ],
                    "text": "r~ _x"
                }
            },
            {
                "box": {
                    "id": "obj-89",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 587.0, 1420.0, 214.0, 22.0 ],
                    "text": "StrangePan"
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
                    "patching_rect": [ 1113.0, 286.1579098701477, 108.0, 23.0 ],
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
                    "patching_rect": [ 970.0, 313.1579098701477, 162.0, 23.0 ],
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
                    "patching_rect": [ 970.0, 350.1579098701477, 122.0, 23.0 ],
                    "text": "prepend recallmulti"
                }
            },
            {
                "box": {
                    "candycane": 4,
                    "candycane2": [ 0.976470588235294, 0.254901960784314, 0.266666666666667, 0.68 ],
                    "candycane3": [ 0.952941176470588, 0.447058823529412, 0.172549019607843, 0.7 ],
                    "candycane4": [ 0.2429931462, 0.5804384947, 0.4775273204, 0.81 ],
                    "candycane5": [ 0.341176470588235, 0.458823529411765, 0.564705882352941, 1.0 ],
                    "clickmoveinactive": 0,
                    "displayknob": 1,
                    "id": "obj-78",
                    "knobcolor": [ 0.976470588235294, 0.780392156862745, 0.309803921568627, 1.0 ],
                    "maxclass": "nodes",
                    "mousemode": 2,
                    "nodecolor": [ 0.1530902088, 0.4896173477, 0.6329272389, 1.0 ],
                    "nodenumber": 4,
                    "nodesnames": [ "1", "2", "3", "4" ],
                    "nsize": [ 0.4, 0.4, 0.4, 0.4 ],
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 330.52632761001587, 122.05263590812683, 265.0, 203.0 ],
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
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 167.0, 610.0, 101.0, 302.0 ],
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
                    "patching_rect": [ 391.0, 1352.0, 58.0, 22.0 ],
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
                    "patching_rect": [ 484.0, 1352.0, 75.0, 22.0 ],
                    "text": "mc.sum~"
                }
            },
            {
                "box": {
                    "id": "obj-66",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 392.0, 1503.0, 157.0, 22.0 ],
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
                    "patching_rect": [ 391.0, 1329.0, 112.0, 22.0 ],
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
                    "name": "ModTrigger.maxpat",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 662.0, 610.0, 100.0, 277.0 ],
                    "varname": "ModTrigger[6]",
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
                    "patching_rect": [ 562.0, 437.0, 173.0, 162.5 ],
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
                    "patching_rect": [ 244.21053504943848, 356.84211802482605, 38.0, 22.0 ],
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
                    "patching_rect": [ 194.73684906959534, 356.84211802482605, 38.0, 22.0 ],
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
                    "patching_rect": [ 144.2105314731598, 356.84211802482605, 37.0, 22.0 ],
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
                    "patching_rect": [ 93.68421387672424, 356.84211802482605, 38.0, 22.0 ],
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
                    "patching_rect": [ 43.157896280288696, 356.84211802482605, 38.0, 22.0 ],
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
                    "patching_rect": [ 43.157896280288696, 331.5789592266083, 226.0, 22.0 ],
                    "text": "unpack 0. 0. 0. 0. 0."
                }
            },
            {
                "box": {
                    "candicane2": [ 0.952941176470588, 0.447058823529412, 0.172549019607843, 1.0 ],
                    "candicane3": [ 0.564705882352941, 0.745098039215686, 0.427450980392157, 1.0 ],
                    "candicane4": [ 0.301960784313725, 0.564705882352941, 0.556862745098039, 1.0 ],
                    "candicane5": [ 0.152941176470588, 0.490196078431373, 0.631372549019608, 1.0 ],
                    "candycane": 6,
                    "contdata": 1,
                    "id": "obj-17",
                    "maxclass": "multislider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 43.157896280288696, 121.05263590812683, 265.0, 205.0 ],
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
                    "name": "ModTrigger.maxpat",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 265.0, 610.0, 103.0, 277.0 ],
                    "varname": "ModTrigger[5]",
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
                    "name": "ModTrigger.maxpat",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 562.0, 610.0, 100.0, 277.0 ],
                    "varname": "ModTrigger[4]",
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
                    "name": "ModTrigger.maxpat",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 463.0, 610.0, 100.0, 277.0 ],
                    "varname": "ModTrigger[3]",
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
                    "name": "ModTrigger.maxpat",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 365.0, 610.0, 100.0, 277.0 ],
                    "varname": "ModTrigger[2]",
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
                    "patching_rect": [ 968.0, 423.1579098701477, 89.0, 22.0 ],
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
                    "name": "ModTrigger.maxpat",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 67.0, 610.0, 101.0, 277.0 ],
                    "varname": "ModTrigger[1]",
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
                    "patching_rect": [ 970.0, 393.1579098701477, 229.0, 22.0 ],
                    "saved_object_attributes": {
                        "client_rect": [ 4, 44, 358, 172 ],
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
                    "patching_rect": [ 973.0, 56.0, 56.0, 22.0 ],
                    "restore": {
                        "DadrasParams": [ 2.651515151515151, 1.287878787878788, 3.409090909090909, 5.833333333333333, 5.833333333333333 ],
                        "Sound1Gain": [ -70.0 ],
                        "Sound2Gain": [ -70.0 ],
                        "Sound3Gain": [ -9.328496128066693 ],
                        "mc.live.gain~[1]": [ -70.0 ],
                        "mc.live.gain~[2]": [ -61.69750656167977 ],
                        "mc.live.gain~[3]": [ -70.0 ],
                        "mc.live.gain~[4]": [ -8.820209973753322 ],
                        "mc.live.gain~[5]": [ -70.0 ],
                        "mc.live.gain~[6]": [ -70.0 ],
                        "mc.live.gain~[7]": [ -70.0 ]
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
                    "patching_rect": [ 338.4447503566742, 441.0, 171.5, 159.0 ],
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
                    "patching_rect": [ 110.0, 441.0, 174.0, 159.0 ],
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
                    "patching_rect": [ 627.3684434890747, 121.05263590812683, 265.0, 205.0 ],
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
                    "patching_rect": [ 392.0, 1255.0, 92.5, 22.0 ],
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
                    "patching_rect": [ 360.00001287460327, 371.57896065711975, 145.0, 26.0 ],
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
                    "name": "samplePlay.maxpat",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "multichannelsignal", "bang" ],
                    "patching_rect": [ 581.0, 1102.0, 181.0, 88.0 ],
                    "varname": "samplePlay",
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
                    "name": "samplePlay.maxpat",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "multichannelsignal", "bang" ],
                    "patching_rect": [ 581.0, 953.0, 181.0, 88.0 ],
                    "varname": "samplePlay[1]",
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
                    "name": "samplePlay.maxpat",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "multichannelsignal", "bang" ],
                    "patching_rect": [ 324.0, 1102.0, 181.0, 88.0 ],
                    "varname": "samplePlay[2]",
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
                    "name": "samplePlay.maxpat",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "multichannelsignal", "bang" ],
                    "patching_rect": [ 324.0, 953.0, 181.0, 88.0 ],
                    "varname": "samplePlay[3]",
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
                    "name": "samplePlay.maxpat",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "multichannelsignal", "bang" ],
                    "patching_rect": [ 67.0, 1093.0, 181.0, 88.0 ],
                    "varname": "samplePlay[4]",
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
                    "name": "samplePlay.maxpat",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "multichannelsignal", "bang" ],
                    "patching_rect": [ 67.0, 953.0, 181.0, 88.0 ],
                    "varname": "samplePlay[5]",
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
                    "patching_rect": [ 1063.0, 423.1579098701477, 77.0, 22.0 ],
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
                    "patching_rect": [ 502.5, 953.0, 38.0, 88.0 ],
                    "saved_attribute_attributes": {
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
                    "varname": "mc.live.gain~[1]"
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 3,
                    "bordercolor": [ 0.976470588235294, 0.254901960784314, 0.266666666666667, 1.0 ],
                    "id": "obj-80",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 26.0, 1242.1053075790405, 331.5789592266083, 307.3684320449829 ],
                    "proportion": 0.5
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 3,
                    "bordercolor": [ 0.2429931462, 0.5804384947, 0.4775273204, 1.0 ],
                    "id": "obj-116",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 370.42106580734253, 1226.2631516456604, 208.42106008529663, 349.4736967086792 ],
                    "proportion": 0.5
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 3,
                    "bordercolor": [ 0.952941176470588, 0.447058823529412, 0.172549019607843, 1.0 ],
                    "id": "obj-117",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 581.0526523590088, 1226.3158333301544, 389.4736981391907, 338.9473805427551 ],
                    "proportion": 0.5
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 3,
                    "bordercolor": [ 0.976470588235294, 0.780392156862745, 0.309803921568627, 1.0 ],
                    "id": "obj-99",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 36.84210658073425, 915.5, 881.0, 300.0 ],
                    "proportion": 0.5
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
                    "midpoints": [ 76.5, 1079.0, 309.0, 1079.0, 309.0, 1189.75390625, 401.5, 1189.75390625 ],
                    "order": 0,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "midpoints": [ 76.5, 1043.0, 54.0, 1043.0, 54.0, 938.0, 257.5, 938.0 ],
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
                    "midpoints": [ 638.25, 1356.0, 753.48828125, 1356.0, 753.48828125, 1320.0, 887.5, 1320.0 ],
                    "source": [ "obj-101", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-105", 0 ],
                    "midpoints": [ 605.5, 1347.0, 581.5, 1347.0, 581.5, 1242.0, 758.5, 1242.0, 758.5, 1317.0, 770.5, 1317.0 ],
                    "source": [ "obj-101", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 1 ],
                    "midpoints": [ 799.75, 1278.0, 758.5, 1278.0, 758.5, 1377.0, 661.5, 1377.0 ],
                    "source": [ "obj-103", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 0 ],
                    "midpoints": [ 770.5, 1278.0, 758.5, 1278.0, 758.5, 1377.0, 596.5, 1377.0 ],
                    "source": [ "obj-103", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 1 ],
                    "midpoints": [ 799.75, 1314.0, 758.5, 1314.0, 758.5, 1377.0, 661.5, 1377.0 ],
                    "source": [ "obj-104", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 0 ],
                    "midpoints": [ 770.5, 1314.0, 758.5, 1314.0, 758.5, 1377.0, 596.5, 1377.0 ],
                    "source": [ "obj-104", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 1 ],
                    "midpoints": [ 799.75, 1377.0, 661.5, 1377.0 ],
                    "source": [ "obj-105", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 0 ],
                    "midpoints": [ 770.5, 1377.0, 596.5, 1377.0 ],
                    "source": [ "obj-105", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-118", 0 ],
                    "hidden": 1,
                    "order": 1,
                    "source": [ "obj-11", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 2 ],
                    "hidden": 1,
                    "midpoints": [ 419.90001287460325, 422.6315801143646, 946.6949134999886, 422.6315801143646, 946.6949134999886, 50.631580114364624, 882.8684434890747, 50.631580114364624 ],
                    "order": 0,
                    "source": [ "obj-11", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 1 ],
                    "hidden": 1,
                    "midpoints": [ 394.70001287460326, 422.6315801143646, 946.8141569253057, 422.6315801143646, 946.8141569253057, 50.631580114364624, 759.8684434890747, 50.631580114364624 ],
                    "order": 1,
                    "source": [ "obj-11", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "hidden": 1,
                    "midpoints": [ 369.50001287460327, 422.6315801143646, 947.0526437759399, 422.6315801143646, 947.0526437759399, 59.631580114364624, 636.8684434890747, 59.631580114364624 ],
                    "order": 3,
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 1 ],
                    "order": 2,
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
                    "midpoints": [ 70.5, 1451.2109375, 360.0, 1451.2109375, 360.0, 1216.53515625, 464.5, 1216.53515625 ],
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
                    "source": [ "obj-16", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-77", 0 ],
                    "order": 1,
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
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
                    "midpoints": [ 76.5, 1188.92578125, 433.0, 1188.92578125 ],
                    "order": 0,
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "midpoints": [ 76.5, 1184.0, 54.0, 1184.0, 54.0, 1079.0, 257.5, 1079.0 ],
                    "order": 1,
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-66", 1 ],
                    "source": [ "obj-20", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-66", 0 ],
                    "source": [ "obj-20", 0 ]
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
                    "source": [ "obj-24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-41", 0 ],
                    "source": [ "obj-24", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-35", 0 ],
                    "source": [ "obj-26", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 0 ],
                    "midpoints": [ 508.5, 1190.10546875, 567.0, 1190.10546875, 567.0, 1048.0, 829.5, 1048.0 ],
                    "source": [ "obj-28", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30", 1 ],
                    "hidden": 1,
                    "midpoints": [ 1122.5, 309.50001645088196, 1122.5, 309.50001645088196 ],
                    "source": [ "obj-29", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 1 ],
                    "midpoints": [ 333.5, 1079.0, 309.0, 1079.0, 309.0, 1189.16015625, 412.0, 1189.16015625 ],
                    "order": 1,
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "midpoints": [ 333.5, 1043.0, 309.0, 1043.0, 309.0, 938.0, 512.0, 938.0 ],
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
                    "midpoints": [ 257.5, 1050.0, 829.5, 1050.0 ],
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "hidden": 1,
                    "midpoints": [ 1072.5, 455.1579098701477, 957.16796875, 455.1579098701477, 957.16796875, 383.1579098701477, 979.5, 383.1579098701477 ],
                    "source": [ "obj-34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 5 ],
                    "source": [ "obj-35", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 0 ],
                    "source": [ "obj-36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 0 ],
                    "source": [ "obj-36", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "hidden": 1,
                    "midpoints": [ 977.5, 448.1579098701477, 954.0, 448.1579098701477, 954.0, 388.1579098701477, 979.5, 388.1579098701477 ],
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 0 ],
                    "midpoints": [ 257.5, 1191.0, 566.19140625, 1191.0, 566.19140625, 1049.0, 829.5, 1049.0 ],
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 4 ],
                    "midpoints": [ 333.5, 1190.46875, 443.5, 1190.46875 ],
                    "order": 1,
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 0 ],
                    "midpoints": [ 333.5, 1191.94921875, 309.0, 1191.94921875, 309.0, 1077.0, 508.5, 1077.0 ],
                    "order": 0,
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 374.5, 938.0, 590.5, 938.0 ],
                    "source": [ "obj-40", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "midpoints": [ 472.5, 938.0, 288.0, 938.0, 288.0, 1079.0, 76.5, 1079.0 ],
                    "source": [ "obj-41", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "midpoints": [ 571.5, 938.0, 286.0, 938.0, 286.0, 1079.0, 333.5, 1079.0 ],
                    "source": [ "obj-42", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "midpoints": [ 274.5, 899.0, 333.5, 899.0 ],
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
                    "midpoints": [ 590.5, 1044.0, 565.0, 1044.0, 565.0, 1191.21484375, 422.5, 1191.21484375 ],
                    "order": 1,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-67", 0 ],
                    "midpoints": [ 590.5, 1043.0, 567.0, 1043.0, 567.0, 938.0, 766.2895014286041, 938.0 ],
                    "order": 0,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "midpoints": [ 671.5, 938.0, 567.0, 938.0, 567.0, 1055.0, 585.0, 1055.0, 585.0, 1097.0, 590.5, 1097.0 ],
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
                    "midpoints": [ 590.5, 1190.484375, 454.0, 1190.484375 ],
                    "order": 1,
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-94", 0 ],
                    "midpoints": [ 590.5, 1192.12109375, 567.0, 1192.12109375, 567.0, 1050.0, 778.5, 1050.0 ],
                    "order": 0,
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 0 ],
                    "midpoints": [ 512.0, 1050.0, 829.5, 1050.0 ],
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
                    "midpoints": [ 766.2895014286041, 1050.0, 829.5, 1050.0 ],
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
                    "destination": [ "obj-13", 7 ],
                    "midpoints": [ 596.5, 1485.0, 568.72265625, 1485.0, 568.72265625, 1245.0, 475.0, 1245.0 ],
                    "order": 1,
                    "source": [ "obj-70", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-69", 0 ],
                    "midpoints": [ 596.5, 1494.0, 824.453125, 1494.0, 824.453125, 1440.0, 824.5, 1440.0, 824.5, 1359.0, 837.5, 1359.0 ],
                    "order": 0,
                    "source": [ "obj-70", 0 ]
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
                    "source": [ "obj-77", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tll", 0 ],
                    "hidden": 1,
                    "midpoints": [ 340.02632761001587, 336.0, 951.0, 336.0, 951.0, 91.84765625, 1012.5, 91.84765625 ],
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
                    "destination": [ "obj-70", 1 ],
                    "source": [ "obj-89", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-70", 0 ],
                    "source": [ "obj-89", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 2 ],
                    "source": [ "obj-90", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 3 ],
                    "source": [ "obj-91", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 0 ],
                    "midpoints": [ 778.5, 1200.0, 804.0, 1200.0, 804.0, 1049.0, 829.5, 1049.0 ],
                    "source": [ "obj-94", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-103", 1 ],
                    "midpoints": [ 638.25, 1242.0, 887.5, 1242.0 ],
                    "source": [ "obj-97", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-103", 0 ],
                    "midpoints": [ 605.5, 1278.0, 593.5, 1278.0, 593.5, 1242.0, 767.5, 1242.0, 767.5, 1248.0, 770.5, 1248.0 ],
                    "source": [ "obj-97", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-104", 1 ],
                    "midpoints": [ 638.25, 1356.0, 758.5, 1356.0, 758.5, 1278.0, 887.5, 1278.0 ],
                    "source": [ "obj-98", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-104", 0 ],
                    "midpoints": [ 605.5, 1311.0, 581.5, 1311.0, 581.5, 1241.23046875, 758.5, 1241.23046875, 758.5, 1287.0, 770.5, 1287.0 ],
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
            "obj-1::obj-18": [ "dial", "dial", 0 ],
            "obj-1::obj-25": [ "mc.live.gain~", "mc.live.gain~", 0 ],
            "obj-28": [ "mc.live.gain~[10]", "mc.live.gain~[7]", 0 ],
            "obj-2::obj-18": [ "dial[1]", "dial", 0 ],
            "obj-2::obj-25": [ "mc.live.gain~[1]", "mc.live.gain~", 0 ],
            "obj-33": [ "mc.live.gain~[11]", "mc.live.gain~[7]", 0 ],
            "obj-38": [ "mc.live.gain~[12]", "mc.live.gain~[7]", 0 ],
            "obj-3::obj-18": [ "dial[2]", "dial", 0 ],
            "obj-3::obj-25": [ "mc.live.gain~[2]", "mc.live.gain~", 0 ],
            "obj-4::obj-18": [ "dial[3]", "dial", 0 ],
            "obj-4::obj-25": [ "mc.live.gain~[3]", "mc.live.gain~", 0 ],
            "obj-5::obj-18": [ "dial[4]", "dial", 0 ],
            "obj-5::obj-25": [ "mc.live.gain~[4]", "mc.live.gain~", 0 ],
            "obj-60": [ "mc.live.gain~[7]", "mc.live.gain~[7]", 0 ],
            "obj-67": [ "mc.live.gain~[8]", "mc.live.gain~[7]", 0 ],
            "obj-69": [ "mc.live.gain~[9]", "mc.live.gain~[7]", 0 ],
            "obj-6::obj-18": [ "dial[5]", "dial", 0 ],
            "obj-6::obj-25": [ "mc.live.gain~[5]", "mc.live.gain~", 0 ],
            "obj-94": [ "mc.live.gain~[13]", "mc.live.gain~[7]", 0 ],
            "parameterbanks": {
                "0": {
                    "index": 0,
                    "name": "",
                    "parameters": [ "-", "-", "-", "-", "-", "-", "-", "-" ],
                    "buttons": [ "-", "-", "-", "-", "-", "-", "-", "-" ]
                }
            },
            "parameter_overrides": {
                "obj-1::obj-25": {
                    "parameter_longname": "mc.live.gain~"
                },
                "obj-2::obj-25": {
                    "parameter_longname": "mc.live.gain~[1]"
                },
                "obj-3::obj-25": {
                    "parameter_longname": "mc.live.gain~[2]"
                },
                "obj-4::obj-25": {
                    "parameter_longname": "mc.live.gain~[3]"
                },
                "obj-5::obj-25": {
                    "parameter_longname": "mc.live.gain~[4]"
                },
                "obj-6::obj-25": {
                    "parameter_longname": "mc.live.gain~[5]"
                }
            },
            "inherited_shortname": 1
        },
        "autosave": 0
    }
}