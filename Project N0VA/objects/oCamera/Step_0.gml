/// @description Update Camera

//Update Destination
if (instance_exists(follow)){
	xTo = follow.x;	
	yTo = follow.y;
}

//Update Object Position
x += (xTo - x) / followSpeed;
y += (yTo - y) / followSpeed;

//Keep camera center inside room
x = clamp(x, viewWidthHalf+shakeBuffer, room_width-viewWidthHalf-shakeBuffer);
y = clamp(y, viewHeightHalf+shakeBuffer, room_height-viewHeightHalf-shakeBuffer);

//Screenshake
x += random_range(-shakeRemain,shakeRemain);
y += random_range(-shakeRemain,shakeRemain);
shakeRemain = max(0, shakeRemain - ((1/shakeLength)*shakeMagnitude));

//Get New Camera Position
camCurrentX	= x - viewWidthHalf;
camCurrentY = y - viewHeightHalf;

//Update Camera
camera_set_view_pos(cam, camCurrentX, camCurrentY);