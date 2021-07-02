/// @desc Essential Entity Setup
z			= 0;
spd			= 0;
flash		= 0;
thrown		= false;
lifted		= 0;
flashShader = shWhiteFlash;
uFlash		= shader_get_uniform(flashShader, "flash");

//Give any entity a list of items to drop
entityDropList = -1;

//Get Tilemap for Entities created after room start
collisionMap = layer_tilemap_get_id(layer_get_id("Col"));