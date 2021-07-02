/// @description Draw UI

// Draw Life Text
draw_sprite(sLifeText, 0, healthPositionX + 17, healthPositionY);

//Draw Health
var _playerHealth		= global.playerHealth;
var _playerHealthMax	= global.playerHealthMax;
var _playerHealthFrac	= frac(_playerHealth);

_playerHealth -= _playerHealthFrac;

//Get Heart Total 
for (var i = 1; i <= _playerHealthMax; i++){
	var _imageIndex = (i > _playerHealth);				//<====	Draw Full Hearts
	if (i == _playerHealth +1){							//<==== Draw fractions of Hearts using the variable in _playerHealthFrac
		_imageIndex += (_playerHealthFrac > 0);					//<==== Draw 1/4th of a heart
		_imageIndex += (_playerHealthFrac > 0.25);				//<==== Draw 1/2th of a heart
		_imageIndex += (_playerHealthFrac > 0.5);				//<====	Draw 3/4th of a heart
	}
	
	//Draw hearts to screen
	draw_sprite(sHealthSmall, _imageIndex, healthPositionX + ((i-1) * healthSpacing), healthPositionY);
}

//Coins
var _xx,_yy;

//Coin Icon
_xx = RESOLUTION_W/2;
_yy = 6;
draw_sprite(sCoinUI, 0, _xx, _yy);

//Coin Text
DrawSetText(c_black, fAmmo, fa_left, fa_top);
_xx += (sprite_get_width(sCoinUI) / 2) -1;
_yy = 10;
var _str = string(global.playerMoney);
DrawOutlinedText(_xx, _yy, 1, _str, c_black, c_white);

//Draw Item Box
var _itemUIBox = sActionUIBox;
_xx = RESOLUTION_W - 65;
_yy = 6;
draw_sprite(_itemUIBox, 0, _xx, _yy);

// Check for control scheme
switch (global.controlScheme) {
	
	case CONTROLSCHEME.KEYBOARD: {
		controlSprite = sButtonsKeyboard;
	} break;

	case CONTROLSCHEME.CONTROLLER: {
		controlSprite = sButtonsController;
	} break;
	
	default: break;
}

// Draw "Key" Letter
DrawSetText(c_black, fText, fa_center, fa_middle);
//DrawOutlinedTextWithCorners(_xx +1, _yy + sprite_get_height(_itemUIBox) - 4, 1, "B", c_black, c_white);
draw_sprite(controlSprite, 3, _xx, _yy + sprite_get_height(_itemUIBox));

// Draw Item Icons & Ammo
if (global.playerHasAnyItems) {
	draw_sprite(sItemUI, global.playerEquipped, _xx + 2, _yy + 2);
	if (global.playerAmmo[global.playerEquipped] != -1) {
		DrawSetText(c_black, fAmmo, fa_right, fa_bottom);
		DrawOutlinedText(_xx + sprite_get_width(_itemUIBox) + 1, _yy + sprite_get_height(_itemUIBox) -12, 1, string(global.playerAmmo[global.playerEquipped]), c_black, c_white);
	}
}

//Draw Action Box
_xx = RESOLUTION_W - 38;
draw_sprite(_itemUIBox, 0, _xx, _yy);

// Draw "Key" Letter
DrawSetText(c_black, fText, fa_center, fa_middle);
//DrawOutlinedTextWithCorners(_xx +1, _yy + sprite_get_height(_itemUIBox) - 4, 1, "A", c_black, c_white);
draw_sprite(controlSprite, 0, _xx, _yy + sprite_get_height(_itemUIBox));

// Draw Action Icon
draw_sprite(sActionUI, actionCommand, _xx + 1, _yy + 1);

