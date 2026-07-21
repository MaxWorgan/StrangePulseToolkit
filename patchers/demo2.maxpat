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
        "rect": [ 34.0, 99.0, 1113.0, 823.0 ],
        "default_fontname": "Helvetica Neue",
        "style": "StrangeStyle",
        "boxes": [
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "gain~",
                    "multichannelvariant": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "multichannelsignal", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 658.0, 1725.0, 22.0, 140.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 75.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "gain~",
                            "parameter_mmax": 157.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "gain~",
                            "parameter_type": 0
                        }
                    },
                    "varname": "gain~"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "linecount": 2,
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 658.0, 1880.0, 79.0, 36.0 ],
                    "text": "mc.unpack~ 2"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 875.0, 1451.0, 27.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "r~ y"
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
                    "patching_rect": [ 579.0, 43.0, 87.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "loadmess dt 1."
                }
            },
            {
                "box": {
                    "fontname": "Helvetica Neue",
                    "id": "obj-2",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 356.7010109424591, 1998.6803214550018, 451.0, 22.0 ],
                    "style": "StrangeStyle",
                    "text": "abl.device.delay~ @pingpong 1 @smoothmode 2 @delay 0.29 0.32 @mix 0.194344"
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
                    "name": "StrangeFilter.maxpat",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 658.0, 1479.5, 236.0, 200.0 ],
                    "varname": "StrangeFilter",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "obj-109",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 600.0, 90.0, 150.0, 19.0 ],
                    "style": "StrangeStyle",
                    "text": "Attractor Params"
                }
            },
            {
                "box": {
                    "id": "obj-106",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 24.0, 90.0, 150.0, 19.0 ],
                    "style": "StrangeStyle",
                    "text": "Preset morph"
                }
            },
            {
                "box": {
                    "id": "obj-104",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 140.0, 2022.6803214550018, 162.0, 42.0 ],
                    "style": "StrangeStyle",
                    "text": "Final reverb - again modulated by attractor signals"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-92",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1400.0, 450.0, 60.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "zl.change"
                }
            },
            {
                "box": {
                    "code": "//recallmulti is wierd so\r\n//here is some code to take the nodes ouput\r\n//and convert it to a standard recall call\r\n\r\n\r\nautowatch = 1;\n\nvar eps = 0.001;\n\nfunction list() {\n  var a = arrayfromargs(arguments);\n\n  // collect active (index, weight)\n  var active = [];\n  for (var i = 0; i < a.length; i++) {\n    var w = a[i];\n    if (w > eps) {\n      active.push({ idx: i + 1, w: w });\n    }\n  }\n\n  if (active.length === 0) {\n    return;\n  }\n\n  // single active node\n  if (active.length === 1) {\n    outlet(0, \"recall\", active[0].idx);\n    return;\n  }\n\n  // assume at most two overlaps\n  var i1 = active[0].idx;\n  var w1 = active[0].w;\n  var i2 = active[1].idx;\n  var w2 = active[1].w;\n\n  var denom = w1 + w2;\n  var mix = (denom > 0) ? (w2 / denom) : 0.0;\n\n  outlet(0, \"recall\", i1, i2, mix);\n}",
                    "filename": "none",
                    "fontface": 0,
                    "fontname": "<Monospaced>",
                    "fontsize": 12.0,
                    "hidden": 1,
                    "id": "obj-84",
                    "maxclass": "v8.codebox",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1400.0, 100.0, 454.6391497850418, 332.9896720647812 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0
                    }
                }
            },
            {
                "box": {
                    "id": "obj-81",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 363.0, 1610.103021621704, 29.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "r~ x"
                }
            },
            {
                "box": {
                    "fontname": "Helvetica Neue",
                    "id": "obj-80",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 708.0, 2044.0, 29.0, 22.0 ],
                    "style": "StrangeStyle",
                    "text": "r~ z"
                }
            },
            {
                "box": {
                    "id": "obj-78",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 478.30101094245913, 1911.7937270402908, 29.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "r~ y"
                }
            },
            {
                "box": {
                    "id": "obj-77",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 766.5, 1451.0, 29.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "r~ x"
                }
            },
            {
                "box": {
                    "id": "obj-71",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 490.72162199020386, 34.02061665058136, 51.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "send~ z"
                }
            },
            {
                "box": {
                    "id": "obj-56",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 422.68038868904114, 34.02061665058136, 51.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "send~ y"
                }
            },
            {
                "box": {
                    "id": "obj-54",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 356.7010109424591, 34.02061665058136, 51.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "send~ x"
                }
            },
            {
                "box": {
                    "id": "obj-49",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 363.0, 1634.103021621704, 35.0, 20.0 ],
                    "style": "StrangeStyle",
                    "text": "abs~"
                }
            },
            {
                "box": {
                    "id": "obj-38",
                    "linecount": 3,
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 197.058819770813, 1606.0, 151.0, 45.0 ],
                    "style": "StrangeStyle",
                    "text": "abl.dsp.ringmod~ @drive 10. @enable_drive 1 @frequency 100. @ins mix"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 210.0, 1231.0, 29.5, 20.0 ],
                    "style": "StrangeStyle",
                    "text": "- 1"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 174.0, 1205.0, 55.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "zl.slice 1"
                }
            },
            {
                "box": {
                    "fontname": "Helvetica Neue",
                    "id": "obj-32",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 708.0, 2106.0, 40.0, 22.0 ],
                    "style": "StrangeStyle",
                    "text": "*~ 10."
                }
            },
            {
                "box": {
                    "fontname": "Helvetica Neue",
                    "id": "obj-28",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 708.0, 2075.0, 35.0, 22.0 ],
                    "style": "StrangeStyle",
                    "text": "abs~"
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 478.30101094245913, 1935.7937270402908, 40.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "*~ 20."
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 478.30101094245913, 1959.7937270402908, 35.0, 20.0 ],
                    "style": "StrangeStyle",
                    "text": "abs~"
                }
            },
            {
                "box": {
                    "fontname": "Helvetica Neue",
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 357.0, 2044.0, 315.0, 22.0 ],
                    "style": "StrangeStyle",
                    "text": "abl.dsp.tides~ @tides 1. @mix 0.353 @size 0.12 @ins rate"
                }
            },
            {
                "box": {
                    "id": "obj-115",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 625.0, 1244.0, 58.0, 20.0 ],
                    "style": "StrangeStyle",
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-111",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 197.058819770813, 1680.0, 139.70587968826294, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "abl.dsp.prism~"
                }
            },
            {
                "box": {
                    "id": "obj-108",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 161.76470279693604, 1521.0, 58.82352828979492, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "zl.slice 1"
                }
            },
            {
                "box": {
                    "id": "obj-94",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "orientation": 1,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 196.76469945907593, 1705.0, 140.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "live.gain~[4]",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.gain~[4]",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "showname": 0,
                    "shownumber": 0,
                    "varname": "live.gain~[4]"
                }
            },
            {
                "box": {
                    "id": "obj-93",
                    "maxclass": "newobj",
                    "numinlets": 7,
                    "numoutlets": 2,
                    "outlettype": [ "int", "" ],
                    "patching_rect": [ 197.058819770813, 1545.0, 85.29411602020264, 20.0 ],
                    "style": "StrangeStyle",
                    "text": "midiformat"
                }
            },
            {
                "box": {
                    "id": "obj-90",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 413.0068949222565, 1610.103021621704, 170.58823204040527, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "buffer~ inst2 demo2-slow.wav"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-51",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1470.0, 450.0, 135.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "loadmess recall 1"
                }
            },
            {
                "box": {
                    "id": "obj-96",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 197.058819770813, 1569.0, 246.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "abl.device.drumsampler~ inst2 @volume 0.8"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-87",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "SamplePlayPoly.maxpat",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 24.41176438331604, 986.0, 315.0, 180.0 ],
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
                    "id": "obj-86",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "SamplePlayPoly.maxpat",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 359.41176438331604, 786.0, 315.0, 180.0 ],
                    "varname": "samplePlay[5]",
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
                    "id": "obj-85",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "SamplePlayPoly.maxpat",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 24.41176438331604, 786.0, 315.0, 180.0 ],
                    "varname": "samplePlay[4]",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "obj-72",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 997.0, 1451.0, 90.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "mc.combine~ 4"
                }
            },
            {
                "box": {
                    "id": "obj-58",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 997.0, 1475.0, 68.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "mc.stereo~"
                }
            },
            {
                "box": {
                    "candycane": 8,
                    "candycane2": [ 0.2429931462, 0.5804384947, 0.4775273204, 0.64 ],
                    "candycane3": [ 0.1530902088, 0.4896173477, 0.6329272389, 0.53 ],
                    "candycane4": [ 0.976470588235294, 0.254901960784314, 0.266666666666667, 0.54 ],
                    "displayknob": 1,
                    "id": "obj-74",
                    "knobcolor": [ 0.3058823529411765, 0.4823529411764706, 0.9098039215686274, 1.0 ],
                    "maxclass": "nodes",
                    "mousemode": 2,
                    "nodecolor": [ 0.3058823529411765, 0.4823529411764706, 0.9098039215686274, 0.59 ],
                    "nodenumber": 4,
                    "nodesnames": [ "1", "2", "3", "4" ],
                    "nsize": [ 0.36, 0.36, 0.36, 0.36 ],
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 24.0, 116.0, 268.0, 203.0 ],
                    "xplace": [ 0.2375886524822695, 0.7761194029850746, 0.23404255319148937, 0.7553191489361702 ],
                    "yplace": [ 0.24102564102564103, 0.21921182266009853, 0.7589743589743589, 0.7589743589743589 ]
                }
            },
            {
                "box": {
                    "id": "obj-73",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 625.0, 1268.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-69",
                    "lastchannelcount": 2,
                    "maxclass": "mc.live.gain~",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "orientation": 1,
                    "outlettype": [ "multichannelsignal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 997.0, 1408.0, 136.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "live.gain~[3]",
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
                    "varname": "live.gain~[3]"
                }
            },
            {
                "box": {
                    "id": "obj-68",
                    "lastchannelcount": 2,
                    "maxclass": "mc.live.gain~",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "orientation": 1,
                    "outlettype": [ "multichannelsignal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 997.0, 1369.0, 136.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "live.gain~[2]",
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
                    "varname": "live.gain~[2]"
                }
            },
            {
                "box": {
                    "id": "obj-66",
                    "lastchannelcount": 2,
                    "maxclass": "mc.live.gain~",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "orientation": 1,
                    "outlettype": [ "multichannelsignal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 997.0, 1329.0, 136.0, 26.0 ],
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
                    "id": "obj-64",
                    "lastchannelcount": 2,
                    "maxclass": "mc.live.gain~",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "orientation": 1,
                    "outlettype": [ "multichannelsignal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 997.0, 1295.0, 136.0, 26.0 ],
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
                    "id": "obj-63",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "multichannelsignal", "bang" ],
                    "patching_rect": [ 658.0, 1410.0, 318.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "mc.sfplay~ 2 @audiofile spt_demo2_sound4.wav @loop 1"
                }
            },
            {
                "box": {
                    "id": "obj-62",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "multichannelsignal", "bang" ],
                    "patching_rect": [ 658.0, 1371.0, 318.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "mc.sfplay~ 2 @audiofile spt_demo2_sound3.wav @loop 1"
                }
            },
            {
                "box": {
                    "id": "obj-61",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "multichannelsignal", "bang" ],
                    "patching_rect": [ 658.0, 1331.0, 318.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "mc.sfplay~ 2 @audiofile spt_demo2_sound2.wav @loop 1"
                }
            },
            {
                "box": {
                    "id": "obj-60",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "multichannelsignal", "bang" ],
                    "patching_rect": [ 658.0, 1297.0, 318.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "mc.sfplay~ 2 @audiofile spt_demo2_sound1.wav @loop 1"
                }
            },
            {
                "box": {
                    "id": "obj-57",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 165.0, 1284.0, 33.82352876663208, 20.0 ],
                    "style": "StrangeStyle",
                    "text": "+ 1"
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
                    "patching_rect": [ 53.0, 668.0, 384.0, 65.0 ],
                    "varname": "MultiModTrigger[1]",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "obj-39",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 4,
                    "outlettype": [ "int", "", "", "int" ],
                    "patching_rect": [ 165.0, 1258.0, 64.70588111877441, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "counter 5"
                }
            },
            {
                "box": {
                    "duration_active": 0,
                    "extra1_active": 0,
                    "extra2_active": 0,
                    "id": "obj-31",
                    "loopruler": 0,
                    "maxclass": "live.step",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "", "", "", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 165.0, 1310.0, 404.4117569923401, 151.47058534622192 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 1, 16, 0, 1, 12, 0, 16, 59.0, 80.0, 0, 0, 60, 101, 4, 127, 127, 63, 83, 4, 127, 127, 67, 57, 4, 127, 127, 74, 78, 4, 127, 127, 70, 35, 4, 127, 127, 67, 75, 4, 127, 127, 60, 114, 4, 127, 127, 70, 75, 4, 127, 127, 67, 59, 4, 127, 127, 79, 80, 4, 127, 127, 60, 100, 4, 127, 127, 70, 84, 4, 127, 127, 60, 114, 4, 127, 127, 63, 98, 4, 127, 127, 70, 97, 4, 127, 127, 62, 103, 4, 127, 127 ],
                            "parameter_invisible": 1,
                            "parameter_longname": "live.step",
                            "parameter_modmode": 0,
                            "parameter_shortname": "live.step",
                            "parameter_type": 3
                        }
                    },
                    "usestepcolor2": 0,
                    "varname": "live.step"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-67",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "MultiModTrigger.maxpat",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 795.0, 658.0, 384.0, 107.0 ],
                    "varname": "MultiModTrigger",
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
                    "id": "obj-52",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "SamplePlayPoly.maxpat",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 359.41176438331604, 986.0, 315.0, 180.0 ],
                    "varname": "samplePlay[3]",
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
                    "patching_rect": [ 800.0, 373.0, 38.0, 21.0 ],
                    "style": "StrangeStyle",
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
                    "patching_rect": [ 750.0, 373.0, 38.0, 21.0 ],
                    "style": "StrangeStyle",
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
                    "patching_rect": [ 700.0, 373.0, 37.0, 21.0 ],
                    "style": "StrangeStyle",
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
                    "patching_rect": [ 650.0, 373.0, 38.0, 21.0 ],
                    "style": "StrangeStyle",
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
                    "patching_rect": [ 600.0, 373.0, 38.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "a $1"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-29",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "float", "float", "float", "float", "float" ],
                    "patching_rect": [ 600.0, 348.0, 226.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "unpack 0. 0. 0. 0. 0."
                }
            },
            {
                "box": {
                    "candicane2": [ 0.3058823529411765, 0.4823529411764706, 0.9098039215686274, 1.0 ],
                    "candicane3": [ 0.847468376159668, 0.8226896524429321, 0.771217942237854, 1.0 ],
                    "candicane4": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ],
                    "candicane5": [ 0.9647058823529412, 0.9529411764705882, 0.9254901960784314, 1.0 ],
                    "candycane": 6,
                    "contdata": 1,
                    "id": "obj-30",
                    "maxclass": "multislider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 600.0, 116.0, 270.0, 204.0 ],
                    "setminmax": [ 0.0, 10.0 ],
                    "setstyle": 1,
                    "size": 5,
                    "slidercolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ],
                    "style": "StrangeStyle",
                    "varname": "DadrasParams"
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 477.3195608854294, 2127.834954738617, 61.0, 61.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-76",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 356.7010109424591, 1959.7937270402908, 58.0, 21.0 ],
                    "style": "StrangeStyle",
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
                    "patching_rect": [ 417.5010109424591, 1959.7937270402908, 58.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "mc.sum~"
                }
            },
            {
                "box": {
                    "id": "obj-65",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "multichannelsignal", "multichannelsignal" ],
                    "patching_rect": [ 356.7010109424591, 1928.8658937215805, 114.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "mc.deinterleave~ 2"
                }
            },
            {
                "box": {
                    "id": "obj-25",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 356.7010109424591, 1905.1545548439026, 90.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "mc.combine~ 5"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-21",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "SamplePlayPoly.maxpat",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 694.411764383316, 786.0, 315.0, 180.0 ],
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
                    "id": "obj-19",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "GradientTrigger.maxpat",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "float", "float", "signal", "signal" ],
                    "patching_rect": [ 595.0, 484.0, 574.0, 164.0 ],
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
                    "id": "obj-17",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "AttractorDisplay.maxpat",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 320.0, 118.0, 255.0, 199.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1400.0, 480.0, 197.0, 21.0 ],
                    "saved_object_attributes": {
                        "client_rect": [ 100, 171, 483, 533 ],
                        "parameter_enable": 0,
                        "parameter_mappable": 0,
                        "storage_rect": [ 100, 171, 998, 769 ]
                    },
                    "style": "StrangeStyle",
                    "text": "pattrstorage demo2 @savemode 2",
                    "varname": "demo2"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 1400.0, 58.0, 56.0, 20.0 ],
                    "restore": {
                        "DadrasParams": [ 7.5, 3.1818181818181817, 1.5909090909090908, 4.46969696969697, 6.439393939393939 ],
                        "gain~": [ 75 ],
                        "live.gain~": [ -9.698444719203547 ],
                        "live.gain~[1]": [ -70.0 ],
                        "live.gain~[2]": [ -70.0 ],
                        "live.gain~[3]": [ -70.0 ],
                        "live.gain~[4]": [ -0.03293907165527399 ],
                        "live.step": [ 1, 5, 0, 1, 12, 0, 16, 59.0, 80.0, 0, 0, 60, 101, 4, 127, 127, 63, 83, 4, 127, 127, 67, 57, 4, 127, 127, 74, 78, 4, 127, 127, 70, 35, 4, 127, 127 ]
                    },
                    "style": "StrangeStyle",
                    "text": "autopattr",
                    "varname": "u688000702"
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
                    "patching_rect": [ 30.0, 484.0, 533.0, 164.0 ],
                    "varname": "combineSignalsAsGates[1]",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 389.0, 66.0, 111.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "spt.attractor.dadras"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-15",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "fold.maxpat",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 30.0, 329.0, 222.0, 142.0 ],
                    "varname": "fold",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "attr": "modtime",
                    "id": "obj-42",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 516.3010109424591, 1969.0, 150.0, 22.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "order": 2,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 1 ],
                    "order": 1,
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 2 ],
                    "order": 1,
                    "source": [ "obj-1", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 1 ],
                    "order": 2,
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "order": 1,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-19", 0 ],
                    "order": 2,
                    "source": [ "obj-1", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-54", 0 ],
                    "order": 0,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-56", 0 ],
                    "order": 0,
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-71", 0 ],
                    "order": 0,
                    "source": [ "obj-1", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-26", 1 ],
                    "source": [ "obj-10", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-26", 0 ],
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-93", 0 ],
                    "source": [ "obj-108", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-94", 1 ],
                    "source": [ "obj-111", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-94", 0 ],
                    "source": [ "obj-111", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-73", 0 ],
                    "source": [ "obj-115", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-26", 1 ],
                    "source": [ "obj-12", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-26", 0 ],
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 2 ],
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-40", 0 ],
                    "order": 1,
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-85", 0 ],
                    "midpoints": [ 39.5, 771.0, 33.91176438331604, 771.0 ],
                    "order": 0,
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-86", 0 ],
                    "midpoints": [ 553.5, 771.0, 368.91176438331604, 771.0 ],
                    "source": [ "obj-16", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "midpoints": [ 604.5, 771.0, 703.911764383316, 771.0 ],
                    "source": [ "obj-19", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-67", 0 ],
                    "order": 1,
                    "source": [ "obj-19", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-87", 0 ],
                    "midpoints": [ 789.5, 771.0, 9.0, 771.0, 9.0, 981.0, 33.91176438331604, 981.0 ],
                    "order": 0,
                    "source": [ "obj-19", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 1 ],
                    "source": [ "obj-2", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 2 ],
                    "midpoints": [ 703.911764383316, 1230.0, 594.0, 1230.0, 594.0, 1890.0, 401.7010109424591, 1890.0 ],
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-65", 0 ],
                    "source": [ "obj-25", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 0 ],
                    "source": [ "obj-28", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-44", 0 ],
                    "hidden": 1,
                    "source": [ "obj-29", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 0 ],
                    "hidden": 1,
                    "source": [ "obj-29", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "hidden": 1,
                    "source": [ "obj-29", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-47", 0 ],
                    "hidden": 1,
                    "source": [ "obj-29", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "hidden": 1,
                    "source": [ "obj-29", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-29", 0 ],
                    "hidden": 1,
                    "source": [ "obj-30", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-108", 0 ],
                    "source": [ "obj-31", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "midpoints": [ 270.852939248085, 1473.0, 150.0, 1473.0, 150.0, 1200.0, 183.5, 1200.0 ],
                    "source": [ "obj-31", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 5 ],
                    "source": [ "obj-32", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-111", 1 ],
                    "source": [ "obj-38", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-111", 0 ],
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-57", 0 ],
                    "source": [ "obj-39", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-4", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-39", 0 ],
                    "midpoints": [ 62.5, 771.0, 9.0, 771.0, 9.0, 1245.0, 174.5, 1245.0 ],
                    "source": [ "obj-40", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "source": [ "obj-42", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "hidden": 1,
                    "source": [ "obj-44", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "hidden": 1,
                    "source": [ "obj-45", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "hidden": 1,
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "hidden": 1,
                    "source": [ "obj-47", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "hidden": 1,
                    "source": [ "obj-48", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 3 ],
                    "source": [ "obj-49", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 2 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "hidden": 1,
                    "source": [ "obj-51", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 4 ],
                    "midpoints": [ 368.91176438331604, 1296.0, 594.0, 1296.0, 594.0, 1890.0, 437.2010109424591, 1890.0 ],
                    "source": [ "obj-52", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-31", 0 ],
                    "source": [ "obj-57", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "source": [ "obj-58", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 0 ],
                    "midpoints": [ 667.5, 1320.0, 654.0, 1320.0, 654.0, 1284.0, 1002.0, 1284.0, 1002.0, 1290.0, 1006.5, 1290.0 ],
                    "source": [ "obj-60", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-66", 0 ],
                    "midpoints": [ 667.5, 1353.0, 993.0, 1353.0, 993.0, 1326.0, 1006.5, 1326.0 ],
                    "source": [ "obj-61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-68", 0 ],
                    "midpoints": [ 667.5, 1395.0, 645.0, 1395.0, 645.0, 1443.0, 993.0, 1443.0, 993.0, 1365.0, 1006.5, 1365.0 ],
                    "source": [ "obj-62", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-69", 0 ],
                    "midpoints": [ 667.5, 1443.0, 993.0, 1443.0, 993.0, 1404.0, 1006.5, 1404.0 ],
                    "source": [ "obj-63", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-72", 3 ],
                    "midpoints": [ 1006.5, 1323.0, 993.0, 1323.0, 993.0, 1443.0, 1077.5, 1443.0 ],
                    "source": [ "obj-64", 0 ]
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
                    "destination": [ "obj-72", 2 ],
                    "midpoints": [ 1006.5, 1365.0, 993.0, 1365.0, 993.0, 1443.0, 1053.8333333333333, 1443.0 ],
                    "source": [ "obj-66", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-52", 0 ],
                    "midpoints": [ 804.5, 771.0, 354.0, 771.0, 354.0, 978.0, 368.91176438331604, 978.0 ],
                    "source": [ "obj-67", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-72", 1 ],
                    "midpoints": [ 1006.5, 1404.0, 993.0, 1404.0, 993.0, 1443.0, 1030.1666666666667, 1443.0 ],
                    "source": [ "obj-68", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-72", 0 ],
                    "midpoints": [ 1006.5, 1437.0, 1006.5, 1437.0 ],
                    "source": [ "obj-69", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-39", 4 ],
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-58", 0 ],
                    "source": [ "obj-72", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "order": 3,
                    "source": [ "obj-73", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 0 ],
                    "order": 2,
                    "source": [ "obj-73", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-62", 0 ],
                    "order": 1,
                    "source": [ "obj-73", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 0 ],
                    "order": 0,
                    "source": [ "obj-73", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-84", 0 ],
                    "hidden": 1,
                    "midpoints": [ 33.5, 330.0, 1023.0, 330.0, 1023.0, 45.0, 1409.5, 45.0 ],
                    "source": [ "obj-74", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 1 ],
                    "source": [ "obj-75", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "source": [ "obj-76", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 1 ],
                    "source": [ "obj-77", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "source": [ "obj-78", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "hidden": 1,
                    "source": [ "obj-8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 0 ],
                    "source": [ "obj-80", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 0 ],
                    "source": [ "obj-81", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-92", 0 ],
                    "hidden": 1,
                    "source": [ "obj-84", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 0 ],
                    "midpoints": [ 33.91176438331604, 969.0, 9.0, 969.0, 9.0, 1890.0, 366.2010109424591, 1890.0 ],
                    "source": [ "obj-85", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 1 ],
                    "midpoints": [ 368.91176438331604, 981.0, 354.0, 981.0, 354.0, 1191.0, 147.0, 1191.0, 147.0, 1890.0, 383.9510109424591, 1890.0 ],
                    "source": [ "obj-86", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 3 ],
                    "midpoints": [ 33.91176438331604, 1890.0, 419.4510109424591, 1890.0 ],
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "hidden": 1,
                    "source": [ "obj-92", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-96", 0 ],
                    "source": [ "obj-93", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-26", 1 ],
                    "midpoints": [ 236.51469945907593, 2007.0, 342.0, 2007.0, 342.0, 2112.0, 528.8195608854294, 2112.0 ],
                    "source": [ "obj-94", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-26", 0 ],
                    "midpoints": [ 206.26469945907593, 2007.0, 342.0, 2007.0, 342.0, 2112.0, 486.8195608854294, 2112.0 ],
                    "source": [ "obj-94", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 1 ],
                    "source": [ "obj-96", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "source": [ "obj-96", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-18": [ "gain~", "gain~", 0 ],
            "obj-21::obj-23": [ "sample", "sample", 0 ],
            "obj-31": [ "live.step", "live.step", 0 ],
            "obj-52::obj-23": [ "sample[1]", "sample", 0 ],
            "obj-64": [ "live.gain~", "live.gain~", 0 ],
            "obj-66": [ "live.gain~[1]", "live.gain~", 0 ],
            "obj-68": [ "live.gain~[2]", "live.gain~", 0 ],
            "obj-69": [ "live.gain~[3]", "live.gain~", 0 ],
            "obj-85::obj-23": [ "sample[2]", "sample", 0 ],
            "obj-86::obj-23": [ "sample[3]", "sample", 0 ],
            "obj-87::obj-23": [ "sample[4]", "sample", 0 ],
            "obj-94": [ "live.gain~[4]", "live.gain~[4]", 0 ],
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
                    "syntax_objectcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ],
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                },
                "parentstyle": "",
                "multi": 0
            }
        ],
        "textcolor_inverse": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ],
        "syntax_objectcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ],
        "syntax_objargcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
    }
}