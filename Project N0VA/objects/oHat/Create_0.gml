// Inherit the parent event
event_inherited();

//Destroy Hat if Questy is wearing hat
if (global.questStatus[? "TheHatQuest"] == 2) instance_destroy();