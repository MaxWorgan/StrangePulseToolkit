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
        "rect": [ 41.0, 107.0, 1073.0, 808.0 ],
        "style": "StrangeStyle",
        "boxes": [
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Helvetica Neue",
                    "fontsize": 14.0,
                    "id": "obj-77",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 376.0, 1282.0, 440.0, 39.0 ],
                    "presentation_linecount": 2,
                    "text": "The average length of the vertical lines - suggesting how long a system stays in a particular state"
                }
            },
            {
                "box": {
                    "autofit": 1,
                    "forceaspect": 1,
                    "id": "obj-76",
                    "maxclass": "fpic",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "jit_matrix" ],
                    "patching_rect": [ 227.0, 1285.0, 133.0, 44.83712121212121 ],
                    "pic": "rqaEq7.png"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontname": "Helvetica Neue",
                    "fontsize": 14.0,
                    "id": "obj-75",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 59.0, 1290.0, 162.0, 23.0 ],
                    "text": "Trapping Time (TT):"
                }
            },
            {
                "box": {
                    "autofit": 1,
                    "forceaspect": 1,
                    "id": "obj-74",
                    "maxclass": "fpic",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "jit_matrix" ],
                    "patching_rect": [ 227.0, 1227.0, 133.0, 33.43370165745856 ],
                    "pic": "rqaEq6.png"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Helvetica Neue",
                    "fontsize": 14.0,
                    "id": "obj-69",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 376.0, 1223.9654696132598, 440.0, 39.0 ],
                    "presentation_linecount": 3,
                    "text": "The Shannon entropy of the probability that a diagonal line has exactly length \\ell"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontname": "Helvetica Neue",
                    "fontsize": 14.0,
                    "id": "obj-71",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 59.0, 1231.9654696132598, 162.0, 23.0 ],
                    "text": "Entropy (ENTR):"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Helvetica Neue",
                    "fontsize": 14.0,
                    "id": "obj-68",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 376.0, 1172.0, 240.0, 23.0 ],
                    "text": "The maximum diagonal line length"
                }
            },
            {
                "box": {
                    "autofit": 1,
                    "forceaspect": 1,
                    "id": "obj-67",
                    "maxclass": "fpic",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "jit_matrix" ],
                    "patching_rect": [ 227.0, 1170.0, 131.0, 26.200000000000003 ],
                    "pic": "rqaEq5.png"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontname": "Helvetica Neue",
                    "fontsize": 14.0,
                    "id": "obj-66",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 59.0, 1170.0, 162.0, 23.0 ],
                    "presentation_linecount": 2,
                    "text": "Maximum Line (LMax):"
                }
            },
            {
                "box": {
                    "autofit": 1,
                    "forceaspect": 1,
                    "id": "obj-65",
                    "maxclass": "fpic",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "jit_matrix" ],
                    "patching_rect": [ 229.0, 1045.0, 129.0, 38.92631578947368 ],
                    "pic": "rqaEq2.png"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Helvetica Neue",
                    "fontsize": 14.0,
                    "id": "obj-54",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 376.0, 1110.0, 240.0, 23.0 ],
                    "text": "As DET but with vertical lines"
                }
            },
            {
                "box": {
                    "autofit": 1,
                    "forceaspect": 1,
                    "id": "obj-55",
                    "maxclass": "fpic",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "jit_matrix" ],
                    "patching_rect": [ 227.0, 1106.0, 131.0, 37.93265993265994 ],
                    "pic": "rqaEq4.png"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontname": "Helvetica Neue",
                    "fontsize": 14.0,
                    "id": "obj-35",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 1110.0, 160.0, 23.0 ],
                    "text": "Laminarity (LAM):"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Helvetica Neue",
                    "fontsize": 14.0,
                    "id": "obj-34",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 410.0, 1060.0, 406.0, 23.0 ],
                    "presentation_linecount": 2,
                    "text": "is the frequency distribution of the lenths of the diagonal lines"
                }
            },
            {
                "box": {
                    "autofit": 1,
                    "forceaspect": 1,
                    "id": "obj-56",
                    "maxclass": "fpic",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "jit_matrix" ],
                    "patching_rect": [ 380.0, 1063.0, 28.0, 16.074074074074073 ],
                    "pic": "rqaEq3.png"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Helvetica Neue",
                    "fontsize": 14.0,
                    "id": "obj-57",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 375.0, 1039.0, 406.0, 23.0 ],
                    "presentation_linecount": 2,
                    "text": "The percentage of recurrence points that form diagonal lines. "
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontname": "Helvetica Neue",
                    "fontsize": 14.0,
                    "id": "obj-59",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 59.0, 1049.0, 162.0, 23.0 ],
                    "text": "Determinism (DET):"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Helvetica Neue",
                    "fontsize": 14.0,
                    "id": "obj-60",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 375.0, 987.3947368421054, 241.0, 23.0 ],
                    "presentation_linecount": 2,
                    "text": "The density of recurrence points"
                }
            },
            {
                "box": {
                    "autofit": 1,
                    "forceaspect": 1,
                    "id": "obj-61",
                    "maxclass": "fpic",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "jit_matrix" ],
                    "patching_rect": [ 230.0, 977.0, 128.0, 43.78947368421053 ],
                    "pic": "rqaEq1.png"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontname": "Helvetica Neue",
                    "fontsize": 14.0,
                    "id": "obj-62",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 58.5, 985.0, 161.0, 23.0 ],
                    "presentation_linecount": 2,
                    "text": "Recurrence Rate (RR):"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-42",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 31.0, 165.0, 285.0, 18.0 ],
                    "text": "DEVELOPED BY MAX WORGAN -- WWW.MXWN.IO"
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.09580493718385696, 0.08593045920133591, 0.06428902596235275, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 0.789483368396759, 0.7597718834877014, 0.6996591091156006, 1.0 ],
                    "id": "obj-43",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 31.0, 200.0, 937.0, 4.0 ],
                    "proportion": 0.5,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-45",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 31.0, 45.0, 245.0, 18.0 ],
                    "text": "STRANGE PULSE TOOKIT -- REFERENCE"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.09580493718385696, 0.08593045920133591, 0.06428902596235275, 1.0 ],
                    "id": "obj-47",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 31.0, 30.0, 930.0, 4.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontname": "Helvetica Neue",
                    "fontsize": 48.0,
                    "id": "obj-52",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 31.0, 90.0, 637.0, 64.0 ],
                    "text": "spt.rqa",
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
                    "id": "obj-37",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "AttractorDisplay.maxpat",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 541.0, 360.0, 263.0, 207.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-36",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 698.0, 581.0, 152.0, 48.0 ],
                    "style": "StrangeStyle",
                    "text": "Select some different states of the strange attractor"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "hint": "",
                    "id": "obj-9",
                    "ignoreclick": 1,
                    "legacytextcolor": 1,
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 673.0, 566.0, 20.0, 20.0 ],
                    "rounded": 60.0,
                    "style": "StrangeStyle",
                    "text": "2"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "hidden": 1,
                    "id": "obj-2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 855.0, 233.0, 100.0, 20.0 ],
                    "style": "StrangeStyle",
                    "text": "autopattr",
                    "varname": "u741010616"
                }
            },
            {
                "box": {
                    "bubblesize": 24,
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-1",
                    "maxclass": "preset",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "preset", "int", "preset", "int", "" ],
                    "patching_rect": [ 626.0, 588.0, 60.0, 34.0 ],
                    "preset_data": [
                        {
                            "number": 1,
                            "data": [ 5, "obj-18", "attrui", "attr", "e", 5, "obj-18", "attrui", "float", 6.0, 5, "obj-17", "attrui", "attr", "d", 5, "obj-17", "attrui", "float", 1.573, 5, "obj-16", "attrui", "attr", "c", 5, "obj-16", "attrui", "float", 1.4, 5, "obj-15", "attrui", "attr", "b", 5, "obj-15", "attrui", "float", 1.72, 5, "obj-8", "attrui", "attr", "a", 5, "obj-8", "attrui", "float", 2.7, 5, "obj-29", "attrui", "attr", "subsample_factor", 5, "obj-29", "attrui", "float", 5.0, 5, "obj-28", "attrui", "attr", "hop_size", 5, "obj-28", "attrui", "float", 256.0, 5, "obj-27", "attrui", "attr", "dynamic_threshold_factor", 5, "obj-27", "attrui", "float", 0.1, 5, "obj-26", "attrui", "attr", "threshold", 5, "obj-26", "attrui", "float", 0.1, 5, "obj-25", "attrui", "attr", "use_dynamic_threshold", 5, "obj-25", "attrui", "int", 1, 6, "obj-10", "number~", "list", 0.0, 0.0, 6, "obj-24", "number~", "list", 0.0, 0.0, 6, "obj-30", "number~", "list", 0.0, 0.0, 6, "obj-31", "number~", "list", 0.0, 0.0, 6, "obj-32", "number~", "list", 0.0, 0.0, 6, "obj-33", "number~", "list", 0.0, 0.0 ]
                        },
                        {
                            "number": 2,
                            "data": [ 5, "obj-18", "attrui", "attr", "e", 5, "obj-18", "attrui", "float", 3.5, 5, "obj-17", "attrui", "attr", "d", 5, "obj-17", "attrui", "float", 1.72, 5, "obj-16", "attrui", "attr", "c", 5, "obj-16", "attrui", "float", 2.0, 5, "obj-15", "attrui", "attr", "b", 5, "obj-15", "attrui", "float", 1.6, 5, "obj-8", "attrui", "attr", "a", 5, "obj-8", "attrui", "float", 5.310000000000001, 5, "obj-29", "attrui", "attr", "subsample_factor", 5, "obj-29", "attrui", "float", 5.0, 5, "obj-28", "attrui", "attr", "hop_size", 5, "obj-28", "attrui", "float", 256.0, 5, "obj-27", "attrui", "attr", "dynamic_threshold_factor", 5, "obj-27", "attrui", "float", 0.1, 5, "obj-26", "attrui", "attr", "threshold", 5, "obj-26", "attrui", "float", 0.1, 5, "obj-25", "attrui", "attr", "use_dynamic_threshold", 5, "obj-25", "attrui", "int", 1, 6, "obj-10", "number~", "list", 0.0, 0.0, 6, "obj-24", "number~", "list", 0.0, 0.0, 6, "obj-30", "number~", "list", 0.0, 0.0, 6, "obj-31", "number~", "list", 0.0, 0.0, 6, "obj-32", "number~", "list", 0.0, 0.0, 6, "obj-33", "number~", "list", 0.0, 0.0 ]
                        },
                        {
                            "number": 3,
                            "data": [ 5, "obj-18", "attrui", "attr", "e", 5, "obj-18", "attrui", "float", 7.7, 5, "obj-17", "attrui", "attr", "d", 5, "obj-17", "attrui", "float", 2.2, 5, "obj-16", "attrui", "attr", "c", 5, "obj-16", "attrui", "float", 1.7, 5, "obj-15", "attrui", "attr", "b", 5, "obj-15", "attrui", "float", 1.3, 5, "obj-8", "attrui", "attr", "a", 5, "obj-8", "attrui", "float", 4.0, 5, "obj-29", "attrui", "attr", "subsample_factor", 5, "obj-29", "attrui", "float", 5.0, 5, "obj-28", "attrui", "attr", "hop_size", 5, "obj-28", "attrui", "float", 256.0, 5, "obj-27", "attrui", "attr", "dynamic_threshold_factor", 5, "obj-27", "attrui", "float", 0.1, 5, "obj-26", "attrui", "attr", "threshold", 5, "obj-26", "attrui", "float", 0.1, 5, "obj-25", "attrui", "attr", "use_dynamic_threshold", 5, "obj-25", "attrui", "int", 1, 6, "obj-10", "number~", "list", 0.0, 0.0, 6, "obj-24", "number~", "list", 0.0, 0.0, 6, "obj-30", "number~", "list", 0.0, 0.0, 6, "obj-31", "number~", "list", 0.0, 0.0, 6, "obj-32", "number~", "list", 0.0, 0.0, 6, "obj-33", "number~", "list", 0.0, 0.0 ]
                        },
                        {
                            "number": 4,
                            "data": [ 5, "obj-18", "attrui", "attr", "e", 5, "obj-18", "attrui", "float", 3.5, 5, "obj-17", "attrui", "attr", "d", 5, "obj-17", "attrui", "float", 1.72, 5, "obj-16", "attrui", "attr", "c", 5, "obj-16", "attrui", "float", 1.59, 5, "obj-15", "attrui", "attr", "b", 5, "obj-15", "attrui", "float", 2.19, 5, "obj-8", "attrui", "attr", "a", 5, "obj-8", "attrui", "float", 4.870000000000001, 5, "obj-29", "attrui", "attr", "subsample_factor", 5, "obj-29", "attrui", "float", 5.0, 5, "obj-28", "attrui", "attr", "hop_size", 5, "obj-28", "attrui", "float", 256.0, 5, "obj-27", "attrui", "attr", "dynamic_threshold_factor", 5, "obj-27", "attrui", "float", 0.21, 5, "obj-26", "attrui", "attr", "threshold", 5, "obj-26", "attrui", "float", 0.13, 5, "obj-25", "attrui", "attr", "use_dynamic_threshold", 5, "obj-25", "attrui", "int", 1, 6, "obj-10", "number~", "list", 0.0, 0.0, 6, "obj-24", "number~", "list", 0.0, 0.0, 6, "obj-30", "number~", "list", 0.0, 0.0, 6, "obj-31", "number~", "list", 0.0, 0.0, 6, "obj-32", "number~", "list", 0.0, 0.0, 6, "obj-33", "number~", "list", 0.0, 0.0 ]
                        }
                    ],
                    "style": "StrangeStyle"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-51",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 725.0, 800.0, 79.0, 34.0 ],
                    "style": "StrangeStyle",
                    "text": "Trapping Time"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-50",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 594.0, 808.0, 77.0, 18.0 ],
                    "style": "StrangeStyle",
                    "text": "Laminarity"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-49",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 460.5, 809.0, 77.0, 18.0 ],
                    "style": "StrangeStyle",
                    "text": "Entropy"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-48",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 332.0, 808.0, 77.0, 18.0 ],
                    "style": "StrangeStyle",
                    "text": "LMax"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-46",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 201.0, 810.0, 77.0, 18.0 ],
                    "style": "StrangeStyle",
                    "text": "Determinism"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-44",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 45.0, 810.0, 120.0, 20.0 ],
                    "style": "StrangeStyle",
                    "text": "Recurrence Rate"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-33",
                    "maxclass": "number~",
                    "mode": 2,
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "float" ],
                    "patching_rect": [ 705.0, 749.0, 120.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 794.0, 384.0, 56.0, 22.0 ],
                    "sig": 0.0,
                    "sigoutmode": 0,
                    "style": "StrangeStyle",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-32",
                    "maxclass": "number~",
                    "mode": 2,
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "float" ],
                    "patching_rect": [ 573.0, 749.0, 120.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 655.0, 384.0, 56.0, 22.0 ],
                    "sig": 0.0,
                    "sigoutmode": 0,
                    "style": "StrangeStyle",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-31",
                    "maxclass": "number~",
                    "mode": 2,
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "float" ],
                    "patching_rect": [ 439.5, 750.0, 120.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 516.0, 384.0, 56.0, 22.0 ],
                    "sig": 0.0,
                    "sigoutmode": 0,
                    "style": "StrangeStyle",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-30",
                    "maxclass": "number~",
                    "mode": 2,
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "float" ],
                    "patching_rect": [ 310.0, 750.0, 120.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 242.0, 384.0, 48.0, 22.0 ],
                    "sig": 0.0,
                    "sigoutmode": 0,
                    "style": "StrangeStyle",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-24",
                    "maxclass": "number~",
                    "mode": 2,
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "float" ],
                    "patching_rect": [ 180.0, 751.0, 120.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 378.0, 384.0, 55.0, 22.0 ],
                    "sig": 0.0,
                    "sigoutmode": 0,
                    "style": "StrangeStyle",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-10",
                    "maxclass": "number~",
                    "mode": 2,
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "float" ],
                    "patching_rect": [ 45.0, 750.0, 120.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 99.0, 384.0, 56.0, 22.0 ],
                    "sig": 0.0,
                    "sigoutmode": 0,
                    "style": "StrangeStyle",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "activelinecolor": [ 0.317647, 0.654902, 0.976471, 1.0 ],
                    "bgcolor": [ 0.4, 0.552941176470588, 0.980392156862745, 0.0 ],
                    "id": "obj-11",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 705.0, 750.0, 120.0, 135.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 715.0, 381.0, 135.0, 146.0 ],
                    "range": [ 0.0, 500.0 ],
                    "smooth": 0,
                    "vertical_divisions": 8
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "activelinecolor": [ 0.439216, 0.74902, 0.254902, 1.0 ],
                    "id": "obj-13",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 573.0, 750.0, 120.0, 135.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 576.0, 381.0, 135.0, 143.0 ],
                    "range": [ 0.0, 10.0 ],
                    "smooth": 0
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "activelinecolor": [ 0.960784, 0.827451, 0.156863, 1.0 ],
                    "id": "obj-12",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 439.5, 750.0, 120.0, 135.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 437.0, 382.0, 135.0, 145.0 ],
                    "range": [ 0.0, 10.0 ],
                    "smooth": 0
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "activelinecolor": [ 0.701961, 0.415686, 0.886275, 1.0 ],
                    "id": "obj-14",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 180.0, 751.0, 120.0, 135.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 298.0, 380.0, 135.0, 148.0 ],
                    "range": [ 0.0, 1.0 ]
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "id": "obj-20",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 45.0, 750.0, 120.0, 135.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 383.0, 135.0, 143.0 ],
                    "range": [ 0.0, 1.0 ]
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "activelinecolor": [ 0.92549, 0.364706, 0.341176, 1.0 ],
                    "id": "obj-21",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 310.0, 750.0, 120.0, 135.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 159.0, 383.0, 135.0, 144.0 ],
                    "range": [ 0.0, 5000.0 ],
                    "smooth": 0
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-23",
                    "linecount": 2,
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 50.0, 626.0, 75.0, 21.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 663.0, 100.0, 21.0 ],
                    "style": "StrangeStyle",
                    "text": "spt.rqa 4000"
                }
            },
            {
                "box": {
                    "attr": "use_dynamic_threshold",
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-25",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 230.0, 635.0, 208.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 534.0, 228.0, 20.0 ],
                    "style": "StrangeStyle",
                    "text_width": 165.0,
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "attr": "threshold",
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-26",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 230.0, 611.0, 208.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 582.0, 220.0, 20.0 ],
                    "style": "StrangeStyle",
                    "text_width": 165.0,
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "attr": "dynamic_threshold_factor",
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-27",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 230.0, 551.0, 208.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 558.0, 220.0, 20.0 ],
                    "style": "StrangeStyle",
                    "text_width": 165.0,
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "attr": "hop_size",
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-28",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 230.0, 659.0, 207.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 631.0, 220.0, 20.0 ],
                    "style": "StrangeStyle",
                    "text_width": 164.0,
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "attr": "subsample_factor",
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-29",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 230.0, 587.0, 208.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 606.0, 227.0, 20.0 ],
                    "style": "StrangeStyle",
                    "text_width": 165.0,
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 53.0, 422.0, 127.0, 22.0 ],
                    "style": "StrangeStyle",
                    "text": "spt.attractor.dadras"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 16.0,
                    "id": "obj-88",
                    "linecount": 8,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 45.0, 234.0, 508.0, 174.0 ],
                    "style": "StrangeStyle",
                    "text": "An object that implements a range of Recurrence Quantification Analysis measures. \n\nThe measures are based on the analysis of a recurrence matrix.  The matrix is  built by deciding if the attractor has visited this location before based on either a static threshold, or a dynamic_threshold_factor  (depending on the spread of the input data).\n"
                }
            },
            {
                "box": {
                    "attr": "a",
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-8",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 230.0, 398.0, 149.0, 20.0 ],
                    "style": "StrangeStyle",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "attr": "b",
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-15",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 230.0, 422.0, 145.0, 20.0 ],
                    "style": "StrangeStyle",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "attr": "c",
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-16",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 230.0, 446.0, 143.0, 20.0 ],
                    "style": "StrangeStyle",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "attr": "d",
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-17",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 230.0, 469.0, 149.0, 20.0 ],
                    "style": "StrangeStyle",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "attr": "e",
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-18",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 230.0, 493.0, 149.0, 20.0 ],
                    "style": "StrangeStyle",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "attr": "diagonal_line_min_length",
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-3",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 229.0, 683.0, 209.0, 22.0 ],
                    "style": "StrangeStyle",
                    "text_width": 164.5,
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "attr": "vertical_line_min_length",
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-4",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 230.0, 707.0, 208.0, 20.0 ],
                    "style": "StrangeStyle",
                    "text_width": 164.0,
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.847468376159668, 0.8226896524429321, 0.771217942237854, 1.0 ],
                    "id": "obj-53",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 27.5, 210.0, 944.0, 1155.0 ],
                    "proportion": 0.5
                }
            },
            {
                "box": {
                    "attr": "speed_secondary",
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "obj-78",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 53.0, 435.0, 150.0, 22.0 ],
                    "style": "StrangeStyle",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 239.5, 445.0, 240.0, 445.0, 240.0, 493.0, 40.0, 493.0, 40.0, 457.0, 62.5, 457.0 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 239.5, 504.0, 43.0, 504.0, 43.0, 450.0, 62.5, 450.0 ],
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 239.5, 512.0, 42.0, 512.0, 42.0, 450.0, 62.5, 450.0 ],
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 239.5, 519.0, 41.0, 519.0, 41.0, 450.0, 62.5, 450.0 ],
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "midpoints": [ 59.5, 649.0, 54.5, 649.0 ],
                    "order": 1,
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "midpoints": [ 115.5, 742.0, 714.5, 742.0 ],
                    "order": 0,
                    "source": [ "obj-23", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "midpoints": [ 93.1, 742.0, 449.0, 742.0 ],
                    "order": 0,
                    "source": [ "obj-23", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "midpoints": [ 104.3, 742.0, 582.5, 742.0 ],
                    "order": 0,
                    "source": [ "obj-23", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "midpoints": [ 70.7, 742.0, 189.5, 742.0 ],
                    "source": [ "obj-23", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 0 ],
                    "midpoints": [ 59.5, 649.0, 54.5, 649.0 ],
                    "order": 0,
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "midpoints": [ 81.9, 742.0, 319.5, 742.0 ],
                    "order": 0,
                    "source": [ "obj-23", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30", 0 ],
                    "midpoints": [ 81.9, 742.0, 319.5, 742.0 ],
                    "order": 1,
                    "source": [ "obj-23", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-31", 0 ],
                    "midpoints": [ 93.1, 742.0, 449.0, 742.0 ],
                    "order": 1,
                    "source": [ "obj-23", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 0 ],
                    "midpoints": [ 104.3, 742.0, 582.5, 742.0 ],
                    "order": 1,
                    "source": [ "obj-23", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "midpoints": [ 115.5, 742.0, 714.5, 742.0 ],
                    "order": 1,
                    "source": [ "obj-23", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "midpoints": [ 239.5, 658.0, 240.0, 658.0, 240.0, 613.0, 59.5, 613.0 ],
                    "source": [ "obj-25", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "midpoints": [ 239.5, 634.0, 239.0, 634.0, 239.0, 612.0, 59.5, 612.0 ],
                    "source": [ "obj-26", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "midpoints": [ 239.5, 611.0, 59.5, 611.0 ],
                    "source": [ "obj-27", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "midpoints": [ 239.5, 611.0, 60.0, 611.0, 60.0, 619.0, 59.5, 619.0 ],
                    "source": [ "obj-28", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "midpoints": [ 239.5, 611.0, 59.5, 611.0 ],
                    "source": [ "obj-29", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "midpoints": [ 238.5, 611.0, 62.0, 611.0, 62.0, 622.0, 59.5, 622.0 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "midpoints": [ 239.5, 730.0, 37.0, 730.0, 37.0, 622.0, 59.5, 622.0 ],
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 2 ],
                    "source": [ "obj-5", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 1 ],
                    "source": [ "obj-5", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "source": [ "obj-5", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-37", 2 ],
                    "midpoints": [ 105.7, 501.0, 40.26171875, 501.0, 40.26171875, 219.0, 794.5, 219.0 ],
                    "source": [ "obj-5", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-37", 1 ],
                    "midpoints": [ 84.1, 501.0, 36.30859375, 501.0, 36.30859375, 219.0, 672.5, 219.0 ],
                    "source": [ "obj-5", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-37", 0 ],
                    "midpoints": [ 62.5, 501.0, 37.71875, 501.0, 37.71875, 219.0, 564.0, 219.0, 564.0, 357.0, 550.5, 357.0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-78", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 239.5, 421.0, 238.0, 421.0, 238.0, 493.0, 40.0, 493.0, 40.0, 457.0, 62.5, 457.0 ],
                    "source": [ "obj-8", 0 ]
                }
            }
        ],
        "autosave": 0,
        "boxgroups": [
            {
                "boxes": [ "obj-11", "obj-33", "obj-51" ]
            },
            {
                "boxes": [ "obj-13", "obj-32", "obj-50" ]
            },
            {
                "boxes": [ "obj-12", "obj-31", "obj-49" ]
            },
            {
                "boxes": [ "obj-21", "obj-30", "obj-48" ]
            },
            {
                "boxes": [ "obj-14", "obj-24", "obj-46" ]
            },
            {
                "boxes": [ "obj-20", "obj-10", "obj-44" ]
            },
            {
                "boxes": [ "obj-34", "obj-57", "obj-56" ]
            }
        ],
        "styles": [
            {
                "name": "StrangeStyle",
                "default": {
                    "bgcolor": [ 0.9647058823529412, 0.9529411764705882, 0.9254901960784314, 1.0 ],
                    "editing_bgcolor": [ 0.9673275351524353, 0.9524412751197815, 0.9268162250518799, 1.0 ],
                    "fontface": [ 0 ],
                    "fontname": [ "Helvetica Neue" ],
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