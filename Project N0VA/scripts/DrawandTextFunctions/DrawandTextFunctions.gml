// Divides an image into 9 pieces and streches them out to form a textbox
function NineSliceBoxStretched(_sprite, _x1, _y1, _x2, _y2, _index){ 
	///@desc NineSliceBoxStretched(sprite, x1, y1, x2, y2)
	///@arg sprite
	///@arg x1 left
	///@arg y1 top
	///@arg x2 right
	///@arg y2 bottom
	///@arg index image index

	var _size = sprite_get_width(_sprite) / 3;
	var _w = _x2 - _x1;
	var _h = _y2 - _y1

	//MIDDLE
	draw_sprite_part_ext(_sprite, _index, _size, _size, 1, 1, _x1 + _size,_y1 + _size, _w - (_size * 2), _h - (_size * 2), c_white,1);

	//CORNERS
	//TOP LEFT
	draw_sprite_part(_sprite, _index, 0, 0, _size, _size, _x1, _y1);
	//TOP RIGHT
	draw_sprite_part(_sprite, _index, _size * 2, 0, _size, _size, _x1 + _w - _size, _y1);
	//BOTTOM LEFT
	draw_sprite_part(_sprite, _index, 0, _size * 2, _size, _size, _x1, _y1 + _h - _size);
	//BOTTOM RIGHT
	draw_sprite_part(_sprite, _index, _size * 2, _size * 2, _size, _size, _x1 + _w - _size, _y1 + _h - _size);

	//EDGES
	//LEFT
	draw_sprite_part_ext(_sprite, _index, 0, _size, _size, 1, _x1, _y1 + _size, 1, _h - (_size * 2), c_white, 1);
	//RIGHT
	draw_sprite_part_ext(_sprite, _index, _size * 2, _size, _size, 1, _x1 + _w - _size, _y1 + _size, 1, _h - (_size * 2), c_white, 1);
	//TOP
	draw_sprite_part_ext(_sprite, _index, _size, 0, 1, _size, _x1 + _size, _y1, _w - (_size * 2), 1, c_white, 1);
	//BOTTOM
	draw_sprite_part_ext(_sprite, _index, _size, _size * 2, 1, _size, _x1 + _size, _y1 + _h - (_size), _w - (_size * 2), 1, c_white,1);
}

// Sets all parameters for the draw_text() function
function DrawSetText(_color, _font, _halign, _valign){
	/// @desc DrawSetText(color,font,halign,valign)
	/// @arg color
	/// @arg font
	/// @arg halign
	/// @arg valign

	// Allows one line setup of major text drawing variables.
	// Requiring all four variables prevents silly coders from forgetting one.
	// And therefore creating a dumb dependency on other event calls.
	// (Then wondering why their text changes later in development.)

	draw_set_color(_color);
	draw_set_font(_font);
	draw_set_halign(_halign);
	draw_set_valign(_valign);
}
	
// Draw Text with an offset going up/down/left/right
function DrawOutlinedText(_xx, _yy, _offset, _text, _outcolor, _incolor){
	/// @arg x
	/// @arg y
	/// @arg offset
	/// @arg text
	/// @arg outerColor
	/// @arg innerColor

	draw_set_color(_outcolor);
	var _lineSpacing	= LINE_SPACING;
	var _maxWidth		= RESOLUTION_W-20;
	
	draw_text_ext(_xx-_offset, _yy, _text, _lineSpacing, _maxWidth);
	draw_text_ext(_xx+_offset, _yy, _text, _lineSpacing, _maxWidth);
	draw_text_ext(_xx, _yy-_offset, _text, _lineSpacing, _maxWidth);
	draw_text_ext(_xx, _yy+_offset, _text, _lineSpacing, _maxWidth);
	//draw_text_ext(_xx-_offset, _yy-_offset, _text, _lineSpacing, _maxWidth);
	//draw_text_ext(_xx+_offset, _yy-_offset, _text, _lineSpacing, _maxWidth);
	//draw_text_ext(_xx-_offset, _yy+_offset, _text, _lineSpacing, _maxWidth);
	//draw_text_ext(_xx+_offset, _yy+_offset, _text, _lineSpacing, _maxWidth);
	draw_set_color(_incolor);
	draw_text_ext(_xx,_yy, _text, _lineSpacing, _maxWidth);
}

// Same as above but also draws the offset diagonally
function DrawOutlinedTextWithCorners(_xx, _yy, _offset, _text, _outcolor, _incolor){
	/// @arg x
	/// @arg y
	/// @arg offset
	/// @arg text
	/// @arg outerColor
	/// @arg innerColor

	draw_set_color(_outcolor);
	var _lineSpacing	= LINE_SPACING;
	var _maxWidth		= RESOLUTION_W-20;
	
	draw_text_ext(_xx-_offset, _yy, _text, _lineSpacing, _maxWidth);
	draw_text_ext(_xx+_offset, _yy, _text, _lineSpacing, _maxWidth);
	draw_text_ext(_xx, _yy-_offset, _text, _lineSpacing, _maxWidth);
	draw_text_ext(_xx, _yy+_offset, _text, _lineSpacing, _maxWidth);
	draw_text_ext(_xx-_offset, _yy-_offset, _text, _lineSpacing, _maxWidth);
	draw_text_ext(_xx+_offset, _yy-_offset, _text, _lineSpacing, _maxWidth);
	draw_text_ext(_xx-_offset, _yy+_offset, _text, _lineSpacing, _maxWidth);
	draw_text_ext(_xx+_offset, _yy+_offset, _text, _lineSpacing, _maxWidth);
	draw_set_color(_incolor);
	draw_text_ext(_xx,_yy, _text, _lineSpacing, _maxWidth);
}

