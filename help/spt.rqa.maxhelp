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
		"rect" : [ 73.0, 99.0, 1043.0, 823.0 ],
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
					"attr" : "speed_primary",
					"id" : "obj-19",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 52.0, 300.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-39",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 586.0, 78.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-87",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 785.0, 283.0, 126.0, 22.0 ],
					"text" : "jit.gl.handle rqascreen"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-64",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 785.0, 331.0, 204.0, 22.0 ],
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
					"patching_rect" : [ 785.0, 307.0, 219.0, 22.0 ],
					"text" : "jit.gl.node @name rqa-path @capture 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "jit.pwindow",
					"name" : "rqascreen",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 491.0, 252.5, 247.0, 161.0 ],
					"sync" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-62",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "erase" ],
					"patching_rect" : [ 822.0, 162.0, 55.0, 22.0 ],
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
					"patching_rect" : [ 822.0, 194.0, 125.0, 22.0 ],
					"text" : "jit.gl.render rqascreen"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-56",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 491.0, 220.0, 578.0, 22.0 ],
					"text" : "jit.gl.path rqa-path @interpmode spline @segments 15 @pathstyle line @line_width 2 @color 1. 0.82 0.4 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-78",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 491.0, 195.0, 320.0, 22.0 ],
					"text" : "jit.catch~ 3 @framesize 256 @mode 2 @downsample 512"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 574.0, 124.0, 100.0, 22.0 ],
					"text" : "qmetro 17"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 697.0, 442.0, 150.0, 47.0 ],
					"text" : "Select some different states of the strange attractor"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 0.788235, 0.470588, 1.0 ],
					"fontname" : "Arial Bold",
					"hint" : "",
					"id" : "obj-9",
					"ignoreclick" : 1,
					"legacytextcolor" : 1,
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 672.0, 427.0, 20.0, 20.0 ],
					"rounded" : 60.0,
					"text" : "2",
					"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 898.0, 79.0, 100.0, 22.0 ],
					"text" : "autopattr",
					"varname" : "u741010616"
				}

			}
