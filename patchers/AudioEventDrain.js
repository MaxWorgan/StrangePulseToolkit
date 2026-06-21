// Drain a cumulative signal-rate event counter without losing close events.
autowatch=1; inlets=1; outlets=1; var seen=0;
function msg_int(v){drain(v);} function msg_float(v){drain(v);}
function drain(v){var n=Math.floor(Number(v));if(!isFinite(n))return;if(n<seen){seen=n;return;}var pending=n-seen;seen=n;for(var i=0;i<pending;i++)outlet(0,"bang");}
