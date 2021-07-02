function PlayerStateFree(){
	
	// Movement
	hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

	PlayerCollision();

	// Update Sprite Index
	var _oldSprite = sprite_index;
	if (inputMagnitude != 0) {
		direction		= inputDirection;
		sprite_index	= spriteRun;
	} else sprite_index = spriteIdle;
	if (_oldSprite != sprite_index) localFrame = 0;

	// Update Image Index
	PlayerAnimateSprite();
	
	// Check for Interaction Indication
	var _indicationRange	= 20;
	var _indicationX		= x + lengthdir_x(_indicationRange, direction);
	var _indicationY		= y + lengthdir_y(_indicationRange, direction);
	var _indicationSize		= 8;
	
	if (instance_exists(pEntity)){
		indicationID = collision_rectangle(_indicationX-_indicationSize, _indicationY-_indicationSize, _indicationX+_indicationSize, _indicationY+_indicationSize,
											pEntity, false, true);	
		
		if (indicationID == noone || indicationID.displayInteraction == false) {
			with (oUI) {
				showIndication = false;
				actionCommand = ACTIONCOMMAND.SWORD
			}
		} 
		else {
			var _yCoordinate = indicationID.sprite_height;
			IndicateInteraction();
		}
	}
	
	// Activate Key Logic
	if (keyAction) {
		// Step 1: Check for an entity to activate
		var _activateRange	= _indicationRange;
		var _activateX		= x + lengthdir_x(_activateRange, direction);
		var _activateY		= y + lengthdir_y(_activateRange, direction);
		var _activateSize	= 8;
		var _activateList	= ds_list_create();
		activate = noone;
		var _entitiesFound = collision_rectangle_list(
			_activateX-_activateSize,
			_activateY-_activateSize,
			_activateX+_activateSize,
			_activateY+_activateSize,
			pEntity,
			false,
			true,
			_activateList,
			true
		);
		
		// if the first instance we find is either our liften entity or it has no script: try the next one
		while (_entitiesFound > 0){
			var _check = _activateList[| --_entitiesFound];
			if (_check != global.iLifted) && (_check.entityActivateScript != -1){
				activate = _check;
				break;
			}
		}
		
		ds_list_destroy(_activateList);
		
		// Step 2: If there is nothing, or something with no script
			// 2a. If we are carrying something, throw it!
			// 2b. Otherwise, Roll! just kidding ATTACK
		if (activate == noone) {
			//Throw something if held, otherwise attack
			if (global.iLifted != noone){
				PlayerThrow();	
		
			} else {
				state		= PlayerStateAttack;
				stateAttack = AttackSlash;
			}
		}
		
		// Step 3: Otherwise, there is something with a script - Activate!
		else {
			if (global.iLifted != noone){
				PlayerThrow();	
			}
			else {
				ScriptExecuteArray(activate.entityActivateScript, activate.entityActivateArgs);
		
				// Step 4: If it is an NPC, make it face towards us
				if (activate.entityNPC) {
					with (activate) {
						direction	= point_direction(x,y,other.x,other.y);
						image_index = CARDINAL_DIR;
					}
				}
			}
		}
	}
	
	// Use Item
	if (keyItem) && (!keyAction) && (global.playerHasAnyItems) && (global.playerEquipped != ITEM.NONE) {
		switch (global.playerEquipped) {
			
			case ITEM.BOMB: UseItemBomb(); break;
			case ITEM.BOW:	UseItemBow(); break;
			case ITEM.HOOK: UseItemHook(); break;
			default: break;
		}
	}
	
	// Cycle Items
	if (global.playerHasAnyItems) {
		var _cycleDirection = keyItemSelectUp - keyItemSelectDown;	
		if (_cycleDirection != 0) {
			do {
				global.playerEquipped += _cycleDirection;
				if (global.playerEquipped < 1) global.playerEquipped = ITEM.TYPE_COUNT - 1;
				if (global.playerEquipped >= ITEM.TYPE_COUNT) global.playerEquipped = 1;
			}
			until (global.playerItemUnlocked[global.playerEquipped]);
			
		}
	}
	
}


