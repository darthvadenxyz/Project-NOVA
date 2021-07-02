/// @desc Initialise & Globals
randomize();

//Game Saving
global.gameSaveSlot		= 0;

//Pausing
global.gamePaused		= false;

//Warping
global.targetRoom		= -1;
global.targetX			= -1;
global.targetY			= -1;
global.targetDirection	= 0;

//Dialogue Variables
global.textSpeed		= 0.75;
global.voiceActing		= false;

//Which Dialogue Script is currently running
global.dialogueScript	= -1;

//Are We Drawing to the Gui or to the Camera?
global.drawGui			= true;

//Player Stats
global.playerHealthMax	= 3;
global.playerHealth		= 3;
global.playerMoney		= 99;

//Items
global.playerHasAnyItems	= false;
global.playerEquipped		= ITEM.BOMB;
global.playerAmmo			= array_create(ITEM.TYPE_COUNT, -1);
global.playerItemUnlocked	= array_create(ITEM.TYPE_COUNT, false);
global.playerAmmo[ITEM.BOMB] = 0;
global.playerAmmo[ITEM.BOW]	= 0;

//Testing Items (Temporary)
//global.playerItemUnlocked[ITEM.BOMB]= true;
//global.playerHasAnyItems			= true;
//global.playerAmmo[ITEM.BOMB]		= 5;
//global.playerItemUnlocked[ITEM.BOW] = true;
//global.playerAmmo[ITEM.BOW]			= 15;
//global.playerItemUnlocked[ITEM.HOOK]= true;

//Load Music Tracks
MusicTracks();

//Load Room Events
RoomEvents();

//Player State Storage
global.lastPlayerState = PlayerStateFree;

//Cutscene
global.cutscene			= false;

//Quests
global.questStatus		= ds_map_create();
global.questStatus[? "TheHatQuest"] = 0;

//Create Managers
global.iLifted			= noone;
global.iCamera			= instance_create_layer(0,0,layer,oCamera);
global.iUI				= instance_create_layer(0, 0, layer, oUI);
global.iMusic			= instance_create_layer(0, 0, layer, oMusic);

//Control Scheme
global.controlScheme	= CONTROLSCHEME.KEYBOARD

//Screen Setup (for GIFS)
surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);

//Go to Target Room
room_goto(ROOM_START);