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
        "style": "spt",
        "boxes": [
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-22",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1423.0, 382.39218044281006, 87.0, 22.0 ],
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
                    "patching_rect": [ 1939.2158064842224, 243.13726997375488, 50.0, 22.0 ],
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
                    "patching_rect": [ 2001.9609084129333, 237.25491666793823, 29.5, 22.0 ],
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
                    "patching_rect": [ 1872.549135684967, 288.23531198501587, 85.33333587646484, 22.0 ],
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
                    "patching_rect": [ 1905.8824710845947, 109.80392837524414, 48.50000116229057, 22.0 ],
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
                    "patching_rect": [ 2001.9609084129333, 149.01961708068848, 78.0, 22.0 ],
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
                    "patching_rect": [ 2001.9609084129333, 178.43138360977173, 60.0, 22.0 ],
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
                    "patching_rect": [ 2001.9609084129333, 203.92158126831055, 33.0, 22.0 ],
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
                    "patching_rect": [ 1233.3334097862244, 64.70588636398315, 113.0, 22.0 ],
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
                    "patching_rect": [ 2021.5687527656555, 360.7843360900879, 135.0, 22.0 ],
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
                    "patching_rect": [ 1929.4118843078613, 1182.3530144691467, 70.0, 22.0 ],
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
                    "patching_rect": [ 945.0980978012085, 431.3725757598877, 748.4210793972015, 488.8420901298523 ],
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
                    "patching_rect": [ 1498.0393085479736, 1511.7647995948792, 320.0000114440918, 47.0 ],
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
                    "patching_rect": [ 1021.568690776825, 1500.0000929832458, 150.0, 47.0 ],
                    "text": "Simple Reverb with rate modulated by x param of attractor"
                }
            },
            {
                "box": {
                    "id": "obj-136",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1298.0392961502075, 1545.0981349945068, 150.0, 20.0 ],
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
                    "patching_rect": [ 1843.1373691558838, 1058.823595046997, 151.0, 33.0 ],
                    "text": "Drop your own samples in here if you wish"
                }
            },
            {
                "box": {
                    "id": "obj-133",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1709.804027557373, 760.7843608856201, 150.0, 20.0 ],
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
                    "patching_rect": [ 1698.0393209457397, 500.0000309944153, 150.0, 33.0 ],
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
                    "patching_rect": [ 1001.9608464241028, 341.1764917373657, 150.0, 33.0 ],
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
                    "patching_rect": [ 1296.0785117149353, 335.2941384315491, 150.0, 33.0 ],
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
                    "patching_rect": [ 1586.2746081352234, 345.09806060791016, 150.0, 47.0 ],
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
                    "patching_rect": [ 1564.705979347229, 103.92157506942749, 195.0, 24.0 ],
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
                    "patching_rect": [ 1266.666745185852, 105.8823595046997, 195.0, 24.0 ],
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
                    "patching_rect": [ 978.4314332008362, 105.8823595046997, 198.0, 24.0 ],
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
                    "patching_rect": [ 937.2549600601196, 29.411766529083252, 265.0, 31.0 ],
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
                    "patching_rect": [ 1131.372619152069, 398.03924036026, 38.0, 22.0 ],
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
                    "patching_rect": [ 962.7451577186584, 1421.5687155723572, 187.0, 22.0 ],
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
                    "patching_rect": [ 1662.7452011108398, 1343.1373381614685, 136.0, 26.0 ],
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
                    "patching_rect": [ 1662.7452011108398, 1301.960865020752, 136.0, 26.0 ],
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
                    "patching_rect": [ 1662.7452011108398, 1256.862823009491, 136.0, 26.0 ],
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
                    "patching_rect": [ 1498.0393085479736, 1321.5687093734741, 150.0, 32.0 ],
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
                    "patching_rect": [ 1498.0393085479736, 1288.2353739738464, 150.0, 32.0 ],
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
                    "patching_rect": [ 1498.0393085479736, 1254.9020385742188, 150.0, 32.0 ],
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
                    "patching_rect": [ 1294.117727279663, 1296.0785117149353, 140.0, 35.0 ],
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
                    "patching_rect": [ 1109.8039903640747, 1313.7255716323853, 101.0, 22.0 ],
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
                    "patching_rect": [ 1109.8039903640747, 1288.2353739738464, 36.0, 22.0 ],
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
                    "patching_rect": [ 1294.117727279663, 1390.1961646080017, 153.0, 102.0 ],
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
                    "patching_rect": [ 962.7451577186584, 1360.7843980789185, 165.0, 62.0 ],
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
                    "patching_rect": [ 1670.5883388519287, 1111.764774799347, 38.0, 88.0 ],
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
                    "patching_rect": [ 1149.019679069519, 1101.9608526229858, 38.0, 88.0 ],
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
                    "patching_rect": [ 1149.019679069519, 962.7451577186584, 38.0, 88.0 ],
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
                    "patching_rect": [ 1401.960871219635, 1111.764774799347, 38.0, 88.0 ],
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
                    "patching_rect": [ 1488.2353863716125, 1462.7451887130737, 214.0, 22.0 ],
                    "text": "mc.pack~ 2"
                }
            },
            {
                "box": {
                    "id": "obj-68",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1729.4118719100952, 1468.6275420188904, 78.0, 22.0 ],
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
                    "patching_rect": [ 1729.4118719100952, 1370.5883202552795, 38.0, 88.0 ],
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
                    "patching_rect": [ 1721.5687341690063, 1068.6275172233582, 78.0, 22.0 ],
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
                    "patching_rect": [ 1658.8236322402954, 956.8628044128418, 38.0, 88.0 ],
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
                    "patching_rect": [ 962.7451577186584, 1313.7255716323853, 90.0, 22.0 ],
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
                    "patching_rect": [ 962.7451577186584, 1288.2353739738464, 90.0, 22.0 ],
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
                    "patching_rect": [ 1086.274577140808, 398.03924036026, 38.0, 22.0 ],
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
                    "patching_rect": [ 1041.1765351295471, 398.03924036026, 38.0, 22.0 ],
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
                    "patching_rect": [ 1684.3138298988342, 1400.0000867843628, 36.0, 22.0 ],
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
                    "patching_rect": [ 1619.607943534851, 1400.0000867843628, 36.0, 22.0 ],
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
                    "patching_rect": [ 1488.2353863716125, 1429.411853313446, 214.0, 22.0 ],
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
                    "patching_rect": [ 2015.6863994598389, 296.07844972610474, 108.0, 23.0 ],
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
                    "patching_rect": [ 1872.549135684967, 321.56864738464355, 162.0, 23.0 ],
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
                    "patching_rect": [ 1872.549135684967, 358.8235516548157, 122.0, 23.0 ],
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
                    "patching_rect": [ 1233.3334097862244, 130.4117727279663, 265.0, 203.0 ],
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
                    "patching_rect": [ 1068.6275172233582, 619.6078815460205, 101.0, 302.0 ],
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
                    "patching_rect": [ 1292.1569428443909, 1360.7843980789185, 58.0, 22.0 ],
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
                    "patching_rect": [ 1386.2745957374573, 1360.7843980789185, 75.0, 22.0 ],
                    "text": "mc.sum~"
                }
            },
            {
                "box": {
                    "id": "obj-66",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 1294.117727279663, 1511.7647995948792, 157.0, 22.0 ],
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
                    "patching_rect": [ 1292.1569428443909, 1337.2549848556519, 112.0, 22.0 ],
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
                    "patching_rect": [ 1564.705979347229, 619.6078815460205, 100.0, 277.0 ],
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
                    "patching_rect": [ 1464.705973148346, 447.05885124206543, 173.0, 162.5 ],
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
                    "patching_rect": [ 1147.0588946342468, 366.66668939590454, 38.0, 22.0 ],
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
                    "patching_rect": [ 1096.0784993171692, 366.66668939590454, 38.0, 22.0 ],
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
                    "patching_rect": [ 1047.0588884353638, 366.66668939590454, 37.0, 22.0 ],
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
                    "patching_rect": [ 996.0784931182861, 366.66668939590454, 38.0, 22.0 ],
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
                    "patching_rect": [ 945.0980978012085, 366.66668939590454, 38.0, 22.0 ],
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
                    "patching_rect": [ 945.0980978012085, 341.1764917373657, 226.0, 22.0 ],
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
                    "patching_rect": [ 945.0980978012085, 129.4117727279663, 265.0, 205.0 ],
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
                    "patching_rect": [ 1166.666738986969, 619.6078815460205, 103.0, 277.0 ],
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
                    "patching_rect": [ 1464.705973148346, 619.6078815460205, 100.0, 277.0 ],
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
                    "patching_rect": [ 1364.705966949463, 619.6078815460205, 100.0, 277.0 ],
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
                    "patching_rect": [ 1266.666745185852, 619.6078815460205, 100.0, 277.0 ],
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
                    "patching_rect": [ 1870.5883512496948, 431.3725757598877, 89.0, 22.0 ],
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
                    "patching_rect": [ 968.6275110244751, 619.6078815460205, 101.0, 277.0 ],
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
                    "patching_rect": [ 1872.549135684967, 401.96080923080444, 229.0, 22.0 ],
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
                    "patching_rect": [ 1874.5099201202393, 64.70588636398315, 56.0, 22.0 ],
                    "restore": {
                        "DadrasParams": [ 2.651515151515151, 1.287878787878788, 3.409090909090909, 5.833333333333333, 6.590909090909091 ],
                        "Sound1Gain": [ -70.0 ],
                        "Sound2Gain": [ -70.0 ],
                        "Sound3Gain": [ -70.0 ],
                        "mc.live.gain~[1]": [ -70.0 ],
                        "mc.live.gain~[2]": [ -70.0 ],
                        "mc.live.gain~[3]": [ 0.0 ],
                        "mc.live.gain~[4]": [ -38.81517935258092 ],
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
                    "patching_rect": [ 1241.1765475273132, 450.98042011260986, 171.5, 159.0 ],
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
                    "patching_rect": [ 1011.7647686004639, 450.98042011260986, 174.0, 159.0 ],
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
                    "patching_rect": [ 1528.8135957717896, 128.81356239318848, 264.4067859649658, 198.30508947372437 ],
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
                    "patching_rect": [ 1294.117727279663, 1264.7059607505798, 92.5, 22.0 ],
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
                    "patching_rect": [ 1262.7451763153076, 380.39218044281006, 145.0, 26.0 ],
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
                    "patching_rect": [ 1482.353033065796, 1111.764774799347, 181.0, 88.0 ],
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
                    "patching_rect": [ 1482.353033065796, 962.7451577186584, 181.0, 88.0 ],
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
                    "patching_rect": [ 1225.4902720451355, 1111.764774799347, 181.0, 88.0 ],
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
                    "patching_rect": [ 1225.4902720451355, 962.7451577186584, 181.0, 88.0 ],
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
                    "patching_rect": [ 968.6275110244751, 1101.9608526229858, 181.0, 88.0 ],
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
                    "patching_rect": [ 968.6275110244751, 962.7451577186584, 181.0, 88.0 ],
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
                    "patching_rect": [ 1964.7060041427612, 431.3725757598877, 77.0, 22.0 ],
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
                    "patching_rect": [ 1403.9216556549072, 962.7451577186584, 38.0, 88.0 ],
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
                    "patching_rect": [ 927.4510378837585, 1250.9804697036743, 331.5789592266083, 307.3684320449829 ],
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
                    "patching_rect": [ 1272.5490984916687, 1235.2941942214966, 208.42106008529663, 349.4736967086792 ],
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
                    "patching_rect": [ 1482.353033065796, 1235.2941942214966, 389.4736981391907, 338.9473805427551 ],
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
                    "patching_rect": [ 939.2157444953918, 925.4902534484863, 881.0, 300.0 ],
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
                    "midpoints": [ 978.1275110244751, 1088.9793601036072, 1211.2158064842224, 1088.9793601036072, 1211.2158064842224, 1199.7332663536072, 1303.617727279663, 1199.7332663536072 ],
                    "order": 0,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "midpoints": [ 978.1275110244751, 1052.9793601036072, 956.2158064842224, 1052.9793601036072, 956.2158064842224, 947.9793601036072, 1158.519679069519, 947.9793601036072 ],
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
                    "midpoints": [ 1540.2893085479736, 1365.9793601036072, 1655.7040877342224, 1365.9793601036072, 1655.7040877342224, 1329.9793601036072, 1789.2452011108398, 1329.9793601036072 ],
                    "source": [ "obj-101", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-105", 0 ],
                    "midpoints": [ 1507.5393085479736, 1356.9793601036072, 1483.7158064842224, 1356.9793601036072, 1483.7158064842224, 1251.9793601036072, 1660.7158064842224, 1251.9793601036072, 1660.7158064842224, 1326.9793601036072, 1672.2452011108398, 1326.9793601036072 ],
                    "source": [ "obj-101", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 1 ],
                    "midpoints": [ 1701.4952011108398, 1287.9793601036072, 1660.7158064842224, 1287.9793601036072, 1660.7158064842224, 1386.9793601036072, 1562.7353863716125, 1386.9793601036072 ],
                    "source": [ "obj-103", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 0 ],
                    "midpoints": [ 1672.2452011108398, 1287.9793601036072, 1660.7158064842224, 1287.9793601036072, 1660.7158064842224, 1386.9793601036072, 1497.7353863716125, 1386.9793601036072 ],
                    "source": [ "obj-103", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 1 ],
                    "midpoints": [ 1701.4952011108398, 1323.9793601036072, 1660.7158064842224, 1323.9793601036072, 1660.7158064842224, 1386.9793601036072, 1562.7353863716125, 1386.9793601036072 ],
                    "source": [ "obj-104", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 0 ],
                    "midpoints": [ 1672.2452011108398, 1323.9793601036072, 1660.7158064842224, 1323.9793601036072, 1660.7158064842224, 1386.9793601036072, 1497.7353863716125, 1386.9793601036072 ],
                    "source": [ "obj-104", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 1 ],
                    "midpoints": [ 1701.4952011108398, 1386.9793601036072, 1562.7353863716125, 1386.9793601036072 ],
                    "source": [ "obj-105", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 0 ],
                    "midpoints": [ 1672.2452011108398, 1386.9793601036072, 1497.7353863716125, 1386.9793601036072 ],
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
                    "midpoints": [ 1322.6451763153077, 432.6109402179718, 1848.910719984211, 432.6109402179718, 1848.910719984211, 60.6109402179718, 1783.7203817367554, 60.6109402179718 ],
                    "order": 1,
                    "source": [ "obj-11", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 1 ],
                    "hidden": 1,
                    "midpoints": [ 1297.4451763153077, 432.6109402179718, 1849.0299634095281, 432.6109402179718, 1849.0299634095281, 60.6109402179718, 1661.0169887542725, 60.6109402179718 ],
                    "order": 1,
                    "source": [ "obj-11", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "hidden": 1,
                    "midpoints": [ 1272.2451763153076, 432.6109402179718, 1849.2684502601624, 432.6109402179718, 1849.2684502601624, 69.6109402179718, 1538.3135957717896, 69.6109402179718 ],
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
                    "midpoints": [ 972.2451577186584, 1461.1902976036072, 1262.2158064842224, 1461.1902976036072, 1262.2158064842224, 1226.5145163536072, 1366.617727279663, 1226.5145163536072 ],
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
                    "midpoints": [ 978.1275110244751, 1198.9051413536072, 1335.117727279663, 1198.9051413536072 ],
                    "order": 0,
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "midpoints": [ 978.1275110244751, 1193.9793601036072, 956.2158064842224, 1193.9793601036072, 956.2158064842224, 1088.9793601036072, 1158.519679069519, 1088.9793601036072 ],
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
                    "midpoints": [ 1411.460871219635, 1200.0848288536072, 1469.2158064842224, 1200.0848288536072, 1469.2158064842224, 1057.9793601036072, 1731.0687341690063, 1057.9793601036072 ],
                    "source": [ "obj-28", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30", 1 ],
                    "hidden": 1,
                    "midpoints": [ 2025.1863994598389, 319.47937655448914, 2025.049135684967, 319.47937655448914 ],
                    "source": [ "obj-29", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 1 ],
                    "midpoints": [ 1234.9902720451355, 1088.9793601036072, 1211.2158064842224, 1088.9793601036072, 1211.2158064842224, 1199.1395163536072, 1314.117727279663, 1199.1395163536072 ],
                    "order": 1,
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "midpoints": [ 1234.9902720451355, 1052.9793601036072, 1211.2158064842224, 1052.9793601036072, 1211.2158064842224, 947.9793601036072, 1413.4216556549072, 947.9793601036072 ],
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
                    "midpoints": [ 1158.519679069519, 1059.9793601036072, 1731.0687341690063, 1059.9793601036072 ],
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "hidden": 1,
                    "midpoints": [ 1974.2060041427612, 465.1372699737549, 1859.3837752342224, 465.1372699737549, 1859.3837752342224, 393.1372699737549, 1882.049135684967, 393.1372699737549 ],
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
                    "midpoints": [ 1880.0883512496948, 458.1372699737549, 1856.2158064842224, 458.1372699737549, 1856.2158064842224, 398.1372699737549, 1882.049135684967, 398.1372699737549 ],
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 0 ],
                    "midpoints": [ 1158.519679069519, 1200.9793601036072, 1468.4072127342224, 1200.9793601036072, 1468.4072127342224, 1058.9793601036072, 1731.0687341690063, 1058.9793601036072 ],
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 4 ],
                    "midpoints": [ 1234.9902720451355, 1200.4481101036072, 1345.617727279663, 1200.4481101036072 ],
                    "order": 1,
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 0 ],
                    "midpoints": [ 1234.9902720451355, 1201.9285788536072, 1211.2158064842224, 1201.9285788536072, 1211.2158064842224, 1086.9793601036072, 1411.460871219635, 1086.9793601036072 ],
                    "order": 0,
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 1276.166745185852, 947.9793601036072, 1491.853033065796, 947.9793601036072 ],
                    "source": [ "obj-40", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "midpoints": [ 1374.205966949463, 947.9793601036072, 1190.2158064842224, 947.9793601036072, 1190.2158064842224, 1088.9793601036072, 978.1275110244751, 1088.9793601036072 ],
                    "source": [ "obj-41", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "midpoints": [ 1474.205973148346, 947.9793601036072, 1188.2158064842224, 947.9793601036072, 1188.2158064842224, 1088.9793601036072, 1234.9902720451355, 1088.9793601036072 ],
                    "source": [ "obj-42", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "midpoints": [ 1176.166738986969, 908.9793601036072, 1234.9902720451355, 908.9793601036072 ],
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
                    "midpoints": [ 1491.853033065796, 1053.9793601036072, 1467.2158064842224, 1053.9793601036072, 1467.2158064842224, 1201.1942038536072, 1324.617727279663, 1201.1942038536072 ],
                    "order": 1,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-67", 0 ],
                    "midpoints": [ 1491.853033065796, 1052.9793601036072, 1469.2158064842224, 1052.9793601036072, 1469.2158064842224, 947.9793601036072, 1668.3236322402954, 947.9793601036072 ],
                    "order": 0,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "midpoints": [ 1574.205979347229, 947.9793601036072, 1469.2158064842224, 947.9793601036072, 1469.2158064842224, 1064.9793601036072, 1487.2158064842224, 1064.9793601036072, 1487.2158064842224, 1106.9793601036072, 1491.853033065796, 1106.9793601036072 ],
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
                    "midpoints": [ 1491.853033065796, 1200.4637351036072, 1356.117727279663, 1200.4637351036072 ],
                    "order": 1,
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-94", 0 ],
                    "midpoints": [ 1491.853033065796, 1202.1004538536072, 1469.2158064842224, 1202.1004538536072, 1469.2158064842224, 1059.9793601036072, 1680.0883388519287, 1059.9793601036072 ],
                    "order": 0,
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 0 ],
                    "midpoints": [ 1413.4216556549072, 1059.9793601036072, 1731.0687341690063, 1059.9793601036072 ],
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
                    "midpoints": [ 1668.3236322402954, 1059.9793601036072, 1731.0687341690063, 1059.9793601036072 ],
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
                    "midpoints": [ 1497.7353863716125, 1494.9793601036072, 1470.9384627342224, 1494.9793601036072, 1470.9384627342224, 1254.9793601036072, 1377.117727279663, 1254.9793601036072 ],
                    "order": 1,
                    "source": [ "obj-70", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-69", 0 ],
                    "midpoints": [ 1497.7353863716125, 1503.9793601036072, 1726.6689314842224, 1503.9793601036072, 1726.6689314842224, 1449.9793601036072, 1726.7158064842224, 1449.9793601036072, 1726.7158064842224, 1368.9793601036072, 1738.9118719100952, 1368.9793601036072 ],
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
                    "midpoints": [ 1242.8334097862244, 345.9793601036072, 1853.2158064842224, 345.9793601036072, 1853.2158064842224, 101.82701635360718, 1915.3824710845947, 101.82701635360718 ],
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
                    "midpoints": [ 1680.0883388519287, 1209.9793601036072, 1706.2158064842224, 1209.9793601036072, 1706.2158064842224, 1058.9793601036072, 1731.0687341690063, 1058.9793601036072 ],
                    "source": [ "obj-94", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-103", 1 ],
                    "midpoints": [ 1540.2893085479736, 1251.9793601036072, 1789.2452011108398, 1251.9793601036072 ],
                    "source": [ "obj-97", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-103", 0 ],
                    "midpoints": [ 1507.5393085479736, 1287.9793601036072, 1495.7158064842224, 1287.9793601036072, 1495.7158064842224, 1251.9793601036072, 1669.7158064842224, 1251.9793601036072, 1669.7158064842224, 1257.9793601036072, 1672.2452011108398, 1257.9793601036072 ],
                    "source": [ "obj-97", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-104", 1 ],
                    "midpoints": [ 1540.2893085479736, 1365.9793601036072, 1660.7158064842224, 1365.9793601036072, 1660.7158064842224, 1287.9793601036072, 1789.2452011108398, 1287.9793601036072 ],
                    "source": [ "obj-98", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-104", 0 ],
                    "midpoints": [ 1507.5393085479736, 1320.9793601036072, 1483.7158064842224, 1320.9793601036072, 1483.7158064842224, 1251.2098288536072, 1660.7158064842224, 1251.2098288536072, 1660.7158064842224, 1296.9793601036072, 1672.2452011108398, 1296.9793601036072 ],
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