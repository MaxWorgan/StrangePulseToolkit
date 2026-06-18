// SignalMorph.js — resizable dark-editorial UI for continuous signal combination.
autowatch = 1;
inlets = 1;
outlets = 2; // mode, blend
mgraphics.init(); mgraphics.relative_coords = 0; mgraphics.autofill = 0;

var COL = { base:[0.0549,0.0549,0.0588,1], surface:[0.0863,0.0863,0.0941,1], surf2:[0.1255,0.1255,0.1412,1], hair:[0.1725,0.1725,0.1922,1], text:[0.9255,0.9255,0.9255,1], dim:[0.5412,0.5412,0.5608,1], faint:[0.3608,0.3608,0.3804,1], accent:[0.7216,1,0.3608,1] };
var FONT="Helvetica Neue", MODES=["MIX","LOGIC","CHOP"];
var W=184,H=95,PAD=6,DX,DY,DW,DH,TY,modeValue=0,blendValue=0.5,dragging=false;
var N=160,head=0,sigA=[],sigB=[],sigC=[],sigOut=[];
for(var i=0;i<N;i++){sigA.push(0);sigB.push(0);sigC.push(0);sigOut.push(0);}

function clamp(v,lo,hi){return v<lo?lo:(v>hi?hi:v);}
function setc(c){mgraphics.set_source_rgba(c[0],c[1],c[2],c[3]);}
function rect(x,y,w,h,c){setc(c);mgraphics.rectangle(x,y,w,h);mgraphics.fill();}
function rectb(x,y,w,h,c){setc(c);mgraphics.set_line_width(1);mgraphics.rectangle(x,y,w,h);mgraphics.stroke();}
function line(x1,y1,x2,y2,c,lw){setc(c);mgraphics.set_line_width(lw||1);mgraphics.move_to(x1,y1);mgraphics.line_to(x2,y2);mgraphics.stroke();}
function font(sz){mgraphics.select_font_face(FONT);mgraphics.set_font_size(sz);}
function measure(s,sz){font(sz);var m=mgraphics.text_measure(""+s);return m&&m.length?m[0]:0;}
function text(x,y,s,c,sz,right){setc(c);font(sz);if(right)x-=measure(s,sz);mgraphics.move_to(x,y);mgraphics.show_text(""+s);}
function trk(s){return(""+s).toUpperCase().split("").join(" ");}
function alpha(c,a){return[c[0],c[1],c[2],a];}
function sy(v){return DY+DH*(1-(clamp(v,-1,1)+1)*0.5);}
function layout(){PAD=clamp(Math.round(W*0.035),5,12);DY=22;TY=H-17;DX=PAD;DW=Math.max(60,W-PAD*2);DH=Math.max(28,TY-DY-5);}
function onresize(w,h){W=w;H=h;layout();mgraphics.redraw();}
function a(v){sigA[head]=clamp(v,-1,1);} function b(v){sigB[head]=clamp(v,-1,1);} function c(v){sigC[head]=clamp(v,-1,1);}
function output(v){sigOut[head]=clamp(v,-1,1);head=(head+1)%N;mgraphics.redraw();}
function mode(v){modeValue=clamp(Math.round(v),0,2);mgraphics.redraw();}
function blend(v){blendValue=clamp(v,0,1);mgraphics.redraw();}

function paint(){
 layout();rect(0,0,W,H,COL.base);text(PAD,15,trk("signal morph"),COL.dim,9,false);
 var label=MODES[modeValue],mw=measure(label,8);rect(W-PAD-mw-12,4,mw+12,15,COL.surf2);text(W-PAD-6,15,label,COL.accent,8,true);
 rect(DX,DY,DW,DH,COL.surface);rectb(DX+0.5,DY+0.5,DW-1,DH-1,COL.hair);line(DX,sy(0),DX+DW,sy(0),COL.hair,1);
 drawSignal(sigA,alpha(COL.text,0.25),1);drawSignal(sigB,alpha(COL.dim,0.38),1);if(modeValue===2)drawSignal(sigC,alpha(COL.faint,0.4),1);drawSignal(sigOut,alpha(COL.accent,0.9),1.4);drawRail();
}
function drawSignal(buf,color,lw){setc(color);mgraphics.set_line_width(lw);mgraphics.move_to(DX,sy(buf[head%N]));for(var k=1;k<N;k++)mgraphics.line_to(DX+DW*k/(N-1),sy(buf[(head+k)%N]));mgraphics.stroke();}
function railLabels(){if(modeValue===0)return["A","B",Math.round(blendValue*100)+"%"];if(modeValue===1)return["AND","OR",Math.round(blendValue*100)+"%"];return["A","B",((blendValue*2)-1).toFixed(2)];}
function drawRail(){var l=railLabels(),y=TY+5,x0=DX+28,x1=DX+DW-35,w=Math.max(20,x1-x0);text(DX,y,l[0],COL.faint,8,false);text(DX+DW,y,l[1],COL.faint,8,true);rect(x0,TY,w,5,COL.surf2);rect(x0,TY,w*blendValue,5,alpha(COL.accent,0.35));rect(x0+w*blendValue-2,TY-3,5,11,COL.accent);text(DX+DW-12,y,l[2],COL.accent,9,true);}
function setBlendFromX(x){var x0=DX+28,x1=DX+DW-35;blendValue=clamp((x-x0)/Math.max(1,x1-x0),0,1);outlet(1,blendValue);mgraphics.redraw();}
function onclick(x,y){if(y<21&&x>W-PAD-58){modeValue=(modeValue+1)%3;outlet(0,modeValue);mgraphics.redraw();return;}if(y>=TY-7){dragging=true;setBlendFromX(x);}}
function ondrag(x,y,but){if(!dragging)return;if(but===0){dragging=false;return;}setBlendFromX(x);}
onclick.local=1;ondrag.local=1;layout();
