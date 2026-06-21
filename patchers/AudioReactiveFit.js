// Resize the main v8ui and place the native envelope editor in its reserved panel.
autowatch=1; var P=this.patcher,ui=null,env=null,lastW=-1,lastH=-1,task=new Task(fit);
function loadbang(){begin();} function bang(){begin();}
function begin(){fit();task.interval=250;task.repeat();} function stop(){task.cancel();}
function clamp(v,a,b){return v<a?a:(v>b?b:v);}
function setrect(o,r){if(!o)return;o.rect=r;try{o.presentation_rect=r;}catch(e){}}
function fit(){if(!P||!P.box)return;var r=P.box.rect,w=Math.max(1,Math.round(r[2]-r[0])),h=Math.max(1,Math.round(r[3]-r[1]));if(w===lastW&&h===lastH)return;lastW=w;lastH=h;if(!ui)ui=P.getnamed("ui");if(!env)env=P.getnamed("EnvelopeEditor");setrect(ui,[0,0,w,h]);var pad=clamp(Math.round(w*.02),6,12),scopeH=Math.max(54,Math.min(92,h*.28)),controlsY=24+scopeH+7+35,controlsH=h-controlsY-pad,contentW=w-pad*2,left=contentW*.61,gap=8,envX=pad+left+gap,envW=contentW-left-gap;setrect(env,[envX,controlsY+16,envW,Math.max(20,controlsH-16)]);}
