/// @description Hit Things
var _entity = instance_place(x, y, pEntity);
var _break	= false;

//Are we colliding with something?
if (_entity != noone) {
	with (_entity) {
		//Is this thing an enemy?
		if (object_is_ancestor(object_index, pEnemy)) {
			var _damage = 5
			HurtEnemy(id, _damage, other.id, 20);
			_break = true;
		}
		else {
			//Was this a different entity with a hitScript?
			if (entityHitScript != -1) {
				script_execute(entityHitScript);
				_break = true;
			}
		}	
	}	
	
	if (_break) instance_destroy();
	
}

//destroy is we leave the camera bounds
var _cam	= view_camera[0];
var _camX	= camera_get_view_x(_cam);
var _camY	= camera_get_view_y(_cam);
if (!point_in_rectangle(x, y, _camX, _camY, _camX+camera_get_view_width(_cam), _camY+camera_get_view_height(_cam))) {
	instance_destroy();	
}