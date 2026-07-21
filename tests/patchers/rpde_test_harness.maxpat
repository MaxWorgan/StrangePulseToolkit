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
        "rect": [ 100.0, 100.0, 957.0, 800.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 348.0, 200.0, 97.0, 22.0 ],
                    "text": "reset_calibration"
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
                    "patching_rect": [ 82.0, 299.0, 270.0, 202.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "obj-bufsize-comment",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 15.0, 200.0, 20.0 ],
                    "text": "=== RPDE Test Harness ==="
                }
            },
            {
                "box": {
                    "id": "obj-buffer",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 30.0, 45.0, 132.0, 22.0 ],
                    "text": "buffer~ test_buf 5000 1"
                }
            },
            {
                "box": {
                    "id": "obj-dadras",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 60.0, 115.0, 111.0, 22.0 ],
                    "text": "spt.attractor.dadras"
                }
            },
            {
                "box": {
                    "id": "obj-rec-comment",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 185.0, 150.0, 20.0 ],
                    "text": "--- Record to Buffer ---"
                }
            },
            {
                "box": {
                    "id": "obj-record-toggle",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 30.0, 210.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-record-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 212.0, 60.0, 20.0 ],
                    "text": "Record"
                }
            },
            {
                "box": {
                    "id": "obj-record",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 30.0, 245.0, 120.0, 22.0 ],
                    "text": "record~ test_buf"
                }
            },
            {
                "box": {
                    "allowdrag": 0,
                    "buffername": "test_buf",
                    "id": "obj-waveform",
                    "maxclass": "waveform~",
                    "norulerclick": 0,
                    "numinlets": 5,
                    "numoutlets": 6,
                    "outlettype": [ "float", "float", "float", "float", "list", "" ],
                    "patching_rect": [ 15.789474248886108, 547.3684406280518, 978.9474034309387, 122.10526752471924 ],
                    "ticks": 1
                }
            },
            {
                "box": {
                    "id": "obj-play-comment",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 375.0, 150.0, 20.0 ],
                    "text": "--- Playback to RPDE ---"
                }
            },
            {
                "box": {
                    "id": "obj-play-toggle",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 30.0, 400.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-play-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 402.0, 82.0, 20.0 ],
                    "text": "Play to RPDE"
                }
            },
            {
                "box": {
                    "id": "obj-gate",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 30.0, 430.0, 50.0, 22.0 ],
                    "text": "gate~ 1"
                }
            },
            {
                "box": {
                    "id": "obj-count",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 217.0, 443.0, 160.0, 22.0 ],
                    "text": "count~ 0 9999 @autoreset 1"
                }
            },
            {
                "box": {
                    "id": "obj-peek",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 217.0, 496.0, 90.0, 22.0 ],
                    "text": "index~ test_buf"
                }
            },
            {
                "box": {
                    "id": "obj-rpde-comment",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 479.0, 15.0, 200.0, 20.0 ],
                    "text": "=== RPDE Parameters ==="
                }
            },
            {
                "box": {
                    "id": "obj-rpde",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "signal", "signal", "signal" ],
                    "patching_rect": [ 557.0, 173.0, 82.0, 22.0 ],
                    "text": "spt.rpde 5000"
                }
            },
            {
                "box": {
                    "id": "obj-out-comment",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 479.0, 235.0, 150.0, 20.0 ],
                    "text": "--- RPDE Output ---"
                }
            },
            {
                "box": {
                    "id": "obj-rpde-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 400.0, 260.0, 50.0, 20.0 ],
                    "text": "RPDE:"
                }
            },
            {
                "box": {
                    "id": "obj-snap-rpde",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 479.0, 285.0, 81.0, 22.0 ],
                    "text": "snapshot~ 10"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-rpde-val",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 479.0, 310.0, 80.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-period-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 579.0, 260.0, 50.0, 20.0 ],
                    "text": "Period:"
                }
            },
            {
                "box": {
                    "id": "obj-snap-period",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 579.0, 285.0, 81.0, 22.0 ],
                    "text": "snapshot~ 10"
                }
            },
            {
                "box": {
                    "id": "obj-period-val",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 579.0, 310.0, 60.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-status-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 741.5, 260.0, 50.0, 20.0 ],
                    "text": "Status:"
                }
            },
            {
                "box": {
                    "id": "obj-snap-status",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 836.5, 288.4210629463196, 81.0, 22.0 ],
                    "text": "snapshot~ 10"
                }
            },
            {
                "box": {
                    "id": "obj-status-val",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 836.5, 312.63159012794495, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-scope",
                    "maxclass": "scope~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 479.0, 350.0, 300.0, 100.0 ],
                    "range": [ 0.0, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-sine-comment",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 282.0, 15.0, 200.0, 20.0 ],
                    "text": "=== Sine Test Source ==="
                }
            },
            {
                "box": {
                    "id": "obj-sine-toggle",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 282.0, 45.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-sine-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 312.0, 47.0, 80.0, 20.0 ],
                    "text": "Use Sine"
                }
            },
            {
                "box": {
                    "id": "obj-freq-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 282.0, 80.0, 51.0, 20.0 ],
                    "text": "Freq Hz"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-freq",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 332.0, 80.0, 70.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-cycle",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 282.0, 110.0, 120.0, 22.0 ],
                    "text": "cycle~ 100"
                }
            },
            {
                "box": {
                    "id": "obj-selector",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 200.0, 200.0, 80.0, 22.0 ],
                    "text": "selector~ 2 1"
                }
            },
            {
                "box": {
                    "attr": "a",
                    "id": "obj-2",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 60.0, 85.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "auto_params",
                    "id": "obj-6",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 557.0, 143.0, 150.0, 22.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-dadras", 0 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rpde", 0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rpde", 0 ],
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-peek", 0 ],
                    "source": [ "obj-count", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-selector", 2 ],
                    "source": [ "obj-cycle", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 2 ],
                    "source": [ "obj-dadras", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 1 ],
                    "source": [ "obj-dadras", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-dadras", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-record", 0 ],
                    "order": 2,
                    "source": [ "obj-dadras", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rpde", 0 ],
                    "order": 0,
                    "source": [ "obj-dadras", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-selector", 1 ],
                    "order": 1,
                    "source": [ "obj-dadras", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-cycle", 0 ],
                    "source": [ "obj-freq", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gate", 1 ],
                    "source": [ "obj-peek", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-count", 0 ],
                    "order": 0,
                    "source": [ "obj-play-toggle", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gate", 0 ],
                    "order": 1,
                    "source": [ "obj-play-toggle", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-record", 0 ],
                    "source": [ "obj-record-toggle", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-scope", 0 ],
                    "order": 0,
                    "source": [ "obj-rpde", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-snap-period", 0 ],
                    "source": [ "obj-rpde", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-snap-rpde", 0 ],
                    "order": 1,
                    "source": [ "obj-rpde", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-snap-status", 0 ],
                    "source": [ "obj-rpde", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-selector", 0 ],
                    "source": [ "obj-sine-toggle", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-period-val", 0 ],
                    "source": [ "obj-snap-period", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rpde-val", 0 ],
                    "source": [ "obj-snap-rpde", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-status-val", 0 ],
                    "source": [ "obj-snap-status", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}