{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 6,
			"revision" : 5,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 34.0, 99.0, 989.0, 823.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-66",
					"maxclass" : "slider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 478.0, 230.5, 20.0, 140.0 ],
					"size" : 10000.0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-65",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 247.0, 376.0, 82.0, 22.0 ],
					"text" : "rampsmooth~"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-61",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "fold.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 267.0, 263.0, 202.0, 75.0 ],
					"varname" : "fold",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-59",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "combineSignalsAsGates.maxpat",
					"numinlets" : 3,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 49.0, 434.0, 188.0, 160.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-52",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 0,
					"patching_rect" : [ 93.0, 252.0, 65.0, 22.0 ],
					"text" : "dac~ 1 2 3"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-42",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 577.0, 749.0, 81.0, 22.0 ],
					"text" : "snapshot~ 10"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-49",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 577.0, 723.0, 121.0, 22.0 ],
					"text" : "scale~ -1. 1. 50. 100."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 411.0, 739.0, 81.0, 22.0 ],
					"text" : "snapshot~ 10"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-33",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 411.0, 713.0, 121.0, 22.0 ],
					"text" : "scale~ -1. 1. 50. 100."
				}

			}
, 			{
				"box" : 				{
					"basictuning" : 440,
					"clipheight" : 99.0,
					"data" : 					{
						"clips" : [ ]
					}
,
					"followglobaltempo" : 0,
					"formantcorrection" : 0,
					"id" : "obj-40",
					"maxclass" : "playlist~",
					"mode" : "basic",
					"numinlets" : 1,
					"numoutlets" : 5,
					"originallength" : [ 0.0, "ticks" ],
					"originaltempo" : 120.0,
					"outlettype" : [ "signal", "signal", "signal", "", "dictionary" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 991.0, 845.037963628768921, 445.0, 100.0 ],
					"pitchcorrection" : 0,
					"quality" : "basic",
					"timestretch" : [ 0 ]
				}

			}
, 			{
				"box" : 				{
					"basictuning" : 440,
					"clipheight" : 69.886075019836426,
					"data" : 					{
						"clips" : [ ]
					}
,
					"followglobaltempo" : 0,
					"formantcorrection" : 0,
					"id" : "obj-115",
					"maxclass" : "playlist~",
					"mode" : "basic",
					"numinlets" : 1,
					"numoutlets" : 5,
					"originallength" : [ 0.0, "ticks" ],
					"originaltempo" : 120.0,
					"outlettype" : [ "signal", "signal", "signal", "", "dictionary" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 901.265810966491699, 772.151888608932495, 468.354424238204956, 70.886075019836426 ],
					"pitchcorrection" : 0,
					"quality" : "basic",
					"timestretch" : [ 0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-112",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 907.594924807548523, 881.012646675109863, 65.0, 22.0 ],
					"text" : "SlinkFFTS"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-109",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 1144.25, 85.0, 29.5, 22.0 ],
					"text" : "+ 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-108",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1147.0, 36.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-106",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1081.012644052505493, 245.0, 68.0, 22.0 ],
					"text" : "selector~ 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-105",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1081.012644052505493, 205.063288450241089, 68.0, 22.0 ],
					"text" : "selector~ 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-104",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1081.012644052505493, 169.620250940322876, 68.0, 22.0 ],
					"text" : "selector~ 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-53",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [ "", "", "", "", "" ],
					"patching_rect" : [ 5.0, 109.0, 61.0, 22.0 ],
					"text" : "cycle 5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-51",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 11.0, 24.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-48",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "int" ],
					"patching_rect" : [ 11.0, 53.0, 40.0, 22.0 ],
					"text" : "uzi 5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-47",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 11.0, 79.0, 49.0, 22.0 ],
					"text" : "random"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-62",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "erase" ],
					"patching_rect" : [ 1104.0, 424.0, 55.0, 22.0 ],
					"text" : "t b erase"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-60",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 1104.0, 456.0, 143.0, 22.0 ],
					"text" : "jit.gl.render triggerScreen"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"maxclass" : "jit.pwindow",
					"name" : "triggerScreen",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 773.0, 526.0, 284.0, 219.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 30.0, 30.0, 265.0, 204.0 ],
					"sync" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-37",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1069.0, 652.0, 145.0, 22.0 ],
					"text" : "jit.gl.handle triggerScreen"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-38",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 1069.0, 733.0, 204.0, 22.0 ],
					"text" : "jit.gl.videoplane @transform_reset 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-128",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "jit_gl_texture", "", "" ],
					"patching_rect" : [ 1069.0, 689.0, 221.0, 22.0 ],
					"text" : "jit.gl.node @name test-path @capture 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-56",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 773.0, 482.0, 580.0, 22.0 ],
					"text" : "jit.gl.path test-path @interpmode spline @segments 15 @pathstyle line @line_width 2 @color 1. 0.82 0.4 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-39",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 773.0, 457.0, 320.0, 22.0 ],
					"text" : "jit.catch~ 3 @framesize 256 @mode 2 @downsample 512"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-41",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1147.0, 306.0, 150.0, 47.0 ],
					"text" : "Enable audio and send render bang to our AttractorView"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-43",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 1016.0, 382.0, 100.0, 22.0 ],
					"text" : "dac~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-44",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1069.0, 311.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-45",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1132.0, 382.0, 100.0, 22.0 ],
					"text" : "qmetro 17"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 0.788235, 0.470588, 1.0 ],
					"fontname" : "Arial Bold",
					"hint" : "",
					"id" : "obj-46",
					"ignoreclick" : 1,
					"legacytextcolor" : 1,
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1101.0, 313.0, 20.0, 20.0 ],
					"rounded" : 60.0,
					"text" : "1",
					"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-32",
					"maxclass" : "number~",
					"mode" : 2,
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "float" ],
					"patching_rect" : [ 888.0, 237.0, 97.0, 22.0 ],
					"sig" : 0.0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 814.0, 157.0, 82.0, 22.0 ],
					"text" : "spt.rpde 5000"
				}

			}
