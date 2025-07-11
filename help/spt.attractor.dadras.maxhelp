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
					"id" : "obj-4",
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
						"isolateaudio" : 1,
						"assistshowspatchername" : 0,
						"title" : "Audio",
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-10",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 646.0, 347.0, 50.0, 35.0 ],
									"text" : "storagewindow"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "signal", "signal" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 8,
											"minor" : 6,
											"revision" : 5,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"classnamespace" : "box",
										"rect" : [ 0.0, 0.0, 640.0, 480.0 ],
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
										"boxes" : [ 											{
												"box" : 												{
													"fontname" : "Lato",
													"fontsize" : 12.0,
													"id" : "obj-2",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "signal" ],
													"patching_rect" : [ 56.0, 132.0, 124.0, 23.0 ],
													"text" : "gen~ @gen freeverb"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Lato",
													"fontsize" : 12.0,
													"id" : "obj-44",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "signal" ],
													"patching_rect" : [ 50.0, 100.0, 124.0, 23.0 ],
													"text" : "gen~ @gen freeverb"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-14",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "signal" ],
													"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-20",
													"index" : 2,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "signal" ],
													"patching_rect" : [ 85.0, 40.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-24",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 50.0, 215.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-27",
													"index" : 2,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 85.0, 215.0, 30.0, 30.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-44", 0 ],
													"source" : [ "obj-14", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-27", 0 ],
													"source" : [ "obj-2", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-2", 0 ],
													"source" : [ "obj-20", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-24", 0 ],
													"source" : [ "obj-44", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 573.0, 483.0, 96.0, 22.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"tags" : ""
									}
,
									"text" : "p stereoVerb"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"lastchannelcount" : 0,
									"maxclass" : "live.gain~",
									"numinlets" : 2,
									"numoutlets" : 5,
									"outlettype" : [ "signal", "signal", "", "float", "list" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 697.0, 312.0, 48.0, 136.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.gain~",
											"parameter_mmax" : 6.0,
											"parameter_mmin" : -70.0,
											"parameter_modmode" : 3,
											"parameter_shortname" : "live.gain~",
											"parameter_type" : 0,
											"parameter_unitstyle" : 4
										}

									}
,
									"varname" : "live.gain~"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 728.0, 511.0, 100.0, 22.0 ],
									"text" : "loadmess 40"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-37",
									"maxclass" : "newobj",
									"numinlets" : 5,
									"numoutlets" : 2,
									"outlettype" : [ "signal", "signal" ],
									"patching_rect" : [ 414.0, 535.0, 333.0, 22.0 ],
									"text" : "M4L.bal2~"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"hidden" : 1,
									"id" : "obj-29",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 585.0, 275.5, 166.0, 23.0 ],
									"text" : "loadmess 1 2 3 4 5"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"hidden" : 1,
									"id" : "obj-30",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 443.0, 300.5, 162.0, 23.0 ],
									"text" : "vexpr ($f1*0.9999)+$f2"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"hidden" : 1,
									"id" : "obj-31",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 443.0, 325.5, 122.0, 23.0 ],
									"text" : "prepend recallmulti"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-23",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "", "", "", "" ],
									"patching_rect" : [ 501.0, 40.0, 100.0, 22.0 ],
									"restore" : 									{
										"a" : [ "a", 5.183864418083633 ],
										"b" : [ "b", 7.848945079322635 ],
										"c" : [ "c", 1.480632130120752 ],
										"d" : [ "d", 0.367315566695038 ],
										"dt" : [ "dt", 0.01 ],
										"e" : [ "e", 5.034031276593112 ],
										"live.gain~" : [ -35.92385745596232 ],
										"speed" : [ "speed_primary", 554.347695073593854 ]
									}
,
									"text" : "autopattr",
									"varname" : "u156007186"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 443.0, 350.5, 158.0, 22.0 ],
									"saved_object_attributes" : 									{
										"client_rect" : [ 848, 347, 1365, 590 ],
										"parameter_enable" : 0,
										"parameter_mappable" : 0,
										"storage_rect" : [ 100, 171, 1090, 600 ]
									}
,
									"text" : "pattrstorage strangeAudio",
									"varname" : "strangeAudio"
								}

							}