function PlayerStateRoll(){
	// Movement
	hSpeed = lengthdir_x(speedRoll, direction);
	vSpeed = lengthdir_y(speedRoll, direction);
	
	moveDistanceRemaining	= max(0, moveDistanceRemaining - speedRoll);
	var _collided			= PlayerCollision(); //Check for Collision
	
	// Update Sprite
	sprite_index		= spriteRoll;
	var _totalFrames	= sprite_get_number(sprite_index)/4;
	image_index			= (CARDINAL_DIR * _totalFrames) + min(((1 - (moveDistanceRemaining/distanceRoll)) * (_totalFrames)), _totalFrames-1); //Allows animation length to match roll distance
	
	// Change State
	if (moveDistanceRemaining <= 0) {
		state			= PlayerStateFree;
	}
	
	// Wall Collisions
	if (_collided){
		state					= PlayerStateBonk;
		moveDistanceRemaining	= distanceBonk;
		ScreenShake(4,30);
	}
}


function PlayerStateBonk(){
	//Movement
	hSpeed = lengthdir_x(speedBonk, direction-180);
	vSpeed = lengthdir_y(speedBonk, direction-180);
	
	moveDistanceRemaining	= max(0, moveDistanceRemaining - speedBonk);
	var _collided			= PlayerCollision(); //Check for Collision
	
	//Update Sprite
	sprite_index	= spriteHurt;
	image_index		= CARDINAL_DIR - 2;
	
	//Change Height
	z = sin(((moveDistanceRemaining / distanceBonk) * pi)) * distanceBonkHeight;
	
	//Change State
	if (moveDistanceRemaining <= 0) {
		state = PlayerStateFree;
	}
	
	
}


function PlayerStateAttack(){
	script_execute(stateAttack);
}


function PlayerStateLocked(){
	//Do Nothing	
}


function PlayerStateTransition(){
	//Movement
	PlayerCollision();
	
	//Update Image Index
	PlayerAnimateSprite();
	
}


function PlayerStateAct(){
	
	//Update Sprite
	PlayerAnimateSprite();
	
	if (animationEnd){
		state			= PlayerStateFree;
		animationEnd	= false;
		if (animationEndScript != -1){
			script_execute(animationEndScript);
			animationEndScript = -1;
		}
	}
}


function PlayerStateDead(){
	
	/*NOTE: There are some magic numbers here that are going to vary on the specific sprite you are using, I've made
			these into VARS so that they are easier to determine what they are but they will likely have to be tweeked
			when using different sprites	
	*/
	
	//Stop all movement
	hSpeed = 0;
	vSpeed = 0;
	
	//Magic Number Vars
	var _dyingAnimationStartSpeed	= 0.7;		//What speed do we start the dying animation at
	var _dyingDecelerationSpeed		= 0.03;		//How much we slow down during the dying animation
	var _deathAnimationStartSpeed	= 0.07;		//What speed to we move from 'dying' to 'death'
	
	//If just arriving in this state
	if (sprite_index != sPlayerDie) && (sprite_index != sPlayerDead){
		
		//update sprite
		sprite_index	= sPlayerDie;
		image_index		= 0;
		image_speed		= _dyingAnimationStartSpeed;		
	}
	
	//Animation ending this frame?
	if (image_index + image_speed > image_number){
		
		if (sprite_index == sPlayerDie){
			
			image_speed	= max(0, image_speed-_dyingDecelerationSpeed);
			
			if (image_speed < _deathAnimationStartSpeed){
				image_index		= 0;	
				sprite_index	= sPlayerDead;
				image_speed		= 1.0;
			}
			
		}else{
			//Player is dead and on last frame of animation
			image_speed		= 0;
			image_index		= image_number-1;
			global.targetX	= -1;
			global.targetY	= -1;
			RoomTransition(TRANS_TYPE.SLIDE, rVillage);
		}
		
	}
	
}