, 			{
				"box" : 				{
					"bubblesize" : 16,
					"fontsize" : 12.0,
					"id" : "obj-28",
					"maxclass" : "preset",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [ "preset", "int", "preset", "int", "" ],
					"patching_rect" : [ 258.0, 52.0, 245.0, 65.0 ],
					"preset_data" : [ 						{
							"number" : 1,
							"data" : [ 5, "obj-25", "attrui", "attr", "e", 5, "obj-25", "attrui", "float", 9.0, 5, "obj-24", "attrui", "attr", "d", 5, "obj-24", "attrui", "float", 2.0, 5, "obj-23", "attrui", "attr", "c", 5, "obj-23", "attrui", "float", 1.0, 5, "obj-22", "attrui", "attr", "b", 5, "obj-22", "attrui", "float", 2.6, 5, "obj-10", "attrui", "attr", "a", 5, "obj-10", "attrui", "float", 9.0 ]
						}
, 						{
							"number" : 2,
							"data" : [ 5, "obj-25", "attrui", "attr", "e", 5, "obj-25", "attrui", "float", 2.0, 5, "obj-24", "attrui", "attr", "d", 5, "obj-24", "attrui", "float", 2.0, 5, "obj-23", "attrui", "attr", "c", 5, "obj-23", "attrui", "float", 2.7, 5, "obj-22", "attrui", "attr", "b", 5, "obj-22", "attrui", "float", 2.6, 5, "obj-10", "attrui", "attr", "a", 5, "obj-10", "attrui", "float", 6.7 ]
						}
, 						{
							"number" : 3,
							"data" : [ 5, "obj-25", "attrui", "attr", "e", 5, "obj-25", "attrui", "float", 9.0, 5, "obj-24", "attrui", "attr", "d", 5, "obj-24", "attrui", "float", 2.0, 5, "obj-23", "attrui", "attr", "c", 5, "obj-23", "attrui", "float", 1.7, 5, "obj-22", "attrui", "attr", "b", 5, "obj-22", "attrui", "float", 2.7, 5, "obj-10", "attrui", "attr", "a", 5, "obj-10", "attrui", "float", 3.0 ]
						}
, 						{
							"number" : 4,
							"data" : [ 5, "obj-25", "attrui", "attr", "e", 5, "obj-25", "attrui", "float", 9.060000000000002, 5, "obj-24", "attrui", "attr", "d", 5, "obj-24", "attrui", "float", 10.0, 5, "obj-23", "attrui", "attr", "c", 5, "obj-23", "attrui", "float", 2.61, 5, "obj-22", "attrui", "attr", "b", 5, "obj-22", "attrui", "float", 2.56, 5, "obj-10", "attrui", "attr", "a", 5, "obj-10", "attrui", "float", 8.0 ]
						}
, 						{
							"number" : 5,
							"data" : [ 5, "obj-25", "attrui", "attr", "e", 5, "obj-25", "attrui", "float", 9.280000000000001, 5, "obj-24", "attrui", "attr", "d", 5, "obj-24", "attrui", "float", 10.0, 5, "obj-23", "attrui", "attr", "c", 5, "obj-23", "attrui", "float", 2.61, 5, "obj-22", "attrui", "attr", "b", 5, "obj-22", "attrui", "float", 2.56, 5, "obj-10", "attrui", "attr", "a", 5, "obj-10", "attrui", "float", 8.0 ]
						}
, 						{
							"number" : 6,
							"data" : [ 5, "obj-25", "attrui", "attr", "e", 5, "obj-25", "attrui", "float", 5.600238815486852, 5, "obj-24", "attrui", "attr", "d", 5, "obj-24", "attrui", "float", 1.903242631556647, 5, "obj-23", "attrui", "attr", "c", 5, "obj-23", "attrui", "float", 1.742617292749003, 5, "obj-22", "attrui", "attr", "b", 5, "obj-22", "attrui", "float", 2.969157457528329, 5, "obj-10", "attrui", "attr", "a", 5, "obj-10", "attrui", "float", 4.849496719278178 ]
						}
, 						{
							"number" : 7,
							"data" : [ 5, "obj-25", "attrui", "attr", "e", 5, "obj-25", "attrui", "float", 6.740242853763509, 5, "obj-24", "attrui", "attr", "d", 5, "obj-24", "attrui", "float", 3.325881738968772, 5, "obj-23", "attrui", "attr", "c", 5, "obj-23", "attrui", "float", 2.160027032084339, 5, "obj-22", "attrui", "attr", "b", 5, "obj-22", "attrui", "float", 0.728723774199679, 5, "obj-10", "attrui", "attr", "a", 5, "obj-10", "attrui", "float", 4.047938493489728 ]
						}
, 						{
							"number" : 8,
							"data" : [ 5, "obj-25", "attrui", "attr", "e", 5, "obj-25", "attrui", "float", 8.073613953261903, 5, "obj-24", "attrui", "attr", "d", 5, "obj-24", "attrui", "float", 4.859082444867062, 5, "obj-23", "attrui", "attr", "c", 5, "obj-23", "attrui", "float", 3.956372022440731, 5, "obj-22", "attrui", "attr", "b", 5, "obj-22", "attrui", "float", 0.364594124667071, 5, "obj-10", "attrui", "attr", "a", 5, "obj-10", "attrui", "float", 4.470000000000001 ]
						}
, 						{
							"number" : 13,
							"data" : [ 5, "obj-25", "attrui", "attr", "e", 5, "obj-25", "attrui", "float", 6.852421559032639, 5, "obj-24", "attrui", "attr", "d", 5, "obj-24", "attrui", "float", 9.781049512580424, 5, "obj-23", "attrui", "attr", "c", 5, "obj-23", "attrui", "float", 3.319915318461424, 5, "obj-22", "attrui", "attr", "b", 5, "obj-22", "attrui", "float", 8.640018005135024, 5, "obj-10", "attrui", "attr", "a", 5, "obj-10", "attrui", "float", 2.534000000000001 ]
						}
, 						{
							"number" : 21,
							"data" : [ 5, "obj-25", "attrui", "attr", "e", 5, "obj-25", "attrui", "float", 6.463065129015561, 5, "obj-24", "attrui", "attr", "d", 5, "obj-24", "attrui", "float", 4.202891173373016, 5, "obj-23", "attrui", "attr", "c", 5, "obj-23", "attrui", "float", 5.401108864043684, 5, "obj-22", "attrui", "attr", "b", 5, "obj-22", "attrui", "float", 1.26848832086527, 5, "obj-10", "attrui", "attr", "a", 5, "obj-10", "attrui", "float", 8.179684053263054 ]
						}
, 						{
							"number" : 22,
							"data" : [ 5, "obj-25", "attrui", "attr", "e", 5, "obj-25", "attrui", "float", 1.6165014320247, 5, "obj-24", "attrui", "attr", "d", 5, "obj-24", "attrui", "float", 9.717337779279221, 5, "obj-23", "attrui", "attr", "c", 5, "obj-23", "attrui", "float", 2.004862121517136, 5, "obj-22", "attrui", "attr", "b", 5, "obj-22", "attrui", "float", 1.549664804849765, 5, "obj-10", "attrui", "attr", "a", 5, "obj-10", "attrui", "float", 1.19937482904082 ]
						}
, 						{
							"number" : 23,
							"data" : [ 5, "obj-25", "attrui", "attr", "e", 5, "obj-25", "attrui", "float", 2.803957844180641, 5, "obj-24", "attrui", "attr", "d", 5, "obj-24", "attrui", "float", 3.20165042906605, 5, "obj-23", "attrui", "attr", "c", 5, "obj-23", "attrui", "float", 3.497162843563209, 5, "obj-22", "attrui", "attr", "b", 5, "obj-22", "attrui", "float", 4.830898263946155, 5, "obj-10", "attrui", "attr", "a", 5, "obj-10", "attrui", "float", 3.963944442062218 ]
						}
, 						{
							"number" : 24,
							"data" : [ 5, "obj-25", "attrui", "attr", "e", 5, "obj-25", "attrui", "float", 5.643688456256492, 5, "obj-24", "attrui", "attr", "d", 5, "obj-24", "attrui", "float", 8.521494816226094, 5, "obj-23", "attrui", "attr", "c", 5, "obj-23", "attrui", "float", 8.18508349485999, 5, "obj-22", "attrui", "attr", "b", 5, "obj-22", "attrui", "float", 3.346726628589439, 5, "obj-10", "attrui", "attr", "a", 5, "obj-10", "attrui", "float", 5.053106939603298 ]
						}
, 						{
							"number" : 25,
							"data" : [ 5, "obj-25", "attrui", "attr", "e", 5, "obj-25", "attrui", "float", 9.280000000000001, 5, "obj-24", "attrui", "attr", "d", 5, "obj-24", "attrui", "float", 10.0, 5, "obj-23", "attrui", "attr", "c", 5, "obj-23", "attrui", "float", 2.61, 5, "obj-22", "attrui", "attr", "b", 5, "obj-22", "attrui", "float", 2.56, 5, "obj-10", "attrui", "attr", "a", 5, "obj-10", "attrui", "float", 8.0 ]
						}
, 						{
							"number" : 26,
							"data" : [ 5, "obj-25", "attrui", "attr", "e", 5, "obj-25", "attrui", "float", 6.560000000000001, 5, "obj-24", "attrui", "attr", "d", 5, "obj-24", "attrui", "float", 4.030000000000001, 5, "obj-23", "attrui", "attr", "c", 5, "obj-23", "attrui", "float", 2.07, 5, "obj-22", "attrui", "attr", "b", 5, "obj-22", "attrui", "float", 8.6, 5, "obj-10", "attrui", "attr", "a", 5, "obj-10", "attrui", "float", 22.0 ]
						}
, 						{
							"number" : 27,
							"data" : [ 5, "obj-25", "attrui", "attr", "e", 5, "obj-25", "attrui", "float", 6.060000000000001, 5, "obj-24", "attrui", "attr", "d", 5, "obj-24", "attrui", "float", 3.0, 5, "obj-23", "attrui", "attr", "c", 5, "obj-23", "attrui", "float", 2.07, 5, "obj-22", "attrui", "attr", "b", 5, "obj-22", "attrui", "float", 9.380000000000003, 5, "obj-10", "attrui", "attr", "a", 5, "obj-10", "attrui", "float", 3.0 ]
						}
, 						{
							"number" : 28,
							"data" : [ 5, "obj-25", "attrui", "attr", "e", 5, "obj-25", "attrui", "float", 9.681199410962437, 5, "obj-24", "attrui", "attr", "d", 5, "obj-24", "attrui", "float", 1.675325901190921, 5, "obj-23", "attrui", "attr", "c", 5, "obj-23", "attrui", "float", 1.314764500664984, 5, "obj-22", "attrui", "attr", "b", 5, "obj-22", "attrui", "float", 0.868324790313446, 5, "obj-10", "attrui", "attr", "a", 5, "obj-10", "attrui", "float", 1.94880690421472 ]
						}
, 						{
							"number" : 29,
							"data" : [ 5, "obj-25", "attrui", "attr", "e", 5, "obj-25", "attrui", "float", 6.113296212134144, 5, "obj-24", "attrui", "attr", "d", 5, "obj-24", "attrui", "float", 6.795500374707895, 5, "obj-23", "attrui", "attr", "c", 5, "obj-23", "attrui", "float", 1.591791233181588, 5, "obj-22", "attrui", "attr", "b", 5, "obj-22", "attrui", "float", 9.858168432355621, 5, "obj-10", "attrui", "attr", "a", 5, "obj-10", "attrui", "float", 9.382758617317958 ]
						}
, 						{
							"number" : 30,
							"data" : [ 5, "obj-25", "attrui", "attr", "e", 5, "obj-25", "attrui", "float", 2.038358229675737, 5, "obj-24", "attrui", "attr", "d", 5, "obj-24", "attrui", "float", 3.836669326416672, 5, "obj-23", "attrui", "attr", "c", 5, "obj-23", "attrui", "float", 1.740097649255329, 5, "obj-22", "attrui", "attr", "b", 5, "obj-22", "attrui", "float", 0.830286695162427, 5, "obj-10", "attrui", "attr", "a", 5, "obj-10", "attrui", "float", 0.307140017469458 ]
						}
, 						{
							"number" : 31,
							"data" : [ 5, "obj-25", "attrui", "attr", "e", 5, "obj-25", "attrui", "float", 4.263196279736429, 5, "obj-24", "attrui", "attr", "d", 5, "obj-24", "attrui", "float", 2.945546062063313, 5, "obj-23", "attrui", "attr", "c", 5, "obj-23", "attrui", "float", 1.816387131621612, 5, "obj-22", "attrui", "attr", "b", 5, "obj-22", "attrui", "float", 7.354219004186844, 5, "obj-10", "attrui", "attr", "a", 5, "obj-10", "attrui", "float", 9.248691662081054 ]
						}
, 						{
							"number" : 32,
							"data" : [ 5, "obj-25", "attrui", "attr", "e", 5, "obj-25", "attrui", "float", 6.852421559032639, 5, "obj-24", "attrui", "attr", "d", 5, "obj-24", "attrui", "float", 9.781049512580424, 5, "obj-23", "attrui", "attr", "c", 5, "obj-23", "attrui", "float", 3.319915318461424, 5, "obj-22", "attrui", "attr", "b", 5, "obj-22", "attrui", "float", 8.640018005135024, 5, "obj-10", "attrui", "attr", "a", 5, "obj-10", "attrui", "float", 4.54328563786683 ]
						}
, 						{
							"number" : 33,
							"data" : [ 5, "obj-25", "attrui", "attr", "e", 5, "obj-25", "attrui", "float", 8.073613953261903, 5, "obj-24", "attrui", "attr", "d", 5, "obj-24", "attrui", "float", 4.859082444867062, 5, "obj-23", "attrui", "attr", "c", 5, "obj-23", "attrui", "float", 3.956372022440731, 5, "obj-22", "attrui", "attr", "b", 5, "obj-22", "attrui", "float", 0.364594124667071, 5, "obj-10", "attrui", "attr", "a", 5, "obj-10", "attrui", "float", 5.640437591375568 ]
						}
, 						{
							"number" : 34,
							"data" : [ 5, "obj-25", "attrui", "attr", "e", 5, "obj-25", "attrui", "float", 6.122817994209518, 5, "obj-24", "attrui", "attr", "d", 5, "obj-24", "attrui", "float", 5.495584430281368, 5, "obj-23", "attrui", "attr", "c", 5, "obj-23", "attrui", "float", 2.192735363243487, 5, "obj-22", "attrui", "attr", "b", 5, "obj-22", "attrui", "float", 2.20241096985751, 5, "obj-10", "attrui", "attr", "a", 5, "obj-10", "attrui", "float", 2.539724692133338 ]
						}
, 						{
							"number" : 35,
							"data" : [ 5, "obj-25", "attrui", "attr", "e", 5, "obj-25", "attrui", "float", 8.778811026403014, 5, "obj-24", "attrui", "attr", "d", 5, "obj-24", "attrui", "float", 2.583946420114713, 5, "obj-23", "attrui", "attr", "c", 5, "obj-23", "attrui", "float", 3.5721052954078, 5, "obj-22", "attrui", "attr", "b", 5, "obj-22", "attrui", "float", 2.311946382625707, 5, "obj-10", "attrui", "attr", "a", 5, "obj-10", "attrui", "float", 6.043719767996591 ]
						}
, 						{
							"number" : 36,
							"data" : [ 5, "obj-25", "attrui", "attr", "e", 5, "obj-25", "attrui", "float", 6.633113187938585, 5, "obj-24", "attrui", "attr", "d", 5, "obj-24", "attrui", "float", 1.427212682512218, 5, "obj-23", "attrui", "attr", "c", 5, "obj-23", "attrui", "float", 1.940406265031261, 5, "obj-22", "attrui", "attr", "b", 5, "obj-22", "attrui", "float", 7.543622625347282, 5, "obj-10", "attrui", "attr", "a", 5, "obj-10", "attrui", "float", 7.484886250690493 ]
						}
 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "e",
					"id" : "obj-25",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 102.0, 109.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "d",
					"id" : "obj-24",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 102.0, 85.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "c",
					"id" : "obj-23",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 102.0, 61.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "b",
					"id" : "obj-22",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 102.0, 37.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-21",
					"maxclass" : "number~",
					"mode" : 2,
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "float" ],
					"patching_rect" : [ 929.0, 393.0, 56.0, 22.0 ],
					"sig" : 0.0
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-20",
					"maxclass" : "number~",
					"mode" : 2,
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "float" ],
					"patching_rect" : [ 840.0, 393.0, 56.0, 22.0 ],
					"sig" : 0.0
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-19",
					"maxclass" : "number~",
					"mode" : 2,
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "float" ],
					"patching_rect" : [ 757.0, 393.0, 56.0, 22.0 ],
					"sig" : 0.0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 6,
							"revision" : 5,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "dsp.gen",
						"rect" : [ 34.0, 99.0, 1068.0, 823.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 634.615405797958374, 713.461562275886536, 35.0, 22.0 ],
									"text" : "out 3"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 407.692321300506592, 717.307716250419617, 35.0, 22.0 ],
									"text" : "out 2"
								}

							}
