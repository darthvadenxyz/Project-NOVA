function PurchaseItem(_item, _amount, _cost){

	// Player has enough money
	if (global.playerMoney >= _cost) {
		global.playerHasAnyItems			= true;
		global.playerItemUnlocked[_item]	= true;
		global.playerAmmo[_item]			+= _amount;
		global.playerMoney					-= _cost;
		global.playerEquipped				= _item;
		
		// Destroy Item on shelf
		if (activate.oneTimeBuy) instance_destroy(activate);
		
		// Find which description to show
		var _desc = "";
		switch(_item){
			case ITEM.BOW: _desc = "The Bow!\nFire with the activate key to hurt enemies,\nfind ammo in the world."; break;	
			case ITEM.BOMB: _desc = "Bombs!\nActivate to light the fuse, then again to throw.\nBlast away enemies,rocks, and even boulders."; break;	
			case ITEM.HOOK: _desc = "The Grappling Hook!\nActivate to hook things towards you\nor you towards things."; break;	
			default: _desc = "No item description found."; break;	
		}
		
		// Show selected description
		NewTextBox(_desc, 1);
		
	}
	
	// Player does not have enough money
	else {
		NewTextBox("Not enough money...", 1);
	}

}