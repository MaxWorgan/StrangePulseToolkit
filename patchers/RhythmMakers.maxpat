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
        "rect": [ 59.0, 118.0, 830.0, 760.0 ],
        "boxes": [
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-29",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 404.0, 566.0, 102.0, 22.0 ],
                    "text": "loadmess recall 1"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-24",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 404.0, 593.0, 226.0, 22.0 ],
                    "saved_object_attributes": {
                        "client_rect": [ 100, 171, 483, 533 ],
                        "parameter_enable": 0,
                        "parameter_mappable": 0,
                        "storage_rect": [ 100, 171, 730, 466 ]
                    },
                    "text": "pattrstorage rythmmakers @savemode 2",
                    "varname": "rythmmakers"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 315.0, 582.0, 56.0, 22.0 ],
                    "text": "autopattr",
                    "varname": "u965011063"
                }
            },
            {
                "box": {
                    "blinkcolor": [ 0.023529411764706, 0.83921568627451, 0.627450980392157, 1.0 ],
                    "blinktime": 10,
                    "id": "obj-16",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 674.9523790000001, 479.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "blinkcolor": [ 1.0, 0.819607843137255, 0.4, 1.0 ],
                    "blinktime": 10,
                    "id": "obj-17",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 521.0, 479.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 521.0, 242.0, 390.0, 47.0 ],
                    "text": "This patcher extends the GradientTrigger patcher and geneartes gate signals on two input signals, then combines them in a continuously variable amount from AND to XOR"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 20.0,
                    "id": "obj-15",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 521.0, 205.0, 255.0, 29.0 ],
                    "text": "CombineSignalsAsGates",
                    "textcolor": [ 0.2429931462, 0.5804384947, 0.4775273204, 1.0 ]
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
                    "name": "combineSignalsAsGates.maxpat",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 521.0, 304.0, 172.952379, 161.0 ],
                    "varname": "combineSignalsAsGates",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "blinkcolor": [ 0.023529411764706, 0.83921568627451, 0.627450980392157, 1.0 ],
                    "blinktime": 10,
                    "id": "obj-13",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 217.0, 632.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "blinkcolor": [ 1.0, 0.819607843137255, 0.4, 1.0 ],
                    "blinktime": 10,
                    "id": "obj-14",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 45.0, 632.0, 24.0, 24.0 ]
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
                    "name": "ThresholdTrigger.maxpat",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 45.0, 532.0, 191.0, 90.0 ],
                    "varname": "threshTrigger",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "blinkcolor": [ 0.023529411764706, 0.83921568627451, 0.627450980392157, 1.0 ],
                    "blinktime": 10,
                    "id": "obj-6",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 173.0, 401.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "blinkcolor": [ 1.0, 0.819607843137255, 0.4, 1.0 ],
                    "blinktime": 10,
                    "id": "obj-5",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 45.0, 401.0, 24.0, 24.0 ]
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
                    "name": "GradientTrigger.maxpat",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 45.0, 304.0, 147.0, 95.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "obj-23",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 44.5, 491.0, 391.0, 33.0 ],
                    "text": "This patcher uses an upper and a lower threshold mechanism to trigger the two outputs, in the same manner as GradientTrigger"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 20.0,
                    "id": "obj-21",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 43.5, 447.0, 225.0, 29.0 ],
                    "text": "ThresholdTigger",
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
                    "patching_rect": [ 45.0, 163.0, 111.0, 22.0 ],
                    "text": "spt.attractor.dadras"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 39.0, 242.0, 390.0, 47.0 ],
                    "text": "This patcher watches for a change in the gradient in the signal and generates a signal. It has two outputs, one for down to up transitions, and the other for up to down"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 20.0,
                    "id": "obj-10",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 39.0, 205.0, 224.0, 29.0 ],
                    "text": "GradientTrigger",
                    "textcolor": [ 0.2429931462, 0.5804384947, 0.4775273204, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 45.0, 135.0, 390.0, 20.0 ],
                    "text": "Utilities that are designed to extract rhythmical triggers from signals:"
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
                    "patching_rect": [ 45.0, 105.0, 182.0, 31.0 ],
                    "text": "Rhythm Makers:",
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
                    "text": "written by Max Worgan (c) 2025, www.mxwn.io, MIT Licence"
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
                    "destination": [ "obj-3", 0 ],
                    "midpoints": [ 54.5, 195.43359375, 24.0, 195.43359375, 24.0, 300.0, 54.5, 300.0 ],
                    "order": 2,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 1 ],
                    "midpoints": [ 72.9, 195.15234375, 507.0, 195.15234375, 507.0, 300.0, 607.4761895, 300.0 ],
                    "source": [ "obj-12", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "midpoints": [ 54.5, 195.04296875, 507.0, 195.04296875, 507.0, 300.0, 530.5, 300.0 ],
                    "order": 1,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "midpoints": [ 54.5, 194.76171875, 24.0, 194.76171875, 24.0, 528.0, 54.5, 528.0 ],
                    "order": 0,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 0 ],
                    "hidden": 1,
                    "source": [ "obj-29", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "source": [ "obj-3", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "source": [ "obj-4", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "source": [ "obj-8", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "source": [ "obj-8", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}