function NewPortrait(_spr, _index, _xx, _color, _xscale, _first){
	/// Script for 2 Character Portraits
	/// @arg Sprite
	/// @arg Index
	/// @arg x
	/// @arg Color
	/// @arg Xscale
	/// @arg First? //Change to "state"
	
	var _obj;
	
	if (instance_exists(oPortrait)){
		_obj = oPortraitQueued; 
		//_firstPortrait = false;
	}
	else{
		_obj = oPortrait;	
		//_firstPortrait = true;
	}
	
	with (instance_create_layer(0,0,"GuiPortrait",_obj)){
		if (_spr == undefined){
			drawFirstSprite = false;	
			xx				= 0;
			xscale			= 0;
			portraitStartup = false
		}
		else {
			drawFirstSprite = true;
			sprite			= _spr;
			index			= _index;
			xx				= _xx;
			color			= _color;
			xscale			= _xscale;
			portraitStartup = _first;
		}
	}
}