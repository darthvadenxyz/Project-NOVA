function SaveGame(){
	
	// Create Save map
	var _map = ds_map_create();
	
	_map[? "room"]					= room;
	_map[? "playerHealth"]			= global.playerHealth;
	_map[? "playerHealthMax"]		= global.playerHealthMax;
	_map[? "playerHealthMoney"]		= global.playerMoney;
	_map[? "playerItemUnlocked"]	= global.playerItemUnlocked;
	_map[? "playerAmmo"]			= global.playerAmmo;
	_map[? "playerEquipped"]		= global.playerEquipped;
	_map[? "playerHasAnyItems"]		= global.playerHasAnyItems;
	_map[? "targetX"]				= global.targetX;
	_map[? "targetY"]				= global.targetY;
	
	/* 
	 Copy data from questStatus into a new map which we then store onto this map 
	 This new map will also automatically be destroyed when we call the ds_map_destory below 
	*/
	
	var _questMap = ds_map_create();
	ds_map_copy(_questMap, global.questStatus);
	ds_map_add_map(_map, "questStatus", _questMap);
	
	// Save all of this to a string
	var _string = json_encode(_map);
	SaveStringToFile("save" + string(global.gameSaveSlot) + ".sav", _string);
	show_debug_message(_string);
	
	// Nuke the date
	ds_map_destroy(_map);
	show_debug_message("Game Saved")
}


function SaveStringToFile(_filename, _string){
	
	var _buffer = buffer_create( string_byte_length( _string )+1, buffer_fixed, 1 );
	buffer_write( _buffer, buffer_string, _string);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
}