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
        "rect": [ 34.0, 109.0, 915.0, 813.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 4017.0, 255.0, 111.0, 22.0 ],
                    "text": "spt.attractor.dadras"
                }
            },
            {
                "box": {
                    "id": "obj-173",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4530.0, 311.4761901497841, 29.5, 22.0 ],
                    "text": "f $1"
                }
            },
            {
                "box": {
                    "id": "obj-174",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4448.0, 311.4761901497841, 32.0, 22.0 ],
                    "text": "d $1"
                }
            },
            {
                "box": {
                    "id": "obj-175",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4372.0, 311.4761901497841, 31.0, 22.0 ],
                    "text": "c $1"
                }
            },
            {
                "box": {
                    "id": "obj-176",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4297.0, 311.4761901497841, 32.0, 22.0 ],
                    "text": "b $1"
                }
            },
            {
                "box": {
                    "id": "obj-177",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4222.0, 311.4761901497841, 32.0, 22.0 ],
                    "text": "a $1"
                }
            },
            {
                "box": {
                    "id": "obj-178",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4281.0, 125.47619014978409, 19.166709423065186, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 336.0, 47.0, 19.166709423065186, 20.0 ],
                    "text": "β",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "cantchange": 1,
                    "format": 6,
                    "id": "obj-179",
                    "ignoreclick": 1,
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4533.0, 240.4761901497841, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 572.0, 137.0, 50.0, 22.0 ],
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ],
                    "triangle": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "cantchange": 1,
                    "format": 6,
                    "id": "obj-180",
                    "ignoreclick": 1,
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4533.0, 203.4761901497841, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 572.0, 107.0, 50.0, 22.0 ],
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ],
                    "triangle": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "floatoutput": 1,
                    "id": "obj-181",
                    "knobcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ],
                    "knobshape": 5,
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4305.0, 240.4761901497841, 210.0, 25.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 360.0, 136.0, 210.0, 25.0 ],
                    "size": 10.0,
                    "thickness": 56.0,
                    "varname": "dadras_zeta"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "floatoutput": 1,
                    "id": "obj-182",
                    "knobcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ],
                    "knobshape": 5,
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4305.0, 201.4761901497841, 210.0, 25.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 360.0, 105.0, 210.0, 25.0 ],
                    "size": 10.0,
                    "thickness": 56.0,
                    "varname": "dadras_epsillon"
                }
            },
            {
                "box": {
                    "id": "obj-183",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4282.0, 160.4761901497841, 18.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 337.0, 78.0, 18.0, 20.0 ],
                    "text": "δ",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-184",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4281.0, 87.47619014978409, 19.166709423065186, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 336.0, 19.0, 19.166709423065186, 20.0 ],
                    "text": "α",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "cantchange": 1,
                    "format": 6,
                    "id": "obj-185",
                    "ignoreclick": 1,
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4533.0, 158.4761901497841, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 572.0, 77.0, 50.0, 22.0 ],
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ],
                    "triangle": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "cantchange": 1,
                    "format": 6,
                    "id": "obj-186",
                    "ignoreclick": 1,
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4533.0, 122.47619014978409, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 572.0, 46.0, 50.0, 22.0 ],
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ],
                    "triangle": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "cantchange": 1,
                    "format": 6,
                    "id": "obj-187",
                    "ignoreclick": 1,
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4533.0, 85.47619014978409, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 572.0, 18.0, 50.0, 22.0 ],
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ],
                    "triangle": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "floatoutput": 1,
                    "id": "obj-188",
                    "knobcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ],
                    "knobshape": 5,
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4305.0, 157.4761901497841, 210.0, 25.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 360.0, 76.0, 210.0, 25.0 ],
                    "size": 10.0,
                    "thickness": 56.0,
                    "varname": "dadras_delta"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "floatoutput": 1,
                    "id": "obj-189",
                    "knobcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ],
                    "knobshape": 5,
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4305.0, 122.47619014978409, 210.0, 25.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 360.0, 45.0, 210.0, 25.0 ],
                    "size": 10.0,
                    "thickness": 56.0,
                    "varname": "dadras_beta"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "floatoutput": 1,
                    "id": "obj-190",
                    "knobcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ],
                    "knobshape": 5,
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4305.0, 83.47619014978409, 210.0, 25.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 360.0, 16.0, 210.0, 25.0 ],
                    "size": 10.0,
                    "thickness": 56.0,
                    "varname": "dadras_alpha"
                }
            },
            {
                "box": {
                    "id": "obj-191",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4282.0, 199.4761901497841, 18.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 337.0, 108.0, 18.0, 20.0 ],
                    "text": "ε",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-192",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4281.0, 241.4761901497841, 19.166666209697723, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 336.0, 138.0, 19.166666209697723, 20.0 ],
                    "text": "ζ",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-193",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4361.0, 53.47619014978409, 150.0, 20.0 ],
                    "text": "Dadras"
                }
            },
            {
                "box": {
                    "id": "obj-30",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 3136.0, 212.0, 32.0, 22.0 ],
                    "text": "a $1"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "cantchange": 1,
                    "format": 6,
                    "id": "obj-15",
                    "ignoreclick": 1,
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 3350.0, 90.07353553175926, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1230.0, 16.0, 50.0, 22.0 ],
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ],
                    "triangle": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "floatoutput": 1,
                    "id": "obj-16",
                    "knobcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ],
                    "knobshape": 5,
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 3122.0, 86.07353553175926, 210.0, 25.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1020.0, 15.0, 210.0, 25.0 ],
                    "size": 3.0,
                    "thickness": 56.0,
                    "varname": "halvorsen_a"
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 3099.0, 90.07353553175926, 18.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1000.0, 17.0, 18.0, 20.0 ],
                    "text": "α",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 3174.0, 58.81247127056122, 150.0, 20.0 ],
                    "text": "Halvorsen"
                }
            },
            {
                "box": {
                    "id": "obj-105",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1821.0, 240.9761901497841, 19.166709423065186, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1341.0, 123.0, 19.166709423065186, 20.0 ],
                    "text": "β",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "cantchange": 1,
                    "format": 6,
                    "id": "obj-106",
                    "ignoreclick": 1,
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 2073.0, 274.9761901497841, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1577.0, 151.0, 50.0, 22.0 ],
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ],
                    "triangle": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "cantchange": 1,
                    "format": 6,
                    "id": "obj-107",
                    "ignoreclick": 1,
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 2073.0, 238.9761901497841, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1577.0, 123.0, 50.0, 22.0 ],
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ],
                    "triangle": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "cantchange": 1,
                    "format": 6,
                    "id": "obj-108",
                    "ignoreclick": 1,
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 2073.0, 201.9761901497841, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1577.0, 92.0, 50.0, 22.0 ],
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ],
                    "triangle": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "floatoutput": 1,
                    "id": "obj-109",
                    "knobcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ],
                    "knobshape": 5,
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1845.0, 273.9761901497841, 210.0, 25.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1365.0, 150.0, 210.0, 25.0 ],
                    "size": 5.0,
                    "thickness": 56.0,
                    "varname": "aizawa_zeta"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "floatoutput": 1,
                    "id": "obj-110",
                    "knobcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ],
                    "knobshape": 5,
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1845.0, 238.9761901497841, 210.0, 25.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1365.0, 120.0, 210.0, 25.0 ],
                    "size": 5.0,
                    "thickness": 56.0,
                    "varname": "aizawa_beta"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "floatoutput": 1,
                    "id": "obj-111",
                    "knobcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ],
                    "knobshape": 5,
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1845.0, 199.9761901497841, 210.0, 25.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1365.0, 91.0, 210.0, 25.0 ],
                    "size": 5.0,
                    "thickness": 56.0,
                    "varname": "aizawa_delta"
                }
            },
            {
                "box": {
                    "id": "obj-112",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1822.0, 202.9761901497841, 18.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1342.0, 93.0, 18.0, 20.0 ],
                    "text": "δ",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-113",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1821.0, 275.9761901497841, 19.166666209697723, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1341.0, 152.0, 19.166666209697723, 20.0 ],
                    "text": "ζ",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-102",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2223.0, 311.0, 30.0, 22.0 ],
                    "text": "f $1"
                }
            },
            {
                "box": {
                    "id": "obj-103",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2143.0, 311.0, 32.0, 22.0 ],
                    "text": "e $1"
                }
            },
            {
                "box": {
                    "id": "obj-104",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2056.0, 311.0, 32.0, 22.0 ],
                    "text": "d $1"
                }
            },
            {
                "box": {
                    "id": "obj-55",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1821.0, 123.47619014978409, 19.166709423065186, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1341.0, 32.0, 19.166709423065186, 20.0 ],
                    "text": "α",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "cantchange": 1,
                    "format": 6,
                    "id": "obj-62",
                    "ignoreclick": 1,
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 2073.0, 157.4761901497841, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1577.0, 62.0, 50.0, 22.0 ],
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ],
                    "triangle": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "cantchange": 1,
                    "format": 6,
                    "id": "obj-84",
                    "ignoreclick": 1,
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 2073.0, 121.47619014978409, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1577.0, 32.0, 50.0, 22.0 ],
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ],
                    "triangle": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "cantchange": 1,
                    "format": 6,
                    "id": "obj-88",
                    "ignoreclick": 1,
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 2073.0, 84.47619014978409, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1577.0, 2.0, 50.0, 22.0 ],
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ],
                    "triangle": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "floatoutput": 1,
                    "id": "obj-90",
                    "knobcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ],
                    "knobshape": 5,
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1845.0, 156.4761901497841, 210.0, 25.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1365.0, 60.0, 210.0, 25.0 ],
                    "size": 5.0,
                    "thickness": 56.0,
                    "varname": "aizawa_gamma"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "floatoutput": 1,
                    "id": "obj-92",
                    "knobcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ],
                    "knobshape": 5,
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1845.0, 121.47619014978409, 210.0, 25.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1365.0, 30.0, 210.0, 25.0 ],
                    "size": 5.0,
                    "thickness": 56.0,
                    "varname": "aizawa_alpha"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "floatoutput": 1,
                    "id": "obj-93",
                    "knobcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ],
                    "knobshape": 5,
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1845.0, 82.47619014978409, 210.0, 25.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1365.0, 1.0, 210.0, 25.0 ],
                    "size": 5.0,
                    "thickness": 56.0,
                    "varname": "aizawa_eps"
                }
            },
            {
                "box": {
                    "id": "obj-94",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1822.0, 85.47619014978409, 18.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1342.0, 4.0, 18.0, 20.0 ],
                    "text": "ε",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-95",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1821.0, 158.4761901497841, 19.166666209697723, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1341.0, 62.0, 19.166666209697723, 20.0 ],
                    "text": "γ",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-96",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2002.0, 311.0, 31.0, 22.0 ],
                    "text": "c $1"
                }
            },
            {
                "box": {
                    "id": "obj-97",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1919.0, 311.0, 32.0, 22.0 ],
                    "text": "b $1"
                }
            },
            {
                "box": {
                    "id": "obj-98",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1835.0, 311.0, 32.0, 22.0 ],
                    "text": "a $1"
                }
            },
            {
                "box": {
                    "id": "obj-54",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1901.0, 52.0, 150.0, 20.0 ],
                    "text": "Aizawa"
                }
            },
            {
                "box": {
                    "id": "obj-89",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 824.9999803304672, 45.83333224058151, 150.0, 20.0 ],
                    "text": "TSUCS Params"
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "id": "obj-73",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1163.0, 909.0, 128.0, 128.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 330.0, 0.0, 330.0, 210.0 ],
                    "proportion": 0.5
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "id": "obj-70",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1118.0, 864.0, 128.0, 128.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 990.0, 0.0, 330.0, 128.0 ],
                    "proportion": 0.5
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "id": "obj-67",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1073.0, 819.0, 128.0, 128.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1650.0, 2.0, 330.0, 128.0 ],
                    "proportion": 0.5
                }
            },
            {
                "box": {
                    "id": "obj-40",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 756.2023621201515, 123.28570997714996, 19.166709423065186, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 671.0, 47.0, 19.166709423065186, 20.0 ],
                    "text": "m",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "cantchange": 1,
                    "format": 6,
                    "id": "obj-33",
                    "ignoreclick": 1,
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1007.9761654734612, 121.38094800710678, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 901.0, 47.0, 50.0, 22.0 ],
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ],
                    "triangle": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "cantchange": 1,
                    "format": 6,
                    "id": "obj-34",
                    "ignoreclick": 1,
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1007.9761654734612, 84.47619014978409, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 901.0, 17.0, 50.0, 22.0 ],
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ],
                    "triangle": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "floatoutput": 1,
                    "id": "obj-37",
                    "knobcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ],
                    "knobshape": 5,
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 780.0, 120.78570997714996, 210.0, 25.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 690.0, 45.0, 210.0, 25.0 ],
                    "size": 200.0,
                    "thickness": 56.0,
                    "varname": "tsucs_m"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "floatoutput": 1,
                    "id": "obj-38",
                    "knobcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ],
                    "knobshape": 5,
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 780.0, 81.5, 210.0, 25.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 690.0, 15.0, 210.0, 25.0 ],
                    "size": 1.0,
                    "thickness": 56.0,
                    "varname": "tsucs_alpha"
                }
            },
            {
                "box": {
                    "id": "obj-39",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 756.7857168316841, 85.0714281797409, 18.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 671.0, 17.0, 18.0, 20.0 ],
                    "text": "α",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 854.999991774559, 200.54760599136353, 35.0, 22.0 ],
                    "text": "m $1"
                }
            },
            {
                "box": {
                    "id": "obj-45",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 771.0714295506477, 200.54760599136353, 55.0, 22.0 ],
                    "text": "alpha $1"
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 40.0, 404.0, 67.0, 22.0 ],
                    "save": [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
                    "text": "thispatcher"
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-21",
                    "index": 1,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 40.0, 344.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 491.0, 46.0, 150.0, 20.0 ],
                    "text": "Thomas Params"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 80.5, 50.0, 150.0, 20.0 ],
                    "text": "Lorenz Params"
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 425.0, 84.0, 35.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1658.0, 21.0, 20.0, 20.0 ],
                    "text": "b",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "cantchange": 1,
                    "format": 6,
                    "id": "obj-1",
                    "ignoreclick": 1,
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 679.0, 83.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1890.0, 21.0, 50.0, 22.0 ],
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ],
                    "triangle": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "floatoutput": 1,
                    "id": "obj-5",
                    "knobcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ],
                    "knobshape": 5,
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 455.0, 83.0, 210.0, 25.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1680.0, 19.0, 210.0, 25.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.208 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "thomas_b",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "thomas_b",
                            "parameter_type": 0
                        }
                    },
                    "size": 1.0,
                    "thickness": 56.0,
                    "varname": "thomas_b"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 455.0, 199.0, 32.0, 22.0 ],
                    "text": "b $1"
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-4",
                    "index": 1,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1515.0, 735.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 85.0, 16.0, 56.0, 22.0 ],
                    "restore": {
                        "aizawa_alpha": [ 3.825 ],
                        "aizawa_beta": [ 0.05 ],
                        "aizawa_delta": [ 0.975 ],
                        "aizawa_eps": [ 0.375 ],
                        "aizawa_gamma": [ 0.6 ],
                        "aizawa_zeta": [ 1.125 ],
                        "dadras_alpha": [ 5.850000000000001 ],
                        "dadras_beta": [ 6.35 ],
                        "dadras_delta": [ 3.400000095367432 ],
                        "dadras_epsillon": [ 3.099999904632568 ],
                        "dadras_zeta": [ 7.25 ],
                        "halvorsen_a": [ 3.0 ],
                        "lorenz_beta": [ 2.380000025033951 ],
                        "lorenz_rho": [ 34.250000178813934 ],
                        "lorenz_sigma": [ 2.9000000715255734 ],
                        "thomas_b": [ 0.415 ],
                        "tsucs_alpha": [ 0.015000000000000013 ],
                        "tsucs_m": [ 199.0 ]
                    },
                    "text": "autopattr",
                    "varname": "strangeParams"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "cantchange": 1,
                    "format": 6,
                    "id": "obj-47",
                    "ignoreclick": 1,
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 273.0, 156.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 239.9999942779541, 76.6666648387909, 50.0, 22.0 ],
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ],
                    "triangle": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "cantchange": 1,
                    "format": 6,
                    "id": "obj-44",
                    "ignoreclick": 1,
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 273.0, 120.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 239.9999942779541, 46.66666555404663, 50.0, 22.0 ],
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ],
                    "triangle": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "cantchange": 1,
                    "format": 6,
                    "id": "obj-36",
                    "ignoreclick": 1,
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 273.0, 83.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 239.9999942779541, 16.666666269302368, 50.0, 22.0 ],
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ],
                    "triangle": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "floatoutput": 1,
                    "id": "obj-18",
                    "knobcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ],
                    "knobshape": 5,
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 45.0, 154.5, 210.0, 25.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 29.999999284744263, 74.99999821186066, 210.0, 25.0 ],
                    "size": 7.0,
                    "thickness": 56.0,
                    "varname": "lorenz_beta"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "floatoutput": 1,
                    "id": "obj-13",
                    "knobcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ],
                    "knobshape": 5,
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 45.0, 119.5, 210.0, 25.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 29.999999284744263, 44.999998927116394, 210.0, 25.0 ],
                    "size": 50.0,
                    "thickness": 56.0,
                    "varname": "lorenz_rho"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9250507950782776, 0.9052134156227112, 0.8623547554016113, 1.0 ],
                    "floatoutput": 1,
                    "id": "obj-7",
                    "knobcolor": [ 0.8634395599365234, 0.22767668962478638, 0.10518772155046463, 1.0 ],
                    "knobshape": 5,
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 45.0, 80.5, 210.0, 25.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 29.999999284744263, 14.999999642372131, 210.0, 25.0 ],
                    "size": 20.0,
                    "thickness": 56.0,
                    "varname": "lorenz_sigma"
                }
            },
            {
                "box": {
                    "id": "obj-85",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 22.0, 84.0, 18.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 9.999999761581421, 17.499999582767487, 18.0, 20.0 ],
                    "text": "σ",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-83",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 21.0, 156.0, 19.166709423065186, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 9.166666448116302, 77.49999815225601, 19.166709423065186, 20.0 ],
                    "text": "β",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-81",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 21.0, 121.0, 19.166666209697723, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 9.166666448116302, 47.49999886751175, 19.166666209697723, 20.0 ],
                    "text": "ρ",
                    "textcolor": [ 0.4081761837005615, 0.38345998525619507, 0.309639036655426, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-61",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 203.0, 199.0, 49.0, 22.0 ],
                    "text": "beta $1"
                }
            },
            {
                "box": {
                    "id": "obj-59",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 120.0, 199.0, 43.0, 22.0 ],
                    "text": "rho $1"
                }
            },
            {
                "box": {
                    "id": "obj-58",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 33.0, 200.54760599136353, 57.0, 22.0 ],
                    "text": "sigma $1"
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "id": "obj-63",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1013.0, 759.0, 128.0, 128.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 660.0, 0.0, 330.0, 128.0 ],
                    "proportion": 0.5
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "id": "obj-46",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 998.0, 744.0, 128.0, 128.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 330.0, 128.0 ],
                    "proportion": 0.5
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-102", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-103", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-104", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-102", 0 ],
                    "order": 0,
                    "source": [ "obj-109", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-106", 0 ],
                    "midpoints": [ 1854.5, 299.9761901497841, 2070.0, 299.9761901497841, 2070.0, 272.9761901497841, 2082.5, 272.9761901497841 ],
                    "order": 1,
                    "source": [ "obj-109", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-103", 0 ],
                    "order": 0,
                    "source": [ "obj-110", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-107", 0 ],
                    "midpoints": [ 1854.5, 263.9761901497841, 2070.0, 263.9761901497841, 2070.0, 236.9761901497841, 2082.5, 236.9761901497841 ],
                    "order": 1,
                    "source": [ "obj-110", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-104", 0 ],
                    "order": 1,
                    "source": [ "obj-111", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-108", 0 ],
                    "midpoints": [ 1854.5, 227.9761901497841, 1846.0, 227.9761901497841, 1846.0, 196.9761901497841, 2082.5, 196.9761901497841 ],
                    "order": 0,
                    "source": [ "obj-111", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-44", 0 ],
                    "midpoints": [ 54.5, 144.0, 270.0, 144.0, 270.0, 117.0, 282.5, 117.0 ],
                    "order": 0,
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-59", 0 ],
                    "midpoints": [ 54.5, 150.0, 45.0, 150.0, 45.0, 190.0, 129.5, 190.0 ],
                    "order": 1,
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "midpoints": [ 3131.5, 114.24168011546135, 3123.1150441765785, 114.24168011546135, 3123.1150441765785, 83.24168011546135, 3359.5, 83.24168011546135 ],
                    "order": 0,
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30", 0 ],
                    "order": 1,
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-173", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-174", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-175", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-176", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-177", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-47", 0 ],
                    "midpoints": [ 54.5, 180.0, 270.0, 180.0, 270.0, 153.0, 282.5, 153.0 ],
                    "order": 0,
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 0 ],
                    "midpoints": [ 54.5, 190.0, 212.5, 190.0 ],
                    "order": 1,
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-173", 0 ],
                    "order": 1,
                    "source": [ "obj-181", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-179", 0 ],
                    "midpoints": [ 4314.5, 265.4523802995682, 4530.0, 265.4523802995682, 4530.0, 238.45238029956818, 4542.5, 238.45238029956818 ],
                    "order": 0,
                    "source": [ "obj-181", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-174", 0 ],
                    "order": 1,
                    "source": [ "obj-182", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-180", 0 ],
                    "midpoints": [ 4314.5, 229.45238029956818, 4306.0, 229.45238029956818, 4306.0, 198.45238029956818, 4542.5, 198.45238029956818 ],
                    "order": 0,
                    "source": [ "obj-182", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-175", 0 ],
                    "order": 1,
                    "source": [ "obj-188", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-185", 0 ],
                    "midpoints": [ 4314.5, 183.95238029956818, 4530.0, 183.95238029956818, 4530.0, 156.95238029956818, 4542.5, 156.95238029956818 ],
                    "order": 0,
                    "source": [ "obj-188", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-176", 0 ],
                    "order": 1,
                    "source": [ "obj-189", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-186", 0 ],
                    "midpoints": [ 4314.5, 147.95238029956818, 4530.0, 147.95238029956818, 4530.0, 120.95238029956818, 4542.5, 120.95238029956818 ],
                    "order": 0,
                    "source": [ "obj-189", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-177", 0 ],
                    "order": 1,
                    "source": [ "obj-190", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-187", 0 ],
                    "midpoints": [ 4314.5, 111.95238029956818, 4306.0, 111.95238029956818, 4306.0, 80.95238029956818, 4542.5, 80.95238029956818 ],
                    "order": 0,
                    "source": [ "obj-190", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-22", 0 ],
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-30", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "midpoints": [ 789.5, 145.54760599136353, 1005.0714295506477, 145.54760599136353, 1005.0714295506477, 118.54760599136353, 1017.4761654734612, 118.54760599136353 ],
                    "order": 0,
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-43", 0 ],
                    "midpoints": [ 789.5, 151.54760599136353, 780.0714295506477, 151.54760599136353, 780.0714295506477, 191.54760599136353, 864.499991774559, 191.54760599136353 ],
                    "order": 1,
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-34", 0 ],
                    "midpoints": [ 789.5, 109.54760599136353, 781.0714295506477, 109.54760599136353, 781.0714295506477, 78.54760599136353, 1017.4761654734612, 78.54760599136353 ],
                    "order": 0,
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 0 ],
                    "midpoints": [ 789.5, 109.54760599136353, 780.5714295506477, 109.54760599136353 ],
                    "order": 1,
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-45", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "midpoints": [ 464.5, 110.0, 675.0, 110.0, 675.0, 78.0, 688.5, 78.0 ],
                    "order": 0,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "midpoints": [ 464.5, 108.0, 464.5, 108.0 ],
                    "order": 1,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "midpoints": [ 42.5, 315.0, 1524.5, 315.0 ],
                    "source": [ "obj-58", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-59", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 0 ],
                    "midpoints": [ 54.5, 108.0, 46.0, 108.0, 46.0, 77.0, 282.5, 77.0 ],
                    "order": 0,
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-58", 0 ],
                    "midpoints": [ 54.5, 108.0, 42.5, 108.0 ],
                    "order": 1,
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-62", 0 ],
                    "midpoints": [ 1854.5, 182.4761901497841, 2070.0, 182.4761901497841, 2070.0, 155.4761901497841, 2082.5, 155.4761901497841 ],
                    "order": 0,
                    "source": [ "obj-90", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-96", 0 ],
                    "midpoints": [ 1854.5, 192.4761901497841, 2011.5, 192.4761901497841 ],
                    "order": 1,
                    "source": [ "obj-90", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-84", 0 ],
                    "midpoints": [ 1854.5, 146.4761901497841, 2070.0, 146.4761901497841, 2070.0, 119.47619014978409, 2082.5, 119.47619014978409 ],
                    "order": 0,
                    "source": [ "obj-92", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-97", 0 ],
                    "midpoints": [ 1854.5, 152.4761901497841, 1845.0, 152.4761901497841, 1845.0, 192.4761901497841, 1928.5, 192.4761901497841 ],
                    "order": 1,
                    "source": [ "obj-92", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-88", 0 ],
                    "midpoints": [ 1854.5, 110.47619014978409, 1846.0, 110.47619014978409, 1846.0, 79.47619014978409, 2082.5, 79.47619014978409 ],
                    "order": 0,
                    "source": [ "obj-93", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-98", 0 ],
                    "midpoints": [ 1854.5, 110.47619014978409, 1844.5, 110.47619014978409 ],
                    "order": 1,
                    "source": [ "obj-93", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-96", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-97", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-98", 0 ]
                }
            }
        ]
    }
}