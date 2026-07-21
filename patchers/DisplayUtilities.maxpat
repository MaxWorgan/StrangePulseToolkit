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
        "rect": [ 34.0, 99.0, 948.0, 823.0 ],
        "style": "StrangeStyle",
        "boxes": [
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-25",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 83.0, 549.0, 150.0, 21.0 ],
                    "text": "loadmess load cherokee.aif"
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
                    "patching_rect": [ 83.0, 605.0, 320.0, 196.0 ],
                    "varname": "SamplePlayPoly",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-33",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "float", "float", "signal", "signal" ],
                    "patching_rect": [ 83.0, 574.0, 101.0, 20.0 ],
                    "text": "GradientTrigger"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Helvetica Neue",
                    "fontsize": 14.0,
                    "id": "obj-31",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 434.0, 1145.0, 527.0, 39.0 ],
                    "style": "StrangeStyle",
                    "text": "A custom ffb based stereo filter that uses two input signals to shape the filter shape"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Helvetica Neue",
                    "fontsize": 16.0,
                    "id": "obj-32",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 434.0, 1087.0, 168.0, 25.0 ],
                    "style": "StrangeStyle",
                    "text": "Strange Filter",
                    "textcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-28",
                    "maxclass": "mc.ezdac~",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 83.0, 1265.0, 45.0, 45.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontname": "Helvetica Neue",
                    "fontsize": 48.0,
                    "id": "obj-24",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 45.0, 91.0, 71.0, 64.0 ],
                    "text": "06",
                    "textcolor": [ 0.0, 0.0, 0.0, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 45.0, 45.0, 245.0, 18.0 ],
                    "text": "STRANGE PULSE TOOKIT -- REFERENCE"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09580493718385696, 0.08593045920133591, 0.06428902596235275, 1.0 ],
                    "id": "obj-13",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 45.0, 30.0, 930.0, 4.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontname": "Helvetica Neue",
                    "fontsize": 48.0,
                    "id": "obj-16",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 118.0, 91.0, 637.0, 64.0 ],
                    "text": "Utilities",
                    "textcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ]
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
                    "numinlets": 3,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 83.0, 1060.0, 320.0, 183.0 ],
                    "varname": "StrangeFilter",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Helvetica Neue",
                    "fontsize": 14.0,
                    "id": "obj-20",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 421.0, 688.0, 540.0, 39.0 ],
                    "style": "StrangeStyle",
                    "text": "A simple sample player. With gain and pan knob, an adjustable envelope, and a modifiable start position."
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Helvetica Neue",
                    "fontsize": 16.0,
                    "id": "obj-18",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 421.0, 639.0, 167.0, 25.0 ],
                    "style": "StrangeStyle",
                    "text": "SamplePlayPoly",
                    "textcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Helvetica Neue",
                    "fontsize": 14.0,
                    "id": "obj-17",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 69.0, 927.0, 547.0, 23.0 ],
                    "style": "StrangeStyle",
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
                    "patching_rect": [ 623.0, 854.5, 289.0, 168.0 ],
                    "varname": "ToExternalMidi",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Helvetica Neue",
                    "fontsize": 16.0,
                    "id": "obj-5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 69.0, 883.0, 168.0, 25.0 ],
                    "style": "StrangeStyle",
                    "text": "ToExternalMidi",
                    "textcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Helvetica Neue",
                    "fontsize": 12.0,
                    "id": "obj-39",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 869.0, 516.0, 77.0, 20.0 ],
                    "style": "StrangeStyle",
                    "text": "CHAOTIC?",
                    "textcolor": [ 0.3058823529411765, 0.4823529411764706, 0.9098039215686274, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "hidden": 1,
                    "id": "obj-35",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 841.0, 462.0, 65.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "route 1 0"
                }
            },
            {
                "box": {
                    "checkedcolor": [ 0.3058823529411765, 0.4823529411764706, 0.9098039215686274, 1.0 ],
                    "id": "obj-30",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 841.0, 513.0, 26.0, 26.0 ],
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
                    "size": 40.0,
                    "style": "StrangeStyle",
                    "varname": "toggle"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "hidden": 1,
                    "id": "obj-15",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 841.0, 485.0, 34.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "a 3"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "hidden": 1,
                    "id": "obj-10",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 861.0, 485.0, 34.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "a 9"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Helvetica Neue",
                    "fontsize": 14.0,
                    "id": "obj-6",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 61.0, 386.0, 451.0, 55.0 ],
                    "style": "StrangeStyle",
                    "text": "AttractorDisplay takes the x,y,z signal inputs from an attractor and renders them as a  line. The display can be rotated, panned and zoomed with the mouse"
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
                    "patching_rect": [ 561.0, 335.0, 274.0, 204.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Helvetica Neue",
                    "fontsize": 16.0,
                    "id": "obj-37",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 61.0, 349.0, 130.0, 25.0 ],
                    "style": "StrangeStyle",
                    "text": "AttractorDisplay",
                    "textcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "hidden": 1,
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 841.0, 359.0, 120.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "spt.attractor.dadras"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Helvetica Neue",
                    "fontsize": 18.0,
                    "id": "obj-9",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 45.0, 178.0, 713.0, 48.0 ],
                    "style": "StrangeStyle",
                    "text": "There exist a number of utilities to make building patches with the SPT more convinient and to fill a few functional gaps"
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.847468376159668, 0.8226896524429321, 0.771217942237854, 1.0 ],
                    "id": "obj-27",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 45.0, 240.0, 934.0, 1116.0 ],
                    "proportion": 0.5
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "hidden": 1,
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 2 ],
                    "order": 0,
                    "source": [ "obj-12", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 1 ],
                    "order": 1,
                    "source": [ "obj-12", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "order": 2,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 1 ],
                    "order": 0,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 1 ],
                    "order": 1,
                    "source": [ "obj-12", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 2 ],
                    "order": 0,
                    "source": [ "obj-12", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "order": 1,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "hidden": 1,
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 0 ],
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "hidden": 1,
                    "source": [ "obj-25", 0 ]
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
                    "destination": [ "obj-11", 0 ],
                    "source": [ "obj-33", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "source": [ "obj-33", 0 ]
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
            }
        ],
        "parameters": {
            "obj-2::obj-23": [ "sample", "sample", 0 ],
            "obj-30": [ "toggle", "toggle", 0 ],
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
        ]
    }
}