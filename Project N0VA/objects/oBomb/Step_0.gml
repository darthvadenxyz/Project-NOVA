//Inherit from Parent (just in case we add something to parent object)
event_inherited();

if (!global.gamePaused){
	
	//Reduce Timer
	bombTick--;
	
	//Check if we are going to flash
	if (bombTick == 0){
		
		//Set Flash Opacity
		flash = 0.75;
		
		//Move to next entry of Array
		bombStage++;
		bombTick = bombTickRate[bombStage];
	}
	
	//Time to Explode
	if (bombTick < 0){
		
		//Force Bomb onto floor (if in air when exploding, this can be changed if you want midair explosion)
		y -= z;
		
		//If exploding in players hand
		if (lifted){
			PlayerDropItem();
		}
		
		//Destroy Bomb
		instance_destroy();
	}
	
}