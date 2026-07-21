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
        "rect": [ 180.0, 120.0, 760.0, 590.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "comment": "Signal A",
                    "id": "in-a",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 45.0, 40.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "Signal B",
                    "id": "in-b",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 145.0, 40.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "Chop modulator",
                    "id": "in-mod",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 245.0, 40.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "Amount 0..1",
                    "id": "in-amt",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 345.0, 40.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "gen",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 145.0, 280.0, 124.0, 22.0 ],
                    "text": "gen~ combineSignals"
                }
            },
            {
                "box": {
                    "comment": "Morphed signal",
                    "id": "out",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 145.0, 500.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "SignalMorph.js",
                    "id": "ui",
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 450.0, 185.0, 184.0, 95.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 300.0, 204.0 ],
                    "textfile": {
                        "filename": "SignalMorph.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "ui"
                }
            },
            {
                "box": {
                    "id": "mode",
                    "maxclass": "number",
                    "maximum": 2,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 450.0, 330.0, 50.0, 22.0 ],
                    "varname": "CombineType"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "amount",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 550.0, 330.0, 50.0, 22.0 ],
                    "varname": "BlendAmt"
                }
            },
            {
                "box": {
                    "id": "mode-gen",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 425.0, 375.0, 86.0, 22.0 ],
                    "text": "prepend mode"
                }
            },
            {
                "box": {
                    "id": "mode-ui",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 425.0, 410.0, 86.0, 22.0 ],
                    "text": "prepend mode"
                }
            },
            {
                "box": {
                    "id": "amount-gen",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 550.0, 375.0, 86.0, 22.0 ],
                    "text": "prepend blend"
                }
            },
            {
                "box": {
                    "id": "amount-ui",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 550.0, 410.0, 86.0, 22.0 ],
                    "text": "prepend blend"
                }
            },
            {
                "box": {
                    "id": "snap-a",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 45.0, 120.0, 81.0, 22.0 ],
                    "text": "snapshot~ 20"
                }
            },
            {
                "box": {
                    "id": "snap-b",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 145.0, 120.0, 81.0, 22.0 ],
                    "text": "snapshot~ 20"
                }
            },
            {
                "box": {
                    "id": "snap-c",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 245.0, 120.0, 81.0, 22.0 ],
                    "text": "snapshot~ 20"
                }
            },
            {
                "box": {
                    "id": "snap-out",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 245.0, 330.0, 81.0, 22.0 ],
                    "text": "snapshot~ 20"
                }
            },
            {
                "box": {
                    "id": "msg-a",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 45.0, 160.0, 66.0, 22.0 ],
                    "text": "prepend a"
                }
            },
            {
                "box": {
                    "id": "msg-b",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 145.0, 160.0, 66.0, 22.0 ],
                    "text": "prepend b"
                }
            },
            {
                "box": {
                    "id": "msg-c",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 245.0, 160.0, 66.0, 22.0 ],
                    "text": "prepend c"
                }
            },
            {
                "box": {
                    "id": "msg-out",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 245.0, 370.0, 90.0, 22.0 ],
                    "text": "prepend output"
                }
            },
            {
                "box": {
                    "id": "load",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 650.0, 40.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "filename": "attractorFit.js",
                    "id": "fit",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 600.0, 80.0, 130.0, 22.0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0
                    },
                    "text": "v8 attractorFit.js ui",
                    "textfile": {
                        "filename": "attractorFit.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    }
                }
            },
            {
                "box": {
                    "id": "auto",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 650.0, 120.0, 56.0, 22.0 ],
                    "restore": {
                        "BlendAmt": [ 0.627906976744186 ],
                        "CombineType": [ 2 ]
                    },
                    "text": "autopattr",
                    "varname": "uSignalMorph"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "amount-gen", 0 ],
                    "order": 1,
                    "source": [ "amount", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "amount-ui", 0 ],
                    "order": 0,
                    "source": [ "amount", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gen", 0 ],
                    "source": [ "amount-gen", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui", 0 ],
                    "source": [ "amount-ui", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out", 0 ],
                    "order": 1,
                    "source": [ "gen", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "snap-out", 0 ],
                    "order": 0,
                    "source": [ "gen", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gen", 0 ],
                    "order": 0,
                    "source": [ "in-a", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "snap-a", 0 ],
                    "order": 1,
                    "source": [ "in-a", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "amount", 0 ],
                    "source": [ "in-amt", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gen", 1 ],
                    "order": 0,
                    "source": [ "in-b", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "snap-b", 0 ],
                    "order": 1,
                    "source": [ "in-b", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gen", 2 ],
                    "order": 0,
                    "source": [ "in-mod", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "snap-c", 0 ],
                    "order": 1,
                    "source": [ "in-mod", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "amount", 0 ],
                    "order": 1,
                    "source": [ "load", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "fit", 0 ],
                    "order": 0,
                    "source": [ "load", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mode", 0 ],
                    "order": 2,
                    "source": [ "load", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mode-gen", 0 ],
                    "order": 1,
                    "source": [ "mode", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mode-ui", 0 ],
                    "order": 0,
                    "source": [ "mode", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gen", 0 ],
                    "source": [ "mode-gen", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui", 0 ],
                    "source": [ "mode-ui", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui", 0 ],
                    "source": [ "msg-a", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui", 0 ],
                    "source": [ "msg-b", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui", 0 ],
                    "source": [ "msg-c", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui", 0 ],
                    "source": [ "msg-out", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "msg-a", 0 ],
                    "source": [ "snap-a", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "msg-b", 0 ],
                    "source": [ "snap-b", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "msg-c", 0 ],
                    "source": [ "snap-c", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "msg-out", 0 ],
                    "source": [ "snap-out", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "amount", 0 ],
                    "source": [ "ui", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mode", 0 ],
                    "source": [ "ui", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}