// Draw Sprite with a colored offset around it in 8 directions
function DrawOutlinedSprite(_sprite, _index, _x, _y, _xscale, _yscale, _offset, _rotation, _outcolor, _incolor, _alpha){
	/// @arg sprite
	/// @arg index
	/// @arg x
	/// @arg y
	/// @arg xscale
	/// @arg yscale
	/// @arg offset
	/// @arg rotation
	/// @arg outerColor
	/// @arg innerColor
	/// @arg imageAlpha
	
	//Outline
	draw_sprite_ext(_sprite, _index, _x+_offset, _y, _xscale, _yscale, _rotation, _outcolor, _alpha);
	draw_sprite_ext(_sprite, _index, _x-_offset, _y, _xscale, _yscale, _rotation, _outcolor, _alpha);
	draw_sprite_ext(_sprite, _index, _x, _y+_offset, _xscale, _yscale, _rotation, _outcolor, _alpha);
	draw_sprite_ext(_sprite, _index, _x, _y-_offset, _xscale, _yscale, _rotation, _outcolor, _alpha);
	draw_sprite_ext(_sprite, _index, _x+_offset, _y+_offset, _xscale, _yscale, _rotation, _outcolor, _alpha);
	draw_sprite_ext(_sprite, _index, _x+_offset, _y-_offset, _xscale, _yscale, _rotation, _outcolor, _alpha);
	draw_sprite_ext(_sprite, _index, _x-_offset, _y+_offset, _xscale, _yscale, _rotation, _outcolor, _alpha);
	draw_sprite_ext(_sprite, _index, _x-_offset, _y-_offset, _xscale, _yscale, _rotation, _outcolor, _alpha);
	//Draw Sprite
	draw_sprite_ext(_sprite, _index, _x+_offset, _y, _xscale, _yscale, _rotation, _incolor, _alpha);
}

// Draws a Textbox to the screen
function NewTextBox(_message, _background = 0, _responses, _nameplate, _vo = -1){
	/// @arg Message
	/// @arg Background
	/// @arg [Responses]
	
	var _obj;
	if (instance_exists(oText)) _obj = oTextQueued; else _obj = oText;
	
	with (instance_create_layer(0,0, "Instances",_obj)){
		
		#region CHECK TEXT FOR SPECIAL CHARACTERS
		
		/*
			[ - Conversation case number gets set to the number that comes after this
		*/
		var _textToCheck = _message;
		
		
		for (var _char = 1; _char <= string_length(_textToCheck); _char++){
			
			#region CHANGE Conversation Dialogue "["
			
			// CHANGE ConvoDialogue Case number "["
			if (string_char_at(_textToCheck, _char) == "["){
				
				// Keep only the numbers in the string to check for case
				var _casenumber = string_digits(_textToCheck);
				var _case		= real(_casenumber);
				ScriptExecuteArray(global.dialogueScript, [_case]);
				//ConversationDialogue(_case);			//BOBBY - SET A GLOBAL VARIABLE HERE SO THAT WE CAN CHECK WHICH DIALOGUE SCRIPT WE'RE IN AND SWITCH WITHIN THAT SPECIFIC SCRIPT
				
				// Delete special character and numbers from string
				_textToCheck	= string_delete(_textToCheck, _char, string_length(_casenumber)+1);
			}
			
			#endregion
	
		}
		
		#endregion
		
		// Display Message after checking through text
		messageText = _textToCheck;
		
		if (instance_exists(other)) originInstance = other.id; else originInstance = noone;
		
		// Background
		background = _background;
		
		// Responses
		if (_responses == undefined) || (_responses == -1){
			responses		= [-1];
			responseScripts = [-1];
		}
		else{
			// trim markers from responses
			responses = _responses;
			for (var i = 0; i < array_length(responses); i++){
				var _markerPosition = string_pos(":", responses[i]);
				responseScripts[i]	= string_copy(responses[i], 1, _markerPosition-1);
				responseScripts[i]	= real(responseScripts[i]);
				responses[i]		= string_delete(responses[i],1,_markerPosition);
			}
		}
		
		// NamePlate
		if (_nameplate == undefined) drawNameplate = false; 
		else {
			drawNameplate	= true;
			chrName			= _nameplate;
		}
		// VoiceOver
		//if (_vo == undefined) voiceline = -1; else voiceline = _vo;
		voiceline = _vo;
	}
	
	with (oPlayer){
		if (state != PlayerStateLocked){
			lastState	= state;
			state		= PlayerStateLocked;
		}
	}
}
