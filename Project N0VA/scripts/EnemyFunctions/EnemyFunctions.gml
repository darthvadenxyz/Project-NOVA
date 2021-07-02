// Check if Enemy is colliding with a collision tile
function EnemyTileCollision(){
	var _collision = false;
	
	//Horizontal Tiles
	if (tilemap_get_at_pixel(collisionMap, x + hSpeed, y)) {
		x -= x mod TILE_SIZE; //pushes against end of tile if running into left wall
		if (sign(hSpeed) == 1) x += TILE_SIZE - 1; //pushes against end of tile if running into right wall
		hSpeed		= 0;
		_collision	= true;
	}
	
	//Horizontal Move Commit
	x += hSpeed;
	
	//Vertical Tiles
	if (tilemap_get_at_pixel(collisionMap, x, y+vSpeed)) {
		y -= y mod TILE_SIZE; //pushes against end of tile if running into left wall
		if (sign(vSpeed) == 1) y += TILE_SIZE - 1; //pushes against end of tile if running into right wall
		vSpeed		= 0;
		_collision	= true;
	}
	
	// Vertical Move Commit
	y += vSpeed;
	
	return _collision;
}

// Make Enemy wait between switching states
function EnemyWait(){
	if (++stateWait >= stateWaitDuration){
		stateWait	= 0;	
		state		= stateTarget;
	}
}