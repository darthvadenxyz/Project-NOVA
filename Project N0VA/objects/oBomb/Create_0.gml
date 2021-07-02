// Inherit the parent event
event_inherited();

flashShader		= shRedFlash;
bombStage		= 0;
bombTickRate	= [60,60,60,30,30,30,30,10,10,10,10,10,10,-1]; //		<==== Time between flashes (gets faster as time goes on)
bombTick		= bombTickRate[0];