, 			{
				"box" : 				{
					"bubblesize" : 24,
					"id" : "obj-1",
					"maxclass" : "preset",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [ "preset", "int", "preset", "int", "" ],
					"patching_rect" : [ 625.0, 448.5, 60.0, 34.0 ],
					"preset_data" : [ 						{
							"number" : 1,
							"data" : [ 5, "<invalid>", "attrui", "attr", "dt", 5, "<invalid>", "attrui", "float", 0.01, 5, "obj-18", "attrui", "attr", "e", 5, "obj-18", "attrui", "float", 6.0, 5, "obj-17", "attrui", "attr", "d", 5, "obj-17", "attrui", "float", 1.573, 5, "obj-16", "attrui", "attr", "c", 5, "obj-16", "attrui", "float", 1.4, 5, "obj-15", "attrui", "attr", "b", 5, "obj-15", "attrui", "float", 1.72, 5, "obj-8", "attrui", "attr", "a", 5, "obj-8", "attrui", "float", 2.7, 5, "<invalid>", "attrui", "attr", "sleep", 5, "<invalid>", "attrui", "float", 1000.0, 5, "obj-29", "attrui", "attr", "subsample_factor", 5, "obj-29", "attrui", "float", 5.0, 5, "obj-28", "attrui", "attr", "hop_size", 5, "obj-28", "attrui", "float", 256.0, 5, "obj-27", "attrui", "attr", "dynamic_threshold_factor", 5, "obj-27", "attrui", "float", 0.1, 5, "obj-26", "attrui", "attr", "threshold", 5, "obj-26", "attrui", "float", 0.1, 5, "obj-25", "attrui", "attr", "use_dynamic_threshold", 5, "obj-25", "attrui", "int", 1, 6, "obj-10", "number~", "list", 0.0, 0.0, 6, "obj-24", "number~", "list", 0.0, 0.0, 6, "obj-30", "number~", "list", 0.0, 0.0, 6, "obj-31", "number~", "list", 0.0, 0.0, 6, "obj-32", "number~", "list", 0.0, 0.0, 6, "obj-33", "number~", "list", 0.0, 0.0, 5, "<invalid>", "toggle", "int", 1 ]
						}
, 						{
							"number" : 2,
							"data" : [ 5, "<invalid>", "attrui", "attr", "dt", 5, "<invalid>", "attrui", "float", 0.01, 5, "obj-18", "attrui", "attr", "e", 5, "obj-18", "attrui", "float", 3.5, 5, "obj-17", "attrui", "attr", "d", 5, "obj-17", "attrui", "float", 1.72, 5, "obj-16", "attrui", "attr", "c", 5, "obj-16", "attrui", "float", 2.0, 5, "obj-15", "attrui", "attr", "b", 5, "obj-15", "attrui", "float", 1.6, 5, "obj-8", "attrui", "attr", "a", 5, "obj-8", "attrui", "float", 5.310000000000001, 5, "<invalid>", "attrui", "attr", "sleep", 5, "<invalid>", "attrui", "float", 1000.0, 5, "obj-29", "attrui", "attr", "subsample_factor", 5, "obj-29", "attrui", "float", 5.0, 5, "obj-28", "attrui", "attr", "hop_size", 5, "obj-28", "attrui", "float", 256.0, 5, "obj-27", "attrui", "attr", "dynamic_threshold_factor", 5, "obj-27", "attrui", "float", 0.1, 5, "obj-26", "attrui", "attr", "threshold", 5, "obj-26", "attrui", "float", 0.1, 5, "obj-25", "attrui", "attr", "use_dynamic_threshold", 5, "obj-25", "attrui", "int", 1, 6, "obj-10", "number~", "list", 0.0, 0.0, 6, "obj-24", "number~", "list", 0.0, 0.0, 6, "obj-30", "number~", "list", 0.0, 0.0, 6, "obj-31", "number~", "list", 0.0, 0.0, 6, "obj-32", "number~", "list", 0.0, 0.0, 6, "obj-33", "number~", "list", 0.0, 0.0, 5, "<invalid>", "toggle", "int", 1 ]
						}
, 						{
							"number" : 3,
							"data" : [ 5, "<invalid>", "attrui", "attr", "dt", 5, "<invalid>", "attrui", "float", 0.01, 5, "obj-18", "attrui", "attr", "e", 5, "obj-18", "attrui", "float", 7.7, 5, "obj-17", "attrui", "attr", "d", 5, "obj-17", "attrui", "float", 2.2, 5, "obj-16", "attrui", "attr", "c", 5, "obj-16", "attrui", "float", 1.7, 5, "obj-15", "attrui", "attr", "b", 5, "obj-15", "attrui", "float", 1.3, 5, "obj-8", "attrui", "attr", "a", 5, "obj-8", "attrui", "float", 4.0, 5, "<invalid>", "attrui", "attr", "sleep", 5, "<invalid>", "attrui", "float", 1918.0, 5, "obj-29", "attrui", "attr", "subsample_factor", 5, "obj-29", "attrui", "float", 5.0, 5, "obj-28", "attrui", "attr", "hop_size", 5, "obj-28", "attrui", "float", 256.0, 5, "obj-27", "attrui", "attr", "dynamic_threshold_factor", 5, "obj-27", "attrui", "float", 0.1, 5, "obj-26", "attrui", "attr", "threshold", 5, "obj-26", "attrui", "float", 0.1, 5, "obj-25", "attrui", "attr", "use_dynamic_threshold", 5, "obj-25", "attrui", "int", 1, 6, "obj-10", "number~", "list", 0.0, 0.0, 6, "obj-24", "number~", "list", 0.0, 0.0, 6, "obj-30", "number~", "list", 0.0, 0.0, 6, "obj-31", "number~", "list", 0.0, 0.0, 6, "obj-32", "number~", "list", 0.0, 0.0, 6, "obj-33", "number~", "list", 0.0, 0.0, 5, "<invalid>", "toggle", "int", 1 ]
						}
, 						{
							"number" : 4,
							"data" : [ 5, "<invalid>", "attrui", "attr", "dt", 5, "<invalid>", "attrui", "float", 0.01, 5, "obj-18", "attrui", "attr", "e", 5, "obj-18", "attrui", "float", 3.5, 5, "obj-17", "attrui", "attr", "d", 5, "obj-17", "attrui", "float", 1.72, 5, "obj-16", "attrui", "attr", "c", 5, "obj-16", "attrui", "float", 1.59, 5, "obj-15", "attrui", "attr", "b", 5, "obj-15", "attrui", "float", 2.19, 5, "obj-8", "attrui", "attr", "a", 5, "obj-8", "attrui", "float", 4.870000000000001, 5, "<invalid>", "attrui", "attr", "sleep", 5, "<invalid>", "attrui", "float", 1000.0, 5, "obj-29", "attrui", "attr", "subsample_factor", 5, "obj-29", "attrui", "float", 5.0, 5, "obj-28", "attrui", "attr", "hop_size", 5, "obj-28", "attrui", "float", 256.0, 5, "obj-27", "attrui", "attr", "dynamic_threshold_factor", 5, "obj-27", "attrui", "float", 0.21, 5, "obj-26", "attrui", "attr", "threshold", 5, "obj-26", "attrui", "float", 0.13, 5, "obj-25", "attrui", "attr", "use_dynamic_threshold", 5, "obj-25", "attrui", "int", 1, 6, "obj-10", "number~", "list", 0.0, 0.0, 6, "obj-24", "number~", "list", 0.0, 0.0, 6, "obj-30", "number~", "list", 0.0, 0.0, 6, "obj-31", "number~", "list", 0.0, 0.0, 6, "obj-32", "number~", "list", 0.0, 0.0, 6, "obj-33", "number~", "list", 0.0, 0.0, 5, "<invalid>", "toggle", "int", 1 ]
						}
 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-51",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 797.0, 673.0, 77.0, 33.0 ],
					"text" : "Trapping Time",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-50",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 647.0, 673.0, 77.0, 20.0 ],
					"text" : "Laminarity",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-49",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 497.0, 672.0, 77.0, 20.0 ],
					"text" : "Entropy",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-48",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 348.0, 673.0, 77.0, 20.0 ],
					"text" : "LMax",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-46",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 205.0, 675.0, 77.0, 20.0 ],
					"text" : "Determinism",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-44",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 674.0, 118.0, 20.0 ],
					"text" : "Recurrence Rate",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.4, 0.552941176470588, 0.980392156862745, 0.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-33",
					"maxclass" : "number~",
					"mode" : 2,
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "float" ],
					"patching_rect" : [ 768.0, 617.0, 135.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 794.0, 384.0, 56.0, 22.0 ],
					"sig" : 0.0,
					"sigoutmode" : 0
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-32",
					"maxclass" : "number~",
					"mode" : 2,
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "float" ],
					"patching_rect" : [ 619.0, 617.0, 126.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 655.0, 384.0, 56.0, 22.0 ],
					"sig" : 0.0,
					"sigoutmode" : 0
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-31",
					"maxclass" : "number~",
					"mode" : 2,
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "float" ],
					"patching_rect" : [ 468.0, 616.0, 134.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 516.0, 384.0, 56.0, 22.0 ],
					"sig" : 0.0,
					"sigoutmode" : 0
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-30",
					"maxclass" : "number~",
					"mode" : 2,
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "float" ],
					"patching_rect" : [ 322.0, 617.0, 129.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 242.0, 384.0, 48.0, 22.0 ],
					"sig" : 0.0,
					"sigoutmode" : 0
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-24",
					"maxclass" : "number~",
					"mode" : 2,
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "float" ],
					"patching_rect" : [ 182.764703452587128, 617.0, 121.470593094825745, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 378.0, 384.0, 55.0, 22.0 ],
					"sig" : 0.0,
					"sigoutmode" : 0
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-10",
					"maxclass" : "number~",
					"mode" : 2,
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "float" ],
					"patching_rect" : [ 49.0, 618.0, 118.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 99.0, 384.0, 56.0, 22.0 ],
					"sig" : 0.0,
					"sigoutmode" : 0,
					"textcolor" : [ 1.0, 0.980392156862745, 0.980392156862745, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activelinecolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ],
					"bgcolor" : [ 0.4, 0.552941176470588, 0.980392156862745, 0.0 ],
					"id" : "obj-11",
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 768.0, 617.0, 135.0, 132.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 715.0, 381.0, 135.0, 146.0 ],
					"range" : [ 0.0, 500.0 ],
					"smooth" : 0,
					"vertical_divisions" : 8
				}

			}