, 							{
								"box" : 								{
									"code" : "// RPDE-based periodicity score for online detection of limit cycles\n// Inlets:\n//   in1: signal s(t)            (audio or control rate stream)\n//   in2: RPDE(t) in [0,1]       (from your external)\n// Outlets:\n//   out1: S_periodic\n//   out2: E (EMA variance of s)\n//   out3: (1 - RPDE_smoothed)\n\nParam Emin      (0.01);     // energy threshold (tune to ~5–10% of normal energy)\nParam beta      (0.10);     // softness of energy gate (larger = smoother)\nParam tau_ms    (200.0);    // EMA time constant for mean/variance (ms)\nParam rpde_ms   (80.0);     // smoothing time for RPDE (ms)\nParam clip_z    (10.0);     // sigmoid safety: clamp |z| ≤ clip_z\n\nHistory m(0);               // EMA mean of s\nHistory v(0);               // EMA variance of s\nHistory rpde_lp(0);         // smoothed RPDE\n\n// helper: 1-pole coefficient from time-constant\n// alpha = 1 - exp(-Ts / tau)\nsampr = samplerate;\n Ts    = 1 / max(1, sampr);\n tau_s = max(1e-3, tau_ms * 0.001);\n a     = 1 - exp(-Ts / tau_s);\n\n rpde_tau_s = max(1e-3, rpde_ms * 0.001);\n a_r        = 1 - exp(-Ts / rpde_tau_s);\n\n// inputs\n s     = in1;\n rpde  = clamp(in2, 0, 1);\n\n// ----- EMA mean & variance (stable EMA variant) -----\n// Update mean\n m_prev = m;\nm = m + a * (s - m);\n// Update variance using (x - m_prev)*(x - m) form for EMA\nv = (1 - a) * v + a * (s - m_prev) * (s - m);\n\n// Energy = variance (non-negative and bounded)\n E = max(0, v);\n\n// ----- Smooth RPDE -----\nrpde_lp = rpde_lp + a_r * (rpde - rpde_lp);\n rpde_inv = 1 - rpde_lp;          // higher when periodic\n\n// ----- Energy gate via sigmoid -----\n zraw = (E - Emin) / max(1e-9, beta);\n// protect exp overflow\n z = clamp(zraw, -clip_z, clip_z);\n gate = 1 / (1 + exp(-z));        // σ((E - Emin)/β) in [0,1]\n\n// ----- Final score -----\n S = rpde_inv * gate;\n\n// outputs\nout1 = S;\nout2 = E;\nout3 = rpde_inv;",
									"fontface" : 0,
									"fontname" : "<Monospaced>",
									"fontsize" : 12.0,
									"id" : "obj-5",
									"maxclass" : "codebox",
									"numinlets" : 2,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 45.192307531833649, 45.192309200763702, 747.115409553050995, 646.153867721557617 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 14.0, 28.0, 22.0 ],
									"text" : "in 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 305.0, 14.0, 28.0, 22.0 ],
									"text" : "in 2"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 37.50000125169754, 717.307716250419617, 35.0, 22.0 ],
									"text" : "out 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 1 ],
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"source" : [ "obj-5", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-5", 2 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 761.0, 350.0, 124.0, 22.0 ],
					"text" : "gen~ periodicityScore"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-15",
					"maxclass" : "number~",
					"mode" : 2,
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "float" ],
					"patching_rect" : [ 752.0, 245.0, 114.0, 22.0 ],
					"sig" : 0.0
				}

			}
