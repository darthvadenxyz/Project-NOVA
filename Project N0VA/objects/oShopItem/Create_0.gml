// Inherit the parent event
event_inherited();

// Stop Animation
image_speed = 0;

// Destroy the item if we can only buy it once
if (oneTimeBuy) && (global.playerItemUnlocked[item]) instance_destroy();