, 			{
				"box" : 				{
					"activelinecolor" : [ 0.439216, 0.74902, 0.254902, 1.0 ],
					"id" : "obj-13",
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 619.0, 617.0, 135.0, 132.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 576.0, 381.0, 135.0, 146.0 ],
					"range" : [ 0.0, 10.0 ],
					"smooth" : 0
				}

			}
, 			{
				"box" : 				{
					"activelinecolor" : [ 0.960784, 0.827451, 0.156863, 1.0 ],
					"id" : "obj-12",
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 468.0, 616.0, 135.0, 132.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 437.0, 382.0, 135.0, 145.0 ],
					"range" : [ 0.0, 10.0 ],
					"smooth" : 0
				}

			}
, 			{
				"box" : 				{
					"activelinecolor" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"id" : "obj-14",
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 182.764703452587128, 617.0, 121.470593094825745, 134.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 298.0, 380.0, 135.0, 148.0 ],
					"range" : [ 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 48.0, 617.0, 121.470593094825745, 134.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 20.0, 383.0, 135.0, 143.0 ],
					"range" : [ 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activelinecolor" : [ 0.92549, 0.364706, 0.341176, 1.0 ],
					"id" : "obj-21",
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 319.0, 616.0, 135.0, 132.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 159.0, 383.0, 135.0, 144.0 ],
					"range" : [ 0.0, 5000.0 ],
					"smooth" : 0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-23",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 6,
					"outlettype" : [ "signal", "signal", "signal", "signal", "signal", "signal" ],
					"patching_rect" : [ 49.0, 487.0, 75.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 20.0, 663.0, 100.0, 22.0 ],
					"text" : "spt.rqa 4000"
				}

			}
