function FreezeEntities(){

	with (pEnemy){
		state = ENEMYSTATE.WAIT;
		image_speed = 0;
	}
	
}


function UnfreezeEntities(){

	with (pEnemy){
		state = defaultState;
		image_speed = 1;
	}

}