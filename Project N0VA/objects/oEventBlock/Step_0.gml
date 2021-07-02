/// @desc Prevent Player from passing

//Decide which direction to send the player
var _distance = 32;
switch(dir){
	case "DEFAULT":{
		targetX		= oPlayer.x;
		targetY		= oPlayer.y;
	}break;
	case "UP":{
		targetX		= oPlayer.x;
		targetY		= oPlayer.y-_distance;
		direction	= 90;
	}break;
	case "DOWN":{
		targetX		= oPlayer.x;
		targetY		= oPlayer.y+_distance;
		direction	= 270;
	}break;
	case "RIGHT":{
		targetX		= oPlayer.x+_distance;
		targetY		= oPlayer.y;
		direction	= 0;
	}break;
	case "LEFT":{
		targetX		= oPlayer.x-_distance;
		targetY		= oPlayer.y;
		direction	= 180;
	}break;
	default: break;
}

//Is this the first frame the player has touched this instance
if (instance_exists(oPlayer)) 
	&& (position_meeting(oPlayer.x,oPlayer.y,id)) 
	&& (hasTouched = false){
		
	ScriptExecuteArray(entityActivateScript, entityActivateArgs);
	hasTouched		= true;
	checkForEnd		= true;
}

//If text is done, send player away
if (checkForEnd) {
	if (!instance_exists(oText) && !instance_exists(oTextQueued)){
		with (oPlayer){
			state			= PlayerStateWalkAway;
			targetX			= other.targetX;
			targetY			= other.targetY;
			direction		= other.direction;
		}
		
		//Reset text check
		checkForEnd = false;
	}
}

//Make it so once the player is not longer colliding he can recollide
if (oPlayer.x == oPlayer.targetX) && (oPlayer.y == oPlayer.targetY) {
	hasTouched = false;
}
