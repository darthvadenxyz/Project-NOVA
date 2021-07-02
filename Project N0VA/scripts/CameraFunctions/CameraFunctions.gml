function ScreenShake(_magnitude, _frames){
	/// @desc ScreenShake (magnitude,frames)
	/// @arg Magnitude sets the strength of the shake (distance range)
	/// @arg Frames sets the length of the shake in frames (60 = 1 second)
	
	with (global.iCamera){
		if (_magnitude > shakeRemain){
			shakeMagnitude	= _magnitude;
			shakeRemain		= shakeMagnitude;
			shakeLength		= _frames;
		}
	}
}