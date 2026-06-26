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
		"rect": [
			34.0,
			99.0,
			1200.0,
			860.0
		],
		"openinpresentation": 1,
		"boxes": [
			{
				"box": {
					"id": "in_audio",
					"maxclass": "inlet",
					"numinlets": 0,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"index": 0,
					"comment": "Audio In (mono duplicated / stereo)",
					"patching_rect": [
						27.0,
						40.0,
						30.0,
						30.0
					]
				}
			},
			{
				"box": {
					"id": "in_ctlL",
					"maxclass": "inlet",
					"numinlets": 0,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"index": 0,
					"comment": "Control L",
					"patching_rect": [
						240.0,
						40.0,
						30.0,
						30.0
					]
				}
			},
			{
				"box": {
					"id": "in_ctlR",
					"maxclass": "inlet",
					"numinlets": 0,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"index": 0,
					"comment": "Control R",
					"patching_rect": [
						470.0,
						40.0,
						30.0,
						30.0
					]
				}
			},
			{
				"box": {
					"id": "out_L",
					"maxclass": "outlet",
					"numinlets": 1,
					"numoutlets": 0,
					"index": 0,
					"comment": "Audio Out L",
					"patching_rect": [
						27.0,
						860.0,
						30.0,
						30.0
					]
				}
			},
			{
				"box": {
					"id": "out_R",
					"maxclass": "outlet",
					"numinlets": 1,
					"numoutlets": 0,
					"index": 0,
					"comment": "Audio Out R",
					"patching_rect": [
						92.0,
						860.0,
						30.0,
						30.0
					]
				}
			},
			{
				"box": {
					"id": "unpk",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						27.0,
						110.0,
						100.0,
						22.0
					],
					"text": "mc.unpack~ 2",
					"outlettype": [
						"signal",
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "cc",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						170.0,
						110.0,
						120.0,
						22.0
					],
					"text": "mc.channelcount~",
					"outlettype": [
						"",
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "selR",
					"maxclass": "newobj",
					"numinlets": 3,
					"numoutlets": 1,
					"patching_rect": [
						100.0,
						240.0,
						90.0,
						22.0
					],
					"text": "selector~ 2",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "fffbL",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						27.0,
						320.0,
						150.0,
						22.0
					],
					"text": "mcs.fffb~ 64 20 H 10",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "mixL",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						27.0,
						380.0,
						110.0,
						22.0
					],
					"text": "mc.mixdown~ 1",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "fffbR",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						200.0,
						320.0,
						150.0,
						22.0
					],
					"text": "mcs.fffb~ 64 20 H 10",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "mixR",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						200.0,
						380.0,
						110.0,
						22.0
					],
					"text": "mc.mixdown~ 1",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "powL",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						450.0,
						300.0,
						200.0,
						22.0
					],
					"text": "vexpr pow($f1, 3.) @scalarmode 1"
				}
			},
			{
				"box": {
					"id": "gainL",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						450.0,
						340.0,
						110.0,
						22.0
					],
					"text": "prepend gain 0"
				}
			},
			{
				"box": {
					"id": "powR",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						680.0,
						300.0,
						200.0,
						22.0
					],
					"text": "vexpr pow($f1, 3.) @scalarmode 1"
				}
			},
			{
				"box": {
					"id": "gainR",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						680.0,
						340.0,
						110.0,
						22.0
					],
					"text": "prepend gain 0"
				}
			},
			{
				"box": {
					"id": "qmsg",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						450.0,
						420.0,
						110.0,
						22.0
					],
					"text": "prepend QAll"
				}
			},
			{
				"box": {
					"id": "snap_L",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						250.0,
						110.0,
						90.0,
						22.0
					],
					"text": "snapshot~ 10"
				}
			},
			{
				"box": {
					"id": "exp_L",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						250.0,
						150.0,
						140.0,
						22.0
					],
					"text": "expr $f1 * 0.5 + 0.5"
				}
			},
			{
				"box": {
					"id": "stream_L",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						250.0,
						190.0,
						90.0,
						22.0
					],
					"text": "zl.stream 64"
				}
			},
			{
				"box": {
					"id": "sort_L",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						250.0,
						230.0,
						80.0,
						22.0
					],
					"text": "zl.sort",
					"outlettype": [
						"",
						""
					]
				}
			},
			{
				"box": {
					"id": "slice1_L",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						250.0,
						270.0,
						80.0,
						22.0
					],
					"text": "zl.slice 1",
					"outlettype": [
						"",
						""
					]
				}
			},
			{
				"box": {
					"id": "slice63_L",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						340.0,
						270.0,
						90.0,
						22.0
					],
					"text": "zl.slice 63",
					"outlettype": [
						"",
						""
					]
				}
			},
			{
				"box": {
					"id": "slideA_L",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						250.0,
						310.0,
						90.0,
						22.0
					],
					"text": "slide 10. 10."
				}
			},
			{
				"box": {
					"id": "slideB_L",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						340.0,
						310.0,
						90.0,
						22.0
					],
					"text": "slide 10. 10."
				}
			},
			{
				"box": {
					"id": "norm_L",
					"maxclass": "newobj",
					"numinlets": 3,
					"numoutlets": 1,
					"patching_rect": [
						250.0,
						360.0,
						230.0,
						22.0
					],
					"text": "vexpr ($f1 - $f2) / ($f3 - $f2) @scalarmode 1"
				}
			},
			{
				"box": {
					"id": "interp_L",
					"maxclass": "newobj",
					"numinlets": 3,
					"numoutlets": 1,
					"patching_rect": [
						250.0,
						400.0,
						230.0,
						22.0
					],
					"text": "vexpr $f1 * (1 - $f3) + $f2 * $f3 @scalarmode 1"
				}
			},
			{
				"box": {
					"id": "snap_R",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						520.0,
						110.0,
						90.0,
						22.0
					],
					"text": "snapshot~ 10"
				}
			},
			{
				"box": {
					"id": "exp_R",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						520.0,
						150.0,
						140.0,
						22.0
					],
					"text": "expr $f1 * 0.5 + 0.5"
				}
			},
			{
				"box": {
					"id": "stream_R",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						520.0,
						190.0,
						90.0,
						22.0
					],
					"text": "zl.stream 64"
				}
			},
			{
				"box": {
					"id": "sort_R",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						520.0,
						230.0,
						80.0,
						22.0
					],
					"text": "zl.sort",
					"outlettype": [
						"",
						""
					]
				}
			},
			{
				"box": {
					"id": "slice1_R",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						520.0,
						270.0,
						80.0,
						22.0
					],
					"text": "zl.slice 1",
					"outlettype": [
						"",
						""
					]
				}
			},
			{
				"box": {
					"id": "slice63_R",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						610.0,
						270.0,
						90.0,
						22.0
					],
					"text": "zl.slice 63",
					"outlettype": [
						"",
						""
					]
				}
			},
			{
				"box": {
					"id": "slideA_R",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						520.0,
						310.0,
						90.0,
						22.0
					],
					"text": "slide 10. 10."
				}
			},
			{
				"box": {
					"id": "slideB_R",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						610.0,
						310.0,
						90.0,
						22.0
					],
					"text": "slide 10. 10."
				}
			},
			{
				"box": {
					"id": "norm_R",
					"maxclass": "newobj",
					"numinlets": 3,
					"numoutlets": 1,
					"patching_rect": [
						520.0,
						360.0,
						230.0,
						22.0
					],
					"text": "vexpr ($f1 - $f2) / ($f3 - $f2) @scalarmode 1"
				}
			},
			{
				"box": {
					"id": "interp_R",
					"maxclass": "newobj",
					"numinlets": 3,
					"numoutlets": 1,
					"patching_rect": [
						520.0,
						400.0,
						230.0,
						22.0
					],
					"text": "vexpr $f1 * (1 - $f3) + $f2 * $f3 @scalarmode 1"
				}
			},
			{
				"box": {
					"border": 0,
					"filename": "StrangeFilter.js",
					"id": "ui",
					"maxclass": "v8ui",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"parameter_enable": 0,
					"patching_rect": [
						800.0,
						110.0,
						236.0,
						200.0
					],
					"presentation": 1,
					"presentation_rect": [
						0.0,
						0.0,
						236.0,
						200.0
					],
					"textfile": {
						"filename": "StrangeFilter.js",
						"flags": 0,
						"embed": 0,
						"autowatch": 1
					},
					"varname": "ui"
				}
			},
			{
				"box": {
					"id": "precurveL",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						250.0,
						460.0,
						110.0,
						22.0
					],
					"text": "prepend curveL"
				}
			},
			{
				"box": {
					"id": "precurveR",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						520.0,
						460.0,
						110.0,
						22.0
					],
					"text": "prepend curveR"
				}
			},
			{
				"box": {
					"id": "route",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 4,
					"patching_rect": [
						800.0,
						360.0,
						200.0,
						22.0
					],
					"text": "route curveL curveR mix q",
					"outlettype": [
						"",
						"",
						"",
						""
					]
				}
			},
			{
				"box": {
					"id": "ccsnap",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						170.0,
						150.0,
						100.0,
						22.0
					],
					"text": "snapshot~ 100",
					"outlettype": [
						"float"
					]
				}
			},
			{
				"box": {
					"id": "ccclip",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						170.0,
						190.0,
						60.0,
						22.0
					],
					"text": "clip 1 2"
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"source": [
						"in_audio",
						0
					],
					"destination": [
						"unpk",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"in_audio",
						0
					],
					"destination": [
						"cc",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"unpk",
						0
					],
					"destination": [
						"selR",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"unpk",
						1
					],
					"destination": [
						"selR",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"unpk",
						0
					],
					"destination": [
						"fffbL",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"selR",
						0
					],
					"destination": [
						"fffbR",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"fffbL",
						0
					],
					"destination": [
						"mixL",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"mixL",
						0
					],
					"destination": [
						"out_L",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"fffbR",
						0
					],
					"destination": [
						"mixR",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"mixR",
						0
					],
					"destination": [
						"out_R",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"powL",
						0
					],
					"destination": [
						"gainL",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"gainL",
						0
					],
					"destination": [
						"fffbL",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"powR",
						0
					],
					"destination": [
						"gainR",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"gainR",
						0
					],
					"destination": [
						"fffbR",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"qmsg",
						0
					],
					"destination": [
						"fffbL",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"qmsg",
						0
					],
					"destination": [
						"fffbR",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"in_ctlL",
						0
					],
					"destination": [
						"snap_L",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"snap_L",
						0
					],
					"destination": [
						"exp_L",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"exp_L",
						0
					],
					"destination": [
						"stream_L",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"stream_L",
						0
					],
					"destination": [
						"sort_L",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"stream_L",
						0
					],
					"destination": [
						"norm_L",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"stream_L",
						0
					],
					"destination": [
						"interp_L",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sort_L",
						0
					],
					"destination": [
						"slice1_L",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sort_L",
						0
					],
					"destination": [
						"slice63_L",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slice1_L",
						0
					],
					"destination": [
						"slideA_L",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slice63_L",
						1
					],
					"destination": [
						"slideB_L",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slideA_L",
						0
					],
					"destination": [
						"norm_L",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slideB_L",
						0
					],
					"destination": [
						"norm_L",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"norm_L",
						0
					],
					"destination": [
						"interp_L",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"in_ctlR",
						0
					],
					"destination": [
						"snap_R",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"snap_R",
						0
					],
					"destination": [
						"exp_R",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"exp_R",
						0
					],
					"destination": [
						"stream_R",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"stream_R",
						0
					],
					"destination": [
						"sort_R",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"stream_R",
						0
					],
					"destination": [
						"norm_R",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"stream_R",
						0
					],
					"destination": [
						"interp_R",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sort_R",
						0
					],
					"destination": [
						"slice1_R",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sort_R",
						0
					],
					"destination": [
						"slice63_R",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slice1_R",
						0
					],
					"destination": [
						"slideA_R",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slice63_R",
						1
					],
					"destination": [
						"slideB_R",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slideA_R",
						0
					],
					"destination": [
						"norm_R",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"slideB_R",
						0
					],
					"destination": [
						"norm_R",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"norm_R",
						0
					],
					"destination": [
						"interp_R",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"interp_L",
						0
					],
					"destination": [
						"precurveL",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"precurveL",
						0
					],
					"destination": [
						"ui",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"interp_R",
						0
					],
					"destination": [
						"precurveR",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"precurveR",
						0
					],
					"destination": [
						"ui",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"ui",
						0
					],
					"destination": [
						"route",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"route",
						0
					],
					"destination": [
						"powL",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"route",
						1
					],
					"destination": [
						"powR",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"route",
						2
					],
					"destination": [
						"interp_L",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"route",
						2
					],
					"destination": [
						"interp_R",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"route",
						3
					],
					"destination": [
						"qmsg",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"cc",
						1
					],
					"destination": [
						"ccsnap",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"ccsnap",
						0
					],
					"destination": [
						"ccclip",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"ccclip",
						0
					],
					"destination": [
						"selR",
						0
					]
				}
			}
		]
	}
}