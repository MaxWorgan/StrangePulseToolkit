// MotionLogic.js — resizable UI for continuously morphed movement logic.
autowatch=1; inlets=1; outlets=1;
mgraphics.init(); mgraphics.relative_coords=0; mgraphics.autofill=0;
var C={base:[.055,.055,.059,1],surface:[.086,.086,.094,1],surf2:[.126,.126,.141,1],hair:[.173,.173,.192,1],text:[.926,.926,.926,1],dim:[.541,.541,.561,1],faint:[.361,.361,.380,1],accent:[.722,1,.361,1]};
var OPS=["AND","OR","XOR","NAND","NOR","XNOR"],FONT="Helvetica Neue";
var W=184,H=95,P=6,DX,DY,DW,DH,RY,opValue=0,dragging=false,N=160,head=0,aBuf=[],bBuf=[],outBuf=[];
for(var i=0;i<N;i++){aBuf.push(0);bBuf.push(0);outBuf.push(0);}
function clamp(v,lo,hi){return v<lo?lo:(v>hi?hi:v);} function setc(c){mgraphics.set_source_rgba(c[0],c[1],c[2],c[3]);}
function rect(x,y,w,h,c){setc(c);mgraphics.rectangle(x,y,w,h);mgraphics.fill();} function line(x1,y1,x2,y2,c,lw){setc(c);mgraphics.set_line_width(lw||1);mgraphics.move_to(x1,y1);mgraphics.line_to(x2,y2);mgraphics.stroke();}
function font(s){mgraphics.select_font_face(FONT);mgraphics.set_font_size(s);} function measure(s,z){font(z);return mgraphics.text_measure(""+s)[0];}
function text(x,y,s,c,z,right){setc(c);font(z);if(right)x-=measure(s,z);mgraphics.move_to(x,y);mgraphics.show_text(""+s);} function trk(s){return(""+s).toUpperCase().split("").join(" ");}
function alpha(c,a){return[c[0],c[1],c[2],a];} function layout(){P=clamp(Math.round(W*.035),5,12);DY=22;RY=H-17;DX=P;DW=Math.max(60,W-P*2);DH=Math.max(28,RY-DY-5);}
function onresize(w,h){W=w;H=h;layout();mgraphics.redraw();} function a(v){aBuf[head]=clamp(v,0,1);} function b(v){bBuf[head]=clamp(v,0,1);}
function output(v){outBuf[head]=clamp(v,0,1);head=(head+1)%N;mgraphics.redraw();} function op(v){opValue=clamp(v,0,5);mgraphics.redraw();}
function sy(v,row){var band=DH/3;return DY+row*band+band*(.82-.64*clamp(v,0,1));}
function trace(buf,row,color,lw){setc(color);mgraphics.set_line_width(lw);mgraphics.move_to(DX,sy(buf[head],row));for(var k=1;k<N;k++)mgraphics.line_to(DX+DW*k/(N-1),sy(buf[(head+k)%N],row));mgraphics.stroke();}
function paint(){layout();rect(0,0,W,H,C.base);text(P,15,trk("motion logic"),C.dim,9,false);var i=Math.min(4,Math.floor(opValue)),t=opValue-i,label=t<.02?OPS[Math.round(opValue)]:OPS[i]+" / "+OPS[i+1];text(W-P,15,label,C.accent,8,true);rect(DX,DY,DW,DH,C.surface);line(DX,DY+DH/3,DX+DW,DY+DH/3,C.hair,1);line(DX,DY+2*DH/3,DX+DW,DY+2*DH/3,C.hair,1);text(DX+3,DY+9,"A",C.faint,7,false);text(DX+3,DY+DH/3+9,"B",C.faint,7,false);text(DX+3,DY+2*DH/3+9,"OUT",C.faint,7,false);trace(aBuf,0,alpha(C.text,.35),1);trace(bBuf,1,alpha(C.dim,.55),1);trace(outBuf,2,alpha(C.accent,.95),1.4);drawRail();}
function drawRail(){var x0=DX,x1=DX+DW,w=x1-x0,y=RY;line(x0,y,x1,y,C.hair,5);line(x0,y,x0+w*opValue/5,y,alpha(C.accent,.4),5);for(var i=0;i<6;i++){var x=x0+w*i/5;line(x,y-3,x,y+4,i===Math.round(opValue)?C.accent:C.dim,i===Math.round(opValue)?2:1);}var hx=x0+w*opValue/5;rect(hx-2,y-5,5,11,C.accent);text(x0,y+12,"AND",C.faint,7,false);text(x1,y+12,"XNOR",C.faint,7,true);}
function setFromX(x){opValue=clamp((x-DX)/Math.max(1,DW)*5,0,5);outlet(0,opValue);mgraphics.redraw();}
function onclick(x,y){if(y>=RY-8){dragging=true;setFromX(x);}} function ondrag(x,y,but){if(!dragging)return;if(but===0){dragging=false;return;}setFromX(x);} onclick.local=1;ondrag.local=1;layout();
