/// @description Draw Player & Shadow
draw_sprite(sShadow, 0, x, y);

// Hookshot (before player)
if (state == PlayerStateHook) && (image_index != 3) DrawHookChain();

var _timeBetweenFlashes	= 8;
var _flashDuration		= 2;

if (invulnerable != 0) && ((invulnerable mod _timeBetweenFlashes < _flashDuration) == 0) && (flash == 0){
	// Skip Draw
}
else {
	
	if (flash != 0){
		shader_set(flashShader);
		uFlash = shader_get_uniform(flashShader, "flash");
		shader_set_uniform_f(uFlash, flash);
	}
	
	draw_sprite_ext(
		sprite_index,
		image_index,
		(x),
		(y-z),
		image_xscale,
		image_yscale,
		image_angle,
		image_blend,
		image_alpha
	);
	
	if (shader_current() != -1) shader_reset();
}

//Hookshot (after player) [facing down]
if (state == PlayerStateHook) && (image_index == 3) DrawHookChain();

function DrawHookChain() {
	
	var _originX	= x; //floor(x);
	var _originY	= y-7; //floor(y)-7;		//because player origin is at bottom of sprite;
	
	var _chains		= hook div hookSize; 
	var _hookDirX	= sign(hookX);
	var _hookDirY	= sign(hookY);
	
	//Draw Chain
	for (var i = 0; i < _chains; i++) {
		draw_sprite(
			sHookChain,
			0,
			_originX + hookX - (i * hookSize * _hookDirX),
			_originY + hookY - (i * hookSize * _hookDirY)
		);
	}
	
	//Draw Hook Blade
	draw_sprite(sHookBlade, image_index, _originX+hookX, _originY+hookY);
}