function AnimationEnd(){
	var _ended = false;
		
	if (image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) >= image_number){
		_ended = true;	
	}
		
	return _ended; 
}