, 							{
								"box" : 								{
									"candycane" : 5,
									"candycane2" : [ 0.439216, 0.74902, 0.254902, 0.6 ],
									"candycane3" : [ 0.701960784313725, 0.415686274509804, 0.886274509803922, 0.55 ],
									"candycane4" : [ 0.925490196078431, 0.364705882352941, 0.341176470588235, 0.62 ],
									"candycane5" : [ 0.952941176470588, 0.564705882352941, 0.098039215686275, 0.65 ],
									"candycane6" : [ 0.960784, 0.827451, 0.156863, 1.0 ],
									"clickmoveinactive" : 0,
									"displayknob" : 2,
									"id" : "obj-3",
									"maxclass" : "nodes",
									"mousemode" : 2,
									"nodecolor" : [ 0.317647058823529, 0.654901960784314, 0.976470588235294, 0.53 ],
									"nodenumber" : 5,
									"nodesnames" : [ "1", "2", "3", "4", "5" ],
									"nsize" : [ 0.4, 0.4, 0.4, 0.4, 0.3 ],
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 443.0, 129.5, 180.0, 169.0 ],
									"xplace" : [ 0.794444444444444, 0.19, 0.79, 0.233333333333333, 0.505555555555556 ],
									"yplace" : [ 0.781065088757396, 0.21, 0.21, 0.798816568047337, 0.497041420118343 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-21",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 493.0, 409.0, 100.0, 22.0 ],
									"text" : "snapshot~ 100"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 493.0, 381.0, 100.0, 22.0 ],
									"text" : "*~ 100"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "newobj",
									"numinlets" : 5,
									"numoutlets" : 2,
									"outlettype" : [ "signal", "signal" ],
									"patching_rect" : [ 412.0, 433.0, 100.0, 22.0 ],
									"text" : "M4L.bal2~"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 0,
									"patching_rect" : [ 697.0, 472.0, 100.0, 22.0 ],
									"text" : "dac~"
								}

							}
, 							{
								"box" : 								{
									"activelinecolor" : [ 0.0, 0.854901960784314, 0.282352941176471, 1.0 ],
									"id" : "obj-26",
									"interval" : 1.0,
									"maxclass" : "live.scope~",
									"mode" : 1,
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 245.0, 463.5, 96.0, 77.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 739.0, 541.0, 180.0, 74.0 ],
									"samples" : 2500.0,
									"smooth" : 0,
									"trigger_direction" : 1,
									"trigger_threshold" : 0.01
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-25",
									"interval" : 1.0,
									"maxclass" : "live.scope~",
									"mode" : 1,
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 139.0, 463.5, 96.0, 77.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 628.0, 540.0, 180.0, 74.0 ],
									"samples" : 2500.0,
									"smooth" : 0,
									"trigger_direction" : 1,
									"trigger_threshold" : 0.21
								}

							}
, 							{
								"box" : 								{
									"activelinecolor" : [ 1.0, 0.345098039215686, 0.298039215686275, 1.0 ],
									"id" : "obj-305",
									"interval" : 1.0,
									"maxclass" : "live.scope~",
									"mode" : 1,
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 33.0, 463.5, 96.0, 77.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 123.5, 174.0, 180.0, 74.0 ],
									"samples" : 2500.0,
									"smooth" : 0,
									"trigger_direction" : 1,
									"trigger_threshold" : 0.1
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
									"patching_rect" : [ 33.0, 318.0, 111.0, 22.0 ],
									"text" : "spt.attractor.dadras",
									"varname" : "dadras"
								}

							}
, 							{
								"box" : 								{
									"attr" : "speed_primary",
									"id" : "obj-7",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 33.0, 164.0, 154.0, 22.0 ],
									"varname" : "speed"
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
									"patching_rect" : [ 273.0, 169.0, 150.0, 22.0 ],
									"varname" : "a"
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
									"patching_rect" : [ 273.0, 193.0, 150.0, 22.0 ],
									"varname" : "b"
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
									"patching_rect" : [ 273.0, 217.0, 150.0, 22.0 ],
									"varname" : "c"
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
									"patching_rect" : [ 273.0, 241.0, 150.0, 22.0 ],
									"varname" : "d"
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
									"patching_rect" : [ 273.0, 264.0, 150.0, 22.0 ],
									"varname" : "e"
								}

							}
