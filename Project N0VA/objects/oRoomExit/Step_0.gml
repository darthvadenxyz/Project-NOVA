/// @desc Cause a Room Transition

if (instance_exists(oPlayer)) && (position_meeting(oPlayer.x,oPlayer.y,id)){
	if (!instance_exists(oTransition)) && (oPlayer.state != PlayerStateDead) {
		global.targetRoom		= targetRoom;
		global.targetX			= targetX;
		global.targetY			= targetY;
		global.targetDirection	= oPlayer.direction;
		//room_goto(targetRoom); <-//Cut to room without transition
		with (oPlayer) state	= PlayerStateTransition;
		RoomTransition(TRANS_TYPE.FADE, targetRoom);
		instance_destroy();
	}
}
