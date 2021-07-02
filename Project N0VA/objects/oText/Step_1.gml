/// @description Progress Text
lerpProgress += (1 - lerpProgress) / lerpSpeed; //Creates tweening effect, making the animation start fast and slow as it nears the end
textProgress += global.textSpeed;

//VoiceOver
if (!voStarted){
	if (global.voiceActing) audio_play_sound(voiceline, 100, false);	
	voStarted = true;
}

//Cycle through responses
keyUp				= keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
keyDown				= keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
responseSelected	+= (keyDown - keyUp);

//Wrap response selection
var _max = array_length(responses)-1;
var _min = 0;
if (responseSelected > _max) responseSelected = _min;
if (responseSelected < _min) responseSelected = _max;

//End Message
if (oPlayer.keyAction){
	var _messageLength = string_length(messageText);
	if (textProgress >= _messageLength){
		
		// Check for Responsesd
		if (responses[0] != -1) {
			var _script = global.dialogueScript
			with (originInstance) _script(other.responseScripts[other.responseSelected]);	
		}
		
		// Stop Voice Clip
		audio_stop_sound(voiceline);

		// Destroy Current Portraits
		if (instance_exists(oPortrait)){
			instance_destroy(oPortrait);
		}	
		
		//Destory Current Textbox
		instance_destroy();
		
		//Queue Next Portraits
		if (instance_exists(oPortraitQueued)){
			with (oPortraitQueued) ticket--;	
		}
		
		// Queue Next Textbox
		if (instance_exists(oTextQueued)){
			with (oTextQueued) ticket--;	
		}
		else{
			with (oPlayer){
				if (!global.cutscene) state = lastState;	
				else state = PlayerStateLocked;
			}
		}
	}
	else{
		if (textProgress > 2){
			textProgress = _messageLength;
		}
	}
}