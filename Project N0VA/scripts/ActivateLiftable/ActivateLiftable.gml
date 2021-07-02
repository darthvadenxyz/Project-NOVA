function ActivateLiftable(_id){
	/// arg id
	if (global.iLifted == noone){
		PlayerActOutAnimation(sPlayerLift);	
		
		spriteIdle	= sPlayerCarrying;
		spriteRun	= sPlayerRunCarrying;
		
		global.iLifted = _id;
		with (global.iLifted){
			lifted		= true;	
			persistent	= true;
		}
		
	}
}