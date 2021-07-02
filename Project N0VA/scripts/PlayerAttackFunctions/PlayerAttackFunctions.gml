function AttackSlash(){
	
	// Attack just started
	if (sprite_index != sPlayerAttackSlash){
		//Set up correct animation
		sprite_index	= sPlayerAttackSlash;
		localFrame		= 0;
		image_index		= 0;
		
		//Clear hit list
		if (!ds_exists(hitByAttack, ds_type_list)) hitByAttack = ds_list_create();
		ds_list_clear(hitByAttack);
	}
	
	//var _hbDir = sPlayerAttackSlashHBR;
	//if (CARDINAL_DIR == 0) _hbDir = sPlayerAttackSlashHBR;
	//if (CARDINAL_DIR == 1) _hbDir = sPlayerAttackSlashHBU;
	//if (CARDINAL_DIR == 2) _hbDir = sPlayerAttackSlashHBL;
	//if (CARDINAL_DIR == 3) _hbDir = sPlayerAttackSlashHBD;
	
	CalcAttack(sPlayerAttackSlashHB);
	
	// Update Sprite
	PlayerAnimateSprite();
	
	if (animationEnd){
		state			= PlayerStateFree;	
		animationEnd	= false;
	}
}

function AttackSpin(){

}

function CalcAttack(_hitbox){
	// Use attack hitbox & check for hits
	mask_index = _hitbox;
	
	var _hitByAttackNow = ds_list_create();
	var _hits = instance_place_list(x, y, pEntity, _hitByAttackNow, false);
	if (_hits > 0){
		for (var i = 0; i < _hits; i++){
			
			// If this instance has not yet been hit by this attack, hit it.
			var _hitID = _hitByAttackNow[| i];
			if (ds_list_find_index(hitByAttack, _hitID) == -1) { 
				ds_list_add(hitByAttack, _hitID);	
				with (_hitID) { 
					// What to do with object we have hit
					if (object_is_ancestor(object_index, pEnemy)) {
						HurtEnemy(id, 5, other.id, 10);	
					}
					else if (entityHitScript != -1) script_execute(entityHitScript);
				}
			} 
		}
	}
	
	ds_list_destroy(_hitByAttackNow);
	// Restore original mask
	mask_index = defaultIdle;
	
}

function HurtEnemy(_enemy, _damage, _source, _knockback){
	// Damage Enemy
	with (_enemy){
		if (state != ENEMYSTATE.DIE){
			enemyHP -= _damage;
			flash	= 1;
			
			// Hurt or Dead?
			if (enemyHP <= 0){
				state = ENEMYSTATE.DIE;	
			}
			else{
				if (state != ENEMYSTATE.HURT) statePrevious = state;
				state = ENEMYSTATE.HURT;
			}
			
			// Set image index to Zero so it doesn't jump into a random frame
			image_index = 0;
			
			// Deal knockback
			if (_knockback != 0){
				var _knockDirection = point_direction(x,y,(_source).x, (_source).y);
				xTo = x - lengthdir_x(_knockback, _knockDirection);
				yTo = y - lengthdir_y(_knockback, _knockDirection);
			}
		}
	}

}