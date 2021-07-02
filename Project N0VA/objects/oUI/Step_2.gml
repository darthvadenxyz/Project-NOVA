/// @description Animation Curve Logic

if (!showIndication) playAnimationCurve = true;

//'CHECK' Slide In
if (showIndication) && (playAnimationCurve){
	var getChannel = animcurve_get_channel(cSlideIn, "SlideIn");
	var graphValue = animcurve_channel_evaluate(getChannel,animCurvegraphX)

	animCurvePositionX = animCurvestartX + graphValue;

	animCurvegraphX += animCurveSpd;
	if (animCurvegraphX >= 1) {
		animCurvegraphX		= 0;
		playAnimationCurve	= false;
	}
} 
else {
	animCurvePositionX = animCurvestartX;	
}
