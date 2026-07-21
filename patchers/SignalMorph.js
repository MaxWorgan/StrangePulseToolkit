// SignalMorph.js — resizable dark-editorial UI for continuous signal combination.
autowatch = 1;
inlets = 1;
outlets = 2; // mode, blend
mgraphics.init(); mgraphics.relative_coords = 0; mgraphics.autofill = 0;

// Paper Lab — light lab-instrument palette (see design_handoff_paperlab_ui/tokens.md)
var COL = { base:[0.925,0.906,0.863,1], surface:[0.965,0.953,0.925,1], surf2:[0.886,0.863,0.808,1], hair:[0.788,0.761,0.698,1], text:[0.094,0.086,0.067,1], dim:[0.408,0.384,0.310,1], faint:[0.639,0.612,0.541,1], accent:[0.863,0.227,0.106,1], accent2:[0.306,0.482,0.910,1] };
var FONT="Helvetica Neue", MONO="Menlo", MODES=["MIX","LOGIC","CHOP"];
var W=184,H=95,PAD=6,DX,DY,DW,DH,TY,modeValue=0,blendValue=0.5,dragging=false;
var chip={x:0,y:0,w:0,h:0};
var N=160,head=0,sigA=[],sigB=[],sigC=[],sigOut=[];
for(var i=0;i<N;i++){sigA.push(0);sigB.push(0);sigC.push(0);sigOut.push(0);}

function clamp(v,lo,hi){return v<lo?lo:(v>hi?hi:v);}
function setc(c){mgraphics.set_source_rgba(c[0],c[1],c[2],c[3]);}
function rect(x,y,w,h,c){setc(c);mgraphics.rectangle(x,y,w,h);mgraphics.fill();}
function rectb(x,y,w,h,c){setc(c);mgraphics.set_line_width(1);mgraphics.rectangle(x,y,w,h);mgraphics.stroke();}
function line(x1,y1,x2,y2,c,lw){setc(c);mgraphics.set_line_width(lw||1);mgraphics.move_to(x1,y1);mgraphics.line_to(x2,y2);mgraphics.stroke();}
function font(sz,mono){mgraphics.select_font_face(mono?MONO:FONT);mgraphics.set_font_size(sz);}
function measure(s,sz,mono){font(sz,mono);var m=mgraphics.text_measure(""+s);return m&&m.length?m[0]:0;}
function text(x,y,s,c,sz,right,mono){setc(c);font(sz,mono);if(right===1)x-=measure(s,sz,mono)/2;else if(right)x-=measure(s,sz,mono);mgraphics.move_to(x,y);mgraphics.show_text(""+s);}
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
 layout();rect(0,0,W,H,COL.surface);
 text(PAD,15,"09",COL.faint,9,false);text(PAD+18,15,trk("signal morph"),COL.dim,9,false);
 drawModeChip();
 rect(DX,DY,DW,DH,COL.base);drawGrid();line(DX,sy(0),DX+DW,sy(0),COL.hair,1);
 drawSignal(sigA,alpha(COL.text,0.34),1);drawSignal(sigB,alpha(COL.dim,0.45),1);if(modeValue===2)drawSignal(sigC,alpha(COL.faint,0.5),1);drawSignal(sigOut,alpha(COL.accent,0.9),1.5);
 rectb(DX+0.5,DY+0.5,DW-1,DH-1,COL.hair);drawRail();
}
function drawGrid(){var gc=alpha(COL.accent2,0.13);for(var i=1;i<8;i++)line(DX+DW*i/8,DY+1,DX+DW*i/8,DY+DH-1,gc,1);}
function drawModeChip(){var pad=6,h=15,y=4,ws=[],i;for(i=0;i<3;i++)ws.push(measure(MODES[i],8)+pad*2);var total=ws[0]+ws[1]+ws[2],x=W-PAD-total,cx=x;chip={x:x,y:y,w:total,h:h,b:[x+ws[0],x+ws[0]+ws[1],x+total]};for(i=0;i<3;i++){if(i===modeValue)rect(cx,y,ws[i],h,COL.accent);text(cx+ws[i]/2,y+11,MODES[i],i===modeValue?COL.base:COL.faint,8,1);if(i>0)line(cx,y,cx,y+h,COL.hair,1);cx+=ws[i];}rectb(x+0.5,y+0.5,total-1,h-1,COL.hair);}
function drawSignal(buf,color,lw){setc(color);mgraphics.set_line_width(lw);mgraphics.move_to(DX,sy(buf[head%N]));for(var k=1;k<N;k++)mgraphics.line_to(DX+DW*k/(N-1),sy(buf[(head+k)%N]));mgraphics.stroke();}
function railLabels(){if(modeValue===0)return["A","B",Math.round(blendValue*100)+"%"];if(modeValue===1)return["AND","OR",Math.round(blendValue*100)+"%"];return["A","B",((blendValue*2)-1).toFixed(2)];}
function railTrack(){var x0=DX+14,x1=DX+DW-50;return{x0:x0,x1:x1,w:Math.max(20,x1-x0)};}
function drawRail(){var l=railLabels(),y=TY+5,t=railTrack();text(DX,y,l[0],COL.dim,9,false);rect(t.x0,TY,t.w,7,COL.surf2);rect(t.x0,TY,t.w*blendValue,7,alpha(COL.accent,0.13));rect(t.x0+t.w*blendValue-2,TY-2,5,11,COL.accent);text(DX+DW-44,y,l[1],COL.dim,9,true);text(DX+DW,y,l[2],COL.accent,13,true,true);}
function setBlendFromX(x){var t=railTrack();blendValue=clamp((x-t.x0)/Math.max(1,t.x1-t.x0),0,1);outlet(1,blendValue);mgraphics.redraw();}
function onclick(x,y){if(x>=chip.x&&x<=chip.x+chip.w&&y>=chip.y&&y<=chip.y+chip.h){modeValue=x<chip.b[0]?0:(x<chip.b[1]?1:2);outlet(0,modeValue);mgraphics.redraw();return;}if(y>=TY-7){dragging=true;setBlendFromX(x);}}
function ondrag(x,y,but){if(!dragging)return;if(but===0){dragging=false;return;}setBlendFromX(x);}
onclick.local=1;ondrag.local=1;layout();
