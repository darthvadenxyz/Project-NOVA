if (global.drawGui){

	//Draw Dropshadow
	if (drawFirstSprite) draw_sprite_ext(sprite, index, xCurrent+dropShadow, global.camY+dropShadow, xscale, image_yscale, 0, c_black, fadeCurrent);
	//Draw Portrait
	if (drawFirstSprite){
		//draw_sprite_ext(sprite, index, xx, y, xscale, image_yscale, 0, color, image_alpha);
		DrawOutlinedSprite(sprite, index, xCurrent, global.camY, xscale, image_yscale, 0, 0, c_black, color, fadeCurrent);
		//DrawOutlinedSprite(sprite, index, xCurrent, global.camY, xscale, image_yscale, 1, 0, c_black, color, fadeCurrent);
	}

}