, 			{
				"box" : 				{
					"activelinecolor" : [ 0.901960784313726, 0.901960784313726, 0.901960784313726, 1.0 ],
					"id" : "obj-9",
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 581.0, 86.0, 184.0, 68.0 ],
					"range" : [ -1.1, 1.1 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 581.0, 43.0, 124.0, 22.0 ],
					"text" : "gen~ combineSignals"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 0.0 ],
					"activelinecolor" : [ 0.129411764705882, 0.129411764705882, 0.129411764705882, 1.0 ],
					"grid_line_width" : 6.3,
					"id" : "obj-80",
					"line_width" : 3.9,
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 176.0, 898.0, 184.0, 68.0 ],
					"range" : [ -0.200000002980232, 1.200000047683716 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-75",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 0,
					"patching_rect" : [ 533.0, 940.0, 125.0, 22.0 ],
					"text" : "noteout"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-76",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 3,
					"outlettype" : [ "float", "float", "float" ],
					"patching_rect" : [ 533.0, 913.0, 125.0, 22.0 ],
					"text" : "makenote 100 200 63"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-77",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 533.0, 886.0, 29.5, 22.0 ],
					"text" : "62"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-78",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"patching_rect" : [ 533.0, 862.0, 42.0, 22.0 ],
					"text" : "edge~"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 0.0 ],
					"activelinecolor" : [ 0.129411764705882, 0.129411764705882, 0.129411764705882, 1.0 ],
					"grid_line_width" : 6.3,
					"id" : "obj-74",
					"line_width" : 3.9,
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 679.0, 909.0, 184.0, 68.0 ],
					"range" : [ -0.200000002980232, 1.200000047683716 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-73",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 0,
					"patching_rect" : [ 378.0, 940.0, 125.0, 22.0 ],
					"text" : "noteout"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-72",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 3,
					"outlettype" : [ "float", "float", "float" ],
					"patching_rect" : [ 378.0, 914.0, 125.0, 22.0 ],
					"text" : "makenote 100 200 60"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-71",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 378.0, 886.0, 29.5, 22.0 ],
					"text" : "60"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-70",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"patching_rect" : [ 378.0, 859.0, 42.0, 22.0 ],
					"text" : "edge~"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 0.0 ],
					"activelinecolor" : [ 0.4, 0.552941176470588, 0.980392156862745, 1.0 ],
					"id" : "obj-5",
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 568.0, 606.0, 184.0, 68.0 ],
					"range" : [ -0.200000002980232, 1.200000047683716 ]
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 0.0 ],
					"activelinecolor" : [ 0.945098039215686, 0.0, 0.0, 1.0 ],
					"id" : "obj-8",
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 568.0, 453.0, 184.0, 68.0 ],
					"range" : [ -0.200000002980232, 1.200000047683716 ]
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 0.0 ],
					"activelinecolor" : [ 0.592156862745098, 0.196078431372549, 1.0, 1.0 ],
					"id" : "obj-64",
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 568.0, 526.0, 184.0, 68.0 ],
					"range" : [ -0.2, 1.2 ]
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-63",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "GateLogic.maxpat",
					"numinlets" : 2,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 548.0, 410.0, 102.0, 22.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-55",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 378.0, 789.0, 174.0, 22.0 ],
					"text" : "gen~ gateToTrigger"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "slider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 681.0, 183.0, 20.0, 140.0 ],
					"size" : 10000.0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 640.0, 357.0, 82.0, 22.0 ],
					"text" : "rampsmooth~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 6,
					"outlettype" : [ "signal", "signal", "signal", "signal", "signal", "signal" ],
					"patching_rect" : [ 102.0, 155.0, 111.0, 22.0 ],
					"text" : "spt.attractor.dadras"
				}

			}
