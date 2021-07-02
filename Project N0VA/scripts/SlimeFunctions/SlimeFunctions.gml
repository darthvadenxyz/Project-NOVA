function SlimeWander(){

	sprite_index = sprMove;
	
	//At destination or given up?
	if ((x == xTo) && (y == yTo)) || (timePassed > enemyWanderDistance/enemySpeed) {
		hSpeed = 0;
		vSpeed = 0;
		//End our move animation (keeps slime bounce, even when arriving at destination)
		if (image_index < 1) {
			image_speed = 0.0;
			image_index = 0;
		}
		
		//Set new target Destination
		if (++wait >= waitDuration) {
			wait		= 0;	
			timePassed	= 0;
			dir			= point_direction(x,y,xstart,ystart) + irandom_range(-45, 45);
			xTo			= x +lengthdir_x(enemyWanderDistance, dir);
			yTo			= y +lengthdir_y(enemyWanderDistance, dir);
		}		
	}
	else { //Move towards new destination
		
		timePassed++;
		image_speed			= 1.0;
		var _distanceToGo	= point_distance(x,y,xTo,yTo);
		var _speedThisFrame = enemySpeed;
		
		if (_distanceToGo < enemySpeed) _speedThisFrame = _distanceToGo;
		
		dir		= point_direction(x,y,xTo,yTo);
		hSpeed	= lengthdir_x(_speedThisFrame,dir);
		vSpeed	= lengthdir_y(_speedThisFrame,dir);
		
		if (hSpeed != 0) image_xscale = sign(hSpeed);
		
		//Collision and Movement
		var _collided = EnemyTileCollision();
	}
	
	//Check for Aggro
	if (++aggroCheck >= aggroCheckDuration) {
		aggroCheck = 0;	
		if (instance_exists(oPlayer)) && (point_distance(x,y,oPlayer.x,oPlayer.y) <= enemyAggroRadius) {
			state = ENEMYSTATE.CHASE;
			target = oPlayer;			
		}		
	}
}


function SlimeChase(){
	
	sprite_index = sprMove;
	
	if (instance_exists(target)) {
		xTo = target.x;
		yTo = target.y;
		
		//Move Slime
		var _distanceToGo = point_distance(x,y,xTo,yTo);
		image_speed = 1.0;
		dir = point_direction(x,y,xTo,yTo);
		if (_distanceToGo > enemySpeed) {
			hSpeed = lengthdir_x(enemySpeed, dir);
			vSpeed = lengthdir_y(enemySpeed, dir);
		}
		else {
			hSpeed = lengthdir_x(_distanceToGo, dir);
			vSpeed = lengthdir_y(_distanceToGo, dir);			
		}
		
		//Animate Slime
		if (hSpeed != 0) image_xscale = sign(hSpeed);
		
		//Collision & Movement
		EnemyTileCollision();
		
		//Check if close enough to launch an attack
		if (point_distance(x,y,target.x,target.y) <= enemyAttackRadius){
			state = ENEMYSTATE.ATTACK;
			sprite_index = sprAttack;
			image_index = 0;
			image_speed = 1;
			//---target 8pixel past the player
			xTo += lengthdir_x(8, dir);
			yTo += lengthdir_y(8, dir);
		}
	}		
}


function SlimeAttack(){
	//----------This particular function is specific to the slime enemy we brought in, refering to things like the 6 frame 
	//			we have set up. But by understanding how this works you should be able to better understand how to do
	//			more universal enemy logic
	
	//How Fast To Move
	var _spd = enemySpeed;
	
	//Don't move while still getting ready to jump
	if (image_index < 2) _spd = 0;
	
	//Freeze animation while in mid-air and also after landing finishes
	if (floor(image_index) == 3) || (floor(image_index) == 5) image_speed = 0; 
	
	//How far we have to jump
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	
	//Begin landing end of the animation once we are nearly done
	if (_distanceToGo < 4) && (image_index < 5) image_speed = 1;

	//Move
	if (_distanceToGo > _spd){
		dir = point_direction(x,y,xTo,yTo);	
		hSpeed = lengthdir_x(_spd,dir);
		vSpeed = lengthdir_y(_spd,dir);
		if (hSpeed != 0) image_xscale = sign(hSpeed);
		
		//Commit to move and stop moving if we hit a wall
		if (EnemyTileCollision() == true){
			xTo = x;
			yTo = y;
		}		
	} 
	else{
		x = xTo;
		y = yTo;
		if (floor(image_index) == 5){
			stateTarget = ENEMYSTATE.CHASE;	
			stateWaitDuration = 15;
			state = ENEMYSTATE.WAIT;
		}		
	}
}
	
	
function SlimeHurt(){
	
	//Set Sprite
	sprite_index	= sprHurt;
	
	//Knockback
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	if (_distanceToGo > enemySpeed){
		image_speed = 1.0;
		dir			= point_direction(x,y,xTo,yTo);
		hSpeed		= lengthdir_x(enemySpeed, dir);
		vSpeed		= lengthdir_y(enemySpeed, dir);
		
		//face the correct way, which is the opposite way the enemy is bouncing
		if (hSpeed != 0) image_xscale = -sign(hSpeed);	
		
		//Collide & Move, if theres a collision, then stop knockback
		if (EnemyTileCollision()){
			xTo = x;
			yTo = y;
		}	
	}
	//Reset Enemy after Hit/Knockback
	else{
		x = xTo;
		y = yTo;
		if (statePrevious != ENEMYSTATE.ATTACK) state = statePrevious; else state = ENEMYSTATE.CHASE;
	}
	
}


function SlimeDie(){
	
	sprite_index = sprDie;
	image_speed = 1.0;
	
	//Move with Knockback
	var _distanceToGo = point_distance(x,y,xTo,yTo);	
	if (_distanceToGo > enemySpeed){
		dir			= point_direction(x,y,xTo,yTo);
		hSpeed		= lengthdir_x(enemySpeed, dir);	
		vSpeed		= lengthdir_y(enemySpeed, dir);
		if (hSpeed != 0) image_xscale = -sign(hSpeed);
		
		//Collide & Move
		EnemyTileCollision();
	}
	else{
		x = xTo;	
		y = yTo;
	}
	
	//If animation is over, destroy instance (Bobby Note: Make this a function?) //Made into function: AnimationEnd();
	if (AnimationEnd()){
		instance_destroy();	
	}
	
}