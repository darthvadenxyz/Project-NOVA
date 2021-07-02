#macro FRAME_RATE	60
#macro TILE_SIZE	16
#macro CARDINAL_DIR round(direction/90)
#macro ROOM_START	rTesting
#macro ActionRPG:ROOM_START	rVillage

#macro RESOLUTION_W 320
#macro RESOLUTION_H 180
#macro SIZE			1	//Relative to how big the GUI is compared to the main game

#macro TRANSITION_SPEED 0.02
#macro OUT	0
#macro IN	1

//Textbox
#macro LINE_SPACING		12
#macro TEXTBOX_COLOR	0

#macro DEV_MODE true
#macro MSG show_debug_message

#macro CARRY_HEIGHT 13

enum ENEMYSTATE {
	IDLE,
	WANDER,
	CHASE,
	ATTACK,
	HURT,
	DIE,
	WAIT
}

enum ITEM {
	NONE,
	BOMB,
	BOW,
	HOOK,
	TYPE_COUNT
}

enum HOOKSTATUS {
	EXTENDING,
	PULLTOPLAYER,
	PULLTOENTITY,
	MISSED
}

enum ACTIONCOMMAND {
	NONE,
	SWORD,
	TALK,
	THROW,
	SHOP
}

//Control Scheme
enum CONTROLSCHEME {
	KEYBOARD,
	CONTROLLER
}