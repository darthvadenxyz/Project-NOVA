/// @description Display Interaction Symbol

//Show Interaction Indication
if (showIndication && oPlayer.state == PlayerStateFree){
	draw_sprite(sIndicationSymbols, indicationType, indicationX, indicationY + animCurvePositionX);
	//draw_sprite(spr_indication_symbols, indicationType, indicationX + animCurvePositionX, indicationY);
	//draw_sprite(spr_check_mini, indicationType, indicationX + animCurvePositionX, global.camY);
}