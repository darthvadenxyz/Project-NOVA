// Get Player Inputs
GetInputs();

// Calculate Movement
inputDirection	= point_direction(0, 0, keyRight-keyLeft, keyDown-keyUp);
inputMagnitude	= (keyRight - keyLeft != 0) || (keyDown - keyUp != 0);

if (!global.gamePaused){
	script_execute(state);
	invulnerable = max(invulnerable-1, 0);
	flash		 = max(flash-flashSpeed, 0);
}

// Depth Sorting
depth = -bbox_bottom;