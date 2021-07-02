// Update sprite based on direction
function PlayerAnimateSprite(){ 
	var _totalFrames	= sprite_get_number(sprite_index)/4;
	image_index			= localFrame + (CARDINAL_DIR * _totalFrames);
	localFrame			+= sprite_get_speed(sprite_index) / FRAME_RATE;
	
	//If animation would loop on next game step
	if (localFrame >= _totalFrames) {
		animationEnd	= true;
		localFrame		-= _totalFrames;
	}else animationEnd = false;
}


function PlayerCollision(){
	var _collision	= false;
	var _entityList = ds_list_create()
	
	// Horizontal Tiles
	if (tilemap_get_at_pixel(collisionMap, x + hSpeed, y)) {
		x -= x mod TILE_SIZE; //pushes against end of tile if running into left wall
		if (sign(hSpeed) == 1) x += TILE_SIZE - 1; //pushes against end of tile if running into right wall
		hSpeed		= 0;
		_collision	= true;
	}
	
	// Horizontal Entities
	var _entityCount = instance_position_list(x + hSpeed, y, pEntity, _entityList, false);
	var _snapX;
	while (_entityCount > 0){
		var _entityCheck = _entityList[| 0];
		if (_entityCheck.entityCollision == true){
			// Move as close as we can	
			if (sign(hSpeed) == -1) _snapX = _entityCheck.bbox_right+1; //moving left
			else _snapX = _entityCheck.bbox_left-1; //moving right
			
			x				= _snapX
			hSpeed			= 0;
			_collision		= true;
			_entityCount	= 0;
		}
		ds_list_delete(_entityList,0); //remove first entity from list, therefore checking one entity at a time
		_entityCount--;
	}
	
	//Horizontal Move Commit
	x += hSpeed;
	
	//Clear list between axis
	ds_list_clear(_entityList);
	
	//Vertical Tiles
	if (tilemap_get_at_pixel(collisionMap, x, y+vSpeed)) {
		y -= y mod TILE_SIZE; //pushes against end of tile if running into left wall
		if (sign(vSpeed) == 1) y += TILE_SIZE - 1; //pushes against end of tile if running into right wall
		vSpeed = 0;
		_collision = true;
	}
	
	//Vertical Entities
	var _entityCount = instance_position_list(x, y + vSpeed, pEntity, _entityList, false);
	var _snapY;
	while (_entityCount > 0){
		var _entityCheck = _entityList[| 0];
		if (_entityCheck.entityCollision == true){
			//Move as close as we can	
			if (sign(vSpeed) == -1) _snapY = _entityCheck.bbox_bottom+1; //moving left
			else _snapY = _entityCheck.bbox_top-1; //moving right
			
			y				= _snapY
			vSpeed			= 0;
			_collision		= true;
			_entityCount	= 0;
		}
		ds_list_delete(_entityList,0); //remove first entity from list, therefore checking one entity at a time
		_entityCount--;
	}
	
	// Vertical Move Commit
	y += vSpeed;
	
	ds_list_destroy(_entityList);
	
	return _collision;
}


function PlayerActOutAnimation(_sprite, _endscript){
	/// @desc PlayerActOutAnimation(Sprite, EndScript)
	/// @arg Sprite
	/// @arg EndScript
	
	//Carry out an animation and optionally carry out a script when animation ends.
	
	state			= PlayerStateAct;
	sprite_index	= _sprite;
	
	if (_endscript == undefined) animationEndScript = -1; else animationEndScript = _endscript;
	
	localFrame		= 0;
	image_index		= 0;
	PlayerAnimateSprite();
}


function PlayerThrow(){
	
	with (global.iLifted){
		lifted					= false;
		persistent				= false;
		thrown					= true;
		z						= CARRY_HEIGHT;
		throwPeakHeight			= z + 10;
		throwDistance			= entityThrowDistance;
		throwDistanceTravelled	= 0;
		throwStartPercent		= (CARRY_HEIGHT/throwPeakHeight) * 0.5;
		throwPercent			= throwStartPercent;
		direction				= other.direction;
		xstart					= x;
		ystart					= y;
	}
	PlayerActOutAnimation(sPlayerLift); //put throw animation here
	
	global.iLifted	= noone;
	spriteIdle		= defaultIdle;
	spriteRun		= defaultRun;
	
}


function PlayerDropItem(){
	
	with (oPlayer){
		global.iLifted	= noone;
		spriteIdle		= defaultIdle;
		spriteRun		= defaultRun;
	}
	
}