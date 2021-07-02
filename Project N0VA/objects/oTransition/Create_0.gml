/// @desc Enums + Setup

enum TRANS_TYPE { //different types of transitions
	SLIDE,
	FADE,
	PUSH,
	STAR,
	WIPE
}

width		= RESOLUTION_W;
height		= RESOLUTION_H;
downtime	= 20; //frames of black between transition
heightHalf	= (height * 0.5) + downtime;
percent		= 0;
leading		= OUT;