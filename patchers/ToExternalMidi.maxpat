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
        "rect": [ 581.0, 182.0, 505.0, 487.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 61.0, 311.0, 29.5, 22.0 ],
                    "text": "int"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 296.0, 324.0, 77.0, 22.0 ],
                    "restore": [ 0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr midiOut",
                    "varname": "midiOut"
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 61.0, 403.0, 108.0, 22.0 ],
                    "text": "join"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "float", "float" ],
                    "patching_rect": [ 61.0, 373.0, 108.0, 22.0 ],
                    "text": "makenote 120 500"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 234.0, 294.0, 100.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.054901860654354095, 0.05490203946828842, 0.05919864773750305, 1.0 ],
                    "bgfillcolor_angle": 270.0,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.054901860654354095, 0.05490203946828842, 0.05919864773750305, 1.0 ],
                    "bgfillcolor_color1": [ 0.126, 0.126, 0.141, 1.0 ],
                    "bgfillcolor_color2": [ 0.086, 0.086, 0.094, 1.0 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "elementcolor": [ 0.086, 0.086, 0.094, 1.0 ],
                    "fontface": 0,
                    "fontname": "Helvetica Neue",
                    "fontsize": 10.0,
                    "hint": "MIDI Device",
                    "id": "obj-9",
                    "items": [ "AU DLS Synth 1", ",", "from Max 1", ",", "from Max 2" ],
                    "labelclick": 1,
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 234.0, 354.0, 100.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 92.0, 156.0, 20.0 ],
                    "textcolor": [ 0.926, 0.926, 0.926, 1.0 ],
                    "varname": "umenu"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 234.0, 323.0, 55.0, 23.0 ],
                    "text": "midiinfo"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 61.0, 484.0, 55.0, 23.0 ],
                    "text": "noteout"
                }
            },
            {
                "box": {
                    "annotation": "Trigger In",
                    "comment": "Trigger In (float = velocity 0-1)",
                    "hint": "Trigger In",
                    "id": "obj-1",
                    "index": 1,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 61.0, 34.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-tbf",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "float" ],
                    "patching_rect": [ 61.0, 90.0, 40.0, 22.0 ],
                    "text": "t b f"
                }
            },
            {
                "box": {
                    "id": "obj-vscale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 150.0, 128.0, 118.0, 22.0 ],
                    "text": "scale 0. 1. 1 127"
                }
            },
            {
                "box": {
                    "id": "obj-vint",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 150.0, 166.0, 30.0, 22.0 ],
                    "text": "int"
                }
            },
            {
                "box": {
                    "border": 0,
                    "embedstate": [
                        [ "setstate", 53, 1, 200, 0 ]
                    ],
                    "filename": "ToExternalMidi.js",
                    "id": "ui",
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 400.0, 90.0, 220.0, 132.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 156.0, 92.0 ],
                    "textfile": {
                        "filename": "ToExternalMidi.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "ui"
                }
            },
            {
                "box": {
                    "id": "rt",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 400.0, 250.0, 160.0, 22.0 ],
                    "text": "route note chan gate"
                }
            },
            {
                "box": {
                    "id": "pvel",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 260.0, 200.0, 80.0, 22.0 ],
                    "text": "prepend vel"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-tbf", 0 ],
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "source": [ "obj-12", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 1 ],
                    "source": [ "obj-2", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "midpoints": [ 284.0, 443.0, 70.5, 443.0 ],
                    "source": [ "obj-9", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-tbf", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-vscale", 0 ],
                    "order": 1,
                    "source": [ "obj-tbf", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pvel", 0 ],
                    "order": 0,
                    "source": [ "obj-tbf", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 1 ],
                    "source": [ "obj-vint", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-vint", 0 ],
                    "source": [ "obj-vscale", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui", 0 ],
                    "source": [ "pvel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 2 ],
                    "source": [ "rt", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 2 ],
                    "source": [ "rt", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 1 ],
                    "source": [ "rt", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rt", 0 ],
                    "source": [ "ui", 0 ]
                }
            }
        ]
    }
}