function RoomTransition(_type, _target){
	/// @desc RoomTransition(type, targetroom)
	/// @arg Type
	/// @arg Targetroom
	
	if (!instance_exists(oTransition)) {
		with (instance_create_depth(0,0,-9999,oTransition)) {
			type	= _type;
			target	= _target;
		}
	}else MSG("Trying to transition while transition is happening!");
}