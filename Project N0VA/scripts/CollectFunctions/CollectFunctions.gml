function CollectCoins(_amount){
	global.playerMoney += _amount;
}


function CollectAmmo(_array){
	//_array = [type, amount]
	global.playerAmmo[_array[0]] += _array[1];
}


function CollectHealth(_amount) {
	global.playerHealth = Approach(global.playerHealth, global.playerHealthMax, _amount);
}