if (!global.gamePaused){
	
	image_speed = 1.0;
	
	//Hit Things (only check for collision on first 4 frames)
	if (image_index < 4){
		
		var _entityList		= ds_list_create();
		var _entityCount	= instance_place_list(x, y, pEntity, _entityList, false);
		var _entity			= noone;
		
		while (_entityCount > 0){
			
			//Collision we are checking
			_entity = _entityList[| 0];
			
			//Register as collision and add it to list so we don't collide with the same object twice
			if (ds_list_find_index(collisionHistory, _entity) == -1){
				
				with (_entity){
					
					//If this was an enemy - damage it
					if (object_is_ancestor(object_index, pEnemy)){
						HurtEnemy(id, 25, other.id, 20);
					}			
					else{
						if (entityHitScript != -1) script_execute(entityHitScript);	
					}

				}
			
				ds_list_add(collisionHistory, _entity);

			}
			ds_list_delete(_entityList, 0);
			_entityCount--;
			
		}
		ds_list_destroy(_entityList);
		
	}
	
}

//Game is Paused
else{
	image_speed = 0.0;	
}