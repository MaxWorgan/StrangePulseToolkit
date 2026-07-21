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
        "rect": [ 42.0, 107.0, 1159.0, 807.0 ],
        "style": "StrangeStyle",
        "boxes": [
            {
                "box": {
                    "fontface": 1,
                    "fontname": "Helvetica Neue",
                    "fontsize": 48.0,
                    "id": "obj-4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 45.0, 89.0, 74.0, 64.0 ],
                    "text": "05",
                    "textcolor": [ 0.1607843137254902, 0.15294117647058825, 0.12156862745098039, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Helvetica Neue",
                    "fontsize": 16.0,
                    "id": "obj-2",
                    "linecount": 7,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 510.0, 1305.0, 472.0, 137.0 ],
                    "text": "The RecurrenceLab patcher is a convenience UI object that shows a recurrenceplot of an incoming signal, as well as showing a visual readout of the two recurence analysis tools.\n\nThe purpose is to help you gain an intuitive understanding of how the recurrence analysis methods operate as well as how to tune the parameters for effective use."
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
                    "name": "RecurrenceLab.maxpat",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patching_rect": [ 139.0, 1335.0, 340.0, 424.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "obj-40",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 138.0, 1312.0, 110.0, 21.0 ],
                    "text": "spt.attractor.dadras"
                }
            },
            {
                "box": {
                    "fontname": "Helvetica Neue",
                    "fontsize": 18.0,
                    "id": "obj-39",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 138.0, 1279.0, 342.0, 27.0 ],
                    "text": "Recurrence Lab",
                    "textcolor": [ 0.3058823529411765, 0.4823529411764706, 0.9098039215686274, 1.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Helvetica Neue",
                    "fontsize": 18.0,
                    "id": "obj-12",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 136.0, 1069.0, 346.0, 27.0 ],
                    "text": "Recurrence Quantification Analysis",
                    "textcolor": [ 0.3058823529411765, 0.4823529411764706, 0.9098039215686274, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Helvetica Neue",
                    "fontsize": 18.0,
                    "id": "obj-17",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 45.0, 218.0, 845.0, 48.0 ],
                    "text": "SPT supports audio-reactive control and recurrence-based feedback. Audio analysis produces events, envelopes and follower signals for patching elsewhere."
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.09580493718385696, 0.08593045920133591, 0.06428902596235275, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 0.789483368396759, 0.7597718834877014, 0.6996591091156006, 1.0 ],
                    "id": "obj-5",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 45.0, 200.0, 937.0, 4.0 ],
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
                    "text": "STRANGE PULSE TOOKIT -- REFERENCE"
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
                    "id": "obj-6",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 121.0, 89.0, 259.0, 64.0 ],
                    "text": "Feedback",
                    "textcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Helvetica Neue",
                    "fontsize": 16.0,
                    "id": "obj-30",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 136.0, 1110.0, 839.0, 62.0 ],
                    "text": "This external implements a range of measures that analyse and quantify the phase space trajectory of a dynamical system. The measures are all based on a geometric analysis of the recurrence matrix - full details to be found in the helpfile."
                }
            },
            {
                "box": {
                    "fontname": "Helvetica Neue",
                    "fontsize": 16.0,
                    "id": "obj-29",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 138.0, 945.0, 741.0, 44.0 ],
                    "text": "This metric is highly sensitive to all variables, including the speed of the signal analysed, the window size,  and the other key parameters exposed. See the helpfile for details."
                }
            },
            {
                "box": {
                    "fontname": "Helvetica Neue",
                    "fontsize": 16.0,
                    "id": "obj-28",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 138.0, 885.0, 839.0, 44.0 ],
                    "text": "This metric generates a single value, describing the level of periodicity is found in its input signal. It's a fairly easy way to deterine if an attractor is in a chaotic state or a periodic state (i.e. a limit cycle or fixed point)."
                }
            },
            {
                "box": {
                    "fontname": "Helvetica Neue",
                    "fontsize": 18.0,
                    "id": "obj-26",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 138.0, 850.0, 330.0, 27.0 ],
                    "text": "Recurrence period density entropy",
                    "textcolor": [ 0.3058823529411765, 0.4823529411764706, 0.9098039215686274, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-23",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 47.0, 1072.0, 71.5, 21.0 ],
                    "text": "spt.rqa"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Helvetica Neue",
                    "fontsize": 16.0,
                    "id": "obj-14",
                    "linecount": 6,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 612.0, 374.0, 370.0, 118.0 ],
                    "style": "StrangeStyle",
                    "text": "Max provides all the necessary tools to incorporate audio based feedback into your patches. SPT simply provides a convinience patcher from the early days of the SPTs development which may or may not ease the development of  your instruments."
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "ezadc~",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 255.0, 309.0, 45.0, 45.0 ]
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
                    "name": "AudioReactive.maxpat",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "", "signal", "signal" ],
                    "patching_rect": [ 108.0, 362.0, 494.0, 323.0 ],
                    "varname": "AudioReactive",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "signal", "signal", "signal" ],
                    "patching_rect": [ 56.5, 853.0, 52.0, 21.0 ],
                    "text": "spt.rpde"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Helvetica Neue",
                    "fontsize": 20.0,
                    "id": "obj-7",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 780.0, 239.0, 30.0 ],
                    "text": "Recurrence Feedback",
                    "textcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Helvetica Neue",
                    "fontsize": 20.0,
                    "id": "obj-1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 309.0, 173.0, 30.0 ],
                    "text": "Audio Reactive",
                    "textcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ]
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.847468376159668, 0.8226896524429321, 0.771217942237854, 1.0 ],
                    "id": "obj-15",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 45.0, 301.0, 954.0, 434.0 ],
                    "proportion": 0.5
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.847468376159668, 0.8226896524429321, 0.771217942237854, 1.0 ],
                    "id": "obj-16",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 765.0, 942.0, 1200.0 ],
                    "proportion": 0.5
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 2 ],
                    "source": [ "obj-40", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 1 ],
                    "source": [ "obj-40", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 0 ],
                    "source": [ "obj-40", 3 ]
                }
            }
        ],
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