, 			{
				"box" : 				{
					"attr" : "use_dynamic_threshold",
					"id" : "obj-25",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 229.0, 496.0, 208.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 20.0, 534.0, 228.0, 22.0 ],
					"text_width" : 165.0
				}

			}
, 			{
				"box" : 				{
					"attr" : "threshold",
					"id" : "obj-26",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 229.0, 472.0, 209.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 20.0, 582.0, 228.0, 22.0 ],
					"text_width" : 165.0
				}

			}
, 			{
				"box" : 				{
					"attr" : "dynamic_threshold_factor",
					"id" : "obj-27",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 229.0, 427.0, 209.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 20.0, 558.0, 228.0, 22.0 ],
					"text_width" : 165.0
				}

			}
, 			{
				"box" : 				{
					"attr" : "hop_size",
					"id" : "obj-28",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 229.0, 520.0, 208.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 20.0, 631.0, 228.0, 22.0 ],
					"text_width" : 164.0
				}

			}
, 			{
				"box" : 				{
					"attr" : "subsample_factor",
					"id" : "obj-29",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 229.0, 448.0, 209.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 20.0, 606.0, 228.0, 22.0 ],
					"text_width" : 165.0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 6,
					"outlettype" : [ "signal", "signal", "signal", "signal", "signal", "signal" ],
					"patching_rect" : [ 52.0, 330.0, 111.0, 22.0 ],
					"text" : "spt.attractor.dadras"
				}

			}
, 			{
				"box" : 				{
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
					"patching_rect" : [ 629.0, 80.0, 20.0, 20.0 ],
					"rounded" : 60.0,
					"text" : "1",
					"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-88",
					"linecount" : 10,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 103.0, 420.0, 154.0 ],
					"text" : "An object that implements a range of Recurrence Quantification Analysis measures. \n\nThe input is expected to be the 3d coordinates of a non-linear dynamical system.\n\nThe measures are based on the analysis of a recurrence matrix - which is build by deciding if the attractor has visited this location before based on either a static threshold, or a dynamic_threshold_factor  (depending on the spread of the input data).\n",
					"textcolor" : [ 0.32548999786377, 0.345097988843918, 0.372548997402191, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 12.0,
					"id" : "obj-76",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 68.0, 349.0, 20.0 ],
					"text" : "written by Max Worgan (c) 2025,MIT Licence"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 40.0,
					"id" : "obj-22",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 15.0, 182.0, 51.0 ],
					"text" : "spt.rqa",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "a",
					"id" : "obj-8",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 229.0, 259.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "b",
					"id" : "obj-15",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 229.0, 283.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "c",
					"id" : "obj-16",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 229.0, 307.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "d",
					"id" : "obj-17",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 229.0, 330.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "e",
					"id" : "obj-18",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 229.0, 354.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "diagonal_line_min_length",
					"id" : "obj-3",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 228.5, 544.0, 209.0, 22.0 ],
					"text_width" : 164.5
				}

			}
, 			{
				"box" : 				{
					"attr" : "vertical_line_min_length",
					"id" : "obj-4",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 229.0, 568.0, 209.0, 22.0 ],
					"text_width" : 164.0
				}

			}
