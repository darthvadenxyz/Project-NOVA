/// @description Draw Textbox [no GUI]

if (!global.drawGui){

	var _outline = 2 * SIZE;
	var _nameplateHalfPointH = 62;
	var _nameplateHalfPointV = 24;
	var _boxStartY	= 260;	//Height of the screen minus height of text box

	//Nameplate Position [nudging]
	var nx = 2;
	var ny = 14;

	//Draw nameplate
	if (drawNameplate){
		draw_sprite(sNameplate, background, global.camX+nx, global.camY+_boxStartY+ny);
		DrawSetText(c_black, font, fa_center, fa_center);
		DrawOutlinedText(global.camX+nx+_nameplateHalfPointH, global.camY+ny+_boxStartY-_nameplateHalfPointV-5, _outline, chrName, c_black, c_white);
	}

	//Draw Textbox background

	draw_sprite(sTextBoxBackground, background, global.camX, global.camY+_boxStartY);
	//draw_sprite(spr_textbox_dialogue, background, camX, y1);
	//NineSliceBoxStretched(spr_textbox_background_actionRPG, x1, y1, x2, y2, background);

	DrawSetText(c_black, font, fa_left, fa_top);
	var _print	= string_copy(messageText,1,textProgress);

	var _color	= c_white;

	//Responses
	if (responses[0] != -1) && (textProgress >= string_length(messageText)){
		for (var i = 0;	i < array_length(responses); i++){
			_print += "\n"; //New Line
			if (i == responseSelected){
				_print += "   >> ";
			}
			else{
				_print += "      ";
			}
		
			_print += responses[i];
		}
	}

	var _yBuffer	= 8; //buffer between y borders of text box and the text itself
	DrawOutlinedText(global.camX + 30, global.camY+_boxStartY+_yBuffer, _outline, _print, c_black, _color);
}