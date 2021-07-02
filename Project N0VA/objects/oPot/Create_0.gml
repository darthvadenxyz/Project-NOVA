/// @description Pot Creation

// Inherit the parent event
event_inherited();

// Entity Drop List
entityDropList = choose(
	[oBombDrop],
	[oCoin, oCoin],
	[oCoin, oCoin, oCoin],
	[oArrowDrop]
);
