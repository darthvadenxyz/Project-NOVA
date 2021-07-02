// Inherit the parent event
event_inherited();

//Enemy State
state = ENEMYSTATE.WANDER;

//Enemy Sprites
sprMove		= sBat;
sprAttack	= sBat;
sprDie		= sBatDie;
sprHurt		= sBatHurt;

//Enemy Scripts
enemyScript[ENEMYSTATE.WANDER]	= BatWander;
enemyScript[ENEMYSTATE.CHASE]	= BatChase;
enemyScript[ENEMYSTATE.ATTACK]	= -1;		//Bat will not have an attack state
enemyScript[ENEMYSTATE.HURT]	= SlimeHurt;
enemyScript[ENEMYSTATE.DIE]		= SlimeDie;

//Drop something (coins, bombs, or nothing)
entityDropList = choose(
	[oCoin, oCoin, oCoin],
	[oBombDrop],
	[oArrowDrop],
	[oHealthDrop],
)