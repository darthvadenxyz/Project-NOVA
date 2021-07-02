function Chance(_outOfOne){
	/// @description Chance(outOfOne)
	/// @param outOfOne
 
	// Returns true or false depending on RNG
	// ex:
	//      Chance(0.7);    -> Returns true 70% of the time
 
	return _outOfOne > random(1);
}

