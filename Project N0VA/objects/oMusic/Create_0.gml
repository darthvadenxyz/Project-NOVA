state			= eMusicStates.quiet;
stateWanted		= state;
currentSound	= -1;

timer			= 0;
timeTilSwitch	= 0;//room_speed;

introLength		= global.music[state][eMusicStats.introLength];
loopLength		= global.music[state][eMusicStats.loopLength];
totalLength		= introLength + loopLength;