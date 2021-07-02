flash	= max(0, flash-0.05);
fric	= 0.05;
if (z == 0)	fric = 0.10;

// Magnetise to the player
if (instance_exists(oPlayer)){
	var _px		= oPlayer.x;	
	var _py		= oPlayer.y;
	var _dist	= point_distance(x, y, _px, _py);
	var _range	= 12; //								<=== If you want to vary the range, set as a variable in each collectable
	
	// Magnet Radius
	if (_dist < _range){
		spd			+= 0.25; //									<=== Acceleration of Collectible						
		direction	= point_direction(x, y, _px, _py); //		<=== Direction Collectible moves (towards player)
		spd			= min(spd, 3); //							<=== Max Speed Collectible can reach
		fric		= 0; //										<=== No Friction during this magnetisation
		
		// Collect Radius
		if (_dist < 5){	//											<=== Collect the collectable 
			
			// Does the collectable script have arguments [ie: picking up a pack of something]
			if (collectScriptArg != -1){							
				script_execute(collectScript, collectScriptArg);	
			}
			// No arguments
			else{
				if (collectScript != -1) script_execute(collectScript)		;		
			}
			
			// Destroy The Collectable
			instance_destroy()
			
		}
	}
	
}

// Bounce
if (bounceCount != 0){
	bounce += (pi * bounceSpeed);	
	if (bounce > pi){
		bounce			-= pi;
		bounceHeight	*= bounceReduction; //reduces bounce on next cycle
		bounceCount--;
	}
	z = sin(bounce) * bounceHeight;
}
else z = 0;

// Commit to moving in a speed and directino
x	+= lengthdir_x(spd, direction);
y	+= lengthdir_y(spd, direction);
spd		= max(spd-fric, 0);
depth	= -bbox_bottom;