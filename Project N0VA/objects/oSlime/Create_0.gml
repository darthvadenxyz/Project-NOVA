// Inherit the parent event
event_inherited();

//Enemy State
state = ENEMYSTATE.WANDER;

//Enemy Sprites
sprMove		= sSlime;
sprAttack	= sSlimeAttack;
sprDie		= sSlimeDie;
sprHurt		= sSlimeHurt;

//Enemy Scripts
enemyScript[ENEMYSTATE.WANDER]	= SlimeWander;
enemyScript[ENEMYSTATE.CHASE]	= SlimeChase;
enemyScript[ENEMYSTATE.ATTACK]	= SlimeAttack;
enemyScript[ENEMYSTATE.HURT]	= SlimeHurt;
enemyScript[ENEMYSTATE.DIE]		= SlimeDie;

//Drop something (coins, bombs, or nothing)
entityDropList = choose(
	[oCoin, oCoin, oCoin],
	[oBombDrop],
	[oArrowDrop],
	[oHealthDrop],
)