// States
state				= PlayerStateFree;
stateAttack			= AttackSlash;
hitByAttack			= -1;
lastState			= state;

// Tile Collisions
collisionMap		= layer_tilemap_get_id(layer_get_id("Col"));

// Movement
image_speed			= 0;
hSpeed				= 0;
vSpeed				= 0;
speedWalk			= 2.0;
speedRoll			= 3.0;
speedBonk			= 2.0;
speedHook			= 4.0;

// Rolling
distanceRoll		= 52;
distanceBonk		= 40;
distanceBonkHeight	= 12;
distanceHook		= 88;

// Invulnerablity
invulnerable		= 0;			//<==== if above zero, invulnerable is true
invulnerablityTime	= 60;

// Walking Away
walkAwayTime		= 0;			//<==== if above zero, player is in walkaway state

// Event Blocks
targetX				= x;
targetY				= y;

// Z-Depth
z					= 0;

// Flashing
flash				= 0;
flashLength			= 0.7;
flashSpeed			= 0.05;
flashShader			= shWhiteFlash;

// Animation End Script
animationEndScript	= -1;

// Player Sprites
defaultIdle			= sNova;
defaultRun			= sNovaRun;

spriteHurt			= sNova;
spriteRoll			= sPlayerRoll;
spriteRun			= sNovaRun;
spriteIdle			= sNova;
localFrame			= 0;

// Hookshot
hook				= 0;
hookX				= 0;
hookY				= 0;
hookSize			= sprite_get_width(sHookChain);

//Room transition Positioning
if (global.targetX != -1){
	x			= global.targetX;
	y			= global.targetY;
	direction	= global.targetDirection;
}

// Check if carrying at room start
if (global.iLifted != noone) {
	spriteIdle = sPlayerCarrying;
	spriteRun = sPlayerRunCarrying;
	sprite_index = spriteIdle;
}