, 			{
				"box" : 				{
					"attr" : "speed_secondary",
					"id" : "obj-7",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 52.0, 273.0, 150.0, 22.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 0 ],
					"source" : [ "obj-128", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"midpoints" : [ 238.5, 306.0, 239.0, 306.0, 239.0, 354.0, 39.0, 354.0, 39.0, 318.0, 61.5, 318.0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"midpoints" : [ 238.5, 365.0, 42.0, 365.0, 42.0, 311.0, 61.5, 311.0 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"midpoints" : [ 238.5, 373.0, 41.0, 373.0, 41.0, 311.0, 61.5, 311.0 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"midpoints" : [ 238.5, 380.0, 40.0, 380.0, 40.0, 311.0, 61.5, 311.0 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"midpoints" : [ 58.5, 510.0, 58.5, 510.0 ],
					"order" : 0,
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"midpoints" : [ 114.5, 603.0, 777.5, 603.0 ],
					"order" : 1,
					"source" : [ "obj-23", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"midpoints" : [ 92.099999999999994, 603.0, 477.5, 603.0 ],
					"order" : 1,
					"source" : [ "obj-23", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"midpoints" : [ 103.299999999999997, 603.0, 628.5, 603.0 ],
					"order" : 1,
					"source" : [ "obj-23", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"midpoints" : [ 69.700000000000003, 603.0, 192.264703452587128, 603.0 ],
					"source" : [ "obj-23", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"midpoints" : [ 58.5, 510.0, 57.5, 510.0 ],
					"order" : 1,
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"midpoints" : [ 80.900000000000006, 603.0, 328.5, 603.0 ],
					"order" : 1,
					"source" : [ "obj-23", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"midpoints" : [ 80.900000000000006, 603.0, 331.5, 603.0 ],
					"order" : 0,
					"source" : [ "obj-23", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"midpoints" : [ 92.099999999999994, 603.0, 477.5, 603.0 ],
					"order" : 0,
					"source" : [ "obj-23", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"midpoints" : [ 103.299999999999997, 603.0, 628.5, 603.0 ],
					"order" : 0,
					"source" : [ "obj-23", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"midpoints" : [ 114.5, 603.0, 777.5, 603.0 ],
					"order" : 0,
					"source" : [ "obj-23", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 238.5, 519.0, 239.0, 519.0, 239.0, 474.0, 58.5, 474.0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 238.5, 495.0, 238.0, 495.0, 238.0, 473.0, 58.5, 473.0 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 238.5, 472.0, 58.5, 472.0 ],
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 238.5, 472.0, 59.0, 472.0, 59.0, 480.0, 58.5, 480.0 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 238.5, 472.0, 58.5, 472.0 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 238.0, 472.0, 61.0, 472.0, 61.0, 483.0, 58.5, 483.0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-39", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 238.5, 591.0, 36.0, 591.0, 36.0, 483.0, 58.5, 483.0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 2 ],
					"source" : [ "obj-5", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 1 ],
					"source" : [ "obj-5", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-78", 2 ],
					"midpoints" : [ 153.5, 387.0, 477.0, 387.0, 477.0, 180.0, 801.5, 180.0 ],
					"source" : [ "obj-5", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-78", 1 ],
					"midpoints" : [ 135.099999999999994, 387.0, 477.0, 387.0, 477.0, 180.0, 651.0, 180.0 ],
					"source" : [ "obj-5", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-78", 0 ],
					"midpoints" : [ 116.700000000000003, 387.0, 477.0, 387.0, 477.0, 189.0, 500.5, 189.0 ],
					"source" : [ "obj-5", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 0 ],
					"midpoints" : [ 583.5, 153.5, 831.5, 153.5 ],
					"order" : 0,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-78", 0 ],
					"midpoints" : [ 583.5, 170.0, 500.5, 170.0 ],
					"order" : 1,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"midpoints" : [ 867.5, 188.599009900990097, 831.5, 188.599009900990097 ],
					"source" : [ "obj-62", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"midpoints" : [ 831.5, 193.599009900990097, 831.5, 193.599009900990097 ],
					"source" : [ "obj-62", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"source" : [ "obj-78", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"midpoints" : [ 238.5, 282.0, 237.0, 282.0, 237.0, 354.0, 39.0, 354.0, 39.0, 318.0, 61.5, 318.0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-128", 0 ],
					"source" : [ "obj-87", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "spt.attractor.dadras.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "spt.rqa.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0,
		"boxgroups" : [ 			{
				"boxes" : [ "obj-14", "obj-24" ]
			}
 ]
	}

}
