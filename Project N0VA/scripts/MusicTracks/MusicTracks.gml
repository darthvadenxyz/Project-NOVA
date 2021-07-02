function MusicTracks(){

	enum eMusicStates {
		quiet,
		//battle,
		//boss,
		//victory,
		//intro,
	}
	
	enum eMusicStats {
		song,
		loops,
		introLength,
		loopLength	
	}
	
	global.music[eMusicStates.quiet][eMusicStats.song]					= mBlank; //Song File
	global.music[eMusicStates.quiet][eMusicStats.loops]					= false;
	global.music[eMusicStates.quiet][eMusicStats.introLength]			= -1;
	global.music[eMusicStates.quiet][eMusicStats.loopLength]			= -1;
	
}