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
        "rect": [ 34.0, 99.0, 991.0, 823.0 ],
        "default_fontname": "Helvetica Neue",
        "style": "StrangeStyle",
        "boxes": [
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-17",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 6,
                    "outlettype": [ "", "", "", "", "", "" ],
                    "patching_rect": [ 5.25, 740.0, 71.5, 23.0 ],
                    "text": "gate 6"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 7.0, 362.0, 29.5, 23.0 ],
                    "text": "+ 1"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-86",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 7.0, 423.0, 68.0, 23.0 ],
                    "text": "offset $1 0"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-82",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 7.0, 392.0, 123.0, 23.0 ],
                    "text": "expr - (($f1 -1) * 330)"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 1,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-5",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "attractorParams.maxpat",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patching_rect": [ 45.0, 498.0, 306.0, 225.0 ],
                    "varname": "attractorParams",
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
                    "id": "obj-11",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "AttractorDisplay.maxpat",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 345.0, 615.0, 591.0, 240.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 78.37837314605713, 300.0, 62.0, 23.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.09580493718385696, 0.08593045920133591, 0.06428902596235275, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 0.789483368396759, 0.7597718834877014, 0.6996591091156006, 1.0 ],
                    "id": "obj-64",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 45.0, 990.0, 930.0, 4.0 ],
                    "proportion": 0.5,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-61",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 239.0, 1223.0, 62.0, 23.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 239.0, 1259.0, 40.0, 23.0 ],
                    "text": "int 10"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-62",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "AttractorDisplay.maxpat",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 495.0, 1320.0, 265.0, 204.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 16.0,
                    "id": "obj-25",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 46.0, 1050.0, 782.0, 44.0 ],
                    "text": "Custom attractors can be written as gen~ files, as shown in the example below. If even better performance is required, the attractor_base.h file can be extended to make dedicated externals.",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 24.0,
                    "id": "obj-24",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 46.0, 1005.0, 240.0, 35.0 ],
                    "text": "Custom Attractors",
                    "textcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-182",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 239.0, 1320.0, 52.0, 22.0 ],
                    "style": "StrangeStyle",
                    "text": "* 44.1"
                }
            },
            {
                "box": {
                    "id": "obj-181",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 299.0, 1295.0, 150.0, 21.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 848.0, 143.0, 69.0, 21.0 ],
                    "text": "speed (Hz)",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-109",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 239.0, 1391.0, 48.0, 23.0 ],
                    "text": "<~ -0.5"
                }
            },
            {
                "box": {
                    "id": "obj-108",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 239.0, 1367.0, 44.0, 23.0 ],
                    "text": "delta~"
                }
            },
            {
                "box": {
                    "id": "obj-105",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 239.0, 1343.0, 55.0, 23.0 ],
                    "text": "phasor~"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-155",
                    "maxclass": "flonum",
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 239.0, 1294.0, 50.0, 23.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 788.0, 142.0, 50.0, 23.0 ],
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ],
                    "varname": "strangeSpeed"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-63",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "signal", "signal", "signal" ],
                    "patching_rect": [ 239.0, 1463.0, 144.0, 21.0 ],
                    "style": "StrangeStyle-1",
                    "text": "gen~ arneodo_attractor"
                }
            },
            {
                "box": {
                    "attr": "arneodo_a",
                    "id": "obj-19",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 311.0, 1343.0, 150.0, 23.0 ],
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "attr": "arneodo_b",
                    "id": "obj-20",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 311.0, 1367.0, 150.0, 23.0 ],
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "attr": "arneodo_c",
                    "id": "obj-21",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 311.0, 1391.0, 150.0, 23.0 ],
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "attr": "dt",
                    "id": "obj-30",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 311.0, 1415.0, 150.0, 23.0 ],
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9647058823529412, 0.9529411764705882, 0.9254901960784314, 1.0 ],
                    "fontsize": 10.0,
                    "id": "obj-60",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 345.0, 344.65294629335403, 590.6542010307312, 18.0 ],
                    "text": "TIME SERIES",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9647058823529412, 0.9529411764705882, 0.9254901960784314, 1.0 ],
                    "fontsize": 10.0,
                    "id": "obj-59",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 345.0, 595.0, 590.6542010307312, 18.0 ],
                    "text": "PHASE PORTRAIT",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "hidden": 1,
                    "id": "obj-38",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 96.29729413986206, 705.0, 97.0, 22.0 ],
                    "text": "expr pow($f1\\,3)"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-53",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 96.29729413986206, 735.0, 110.0, 23.0 ],
                    "text": "speed_primary $1"
                }
            },
            {
                "box": {
                    "id": "obj-49",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 76.29729413986206, 425.0, 150.0, 21.0 ],
                    "text": "Speed",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "floatoutput": 1,
                    "id": "obj-47",
                    "knobcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ],
                    "knobshape": 5,
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 76.0, 452.0, 210.0, 23.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_exponent": 3.0,
                            "parameter_initial": [ 0.2 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "speed",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "speed",
                            "parameter_steps": 1000,
                            "parameter_type": 0,
                            "parameter_units": "%.f2",
                            "parameter_unitstyle": 9
                        }
                    },
                    "size": 1.0,
                    "thickness": 83.0,
                    "valuepopup": 1,
                    "valuepopuplabel": 3,
                    "varname": "slider"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-45",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 78.37837314605713, 765.0, 45.00001001358032, 23.0 ],
                    "text": "+ 1"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "bgfillcolor_angle": 270.0,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "bgfillcolor_color1": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ],
                    "bgfillcolor_color2": [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 1.0 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "elementcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "fontface": 0,
                    "fontname": "Helvetica Neue",
                    "fontsize": 18.0,
                    "id": "obj-43",
                    "items": [ "Lorenz", ",", "Dadras", ",", "Tsucs1", ",", "Halvorsen", ",", "Aizawa", ",", "Thomas" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 78.37837314605713, 339.15294629335403, 116.62162685394287, 29.0 ],
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-42",
                    "maxclass": "newobj",
                    "numinlets": 7,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 240.54052448272705, 890.6756672859192, 97.70270919799805, 23.0 ],
                    "text": "selector~ 6"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-41",
                    "maxclass": "newobj",
                    "numinlets": 7,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 240.54052448272705, 844.729724407196, 97.70270919799805, 23.0 ],
                    "text": "selector~ 6"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-40",
                    "maxclass": "newobj",
                    "numinlets": 7,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 240.54052448272705, 800.1351327896118, 97.70270919799805, 23.0 ],
                    "text": "selector~ 6"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-36",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 75.6756706237793, 909.594584941864, 140.94594955444336, 23.0 ],
                    "text": "spt.attractor.thomas"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-35",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 77.02702188491821, 885.2702622413635, 138.24324703216553, 23.0 ],
                    "text": "spt.attractor.aizawa"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-34",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 77.02702188491821, 859.5945882797241, 154.45946216583252, 23.0 ],
                    "text": "spt.attractor.halvorsen"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-33",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 77.02702188491821, 837.9729681015015, 135.5405445098877, 23.0 ],
                    "text": "spt.attractor.tsucs1"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "hidden": 1,
                    "id": "obj-28",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 75.6756706237793, 814.9999966621399, 127.4324369430542, 22.0 ],
                    "text": "spt.attractor.dadras"
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 0.0 ],
                    "activegridcolor": [ 0.3058823529411765, 0.4823529411764706, 0.9098039215686274, 0.53 ],
                    "activelinecolor": [ 0.6313725490196078, 0.6313725490196078, 0.6313725490196078, 1.0 ],
                    "grid": 3,
                    "grid_line_width": 0.1,
                    "horizonal_divisions": 13,
                    "horizontal_divisions": 13,
                    "id": "obj-16",
                    "interval": 1.0,
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 345.0, 362.0, 590.6542010307312, 203.73831617832184 ],
                    "samples": 88200.0,
                    "smooth": 2,
                    "vertical_divisions": 4
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 0.0 ],
                    "activegridcolor": [ 0.3058823529411765, 0.4823529411764706, 0.9098039215686274, 0.53 ],
                    "activelinecolor": [ 0.6313725490196078, 0.6313725490196078, 0.6313725490196078, 1.0 ],
                    "grid": 3,
                    "grid_line_width": 0.1,
                    "horizonal_divisions": 13,
                    "horizontal_divisions": 13,
                    "id": "obj-15",
                    "interval": 1.0,
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 345.0, 362.0, 590.6542010307312, 203.73831617832184 ],
                    "samples": 88200.0,
                    "smooth": 2,
                    "vertical_divisions": 4
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "activegridcolor": [ 0.3058823529411765, 0.4823529411764706, 0.9098039215686274, 0.53 ],
                    "activelinecolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ],
                    "grid": 3,
                    "grid_line_width": 0.1,
                    "horizonal_divisions": 13,
                    "horizontal_divisions": 13,
                    "id": "obj-14",
                    "interval": 1.0,
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 345.0, 362.0, 590.6542010307312, 203.73831617832184 ],
                    "samples": 88200.0,
                    "smooth": 2,
                    "vertical_divisions": 4
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "hidden": 1,
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 78.37837314605713, 790.6756739616394, 123.37838315963745, 22.0 ],
                    "text": "spt.attractor.lorenz"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Helvetica Neue",
                    "fontsize": 16.0,
                    "id": "obj-4",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 45.0, 173.0, 804.0, 100.0 ],
                    "text": "The strange attractors themselves. Six attractors are provided as MSP externals — each integrates a chaotic system at signal rate and outputs its x, y and z coordinates. Every parameter is a live attribute; a bang resets the system to its initial state. Each attractor has its own set of paramters that can be changed to affect the state of the system.\n",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontname": "Helvetica Neue",
                    "fontsize": 48.0,
                    "id": "obj-1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 45.0, 89.0, 72.0, 64.0 ],
                    "text": "01",
                    "textcolor": [ 0.07450980392156863, 0.07450980392156863, 0.07450980392156863, 1.0 ]
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.09580493718385696, 0.08593045920133591, 0.06428902596235275, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 0.789483368396759, 0.7597718834877014, 0.6996591091156006, 1.0 ],
                    "id": "obj-13",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 45.0, 267.0, 930.0, 4.0 ],
                    "proportion": 0.5,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-10",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 45.0, 45.0, 245.0, 18.0 ],
                    "text": "STRANGE PULSE TOOKIT",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09580493718385696, 0.08593045920133591, 0.06428902596235275, 1.0 ],
                    "id": "obj-8",
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
                    "id": "obj-3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 119.0, 89.0, 637.0, 64.0 ],
                    "text": "Signal Generators",
                    "textcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ]
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.847468376159668, 0.8226896524429321, 0.771217942237854, 1.0 ],
                    "id": "obj-65",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 45.0, 1110.0, 930.0, 660.0 ],
                    "proportion": 0.5
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.847468376159668, 0.8226896524429321, 0.771217942237854, 1.0 ],
                    "id": "obj-6",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 45.0, 300.0, 930.0, 660.0 ],
                    "proportion": 0.5
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-108", 0 ],
                    "source": [ "obj-105", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-109", 0 ],
                    "source": [ "obj-108", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 0 ],
                    "source": [ "obj-109", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-155", 0 ],
                    "hidden": 1,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-182", 0 ],
                    "source": [ "obj-155", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 0 ],
                    "hidden": 1,
                    "source": [ "obj-17", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "hidden": 1,
                    "source": [ "obj-17", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-34", 0 ],
                    "source": [ "obj-17", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-35", 0 ],
                    "source": [ "obj-17", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 0 ],
                    "source": [ "obj-17", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "hidden": 1,
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-105", 0 ],
                    "source": [ "obj-182", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 0 ],
                    "source": [ "obj-19", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-43", 0 ],
                    "hidden": 1,
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 0 ],
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 0 ],
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-40", 2 ],
                    "hidden": 1,
                    "source": [ "obj-28", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-41", 2 ],
                    "hidden": 1,
                    "source": [ "obj-28", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 2 ],
                    "hidden": 1,
                    "source": [ "obj-28", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 0 ],
                    "source": [ "obj-30", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-40", 3 ],
                    "hidden": 1,
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-41", 3 ],
                    "hidden": 1,
                    "source": [ "obj-33", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 3 ],
                    "hidden": 1,
                    "source": [ "obj-33", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-40", 4 ],
                    "hidden": 1,
                    "source": [ "obj-34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-41", 4 ],
                    "hidden": 1,
                    "source": [ "obj-34", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 4 ],
                    "hidden": 1,
                    "source": [ "obj-34", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-40", 5 ],
                    "hidden": 1,
                    "source": [ "obj-35", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-41", 5 ],
                    "hidden": 1,
                    "source": [ "obj-35", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 5 ],
                    "hidden": 1,
                    "source": [ "obj-35", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-40", 6 ],
                    "hidden": 1,
                    "source": [ "obj-36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-41", 6 ],
                    "hidden": 1,
                    "source": [ "obj-36", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 6 ],
                    "hidden": 1,
                    "source": [ "obj-36", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-53", 0 ],
                    "hidden": 1,
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 2 ],
                    "order": 0,
                    "source": [ "obj-40", 0 ]
                }
            },
            {
                "patchline": {
                    "color": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ],
                    "destination": [ "obj-14", 0 ],
                    "hidden": 1,
                    "order": 1,
                    "source": [ "obj-40", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 1 ],
                    "order": 1,
                    "source": [ "obj-41", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "hidden": 1,
                    "order": 0,
                    "source": [ "obj-41", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "order": 1,
                    "source": [ "obj-42", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "hidden": 1,
                    "order": 0,
                    "source": [ "obj-42", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 0 ],
                    "hidden": 1,
                    "order": 0,
                    "source": [ "obj-43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "hidden": 1,
                    "order": 1,
                    "source": [ "obj-43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-40", 0 ],
                    "hidden": 1,
                    "order": 2,
                    "source": [ "obj-45", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-41", 0 ],
                    "hidden": 1,
                    "order": 1,
                    "source": [ "obj-45", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 0 ],
                    "hidden": 1,
                    "order": 0,
                    "source": [ "obj-45", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "hidden": 1,
                    "source": [ "obj-47", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 1 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 0 ],
                    "hidden": 1,
                    "order": 5,
                    "source": [ "obj-53", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "hidden": 1,
                    "order": 3,
                    "source": [ "obj-53", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-34", 0 ],
                    "hidden": 1,
                    "order": 2,
                    "source": [ "obj-53", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-35", 0 ],
                    "hidden": 1,
                    "order": 1,
                    "source": [ "obj-53", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 0 ],
                    "hidden": 1,
                    "order": 4,
                    "source": [ "obj-53", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "hidden": 1,
                    "order": 0,
                    "source": [ "obj-53", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "hidden": 1,
                    "source": [ "obj-61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-62", 2 ],
                    "midpoints": [ 373.5, 1496.48046875, 482.0, 1496.48046875, 482.0, 1307.0, 750.5, 1307.0 ],
                    "source": [ "obj-63", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-62", 1 ],
                    "midpoints": [ 311.0, 1496.0, 482.0, 1496.0, 482.0, 1307.0, 627.5, 1307.0 ],
                    "source": [ "obj-63", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-62", 0 ],
                    "midpoints": [ 248.5, 1496.0, 482.0, 1496.0, 482.0, 1316.0, 504.5, 1316.0 ],
                    "source": [ "obj-63", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-40", 1 ],
                    "hidden": 1,
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-41", 1 ],
                    "hidden": 1,
                    "source": [ "obj-7", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 1 ],
                    "hidden": 1,
                    "source": [ "obj-7", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-86", 0 ],
                    "hidden": 1,
                    "source": [ "obj-82", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "hidden": 1,
                    "source": [ "obj-86", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "hidden": 1,
                    "order": 1,
                    "source": [ "obj-9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-82", 0 ],
                    "hidden": 1,
                    "order": 0,
                    "source": [ "obj-9", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-47": [ "speed", "speed", 0 ],
            "obj-5::obj-5": [ "thomas_b", "thomas_b", 0 ],
            "inherited_shortname": 1
        },
        "autosave": 0,
        "boxgroups": [
            {
                "boxes": [ "obj-16", "obj-15", "obj-14" ]
            }
        ],
        "styles": [
            {
                "name": "StrangeStyle",
                "default": {
                    "bgcolor": [ 0.9647058823529412, 0.9529411764705882, 0.9254901960784314, 1.0 ],
                    "editing_bgcolor": [ 0.9673275351524353, 0.9524412751197815, 0.9268162250518799, 1.0 ],
                    "fontface": [ 1 ],
                    "fontname": [ "Arial" ],
                    "fontsize": [ 12.0 ],
                    "locked_bgcolor": [ 0.9673275351524353, 0.9524412751197815, 0.9268162250518799, 1.0 ]
                },
                "parentstyle": "",
                "multi": 0
            },
            {
                "name": "StrangeStyle-1",
                "default": {
                    "bgcolor": [ 0.9647058823529412, 0.9529411764705882, 0.9254901960784314, 1.0 ],
                    "editing_bgcolor": [ 0.9673275351524353, 0.9524412751197815, 0.9268162250518799, 1.0 ],
                    "fontface": [ 1 ],
                    "fontname": [ "Sana" ],
                    "locked_bgcolor": [ 0.9673275351524353, 0.9524412751197815, 0.9268162250518799, 1.0 ]
                },
                "parentstyle": "",
                "multi": 0
            }
        ],
        "syntax_objectcolor": [ 0.1607843137254902, 0.15294117647058825, 0.12156862745098039, 1.0 ],
        "syntax_objargcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
    }
}