, 							{
								"box" : 								{
									"attr" : "dt",
									"id" : "obj-19",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 33.0, 197.0, 154.0, 22.0 ],
									"varname" : "dt"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-88",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 30.0, 105.0, 401.0, 33.0 ],
									"text" : "The attractor can be run at audio rates and used as a chaotic oscillator. Either set of outputs can be run at any speed.",
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
									"text" : "written by Max Worgan (c) 2025, MIT Licence"
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
									"patching_rect" : [ 30.0, 15.0, 417.0, 51.0 ],
									"text" : "spt.attractor.dadras",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"attr" : "position",
									"id" : "obj-13",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 33.0, 288.0, 150.0, 22.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-21", 0 ],
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 1 ],
									"midpoints" : [ 502.5, 463.0, 659.5, 463.0 ],
									"order" : 0,
									"source" : [ "obj-12", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"midpoints" : [ 421.5, 473.0, 582.5, 473.0 ],
									"order" : 0,
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 1 ],
									"midpoints" : [ 502.5, 470.0, 502.0, 470.0 ],
									"order" : 1,
									"source" : [ "obj-12", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"midpoints" : [ 421.5, 470.0, 423.5, 470.0 ],
									"order" : 1,
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"midpoints" : [ 282.5, 217.0, 198.0, 217.0, 198.0, 244.0, 42.5, 244.0 ],
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"midpoints" : [ 282.5, 243.0, 42.5, 243.0 ],
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"midpoints" : [ 282.5, 265.0, 198.0, 265.0, 198.0, 244.0, 42.5, 244.0 ],
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"midpoints" : [ 282.5, 290.0, 198.0, 290.0, 198.0, 244.0, 42.5, 244.0 ],
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"midpoints" : [ 42.5, 220.0, 42.5, 220.0 ],
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 4 ],
									"source" : [ "obj-21", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 3 ],
									"midpoints" : [ 659.5, 501.5, 659.0, 501.5 ],
									"source" : [ "obj-28", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 2 ],
									"midpoints" : [ 582.5, 501.5, 580.5, 501.5 ],
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 1 ],
									"midpoints" : [ 594.5, 292.75, 595.5, 292.75 ],
									"source" : [ "obj-29", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-31", 0 ],
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"source" : [ "obj-31", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 1 ],
									"midpoints" : [ 737.5, 567.0, 848.0, 567.0, 848.0, 312.5, 735.5, 312.5 ],
									"source" : [ "obj-37", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"midpoints" : [ 423.5, 567.0, 863.0, 567.0, 863.0, 300.5, 706.5, 300.5 ],
									"source" : [ "obj-37", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 4 ],
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"midpoints" : [ 79.299999999999997, 372.0, 305.5, 372.0, 305.5, 372.0, 502.5, 372.0 ],
									"order" : 0,
									"source" : [ "obj-5", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 3 ],
									"midpoints" : [ 79.299999999999997, 380.0, 482.25, 380.0 ],
									"order" : 1,
									"source" : [ "obj-5", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 2 ],
									"midpoints" : [ 60.899999999999999, 391.0, 462.0, 391.0 ],
									"order" : 0,
									"source" : [ "obj-5", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 1 ],
									"midpoints" : [ 60.899999999999999, 402.0, 441.75, 402.0 ],
									"order" : 1,
									"source" : [ "obj-5", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"midpoints" : [ 42.5, 412.0, 421.5, 412.0 ],
									"order" : 0,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-25", 0 ],
									"midpoints" : [ 60.899999999999999, 447.0, 148.5, 447.0 ],
									"order" : 2,
									"source" : [ "obj-5", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"midpoints" : [ 79.299999999999997, 447.0, 254.5, 447.0 ],
									"order" : 2,
									"source" : [ "obj-5", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-305", 0 ],
									"midpoints" : [ 42.5, 447.0, 42.5, 447.0 ],
									"order" : 1,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"midpoints" : [ 42.5, 196.0, 42.0, 196.0, 42.0, 244.0, 42.5, 244.0 ],
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"midpoints" : [ 282.5, 193.0, 198.0, 193.0, 198.0, 244.0, 42.5, 244.0 ],
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 1 ],
									"source" : [ "obj-9", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-9", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 218.0, 84.0, 227.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p mxwn.dadras.audio.maxhelp",
					"varname" : "mxwn.dadras.audio.maxhelp"
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
, 			{
				"box" : 				{
					"id" : "obj-1",
					"linecount" : 3,
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
						"title" : "Basic",
						"boxes" : [ 							{
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
									"patching_rect" : [ 822.0, 194.0, 144.0, 22.0 ],
									"text" : "jit.gl.render dadrasscreen"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-24",
									"maxclass" : "jit.pwindow",
									"name" : "dadrasscreen",
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
									"patching_rect" : [ 787.0, 423.0, 162.0, 22.0 ],
									"text" : "jit.gl.handle dadrasscreen"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-64",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "jit_matrix", "" ],
									"patching_rect" : [ 787.0, 471.0, 204.0, 22.0 ],
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
									"patching_rect" : [ 787.0, 447.0, 243.5, 22.0 ],
									"text" : "jit.gl.node @name dadras-path @capture 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-56",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 491.0, 220.0, 598.0, 22.0 ],
									"text" : "jit.gl.path dadras-path @interpmode spline @segments 15 @pathstyle line @line_width 2 @color 1. 0.82 0.4 1."
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
									"patching_rect" : [ 529.0, 555.5, 134.0, 31.0 ],
									"preset_data" : [ 										{
											"number" : 1,
											"data" : [ 5, "<invalid>", "attrui", "attr", "dt", 5, "<invalid>", "attrui", "float", 0.001, 5, "obj-18", "attrui", "attr", "e", 5, "obj-18", "attrui", "float", 9.0, 5, "obj-17", "attrui", "attr", "d", 5, "obj-17", "attrui", "float", 2.0, 5, "obj-16", "attrui", "attr", "c", 5, "obj-16", "attrui", "float", 1.7, 5, "obj-15", "attrui", "attr", "b", 5, "obj-15", "attrui", "float", 2.7, 5, "obj-8", "attrui", "attr", "a", 5, "obj-8", "attrui", "float", 3.0, 5, "<invalid>", "attrui", "attr", "speed_slow", 5, "<invalid>", "attrui", "float", 10.0, 5, "obj-40", "toggle", "int", 1, 5, "<invalid>", "attrui", "attr", "speed_fast", 5, "<invalid>", "attrui", "float", 100.0 ]
										}
, 										{
											"number" : 2,
											"data" : [ 5, "<invalid>", "attrui", "attr", "dt", 5, "<invalid>", "attrui", "float", 0.001, 5, "obj-18", "attrui", "attr", "e", 5, "obj-18", "attrui", "float", 3.0, 5, "obj-17", "attrui", "attr", "d", 5, "obj-17", "attrui", "float", 2.0, 5, "obj-16", "attrui", "attr", "c", 5, "obj-16", "attrui", "float", 1.7, 5, "obj-15", "attrui", "attr", "b", 5, "obj-15", "attrui", "float", 2.0, 5, "obj-8", "attrui", "attr", "a", 5, "obj-8", "attrui", "float", 4.0, 5, "<invalid>", "attrui", "attr", "speed_slow", 5, "<invalid>", "attrui", "float", 10.0, 5, "obj-40", "toggle", "int", 1, 5, "<invalid>", "attrui", "attr", "speed_fast", 5, "<invalid>", "attrui", "float", 100.0 ]
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
									"autofit" : 1,
									"forceaspect" : 1,
									"id" : "obj-12",
									"maxclass" : "fpic",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "jit_matrix" ],
									"patching_rect" : [ 71.5, 249.256906077348049, 182.0, 42.104477611940297 ],
									"pic" : "dadraseq3.png"
								}

							}
, 							{
								"box" : 								{
									"autofit" : 1,
									"forceaspect" : 1,
									"id" : "obj-11",
									"maxclass" : "fpic",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "jit_matrix" ],
									"patching_rect" : [ 71.5, 195.0, 182.0, 41.032727272727271 ],
									"pic" : "dadraseq2.png"
								}

							}
, 							{
								"box" : 								{
									"autofit" : 1,
									"forceaspect" : 1,
									"id" : "obj-10",
									"maxclass" : "fpic",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "jit_matrix" ],
									"patching_rect" : [ 71.5, 143.506249999999994, 209.0, 40.493749999999999 ],
									"pic" : "dadraseq1.png"
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
									"patching_rect" : [ 30.0, 570.0, 111.0, 22.0 ],
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
									"linecount" : 23,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 30.0, 105.0, 423.0, 328.0 ],
									"text" : "An object that implements the dadras strange attractor, defined by the following equations:\n\n\n\n\n\n\n\n\n\n\n\n\n\nThe object contains two instances of the attractor, each outputing x, y and z coordinates. The slower instance is most suited for triggering/modulation whereas the faster instance is best suited for audio rate duties as well as for use in analysis. The instances are synced and represent the same trajectory.\n\nThe Euler integration method is used, and is a simple check in case the simulation 'blows up' that will reset the system to a customisable position.\n\n",
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
									"text" : "written by Max Worgan (c) 2025, MIT Licence"
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
									"text" : "spt.attractor.dadras",
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
									"patching_rect" : [ 270.0, 465.0, 150.0, 22.0 ]
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
									"patching_rect" : [ 270.0, 489.0, 150.0, 22.0 ]
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
									"patching_rect" : [ 270.0, 513.0, 150.0, 22.0 ]
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
									"patching_rect" : [ 270.0, 536.0, 150.0, 22.0 ]
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
									"patching_rect" : [ 270.0, 560.0, 150.0, 22.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-128", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"midpoints" : [ 279.5, 513.0, 195.0, 513.0, 195.0, 540.0, 39.5, 540.0 ],
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"midpoints" : [ 279.5, 539.0, 39.5, 539.0 ],
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"midpoints" : [ 279.5, 561.0, 195.0, 561.0, 195.0, 540.0, 39.5, 540.0 ],
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"midpoints" : [ 279.5, 586.0, 195.0, 586.0, 195.0, 540.0, 39.5, 540.0 ],
									"source" : [ "obj-18", 0 ]
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
									"midpoints" : [ 113.099999999999994, 629.5, 230.5, 629.5 ],
									"source" : [ "obj-5", 4 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-21", 0 ],
									"midpoints" : [ 131.5, 627.5, 421.5, 627.5 ],
									"source" : [ "obj-5", 5 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"midpoints" : [ 94.700000000000003, 630.5, 39.5, 630.5 ],
									"source" : [ "obj-5", 3 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-78", 2 ],
									"midpoints" : [ 76.299999999999997, 602.0, 459.0, 602.0, 459.0, 169.0, 801.5, 169.0 ],
									"source" : [ "obj-5", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-78", 1 ],
									"midpoints" : [ 57.899999999999999, 611.0, 467.25, 611.0, 467.25, 176.0, 651.0, 176.0 ],
									"source" : [ "obj-5", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-78", 0 ],
									"midpoints" : [ 39.5, 621.0, 475.5, 621.0, 475.5, 184.0, 500.5, 184.0 ],
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
									"midpoints" : [ 279.5, 489.0, 195.0, 489.0, 195.0, 540.0, 39.5, 540.0 ],
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
					"patching_rect" : [ 10.0, 61.0, 206.0, 49.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p mxwn.attractor.dadras.basic.maxhelp",
					"varname" : "mxwn.dadras.basic.maxhelp"
				}

			}
 ],
		"lines" : [  ],
		"parameters" : 		{
			"obj-4::obj-9" : [ "live.gain~", "live.gain~", 0 ],
			"parameterbanks" : 			{
				"0" : 				{
					"index" : 0,
					"name" : "",
					"parameters" : [ "-", "-", "-", "-", "-", "-", "-", "-" ]
				}

			}
,
			"inherited_shortname" : 1
		}
,
		"dependency_cache" : [ 			{
				"name" : "M4L.bal2~.maxpat",
				"bootpath" : "C74:/patchers/m4l/Tools resources",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "dadraseq1.png",
				"bootpath" : "~/Documents/Max 8/Packages/spt/help",
				"patcherrelativepath" : ".",
				"type" : "PNG",
				"implicit" : 1
			}
, 			{
				"name" : "dadraseq2.png",
				"bootpath" : "~/Documents/Max 8/Packages/spt/help",
				"patcherrelativepath" : ".",
				"type" : "PNG",
				"implicit" : 1
			}
, 			{
				"name" : "dadraseq3.png",
				"bootpath" : "~/Documents/Max 8/Packages/spt/help",
				"patcherrelativepath" : ".",
				"type" : "PNG",
				"implicit" : 1
			}
, 			{
				"name" : "freeverb.gendsp",
				"bootpath" : "~/Library/Application Support/Cycling '74/Max 8/Examples/gen",
				"patcherrelativepath" : "../../../../../Library/Application Support/Cycling '74/Max 8/Examples/gen",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "freeverb_allpass.gendsp",
				"bootpath" : "~/Library/Application Support/Cycling '74/Max 8/Examples/gen",
				"patcherrelativepath" : "../../../../../Library/Application Support/Cycling '74/Max 8/Examples/gen",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "freeverb_comb.gendsp",
				"bootpath" : "~/Library/Application Support/Cycling '74/Max 8/Examples/gen",
				"patcherrelativepath" : "../../../../../Library/Application Support/Cycling '74/Max 8/Examples/gen",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "spt.attractor.dadras.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "strangeAudio.json",
				"bootpath" : "~/Documents/Max 8/Packages/spt/help",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}
