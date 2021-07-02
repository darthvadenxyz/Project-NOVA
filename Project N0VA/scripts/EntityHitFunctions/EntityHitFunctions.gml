// Attack collides with something that is instantly destroyed
function EntityHitDestroy(){
	instance_destroy();
}

// Attack collides with something solid that cannot be destoryed
function EntityHitSolid(){
	flash = 0.5; //Opacity
}