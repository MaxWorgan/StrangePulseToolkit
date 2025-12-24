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
        "rect": [ 269.0, 99.0, 878.0, 821.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-31",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 152.0, 911.0, 575.0, 33.0 ],
                    "presentation_linecount": 2,
                    "text": "In most cases RPDE will likely provide the easiest way to analyse the attractor, however there may be more "
                }
            },
            {
                "box": {
                    "id": "obj-30",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 152.0, 867.0, 575.0, 33.0 ],
                    "presentation_linecount": 2,
                    "text": "This set of metrics provies 6 different ways to analyse  a signal, each based on a geometric interpretation of a recurrence plot."
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 152.0, 772.0, 575.0, 33.0 ],
                    "presentation_linecount": 2,
                    "text": "This metric is highly sensitive to all variables, including the speed of the signal analysed, the window size,  and the other key parameters exposed. See the helpfile for details."
                }
            },
            {
                "box": {
                    "id": "obj-28",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 152.0, 723.0, 575.0, 47.0 ],
                    "presentation_linecount": 4,
                    "text": "This metric generates a single value, describing the level of periodicity is found in its input signal. It's a fairly easy way to deterine if an attractor is in a chaotic state or a periodic state (i.e. a limit cycle or fixed point)."
                }
            },
            {
                "box": {
                    "fontsize": 14.0,
                    "id": "obj-27",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 152.0, 828.0, 249.0, 22.0 ],
                    "text": "Recurrence quantification analysis",
                    "textcolor": [ 0.9764705882352941, 0.5176470588235295, 0.2901960784313726, 1.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 14.0,
                    "id": "obj-26",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 152.0, 687.0, 249.0, 22.0 ],
                    "text": "Recurrence period density entropy",
                    "textcolor": [ 0.9764705882352941, 0.5176470588235295, 0.2901960784313726, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-23",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 49.0, 828.0, 71.5, 22.0 ],
                    "text": "spt.rqa"
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "linecount": 5,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 636.0, 267.0, 339.0, 74.0 ],
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
                    "patching_rect": [ 49.0, 254.0, 45.0, 45.0 ]
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
                    "name": "AudioTriggers.maxpat",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "", "", "signal" ],
                    "patching_rect": [ 117.0, 258.0, 494.0, 323.0 ],
                    "varname": "AudioTriggers",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 58.75, 687.0, 52.0, 22.0 ],
                    "text": "spt.rpde"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 18.0,
                    "id": "obj-7",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 45.0, 611.0, 211.0, 27.0 ],
                    "text": "Recurrence Feedback",
                    "textcolor": [ 0.2429931462, 0.5804384947, 0.4775273204, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 18.0,
                    "id": "obj-1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 41.0, 205.0, 152.0, 27.0 ],
                    "text": "AudioTriggers",
                    "textcolor": [ 0.2429931462, 0.5804384947, 0.4775273204, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 45.0, 152.0, 332.0, 47.0 ],
                    "text": "There are two avenues of feedback that can be considered when building withe the SPT, audio feedback, and a recurrence based feedback."
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 24.0,
                    "id": "obj-2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 45.0, 105.0, 135.0, 33.0 ],
                    "text": "Feedback",
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
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "source": [ "obj-13", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}