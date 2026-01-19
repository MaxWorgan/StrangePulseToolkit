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
        "rect": [ 34.0, 99.0, 1247.0, 823.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 887.5, 513.0, 84.0, 22.0 ],
                    "text": "mc.unpack~ 2"
                }
            },
            {
                "box": {
                    "id": "obj-51",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1109.5, 941.0, 155.0, 33.0 ],
                    "text": "An fft based panning effect for stereo signals"
                }
            },
            {
                "box": {
                    "id": "obj-50",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 868.0, 1107.0, 45.0, 45.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-49",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "orientation": 1,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 893.5, 993.0, 185.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "live.gain~[1]",
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
                    "varname": "live.gain~[1]"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 18.0,
                    "id": "obj-48",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 890.0, 875.0, 109.0, 27.0 ],
                    "text": "StrangePan",
                    "textcolor": [ 0.2429931462, 0.5804384947, 0.4775273204, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-47",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "orientation": 1,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 902.0, 802.0, 197.0, 26.0 ],
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
                    "id": "obj-44",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 1112.0, 638.0, 70.0, 22.0 ],
                    "text": "mc.pack~ 2"
                }
            },
            {
                "box": {
                    "data": {
                        "clips": [
                            {
                                "absolutepath": "extra_sound1.wav",
                                "filename": "extra_sound1.wav",
                                "filekind": "audiofile",
                                "id": "u488012533",
                                "loop": 1,
                                "content_state": {
                                    "loop": 1
                                }
                            }
                        ]
                    },
                    "id": "obj-38",
                    "maxclass": "playlist~",
                    "mode": "basic",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "signal", "", "dictionary" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1112.0, 587.0, 150.0, 30.0 ],
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
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-34",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "StrangePan.maxpat",
                    "numinlets": 4,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 893.5, 924.0, 185.0, 67.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1099.0, 699.0, 155.0, 33.0 ],
                    "text": "A filter based on a 64 band fixed filter bank"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-25",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "GradientTrigger.maxpat",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 671.0, 368.0, 148.0, 94.0 ],
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
                    "id": "obj-23",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "StrangeFilter.maxpat",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 890.0, 679.0, 192.0, 111.0 ],
                    "varname": "StrangeFilter",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 18.0,
                    "id": "obj-21",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 887.5, 601.0, 197.0, 27.0 ],
                    "text": "StrangeFilter",
                    "textcolor": [ 0.2429931462, 0.5804384947, 0.4775273204, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1099.0, 422.0, 155.0, 60.0 ],
                    "text": "A very simple sample player. With gain and pan knob. Drag a drop audio files to change sample."
                }
            },
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
                    "name": "SamplePlayPoly.maxpat",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 887.5, 416.0, 180.0, 90.0 ],
                    "varname": "SamplePlayPoly",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 18.0,
                    "id": "obj-18",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 887.5, 364.0, 197.0, 27.0 ],
                    "text": "SamplePlayPoly",
                    "textcolor": [ 0.2429931462, 0.5804384947, 0.4775273204, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1024.0, 255.5, 155.0, 47.0 ],
                    "text": "Trigger the MIDI Note, on the specified channel, from the specificed MIDI Device"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-11",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "ToExternalMidi.maxpat",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 887.5, 254.0, 102.0, 50.0 ],
                    "varname": "ToExternalMidi",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 18.0,
                    "id": "obj-5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 887.5, 197.0, 197.0, 27.0 ],
                    "text": "ToExternalMidi",
                    "textcolor": [ 0.2429931462, 0.5804384947, 0.4775273204, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-42",
                    "linecount": 7,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 508.0, 750.0, 260.0, 114.0 ],
                    "text": "This visualisation is purely for just to aid in understanding how this recurrence metrics work.\n\nMore information can be found here:\n\nhttps://en.wikipedia.org/wiki/Recurrence_plot\n"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 18.0,
                    "id": "obj-41",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 49.0, 529.0, 197.0, 27.0 ],
                    "text": "RecurrencePlot",
                    "textcolor": [ 0.2429931462, 0.5804384947, 0.4775273204, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-40",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 508.0, 658.0, 269.0, 60.0 ],
                    "text": "RecurrencePlot creates a recurrence plot for a given signal. It is the basis for the recurrence analysis we've implemented with spt.rqa and spt.rpde."
                }
            },
            {
                "box": {
                    "fontsize": 18.0,
                    "id": "obj-39",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 452.0, 529.0, 215.0, 27.0 ],
                    "text": "Chaotic?",
                    "textcolor": [ 0.9725490196078431, 0.5882352941176471, 0.11764705882352941, 1.0 ]
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-35",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 310.0, 173.0, 56.0, 22.0 ],
                    "text": "route 1 0"
                }
            },
            {
                "box": {
                    "id": "obj-30",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 413.0, 524.0, 37.0, 37.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_initial": [ 1.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "toggle",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "toggle",
                            "parameter_type": 2
                        }
                    },
                    "varname": "toggle"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-15",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 287.0, 206.0, 29.5, 22.0 ],
                    "text": "a 3"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-10",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 245.5, 206.0, 29.5, 22.0 ],
                    "text": "a 9"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-8",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "RecurrencePlot.maxpat",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 73.0, 587.0, 404.0, 338.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 388.0, 385.0, 153.0, 60.0 ],
                    "text": "A jit.gl.handle is used allowing ths space to be rotated and repositioned with the mouse"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 389.5, 292.0, 153.0, 60.0 ],
                    "text": "AttractorDisplay takes the x,y,z signal inputs from an attractor and renders them as a 3d line."
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
                    "name": "AttractorDisplay.maxpat",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 101.0, 287.0, 265.0, 204.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 18.0,
                    "id": "obj-37",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 45.0, 197.0, 197.0, 27.0 ],
                    "text": "AttractorDisplay",
                    "textcolor": [ 0.2429931462, 0.5804384947, 0.4775273204, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 49.0, 230.0, 111.0, 22.0 ],
                    "text": "spt.attractor.dadras"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 45.0, 138.0, 390.0, 33.0 ],
                    "text": "A few utilities from simple midi output objects, to audio effects, to visualisations"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 22.0,
                    "id": "obj-2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 45.0, 105.0, 230.0, 31.0 ],
                    "text": "Utilities",
                    "textcolor": [ 0.1530902088, 0.4896173477, 0.6329272389, 1.0 ]
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
                    "patching_rect": [ 45.0, 68.0, 349.0, 20.0 ],
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
                    "patching_rect": [ 45.0, 15.0, 422.0, 51.0 ],
                    "text": "Strange Pulse Toolkit",
                    "textcolor": [ 0.952941176470588, 0.447058823529412, 0.172549019607843, 1.0 ]
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "grad1": [ 0.976470588235294, 0.780392156862745, 0.309803921568627, 1.0 ],
                    "grad2": [ 0.952941176470588, 0.447058823529412, 0.172549019607843, 1.0 ],
                    "id": "obj-4",
                    "maxclass": "panel",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 87.0, 267.0, 293.0, 244.0 ],
                    "proportion": 0.5
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "hidden": 1,
                    "midpoints": [ 255.0, 225.0, 58.5, 225.0 ],
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 2 ],
                    "midpoints": [ 95.3, 273.0, 356.5, 273.0 ],
                    "order": 0,
                    "source": [ "obj-12", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 1 ],
                    "midpoints": [ 76.9, 273.0, 233.5, 273.0 ],
                    "order": 1,
                    "source": [ "obj-12", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "midpoints": [ 58.5, 273.0, 110.5, 273.0 ],
                    "order": 2,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 1 ],
                    "midpoints": [ 95.3, 264.0, 36.0, 264.0, 36.0, 573.0, 873.0, 573.0, 873.0, 666.0, 1072.5, 666.0 ],
                    "order": 1,
                    "source": [ "obj-12", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 0 ],
                    "midpoints": [ 58.5, 255.0, 30.0, 255.0, 30.0, 183.0, 297.0, 183.0, 297.0, 201.0, 327.0, 201.0, 327.0, 249.0, 680.5, 249.0 ],
                    "order": 1,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-34", 3 ],
                    "midpoints": [ 76.9, 255.0, 873.0, 255.0, 873.0, 910.01171875, 1069.0, 910.01171875 ],
                    "order": 0,
                    "source": [ "obj-12", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-34", 2 ],
                    "midpoints": [ 58.5, 516.0, 36.0, 516.0, 36.0, 573.0, 873.0, 573.0, 873.0, 911.82421875, 1013.6666666666666, 911.82421875 ],
                    "order": 0,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "midpoints": [ 113.7, 273.2265625, 72.0, 273.2265625, 72.0, 516.0, 36.0, 516.0, 36.0, 570.0, 82.5, 570.0 ],
                    "source": [ "obj-12", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "hidden": 1,
                    "midpoints": [ 296.5, 252.0, 171.0, 252.0, 171.0, 225.0, 58.5, 225.0 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-19", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-47", 1 ],
                    "source": [ "obj-23", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-47", 0 ],
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-19", 0 ],
                    "source": [ "obj-25", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 1 ],
                    "midpoints": [ 962.0, 588.0, 873.0, 588.0, 873.0, 1092.0, 903.5, 1092.0 ],
                    "source": [ "obj-3", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 0 ],
                    "midpoints": [ 897.0, 588.0, 873.0, 588.0, 873.0, 1104.0, 877.5, 1104.0 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-35", 0 ],
                    "hidden": 1,
                    "source": [ "obj-30", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 1 ],
                    "source": [ "obj-34", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 0 ],
                    "source": [ "obj-34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "hidden": 1,
                    "source": [ "obj-35", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "hidden": 1,
                    "source": [ "obj-35", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-34", 1 ],
                    "midpoints": [ 1154.25, 631.2265625, 1095.0, 631.2265625, 1095.0, 789.0, 1094.4609375, 789.0, 1094.4609375, 909.0, 969.0, 909.0, 969.0, 921.0, 958.3333333333334, 921.0 ],
                    "order": 1,
                    "source": [ "obj-38", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-34", 0 ],
                    "midpoints": [ 1121.5, 631.00390625, 1095.0, 631.00390625, 1095.0, 666.0, 873.6796875, 666.0, 873.6796875, 914.703125, 903.0, 914.703125 ],
                    "order": 1,
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-44", 1 ],
                    "order": 0,
                    "source": [ "obj-38", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-44", 0 ],
                    "order": 0,
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "source": [ "obj-44", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 1 ],
                    "midpoints": [ 956.0, 861.0, 882.0, 861.0, 882.0, 1095.0, 903.5, 1095.0 ],
                    "source": [ "obj-47", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 0 ],
                    "midpoints": [ 911.5, 861.0, 882.0, 861.0, 882.0, 1095.0, 877.5, 1095.0 ],
                    "source": [ "obj-47", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 1 ],
                    "midpoints": [ 944.5, 1095.0, 903.5, 1095.0 ],
                    "source": [ "obj-49", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 0 ],
                    "midpoints": [ 903.0, 1095.0, 877.5, 1095.0 ],
                    "source": [ "obj-49", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-19::obj-18": [ "dial[5]", "dial", 0 ],
            "obj-19::obj-23": [ "sample", "sample", 0 ],
            "obj-19::obj-25": [ "mc.live.gain~[7]", "mc.live.gain~", 0 ],
            "obj-30": [ "toggle", "toggle", 0 ],
            "obj-47": [ "live.gain~", "live.gain~", 0 ],
            "obj-49": [ "live.gain~[1]", "live.gain~", 0 ],
            "obj-8::obj-107": [ "live.dial", "Speed", 0 ],
            "obj-8::obj-108": [ "live.dial[1]", "Size", 0 ],
            "obj-8::obj-118": [ "live.dial[2]", "Distance", 0 ],
            "parameterbanks": {
                "0": {
                    "index": 0,
                    "name": "",
                    "parameters": [ "-", "-", "-", "-", "-", "-", "-", "-" ],
                    "buttons": [ "-", "-", "-", "-", "-", "-", "-", "-" ]
                }
            },
            "parameter_overrides": {
                "obj-8::obj-107": {
                    "parameter_initial": 50,
                    "parameter_initial_enable": 1
                },
                "obj-8::obj-108": {
                    "parameter_initial": 100,
                    "parameter_initial_enable": 1
                },
                "obj-8::obj-118": {
                    "parameter_initial": 0.01,
                    "parameter_initial_enable": 1
                }
            },
            "inherited_shortname": 1
        },
        "autosave": 0
    }
}