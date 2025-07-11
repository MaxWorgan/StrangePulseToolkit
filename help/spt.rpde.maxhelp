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
		"rect" : [ 46.0, 99.0, 1085.0, 823.0 ],
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
		"showrootpatcherontab" : 0,
		"showontab" : 0,
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
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
						"classnamespace" : "box",
						"rect" : [ 46.0, 125.0, 1085.0, 797.0 ],
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
						"showontab" : 1,
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"attr" : "tau",
									"id" : "obj-11",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 230.0, 440.0, 150.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "live.scope~",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 230.0, 520.0, 184.0, 68.0 ],
									"range" : [ 0.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 230.0, 490.0, 82.0, 22.0 ],
									"text" : "spt.rpde 5000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-62",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "erase" ],
									"patching_rect" : [ 822.0, 162.0, 55.0, 22.0 ],
									"text" : "t b erase"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-60",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 822.0, 194.0, 131.0, 22.0 ],
									"text" : "jit.gl.render rpdescreen"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-24",
									"maxclass" : "jit.pwindow",
									"name" : "rpdescreen",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "jit_matrix", "" ],
									"patching_rect" : [ 491.0, 264.0, 284.0, 219.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 30.0, 30.0, 265.0, 204.0 ],
									"sync" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-87",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 787.0, 423.0, 133.0, 22.0 ],
									"text" : "jit.gl.handle rpdescreen"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-64",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "jit_matrix", "" ],
									"patching_rect" : [ 787.0, 521.0, 204.0, 22.0 ],
									"text" : "jit.gl.videoplane @transform_reset 2"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-128",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "jit_gl_texture", "", "" ],
									"patching_rect" : [ 787.0, 469.0, 226.0, 22.0 ],
									"text" : "jit.gl.node @name rpde-path @capture 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-56",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 491.0, 236.0, 585.0, 22.0 ],
									"text" : "jit.gl.path rpde-path @interpmode spline @segments 15 @pathstyle line @line_width 2 @color 1. 0.82 0.4 1."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-78",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 2,
									"outlettype" : [ "jit_matrix", "" ],
									"patching_rect" : [ 491.0, 195.0, 320.0, 22.0 ],
									"text" : "jit.catch~ 3 @framesize 256 @mode 2 @downsample 512"
								}

							}
, 							{
								"box" : 								{
									"activelinecolor" : [ 0.023529411764706, 0.83921568627451, 0.627450980392157, 1.0 ],
									"id" : "obj-21",
									"maxclass" : "live.scope~",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 412.0, 636.0, 184.0, 68.0 ]
								}

							}
, 							{
								"box" : 								{
									"activelinecolor" : [ 0.937254901960784, 0.27843137254902, 0.435294117647059, 1.0 ],
									"id" : "obj-20",
									"maxclass" : "live.scope~",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 221.0, 636.0, 184.0, 68.0 ]
								}

							}
, 							{
								"box" : 								{
									"activelinecolor" : [ 1.0, 0.819607843137255, 0.4, 1.0 ],
									"id" : "obj-6",
									"maxclass" : "live.scope~",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 30.0, 636.0, 184.0, 68.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-13",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 704.0, 554.5, 173.0, 33.0 ],
									"text" : "Select some presets to see different behaviours"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 1.0, 0.788235, 0.470588, 1.0 ],
									"fontname" : "Arial Bold",
									"hint" : "",
									"id" : "obj-14",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 673.0, 560.5, 20.0, 20.0 ],
									"rounded" : 60.0,
									"text" : "3",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 823.25, 305.0, 173.0, 33.0 ],
									"text" : "Drag the AttractorView display to see the 3D space"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 589.0, 48.0, 150.0, 47.0 ],
									"text" : "Enable audio and send render bang to our AttractorView"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 1.0, 0.788235, 0.470588, 1.0 ],
									"fontname" : "Arial Bold",
									"hint" : "",
									"id" : "obj-1",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 792.25, 311.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"text" : "2",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 0,
									"patching_rect" : [ 458.0, 124.0, 100.0, 22.0 ],
									"text" : "dac~"
								}

							}
