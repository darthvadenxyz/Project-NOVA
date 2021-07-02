function GetInputs(){

	keyLeft				= keyboard_check(vk_left) || keyboard_check(ord("A"));
	keyRight			= keyboard_check(vk_right) || keyboard_check(ord("D"));
	keyUp				= keyboard_check(vk_up) || keyboard_check(ord("W"));
	keyDown				= keyboard_check(vk_down) || keyboard_check(ord("S"));
	keyAction			= keyboard_check_pressed(vk_shift);
	keyItem				= keyboard_check_pressed(vk_control);
	keyItemSelectUp		= keyboard_check_pressed(ord("E"));
	keyItemSelectDown	= keyboard_check_pressed(ord("Q"));

}


function DebugInputs(){

	//Activate Debug controls when Q is held
	if (keyboard_check(ord("P"))){
		
		//Game Restart
		if (keyboard_check_pressed(ord("R"))) game_restart();
		
		//Freeze Game
		if (keyboard_check_pressed(vk_escape)) {
			global.gamePaused = !global.gamePaused;
	
			if (global.gamePaused) {
				with (all){
					gamePausedImageSpeed = image_speed;
					image_speed = 0;
				}
			}
			else {
				with (all) {
					image_speed = gamePausedImageSpeed;
				}
			}
		}
		
		//PlayerThoughts Test
		if (keyboard_check_pressed(ord("Y"))){
			PlayerThoughts(0);
		}
	}
}