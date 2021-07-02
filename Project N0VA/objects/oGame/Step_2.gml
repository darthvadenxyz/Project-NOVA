//DEV CONTROLS
if (DEV_MODE) DebugInputs();

// Get Camera Coordinates
global.camX	= oCamera.camCurrentX;
global.camY	= oCamera.camCurrentY;

// Are we carrying something?
if (global.iLifted != noone) {
	with (oUI) {
		showIndication = false;
		actionCommand = ACTIONCOMMAND.THROW;
	}	
}