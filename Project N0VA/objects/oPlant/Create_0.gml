// Inherit the parent event
event_inherited();

//Drop something (coins, bombs, or nothing)
entityDropList = choose(
	[oCoin],
	[oCoin, oCoin],
	[oBombDrop],
	[oArrowDrop],
	-1,
	-1,
	-1
)