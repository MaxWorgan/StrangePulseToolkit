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
		"rect" : [ 456.0, 378.0, 640.0, 480.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
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
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 395.0, 26.0, 56.0, 22.0 ],
					"restore" : 					{
						"lowerThresh" : [ 0.0 ],
						"upperThresh" : [ 0.0 ]
					}
,
					"text" : "autopattr",
					"varname" : "u550013009"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.176470588235294, 0.184313725490196, 0.2, 0.0 ],
					"activelinecolor" : [ 0.937254901960784, 0.27843137254902, 0.435294117647059, 1.0 ],
					"bgcolor" : [ 0.177664712071419, 0.185375183820724, 0.199880793690681, 1.0 ],
					"horizonal_divisions" : 9,
					"horizontal_divisions" : 9,
					"id" : "obj-364",
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 417.0, 296.0, 148.0, 94.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 20.0, 0.0, 150.0, 85.0 ],
					"rounded" : 0.0,
					"samples" : 40000.0,
					"vertical_divisions" : 18
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-33",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 572.0, 502.0, 100.0, 22.0 ],
					"text" : ">=~ 0.5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 224.0, 521.0, 100.0, 22.0 ],
					"text" : ">=~ 0.5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 573.0, 459.0, 100.0, 22.0 ],
					"text" : "delta~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 224.0, 492.0, 100.0, 22.0 ],
					"text" : "delta~"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.180890142917633, 0.188634634017944, 0.203202188014984, 1.0 ],
					"floatoutput" : 1,
					"id" : "obj-25",
					"knobcolor" : [ 0.023529411764706, 0.83921568627451, 0.627450980392157, 1.0 ],
					"knobshape" : 5,
					"maxclass" : "slider",
					"min" : -1.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 689.0, 81.0, 20.0, 140.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 170.0, 0.0, 20.0, 85.0 ],
					"size" : 2.0,
					"thickness" : 31.899999999999999,
					"varname" : "lowerThresh"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.180890142917633, 0.188634634017944, 0.203202188014984, 1.0 ],
					"floatoutput" : 1,
					"id" : "obj-23",
					"knobcolor" : [ 1.0, 0.819607843137255, 0.4, 1.0 ],
					"knobshape" : 5,
					"maxclass" : "slider",
					"min" : -1.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 207.0, 73.0, 20.0, 140.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 20.0, 85.0 ],
					"size" : 2.0,
					"thickness" : 29.0,
					"varname" : "upperThresh"
				}

			}
, 			{
				"box" : 				{
					"comment" : "Low Trigger",
					"id" : "obj-16",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 572.0, 651.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"patching_rect" : [ 572.0, 576.0, 100.0, 22.0 ],
					"text" : "edge~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 572.0, 413.0, 100.0, 22.0 ],
					"text" : "<~"
				}

			}
, 			{
				"box" : 				{
					"comment" : "Hi Trigger",
					"id" : "obj-15",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 224.0, 672.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"patching_rect" : [ 224.0, 595.0, 100.0, 22.0 ],
					"text" : "edge~"
				}

			}
, 			{
				"box" : 				{
					"comment" : "Signal In",
					"id" : "obj-13",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 259.0, 56.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 224.0, 452.0, 100.0, 22.0 ],
					"text" : ">~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 567.0, 209.0, 100.0, 22.0 ],
					"text" : "sig~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 267.0, 171.0, 100.0, 22.0 ],
					"text" : "sig~"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"activelinecolor" : [ 1.0, 0.819607843137255, 0.4, 1.0 ],
					"grid_line_width" : 0.3,
					"id" : "obj-21",
					"interval" : 3.63,
					"line_width" : 0.4,
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 117.0, 296.0, 148.0, 94.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 20.0, 0.0, 150.0, 85.0 ],
					"range" : [ 0.0, 1.0 ],
					"rounded" : 0.0,
					"samples" : 40000.0,
					"smooth" : 0
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"activelinecolor" : [ 0.023529411764706, 0.83921568627451, 0.627450980392157, 1.0 ],
					"grid_line_width" : 0.3,
					"id" : "obj-94",
					"interval" : 3.63,
					"line_width" : 0.4,
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 740.0, 296.0, 148.0, 94.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 20.0, 0.0, 150.0, 85.0 ],
					"range" : [ 0.0, 1.0 ],
					"rounded" : 0.0,
					"samples" : 40000.0,
					"smooth" : 0
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"activelinecolor" : [ 0.023529411764706, 0.83921568627451, 0.627450980392157, 1.0 ],
					"grid_line_width" : 0.3,
					"id" : "obj-3",
					"interval" : 3.63,
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 567.0, 296.0, 148.0, 94.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 20.0, 0.0, 150.0, 85.0 ],
					"rounded" : 0.0,
					"samples" : 40000.0,
					"smooth" : 0
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"activegridcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"activelinecolor" : [ 1.0, 0.819607843137255, 0.4, 1.0 ],
					"grid_line_width" : 0.3,
					"gridcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-2",
					"interval" : 3.63,
					"linecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 267.0, 296.0, 148.0, 94.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 20.0, 0.0, 150.0, 85.0 ],
					"rounded" : 0.0,
					"samples" : 40000.0
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 1 ],
					"midpoints" : [ 576.5, 281.0, 727.0, 281.0, 727.0, 407.0, 662.5, 407.0 ],
					"order" : 0,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"order" : 1,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"midpoints" : [ 268.5, 119.0, 253.0, 119.0, 253.0, 407.0, 233.5, 407.0 ],
					"order" : 2,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"midpoints" : [ 268.5, 119.0, 253.0, 119.0, 253.0, 407.0, 559.0, 407.0, 559.0, 407.0, 581.5, 407.0 ],
					"order" : 0,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-364", 0 ],
					"midpoints" : [ 268.5, 119.0, 426.5, 119.0 ],
					"order" : 1,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-14", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"source" : [ "obj-17", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"order" : 0,
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"order" : 1,
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"order" : 1,
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-94", 0 ],
					"order" : 0,
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 1 ],
					"midpoints" : [ 276.5, 281.0, 253.0, 281.0, 253.0, 404.0, 314.5, 404.0 ],
					"order" : 0,
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"order" : 1,
					"source" : [ "obj-8", 0 ]
				}

			}
 ],
		"dependency_cache" : [  ],
		"autosave" : 0
	}

}
