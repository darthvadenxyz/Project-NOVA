// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ShopItemText(_itemImageIndex){
	
	// Change Global Script
	global.dialogueScript = ShopItemText;
	
	// Setup Variables
	var bg			= TEXTBOX_COLOR;
	
	switch(_itemImageIndex) {
	
		// Empty Item Slot
		case 0:{
			NewTextBox("description", bg, ["4:Purchase", "5:No Thanks"])	
		} break;
		
		// Bomb
		case 1: {
			NewTextBox("Bombs (Cost: 10g)\nFor blowing things up!",
						bg, ["4:Purchase", "5:No Thanks"]);
		} break;
		
		// Bow
		case 2: {
			NewTextBox("Bow and Arrows (Cost: 15g)\nFor all of your archery needs!",
						bg, ["4:Purchase", "5:No Thanks"]);			
		} break;		
		
		// Hook
		case 3: {
			NewTextBox("Grappling Hook (Cost: 25g)\nFor crossing gaps and grabbing things!",
						bg, ["4:Purchase", "5:No Thanks"]);			
		} break;		
		
		// Purchase Item
		case 4: {
			PurchaseItem(activate.item, activate.itemAmount, activate.itemCost);
		} break;
		
		// Don't Purchase Item
		case 5: break;
		
		// Default
		default: break;
	
	}
	
}