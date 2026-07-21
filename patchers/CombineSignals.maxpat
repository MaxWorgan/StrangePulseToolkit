{
 "patcher":{"fileversion":1,"appversion":{"major":9,"minor":1,"revision":1,"architecture":"x64","modernui":1},"classnamespace":"box","rect":[200.0,120.0,600.0,430.0],"openinpresentation":1,
 "boxes":[
  {"box":{"id":"a","maxclass":"inlet","numinlets":0,"numoutlets":1,"outlettype":["signal"],"patching_rect":[40.0,40.0,30.0,30.0]}},
  {"box":{"id":"b","maxclass":"inlet","numinlets":0,"numoutlets":1,"outlettype":["signal"],"patching_rect":[120.0,40.0,30.0,30.0]}},
  {"box":{"id":"mod","maxclass":"inlet","numinlets":0,"numoutlets":1,"outlettype":["signal"],"patching_rect":[200.0,40.0,30.0,30.0]}},
  {"box":{"id":"amt","maxclass":"inlet","numinlets":0,"numoutlets":1,"outlettype":[""],"patching_rect":[280.0,40.0,30.0,30.0]}},
  {"box":{"id":"impl","maxclass":"bpatcher","name":"SignalMorph.maxpat","varname":"impl","numinlets":4,"numoutlets":1,"outlettype":["signal"],"border":0,"patching_rect":[40.0,100.0,184.0,95.0],"presentation":1,"presentation_rect":[0.0,0.0,184.0,95.0]}},
  {"box":{"id":"out","maxclass":"outlet","numinlets":1,"numoutlets":0,"patching_rect":[40.0,250.0,30.0,30.0]}},
  {"box":{"id":"load","maxclass":"newobj","text":"loadbang","numinlets":1,"numoutlets":1,"outlettype":["bang"],"patching_rect":[380.0,40.0,58.0,22.0]}},
  {"box":{"id":"fit","maxclass":"newobj","text":"v8 attractorFit.js impl","numinlets":1,"numoutlets":1,"outlettype":[""],"patching_rect":[380.0,80.0,140.0,22.0]}}
 ],
 "lines":[
  {"patchline":{"source":["a",0],"destination":["impl",0]}},{"patchline":{"source":["b",0],"destination":["impl",1]}},
  {"patchline":{"source":["mod",0],"destination":["impl",2]}},{"patchline":{"source":["amt",0],"destination":["impl",3]}},
  {"patchline":{"source":["impl",0],"destination":["out",0]}},{"patchline":{"source":["load",0],"destination":["fit",0]}}
 ],"dependency_cache":[],"autosave":0}
}
