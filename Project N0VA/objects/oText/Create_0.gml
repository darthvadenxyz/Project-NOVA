//Initial Coordinates of Box
boxHeight	= 50;

//Textbox Position
if (!global.drawGui) {
	x1			= global.camX + RESOLUTION_W/2;
	y1			= global.camY + RESOLUTION_H-boxHeight;
	x2			= global.camX + RESOLUTION_W/2
	y2			= global.camY + RESOLUTION_H;
}

//Textbox Position
if (global.drawGui) {
	x1			= RESOLUTION_W/2;
	y1			= RESOLUTION_H;
	x2			= RESOLUTION_W/2
	y2			= RESOLUTION_H;
}

//Text Speed
lerpProgress	= 0;
lerpSpeed		= 50; //textbox grow speed
textProgress	= 0;

//Responses
responseSelected	= 0;

//Font
font			= fText;

//VoiceOver
voStarted		= false;