/// @description Set up Camera
cam				= view_camera[0];
follow			= oPlayer;
followSpeed		= 1;
viewWidthHalf	= camera_get_view_width(cam) * 0.5;
viewHeightHalf	= camera_get_view_height(cam) * 0.5;
xTo				= xstart;
yTo				= ystart;

// Set Camera Size
currentWidth = camera_get_view_width(cam);
currentHeight = camera_get_view_height(cam);
camW = camera_get_view_width(cam);
camH = camera_get_view_height(cam);

// Where is the camera currently located? (for UI)
camCurrentX		= xstart - viewWidthHalf;		
camCurrentY		= ystart - viewHeightHalf;		

// Screenshake
shakeLength		= 0;
shakeMagnitude	= 0;
shakeRemain		= 0;
shakeBuffer		= TILE_SIZE;