, 			{
				"box" : 				{
					"attr" : "a",
					"id" : "obj-10",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 102.0, 13.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "speed_primary",
					"id" : "obj-50",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 258.0, 13.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "mode",
					"id" : "obj-11",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 581.0, 13.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "blend",
					"id" : "obj-14",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 734.0, 13.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "epsilon",
					"id" : "obj-16",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 814.0, 127.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "tau",
					"id" : "obj-17",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 814.0, 103.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "beta",
					"id" : "obj-27",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 761.0, 320.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "tmax",
					"id" : "obj-29",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 814.0, 79.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "theiler",
					"id" : "obj-30",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 814.0, 55.0, 150.0, 22.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-39", 0 ],
					"source" : [ "obj-104", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-39", 1 ],
					"source" : [ "obj-105", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-39", 2 ],
					"source" : [ "obj-106", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-109", 0 ],
					"source" : [ "obj-108", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-104", 0 ],
					"order" : 2,
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-105", 0 ],
					"order" : 1,
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-106", 0 ],
					"order" : 0,
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"source" : [ "obj-128", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"source" : [ "obj-18", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"source" : [ "obj-18", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-104", 2 ],
					"order" : 0,
					"source" : [ "obj-2", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-104", 1 ],
					"order" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-105", 2 ],
					"source" : [ "obj-2", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-105", 1 ],
					"order" : 0,
					"source" : [ "obj-2", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-106", 2 ],
					"source" : [ "obj-2", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-106", 1 ],
					"order" : 0,
					"source" : [ "obj-2", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"order" : 2,
					"source" : [ "obj-2", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"order" : 2,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 1 ],
					"order" : 1,
					"source" : [ "obj-2", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"order" : 1,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"order" : 2,
					"source" : [ "obj-2", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 2 ],
					"order" : 1,
					"source" : [ "obj-2", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 1 ],
					"order" : 3,
					"source" : [ "obj-2", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 0 ],
					"order" : 3,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 1 ],
					"order" : 4,
					"source" : [ "obj-2", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"order" : 1,
					"source" : [ "obj-2", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"order" : 4,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"order" : 4,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"order" : 3,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"order" : 2,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"order" : 1,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"order" : 0,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-63", 1 ],
					"order" : 1,
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"order" : 0,
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 2 ],
					"order" : 0,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 1 ],
					"order" : 1,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-72", 1 ],
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-128", 0 ],
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"source" : [ "obj-39", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-112", 0 ],
					"source" : [ "obj-40", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-112", 1 ],
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 1 ],
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"midpoints" : [ 1078.5, 358.0, 1025.5, 358.0 ],
					"order" : 1,
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"midpoints" : [ 1078.5, 357.5, 1141.5, 357.5 ],
					"order" : 0,
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-39", 0 ],
					"midpoints" : [ 1141.5, 405.0, 1089.0, 405.0, 1089.0, 444.0, 782.5, 444.0 ],
					"order" : 1,
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 0 ],
					"midpoints" : [ 1141.5, 413.5, 1113.5, 413.5 ],
					"order" : 0,
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"source" : [ "obj-49", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-50", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-48", 0 ],
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"source" : [ "obj-53", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"source" : [ "obj-53", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"source" : [ "obj-53", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"source" : [ "obj-53", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-70", 0 ],
					"order" : 0,
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-74", 0 ],
					"order" : 0,
					"source" : [ "obj-55", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-78", 0 ],
					"order" : 1,
					"source" : [ "obj-55", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-80", 0 ],
					"order" : 1,
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"order" : 1,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 1 ],
					"order" : 0,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"source" : [ "obj-6", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"midpoints" : [ 1149.5, 450.59900990099004, 1113.5, 450.59900990099004 ],
					"source" : [ "obj-62", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"midpoints" : [ 1113.5, 455.59900990099004, 1113.5, 455.59900990099004 ],
					"source" : [ "obj-62", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 0 ],
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 2 ],
					"order" : 0,
					"source" : [ "obj-66", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 1 ],
					"order" : 1,
					"source" : [ "obj-66", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-71", 0 ],
					"source" : [ "obj-70", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-72", 0 ],
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-73", 2 ],
					"source" : [ "obj-72", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-73", 1 ],
					"source" : [ "obj-72", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-73", 0 ],
					"source" : [ "obj-72", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 2 ],
					"source" : [ "obj-76", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 1 ],
					"source" : [ "obj-76", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 0 ],
					"source" : [ "obj-76", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-77", 0 ],
					"source" : [ "obj-78", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "GateLogic.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/spt/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "SlinkFFTS.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/spt/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "combineSignals.gendsp",
				"bootpath" : "~/Documents/Max 8/Packages/spt/patchers",
				"patcherrelativepath" : ".",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "combineSignalsAsGates.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/spt/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "fold.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/spt/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "gateToTrigger.gendsp",
				"bootpath" : "~/Documents/Max 8/Packages/spt/patchers",
				"patcherrelativepath" : ".",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "icons2.png",
				"bootpath" : "~/",
				"patcherrelativepath" : "../../../../..",
				"type" : "PNG",
				"implicit" : 1
			}
, 			{
				"name" : "morphCombineGates.gendsp",
				"bootpath" : "~/Documents/Max 8/Packages/spt/patchers",
				"patcherrelativepath" : ".",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "signChangeGates.gendsp",
				"bootpath" : "~/Documents/Max 8/Packages/spt/patchers",
				"patcherrelativepath" : ".",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "slinkFFTStereo.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/spt/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "spt.attractor.dadras.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "spt.rpde.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0
	}

}