function PlayerStateHook(){
		
	//Reset Speed
	hSpeed = 0;
	vSpeed = 0;
	
	//If just arriving in this state
	if (sprite_index != sPlayerHook) {
		hook	= 0;
		hookX	= 0;
		hookY	= 0;
		hookStatus		= HOOKSTATUS.EXTENDING;
		hookedEntity	= noone;
		
		//Update Sprite
		sprite_index = sPlayerHook;
		image_index	= CARDINAL_DIR;
		image_speed = 0;		
	}
	
	//Extend/Retract Hook
	var _speedHookTemp = speedHook;
	if (hookStatus != HOOKSTATUS.EXTENDING) _speedHookTemp *= -1;
	hook += _speedHookTemp;
	switch (image_index) {
		case 0: hookX = hook;	break;	
		case 1:	hookY = -hook;	break;
		case 2:	hookX = -hook;	break;
		case 3:	hookY = hook;	break;		
	}
	
	//Hookshot state machine!
	switch(hookStatus) {
		case HOOKSTATUS.EXTENDING: {
			//Finish Extending
			if (hook >= distanceHook) hookStatus = HOOKSTATUS.MISSED;
			
			//Check for a hit
			var _hookHit = collision_circle(x+hookX, y+hookY, 4, pEntity, false, true);
			if (_hookHit != noone) && (global.iLifted != _hookHit){
				//Act depending on what is hit
				switch(_hookHit.entityHookable) {
					
					default: {	//Not hookable entity
						
						//... else potentially harm enemy
						if (object_is_ancestor(_hookHit.object_index, pEnemy)) {
							HurtEnemy(_hookHit, 1, id, 5);
							hookStatus = HOOKSTATUS.MISSED;							
						}
						else {
							if (_hookHit.entityHitScript != -1) {
								with (_hookHit) script_execute(entityHitScript);
								hookStatus = HOOKSTATUS.MISSED;
							}		
						}
						
					} break;
					
					case 1: {
						hookStatus = HOOKSTATUS.PULLTOPLAYER;
						hookedEntity = _hookHit;
					} break;
					
					case 2: {
						hookStatus = HOOKSTATUS.PULLTOENTITY;
						hookedEntity = _hookHit;
					} break;	
				}			
			}			
			
		} break;
		
		//Pull to entity towards the hooked player
		case HOOKSTATUS.PULLTOPLAYER: {
			
			with (hookedEntity) {
				x = other.x + other.hookX;
				y = other.y + other.hookY;				
			}
			
		} break;
		
		//Pull the PLAYER towards the hooked entity
		case HOOKSTATUS.PULLTOENTITY: {
			
			switch(image_index) {
				case 0: x += speedHook; break;
				case 1: y -= speedHook; break;
				case 2: x -= speedHook; break;
				case 3: y += speedHook; break;		
			}
			
		} break;
	}
	
	//Finish retract and end state
	if (hook <= 0) {
		hookedEntity = noone;
		state = PlayerStateFree;
	}
	
}


function PlayerStateWalkAway() {
		
	//walkAwayTime--;
	
	//Movement
	//moveSpeed = speedWalk;

	////Move towards target
	if (x != targetX || y != targetY) {
		x += sign(targetX - x) * 2; //This needs to be an even number
		y += sign(targetY - y) * 2;		
	} else state = PlayerStateFree;
	
	//if (walkAwayTime <= 0) state = PlayerStateFree;
	
	sprite_index = spriteRun;
	
	PlayerAnimateSprite();
	
	//hSpeed = lengthdir_x(inputMagnitude * _moveSpeed, inputDirection);
	//vSpeed = lengthdir_y(inputMagnitude * _moveSpeed, inputDirection);

	//PlayerCollision();

	////Update Sprite Index
	//var _oldSprite = sprite_index;
	//if (inputMagnitude != 0) {
	//	direction = inputDirection;
	//	sprite_index = spriteRun;
	//} else sprite_index = spriteIdle;
	//if (_oldSprite != sprite_index) localFrame = 0;

	////Update Image Index
	//PlayerAnimateSprite();
		
}