, 							{
								"box" : 								{
									"bubblesize" : 22,
									"id" : "obj-48",
									"maxclass" : "preset",
									"numinlets" : 1,
									"numoutlets" : 5,
									"outlettype" : [ "preset", "int", "preset", "int", "" ],
									"patching_rect" : [ 529.0, 555.5, 58.0, 32.0 ],
									"preset_data" : [ 										{
											"number" : 1,
											"data" : [ 5, "obj-12", "attrui", "attr", "speed_secondary", 5, "obj-12", "attrui", "float", 100.0, 5, "obj-10", "attrui", "attr", "epsilon", 5, "obj-10", "attrui", "float", 0.001000000047497, 5, "obj-18", "attrui", "attr", "e", 5, "obj-18", "attrui", "float", 9.0, 5, "obj-17", "attrui", "attr", "d", 5, "obj-17", "attrui", "float", 2.0, 5, "obj-16", "attrui", "attr", "c", 5, "obj-16", "attrui", "float", 1.7, 5, "obj-15", "attrui", "attr", "b", 5, "obj-15", "attrui", "float", 2.7, 5, "obj-8", "attrui", "attr", "a", 5, "obj-8", "attrui", "float", 4.5, 5, "obj-40", "toggle", "int", 1, 5, "obj-11", "attrui", "attr", "tau", 5, "obj-11", "attrui", "int", 5 ]
										}
, 										{
											"number" : 2,
											"data" : [ 5, "obj-12", "attrui", "attr", "speed_secondary", 5, "obj-12", "attrui", "float", 100.0, 5, "obj-10", "attrui", "attr", "epsilon", 5, "obj-10", "attrui", "float", 0.001000000047497, 5, "obj-18", "attrui", "attr", "e", 5, "obj-18", "attrui", "float", 9.0, 5, "obj-17", "attrui", "attr", "d", 5, "obj-17", "attrui", "float", 2.0, 5, "obj-16", "attrui", "attr", "c", 5, "obj-16", "attrui", "float", 1.7, 5, "obj-15", "attrui", "attr", "b", 5, "obj-15", "attrui", "float", 2.7, 5, "obj-8", "attrui", "attr", "a", 5, "obj-8", "attrui", "float", 6.2, 5, "obj-40", "toggle", "int", 1, 5, "obj-11", "attrui", "attr", "tau", 5, "obj-11", "attrui", "int", 5 ]
										}
, 										{
											"number" : 3,
											"data" : [ 5, "<invalid>", "attrui", "attr", "dt", 5, "<invalid>", "attrui", "float", 0.001, 5, "obj-18", "attrui", "attr", "e", 5, "obj-18", "attrui", "float", 1.91, 5, "obj-17", "attrui", "attr", "d", 5, "obj-17", "attrui", "float", 2.11, 5, "obj-16", "attrui", "attr", "c", 5, "obj-16", "attrui", "float", 2.973000000000001, 5, "obj-15", "attrui", "attr", "b", 5, "obj-15", "attrui", "float", 1.11, 5, "obj-8", "attrui", "attr", "a", 5, "obj-8", "attrui", "float", 5.9, 5, "<invalid>", "attrui", "attr", "speed_slow", 5, "<invalid>", "attrui", "float", 10.0, 5, "obj-40", "toggle", "int", 1, 5, "<invalid>", "attrui", "attr", "speed_fast", 5, "<invalid>", "attrui", "float", 100.0 ]
										}
, 										{
											"number" : 4,
											"data" : [ 5, "<invalid>", "attrui", "attr", "dt", 5, "<invalid>", "attrui", "float", 0.001, 5, "obj-18", "attrui", "attr", "e", 5, "obj-18", "attrui", "float", 4.470000000000001, 5, "obj-17", "attrui", "attr", "d", 5, "obj-17", "attrui", "float", 4.670000000000001, 5, "obj-16", "attrui", "attr", "c", 5, "obj-16", "attrui", "float", 2.740000000000001, 5, "obj-15", "attrui", "attr", "b", 5, "obj-15", "attrui", "float", 0.76, 5, "obj-8", "attrui", "attr", "a", 5, "obj-8", "attrui", "float", 1.3, 5, "<invalid>", "attrui", "attr", "speed_slow", 5, "<invalid>", "attrui", "float", 3.610000000000001, 5, "obj-40", "toggle", "int", 1, 5, "<invalid>", "attrui", "attr", "speed_fast", 5, "<invalid>", "attrui", "float", 100.0 ]
										}
, 										{
											"number" : 5,
											"data" : [ 5, "<invalid>", "attrui", "attr", "dt", 5, "<invalid>", "attrui", "float", 0.001, 5, "obj-18", "attrui", "attr", "e", 5, "obj-18", "attrui", "float", 4.470000000000001, 5, "obj-17", "attrui", "attr", "d", 5, "obj-17", "attrui", "float", 4.670000000000001, 5, "obj-16", "attrui", "attr", "c", 5, "obj-16", "attrui", "float", 2.740000000000001, 5, "obj-15", "attrui", "attr", "b", 5, "obj-15", "attrui", "float", 0.58, 5, "obj-8", "attrui", "attr", "a", 5, "obj-8", "attrui", "float", 1.3, 5, "<invalid>", "attrui", "attr", "speed_slow", 5, "<invalid>", "attrui", "float", 3.610000000000001, 5, "obj-40", "toggle", "int", 1, 5, "<invalid>", "attrui", "attr", "speed_fast", 5, "<invalid>", "attrui", "float", 100.0 ]
										}
 ],
									"style" : "default"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-40",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 511.0, 53.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-38",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 574.0, 124.0, 100.0, 22.0 ],
									"text" : "qmetro 17"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ],
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 6,
									"outlettype" : [ "signal", "signal", "signal", "signal", "signal", "signal" ],
									"patching_rect" : [ 23.0, 379.0, 111.0, 22.0 ],
									"text" : "spt.attractor.dadras"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 1.0, 0.788235, 0.470588, 1.0 ],
									"fontname" : "Arial Bold",
									"hint" : "",
									"id" : "obj-41",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 543.0, 55.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"text" : "1",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-88",
									"linecount" : 9,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 30.0, 105.0, 423.0, 127.0 ],
									"text" : "An object that implements the Recurrence period density entropy (RPDE) method. It measures the repetitiveness of the phase space of the given system allowing us to meausure how 'chaotic' the attractor currently is.\n\nThe method is very sensitive to both the speed of the input signals, as well as epsilon and tau which are the neighbourhood size and embedding delay respectively. See https://en.wikipedia.org/wiki/Recurrence_period_density_entropy for further details",
									"textcolor" : [ 0.32548999786377, 0.345097988843918, 0.372548997402191, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontsize" : 12.0,
									"id" : "obj-76",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 30.0, 68.0, 349.0, 20.0 ],
									"text" : "written by Max Worgan (c) 2025, www.mxwn.io, MIT Licence"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontname" : "Arial",
									"fontsize" : 40.0,
									"id" : "obj-22",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 30.0, 15.0, 432.0, 51.0 ],
									"text" : "spt.rpde",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"attr" : "a",
									"id" : "obj-8",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 263.0, 274.0, 150.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"attr" : "b",
									"id" : "obj-15",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 263.0, 298.0, 150.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"attr" : "c",
									"id" : "obj-16",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 263.0, 322.0, 150.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"attr" : "d",
									"id" : "obj-17",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 263.0, 345.0, 150.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"attr" : "e",
									"id" : "obj-18",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 263.0, 369.0, 150.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"attr" : "epsilon",
									"id" : "obj-10",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 230.0, 416.0, 150.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"attr" : "speed_secondary",
									"id" : "obj-12",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 23.0, 349.0, 150.0, 22.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-128", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"midpoints" : [ 272.5, 322.0, 188.0, 322.0, 188.0, 349.0, 32.5, 349.0 ],
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"midpoints" : [ 272.5, 348.0, 32.5, 348.0 ],
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"midpoints" : [ 272.5, 370.0, 188.0, 370.0, 188.0, 349.0, 32.5, 349.0 ],
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"midpoints" : [ 272.5, 395.0, 188.0, 395.0, 188.0, 349.0, 32.5, 349.0 ],
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-62", 0 ],
									"midpoints" : [ 583.5, 153.5, 831.5, 153.5 ],
									"order" : 0,
									"source" : [ "obj-38", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-78", 0 ],
									"midpoints" : [ 583.5, 170.0, 500.5, 170.0 ],
									"order" : 1,
									"source" : [ "obj-38", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"midpoints" : [ 520.5, 100.0, 467.5, 100.0 ],
									"order" : 1,
									"source" : [ "obj-40", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 0 ],
									"midpoints" : [ 520.5, 99.5, 583.5, 99.5 ],
									"order" : 0,
									"source" : [ "obj-40", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-20", 0 ],
									"midpoints" : [ 106.099999999999994, 629.5, 230.5, 629.5 ],
									"source" : [ "obj-5", 4 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-21", 0 ],
									"midpoints" : [ 124.5, 627.5, 421.5, 627.5 ],
									"source" : [ "obj-5", 5 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"order" : 0,
									"source" : [ "obj-5", 3 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"midpoints" : [ 87.700000000000003, 630.5, 39.5, 630.5 ],
									"order" : 1,
									"source" : [ "obj-5", 3 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-78", 2 ],
									"midpoints" : [ 69.299999999999997, 602.0, 460.0, 602.0, 460.0, 169.0, 801.5, 169.0 ],
									"source" : [ "obj-5", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-78", 1 ],
									"midpoints" : [ 50.899999999999999, 611.0, 467.25, 611.0, 467.25, 176.0, 651.0, 176.0 ],
									"source" : [ "obj-5", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-78", 0 ],
									"midpoints" : [ 32.5, 621.0, 475.5, 621.0, 475.5, 184.0, 500.5, 184.0 ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-60", 0 ],
									"midpoints" : [ 867.5, 188.599009900990097, 831.5, 188.599009900990097 ],
									"source" : [ "obj-62", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-60", 0 ],
									"midpoints" : [ 831.5, 193.599009900990097, 831.5, 193.599009900990097 ],
									"source" : [ "obj-62", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-56", 0 ],
									"source" : [ "obj-78", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"midpoints" : [ 272.5, 298.0, 188.0, 298.0, 188.0, 349.0, 32.5, 349.0 ],
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-128", 0 ],
									"source" : [ "obj-87", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 165.0, 148.0, 48.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p Basic"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
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
						"classnamespace" : "box",
						"rect" : [ 0.0, 26.0, 1085.0, 797.0 ],
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
						"showontab" : 1,
						"assistshowspatchername" : 0,
						"boxes" : [  ],
						"lines" : [  ]
					}
,
					"patching_rect" : [ 454.0, 84.0, 100.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p ?"
				}

			}
 ],
		"lines" : [  ],
		"dependency_cache" : [ 			{
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
