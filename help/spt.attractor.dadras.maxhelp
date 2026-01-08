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
        "rect": [ 90.0, 99.0, 1019.0, 823.0 ],
        "showrootpatcherontab": 0,
        "showontab": 0,
        "boxes": [
            {
                "box": {
                    "id": "obj-4",
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
                        "rect": [ 0.0, 26.0, 1019.0, 797.0 ],
                        "showontab": 1,
                        "isolateaudio": 1,
                        "title": "Audio",
                        "boxes": [
                            {
                                "box": {
                                    "hidden": 1,
                                    "id": "obj-19",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 172.0, 332.5, 153.0, 22.0 ],
                                    "text": "loadmess speed_primary 5"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-7",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 494.0, 442.0, 114.0, 22.0 ],
                                    "text": "expr ($f1 + 100 / 2.)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-28",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
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
                                        "rect": [ 59.0, 118.0, 640.0, 480.0 ],
                                        "boxes": [
                                            {
                                                "box": {
                                                    "fontname": "Lato",
                                                    "fontsize": 12.0,
                                                    "id": "obj-2",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "signal" ],
                                                    "patching_rect": [ 56.0, 132.0, 124.0, 23.0 ],
                                                    "text": "gen~ @gen freeverb"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "fontname": "Lato",
                                                    "fontsize": 12.0,
                                                    "id": "obj-44",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "signal" ],
                                                    "patching_rect": [ 50.0, 100.0, 124.0, 23.0 ],
                                                    "text": "gen~ @gen freeverb"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "comment": "",
                                                    "id": "obj-14",
                                                    "index": 1,
                                                    "maxclass": "inlet",
                                                    "numinlets": 0,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "signal" ],
                                                    "patching_rect": [ 50.0, 40.0, 30.0, 30.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "comment": "",
                                                    "id": "obj-20",
                                                    "index": 2,
                                                    "maxclass": "inlet",
                                                    "numinlets": 0,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "signal" ],
                                                    "patching_rect": [ 85.0, 40.0, 30.0, 30.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "comment": "",
                                                    "id": "obj-24",
                                                    "index": 1,
                                                    "maxclass": "outlet",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 50.0, 215.0, 30.0, 30.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "comment": "",
                                                    "id": "obj-27",
                                                    "index": 2,
                                                    "maxclass": "outlet",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 85.0, 215.0, 30.0, 30.0 ]
                                                }
                                            }
                                        ],
                                        "lines": [
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-44", 0 ],
                                                    "source": [ "obj-14", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-27", 0 ],
                                                    "source": [ "obj-2", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-2", 0 ],
                                                    "source": [ "obj-20", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-24", 0 ],
                                                    "source": [ "obj-44", 0 ]
                                                }
                                            }
                                        ]
                                    },
                                    "patching_rect": [ 573.0, 506.0, 96.0, 22.0 ],
                                    "text": "p stereoVerb"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-9",
                                    "lastchannelcount": 0,
                                    "maxclass": "live.gain~",
                                    "numinlets": 2,
                                    "numoutlets": 5,
                                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 807.0, 483.0, 48.0, 136.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_longname": "live.gain~",
                                            "parameter_mmax": 6.0,
                                            "parameter_mmin": -70.0,
                                            "parameter_modmode": 3,
                                            "parameter_shortname": "live.gain~",
                                            "parameter_type": 0,
                                            "parameter_unitstyle": 4
                                        }
                                    },
                                    "showname": 0,
                                    "shownumber": 0,
                                    "varname": "live.gain~"
                                }
                            },
                            {
                                "box": {
                                    "hidden": 1,
                                    "id": "obj-4",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 728.0, 491.0, 77.0, 22.0 ],
                                    "text": "loadmess 20"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-37",
                                    "maxclass": "newobj",
                                    "numinlets": 5,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 414.0, 535.0, 333.0, 22.0 ],
                                    "text": "M4L.bal2~"
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
                                    "patching_rect": [ 813.0, 332.0, 166.0, 23.0 ],
                                    "text": "loadmess 1 2 3 4 5"
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
                                    "patching_rect": [ 643.0, 385.0, 162.0, 23.0 ],
                                    "text": "vexpr ($f1*0.9999)+$f2"
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Arial",
                                    "fontsize": 13.0,
                                    "hidden": 1,
                                    "id": "obj-31",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 643.0, 414.0, 122.0, 23.0 ],
                                    "text": "prepend recallmulti"
                                }
                            },
                            {
                                "box": {
                                    "hidden": 1,
                                    "id": "obj-23",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "outlettype": [ "", "", "", "" ],
                                    "patching_rect": [ 501.0, 40.0, 100.0, 22.0 ],
                                    "restore": {
                                        "a": [ "a", 2.7094198073695948 ],
                                        "b": [ "b", 8.598842514985959 ],
                                        "c": [ "c", 1.6424738830528098 ],
                                        "d": [ "d", 0.3097850488445655 ],
                                        "e": [ "e", 5.255487468880194 ],
                                        "live.gain~": [ -70.0 ]
                                    },
                                    "text": "autopattr",
                                    "varname": "u156007186"
                                }
                            },
                            {
                                "box": {
                                    "hidden": 1,
                                    "id": "obj-6",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 643.0, 453.0, 158.0, 22.0 ],
                                    "saved_object_attributes": {
                                        "client_rect": [ 4, 44, 358, 172 ],
                                        "parameter_enable": 0,
                                        "parameter_mappable": 0,
                                        "storage_rect": [ 583, 69, 1034, 197 ]
                                    },
                                    "text": "pattrstorage strangeAudio",
                                    "varname": "strangeAudio"
                                }
                            },
                            {
                                "box": {
                                    "candycane": 5,
                                    "candycane2": [ 0.262745098039216, 0.666666666666667, 0.545098039215686, 0.97 ],
                                    "candycane3": [ 0.952941176470588, 0.447058823529412, 0.172549019607843, 0.79 ],
                                    "candycane4": [ 0.976470588235294, 0.254901960784314, 0.266666666666667, 0.72 ],
                                    "candycane5": [ 0.976470588235294, 0.780392156862745, 0.309803921568627, 0.49 ],
                                    "candycane6": [ 0.960784, 0.827451, 0.156863, 1.0 ],
                                    "clickmoveinactive": 0,
                                    "displayknob": 2,
                                    "id": "obj-3",
                                    "maxclass": "nodes",
                                    "mousemode": 2,
                                    "nodecolor": [ 0.152941176470588, 0.490196078431373, 0.631372549019608, 1.0 ],
                                    "nodenumber": 5,
                                    "nodesnames": [ "1", "2", "3", "4", "5" ],
                                    "nsize": [ 0.4, 0.4, 0.4, 0.4, 0.3 ],
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 450.0, 76.5, 297.0, 269.0 ],
                                    "xplace": [ 0.794444444444444, 0.19, 0.79, 0.233333333333333, 0.505555555555556 ],
                                    "yplace": [ 0.781065088757396, 0.21, 0.21, 0.798816568047337, 0.497041420118343 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-21",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 493.0, 409.0, 100.0, 22.0 ],
                                    "text": "snapshot~ 100"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-11",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 493.0, 381.0, 100.0, 22.0 ],
                                    "text": "*~ 100"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-12",
                                    "maxclass": "newobj",
                                    "numinlets": 5,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 412.0, 472.0, 100.0, 22.0 ],
                                    "text": "M4L.bal2~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 0,
                                    "patching_rect": [ 803.0, 641.0, 70.5, 22.0 ],
                                    "text": "dac~"
                                }
                            },
                            {
                                "box": {
                                    "activelinecolor": [ 0.262745098039216, 0.666666666666667, 0.545098039215686, 1.0 ],
                                    "id": "obj-26",
                                    "interval": 1.0,
                                    "maxclass": "live.scope~",
                                    "mode": 1,
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 245.0, 463.5, 96.0, 77.0 ],
                                    "presentation": 1,
                                    "presentation_rect": [ 739.0, 541.0, 180.0, 74.0 ],
                                    "samples": 2500.0,
                                    "smooth": 0,
                                    "trigger_direction": 1,
                                    "trigger_threshold": 0.01
                                }
                            },
                            {
                                "box": {
                                    "activelinecolor": [ 0.976470588235294, 0.780392156862745, 0.309803921568627, 1.0 ],
                                    "id": "obj-25",
                                    "interval": 1.0,
                                    "maxclass": "live.scope~",
                                    "mode": 1,
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 139.0, 463.5, 96.0, 77.0 ],
                                    "presentation": 1,
                                    "presentation_rect": [ 628.0, 540.0, 180.0, 74.0 ],
                                    "samples": 2500.0,
                                    "smooth": 0,
                                    "trigger_direction": 1,
                                    "trigger_threshold": 0.21
                                }
                            },
                            {
                                "box": {
                                    "activelinecolor": [ 0.976470588235294, 0.254901960784314, 0.266666666666667, 1.0 ],
                                    "id": "obj-305",
                                    "interval": 1.0,
                                    "maxclass": "live.scope~",
                                    "mode": 1,
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 33.0, 463.5, 96.0, 77.0 ],
                                    "presentation": 1,
                                    "presentation_rect": [ 123.5, 174.0, 180.0, 74.0 ],
                                    "samples": 2500.0,
                                    "smooth": 0,
                                    "trigger_direction": 1,
                                    "trigger_threshold": 0.1
                                }
                            },
                            {
                                "box": {
                                    "bgcolor": [ 0.952941, 0.564706, 0.098039, 1.0 ],
                                    "color": [ 0.2980392156862745, 0.2980392156862745, 0.2980392156862745, 1.0 ],
                                    "id": "obj-5",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 6,
                                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                                    "patching_rect": [ 33.0, 296.0, 111.0, 22.0 ],
                                    "text": "spt.attractor.dadras",
                                    "varname": "dadras"
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
                                    "patching_rect": [ 184.0, 168.0, 150.0, 22.0 ],
                                    "varname": "a"
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
                                    "patching_rect": [ 184.0, 192.0, 150.0, 22.0 ],
                                    "varname": "b"
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
                                    "patching_rect": [ 184.0, 216.0, 150.0, 22.0 ],
                                    "varname": "c"
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
                                    "patching_rect": [ 184.0, 240.0, 150.0, 22.0 ],
                                    "varname": "d"
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
                                    "patching_rect": [ 184.0, 263.0, 150.0, 22.0 ],
                                    "varname": "e"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-88",
                                    "linecount": 3,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 105.0, 401.0, 47.0 ],
                                    "saved_attribute_attributes": {
                                        "textcolor": {
                                            "expression": "themecolor.live_control_fg"
                                        }
                                    },
                                    "text": "The attractor can be run at audio rates and used as a chaotic oscillator. Either set of outputs can be run at any speed, however the second attractor is 'corrected' to the firsts settings on parameter changes."
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
                                    "text": "written by Max Worgan (c) 2025, MIT Licence"
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
                                    "patching_rect": [ 30.0, 15.0, 417.0, 51.0 ],
                                    "text": "spt.attractor.dadras",
                                    "textcolor": [ 0.952941176470588, 0.447058823529412, 0.172549019607843, 1.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-21", 0 ],
                                    "source": [ "obj-11", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-28", 1 ],
                                    "midpoints": [ 502.5, 499.5, 659.5, 499.5 ],
                                    "order": 0,
                                    "source": [ "obj-12", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-28", 0 ],
                                    "midpoints": [ 421.5, 499.5, 582.5, 499.5 ],
                                    "order": 0,
                                    "source": [ "obj-12", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-37", 1 ],
                                    "midpoints": [ 502.5, 470.0, 502.0, 470.0 ],
                                    "order": 1,
                                    "source": [ "obj-12", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-37", 0 ],
                                    "midpoints": [ 421.5, 470.0, 423.5, 470.0 ],
                                    "order": 1,
                                    "source": [ "obj-12", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 193.5, 216.0, 42.5, 216.0 ],
                                    "source": [ "obj-15", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 193.5, 240.0, 42.5, 240.0 ],
                                    "source": [ "obj-16", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 193.5, 264.0, 42.5, 264.0 ],
                                    "source": [ "obj-17", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 193.5, 290.5, 42.5, 290.5 ],
                                    "source": [ "obj-18", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "hidden": 1,
                                    "source": [ "obj-19", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-7", 0 ],
                                    "source": [ "obj-21", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-37", 3 ],
                                    "midpoints": [ 659.5, 531.0, 659.0, 531.0 ],
                                    "source": [ "obj-28", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-37", 2 ],
                                    "midpoints": [ 582.5, 531.0, 580.5, 531.0 ],
                                    "source": [ "obj-28", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-30", 1 ],
                                    "hidden": 1,
                                    "midpoints": [ 822.5, 391.5, 805.0, 391.5, 805.0, 367.5, 795.5, 367.5 ],
                                    "source": [ "obj-29", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-30", 0 ],
                                    "hidden": 1,
                                    "midpoints": [ 459.5, 370.25, 652.5, 370.25 ],
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-31", 0 ],
                                    "hidden": 1,
                                    "source": [ "obj-30", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-6", 0 ],
                                    "hidden": 1,
                                    "source": [ "obj-31", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-9", 1 ],
                                    "midpoints": [ 737.5, 579.265625, 803.1171875, 579.265625, 803.1171875, 474.0, 845.5, 474.0 ],
                                    "source": [ "obj-37", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-9", 0 ],
                                    "midpoints": [ 423.5, 578.91796875, 802.140625, 578.91796875, 802.140625, 480.4140625, 816.5, 480.4140625 ],
                                    "source": [ "obj-37", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-37", 4 ],
                                    "hidden": 1,
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
                                    "midpoints": [ 97.7, 372.0, 305.5, 372.0, 305.5, 372.0, 502.5, 372.0 ],
                                    "source": [ "obj-5", 3 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-12", 3 ],
                                    "midpoints": [ 79.3, 380.0, 482.25, 380.0 ],
                                    "order": 0,
                                    "source": [ "obj-5", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-12", 2 ],
                                    "midpoints": [ 60.9, 391.0, 462.0, 391.0 ],
                                    "order": 0,
                                    "source": [ "obj-5", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-12", 1 ],
                                    "midpoints": [ 60.9, 402.0, 441.75, 402.0 ],
                                    "order": 1,
                                    "source": [ "obj-5", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-12", 0 ],
                                    "midpoints": [ 42.5, 412.0, 421.5, 412.0 ],
                                    "order": 0,
                                    "source": [ "obj-5", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-25", 0 ],
                                    "midpoints": [ 60.9, 447.0, 148.5, 447.0 ],
                                    "order": 2,
                                    "source": [ "obj-5", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-26", 0 ],
                                    "midpoints": [ 79.3, 447.0, 254.5, 447.0 ],
                                    "order": 1,
                                    "source": [ "obj-5", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-305", 0 ],
                                    "midpoints": [ 42.5, 447.0, 42.5, 447.0 ],
                                    "order": 1,
                                    "source": [ "obj-5", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-12", 4 ],
                                    "source": [ "obj-7", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 193.5, 192.0, 42.5, 192.0 ],
                                    "source": [ "obj-8", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 1 ],
                                    "source": [ "obj-9", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "source": [ "obj-9", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 218.0, 84.0, 227.0, 22.0 ],
                    "text": "p mxwn.dadras.audio.maxhelp",
                    "varname": "mxwn.dadras.audio.maxhelp"
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
                        "rect": [ 0.0, 26.0, 1019.0, 797.0 ],
                        "showontab": 1,
                        "boxes": [],
                        "lines": []
                    },
                    "patching_rect": [ 454.0, 84.0, 100.0, 22.0 ],
                    "text": "p ?"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "linecount": 3,
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
                        "rect": [ 90.0, 125.0, 1019.0, 797.0 ],
                        "showontab": 1,
                        "title": "Basic",
                        "boxes": [
                            {
                                "box": {
                                    "bgmode": 0,
                                    "border": 0,
                                    "clickthrough": 0,
                                    "enablehscroll": 0,
                                    "enablevscroll": 0,
                                    "id": "obj-19",
                                    "lockeddragscroll": 0,
                                    "lockedsize": 0,
                                    "maxclass": "bpatcher",
                                    "name": "AttractorDisplay.maxpat",
                                    "numinlets": 3,
                                    "numoutlets": 0,
                                    "offset": [ 0.0, 0.0 ],
                                    "patching_rect": [ 487.0, 173.0, 270.0, 198.0 ],
                                    "varname": "AttractorDisplay",
                                    "viewvisibility": 1
                                }
                            },
                            {
                                "box": {
                                    "activelinecolor": [ 0.2429931462, 0.5804384947, 0.4775273204, 1.0 ],
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
                                    "activelinecolor": [ 0.976470588235294, 0.780392156862745, 0.309803921568627, 1.0 ],
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
                                    "activelinecolor": [ 0.976470588235294, 0.254901960784314, 0.266666666666667, 1.0 ],
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
                                    "patching_rect": [ 126.0, 347.0, 205.0, 33.0 ],
                                    "text": "Observe some different behaviours saved in presets",
                                    "textcolor": [ 0.976470588235294, 0.780392156862745, 0.309803921568627, 1.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-9",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 759.0, 261.0, 173.0, 33.0 ],
                                    "text": "Drag the AttractorDisplay to see the 3D space",
                                    "textcolor": [ 0.976470588235294, 0.780392156862745, 0.309803921568627, 1.0 ]
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
                                    "patching_rect": [ 137.0, 388.0, 160.0, 32.0 ],
                                    "preset_data": [
                                        {
                                            "number": 1,
                                            "data": [ 5, "obj-18", "attrui", "attr", "e", 5, "obj-18", "attrui", "float", 9.0, 5, "obj-17", "attrui", "attr", "d", 5, "obj-17", "attrui", "float", 2.0, 5, "obj-16", "attrui", "attr", "c", 5, "obj-16", "attrui", "float", 1.7, 5, "obj-15", "attrui", "attr", "b", 5, "obj-15", "attrui", "float", 2.7, 5, "obj-8", "attrui", "attr", "a", 5, "obj-8", "attrui", "float", 3.0 ]
                                        },
                                        {
                                            "number": 2,
                                            "data": [ 5, "obj-18", "attrui", "attr", "e", 5, "obj-18", "attrui", "float", 3.0, 5, "obj-17", "attrui", "attr", "d", 5, "obj-17", "attrui", "float", 2.0, 5, "obj-16", "attrui", "attr", "c", 5, "obj-16", "attrui", "float", 1.7, 5, "obj-15", "attrui", "attr", "b", 5, "obj-15", "attrui", "float", 2.0, 5, "obj-8", "attrui", "attr", "a", 5, "obj-8", "attrui", "float", 4.0 ]
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
                                        },
                                        {
                                            "number": 6,
                                            "data": [ 5, "obj-18", "attrui", "attr", "e", 5, "obj-18", "attrui", "float", 11.592, 5, "obj-17", "attrui", "attr", "d", 5, "obj-17", "attrui", "float", 3.309, 5, "obj-16", "attrui", "attr", "c", 5, "obj-16", "attrui", "float", 1.733, 5, "obj-15", "attrui", "attr", "b", 5, "obj-15", "attrui", "float", 1.594, 5, "obj-8", "attrui", "attr", "a", 5, "obj-8", "attrui", "float", 0.53 ]
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
                                    "patching_rect": [ 30.0, 570.0, 111.0, 22.0 ],
                                    "text": "spt.attractor.dadras"
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
                                    "text": "written by Max Worgan (c) 2025, MIT Licence"
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
                                    "text": "spt.attractor.dadras",
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
                                    "patching_rect": [ 270.0, 465.0, 150.0, 22.0 ]
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
                                    "patching_rect": [ 270.0, 489.0, 150.0, 22.0 ]
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
                                    "patching_rect": [ 270.0, 513.0, 150.0, 22.0 ]
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
                                    "patching_rect": [ 270.0, 536.0, 150.0, 22.0 ]
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
                                    "patching_rect": [ 270.0, 560.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 14.0,
                                    "id": "obj-88",
                                    "linecount": 12,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 105.0, 440.0, 210.0 ],
                                    "saved_attribute_attributes": {
                                        "textcolor": {
                                            "expression": "themecolor.theme_textcolor"
                                        }
                                    },
                                    "text": "An implementation of the the dadras attractor, which can generate two, three and four-scroll chaotic attractors\n\nEquations:\ndx/dt = y - a * x + b * y * z\ndy/dt = c * y - x * z - z\ndz/dt = d * x * y - e * z\n\nReference:\nDadras, Sara, and Hamid Reza Momeni. \"A novel three-dimensional autonomous chaotic system generating two, three and four-scroll attractors.\" Physics Letters A 373.40 (2009): 3637-3642.\n"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 279.5, 513.0, 195.0, 513.0, 195.0, 540.0, 39.5, 540.0 ],
                                    "source": [ "obj-15", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 279.5, 539.0, 39.5, 539.0 ],
                                    "source": [ "obj-16", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 279.5, 561.0, 195.0, 561.0, 195.0, 540.0, 39.5, 540.0 ],
                                    "source": [ "obj-17", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 279.5, 586.0, 195.0, 586.0, 195.0, 540.0, 39.5, 540.0 ],
                                    "source": [ "obj-18", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-19", 2 ],
                                    "midpoints": [ 76.3, 603.0, 748.56640625, 603.0, 748.56640625, 177.0, 747.5, 177.0 ],
                                    "source": [ "obj-5", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-19", 1 ],
                                    "midpoints": [ 57.9, 603.0, 623.08203125, 603.0, 623.08203125, 177.0, 622.0, 177.0 ],
                                    "source": [ "obj-5", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-19", 0 ],
                                    "midpoints": [ 39.5, 603.0, 498.3125, 603.0, 498.3125, 186.0, 496.5, 186.0 ],
                                    "source": [ "obj-5", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-20", 0 ],
                                    "midpoints": [ 113.1, 629.5, 230.5, 629.5 ],
                                    "source": [ "obj-5", 4 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-21", 0 ],
                                    "midpoints": [ 131.5, 627.5, 421.5, 627.5 ],
                                    "source": [ "obj-5", 5 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-6", 0 ],
                                    "midpoints": [ 94.7, 630.5, 39.5, 630.5 ],
                                    "source": [ "obj-5", 3 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 279.5, 489.0, 195.0, 489.0, 195.0, 540.0, 39.5, 540.0 ],
                                    "source": [ "obj-8", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 10.0, 61.0, 206.0, 49.0 ],
                    "text": "p mxwn.attractor.dadras.basic.maxhelp",
                    "varname": "mxwn.dadras.basic.maxhelp"
                }
            }
        ],
        "lines": [],
        "parameters": {
            "obj-4::obj-9": [ "live.gain~", "live.gain~", 0 ],
            "inherited_shortname": 1
        },
        "autosave": 0
    }
}