/// @desc Portrait Slide In
if (portraitStartup){
	var xEnd	= xx + global.camX;
	var xStart	= xx + global.camX + (distance * xscale);

	if (!positionSet){
		xCurrent	= xStart;
		fadeCurrent = 0;
		positionSet = true;
	}

	if (positionSet){
		xCurrent	= Approach(xCurrent, xEnd, slideSpeed);
		fadeCurrent = Approach(fadeCurrent, 1, fadeSpeed);
	}
} 

if (!portraitStartup){
	xCurrent	= xx + global.camX;	
	fadeCurrent = 1;
}