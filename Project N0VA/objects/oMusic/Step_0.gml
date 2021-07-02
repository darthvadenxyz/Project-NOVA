#region Play Music Based on State

if (state != stateWanted){
	
	//Stop current sound (if one is playing) - only runs once in this block of code
	if (timer == 0) && (currentSound != -1) audio_stop_sound(currentSound);
	
	timer++;
	
	if (timer >= timeTilSwitch){
		
		state = stateWanted;
		var _songToPlay = global.music[state][eMusicStats.song];
		var _loopsOrNot = global.music[state][eMusicStats.loops];
		introLength		= global.music[state][eMusicStats.introLength];
		loopLength		= global.music[state][eMusicStats.loopLength];
		totalLength		= introLength + loopLength;
		
		currentSound = audio_play_sound(_songToPlay, 1, _loopsOrNot);
		
		timer = 0;
	}	
}

#endregion

//Loop Music
var _songPosition	= audio_sound_get_track_position(currentSound);
if ((_songPosition > totalLength)) {
	audio_sound_set_track_position(currentSound, _songPosition - loopLength);	
	//MSG("Song looped")
}