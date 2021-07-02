event_inherited();

/// @desc Allow player to remount if he walked away
if (!canBeEntered){
	player = collision_circle(x, y, 8, oPlayer, false, false);
	
	if (player == noone) canBeEntered = true;	
}