/// @description Set attack related vars
if (sprite_index == spr_attack1_left || sprite_index == spr_attack1_right) {
	attackIndex++;
	isAttacking = false;
}
if (sprite_index == spr_attack2_left || sprite_index = spr_attack2_right) {
	attackIndex++;
	isAttacking = false;
}
if (sprite_index == spr_attack3_left || sprite_index == spr_attack3_right) {
	attackIndex = 0;
	isAttacking = false;
}
if ((sprite_index == spr_jump2_left || sprite_index == spr_jump2_right) && !grounded) {
	show_debug_message("Switching sprite index to fall");
	// Set jump anims to false
	jump1right = false;
	jump1left = false;
	jump2right = false;
	jump2left = false;
	if (faceRight) {
		sprite_index = spr_fall_right;	
	}
	else {
		sprite_index = spr_fall_left;	
	}
}

if (sprite_index == spr_laser_left || sprite_index == spr_laser_right) {
	isAttacking = false;
	isFiring = false;
}

if (sprite_index == spr_dashAttack_left || sprite_index == spr_dashAttack_right) {
	//show_message("Ending dash animation");
	isAttacking = false;	
	isDashing = false;
	
	// Delete hitBox
	if (instance_exists(obj_dashBox)) {
		instance_destroy(obj_dashBox);	
	}
}

if (sprite_index == spr_groundPound_left || sprite_index == spr_groundPound_right) {
	isAttacking = false;	
}

if (sprite_index == spr_air_right || sprite_index == spr_air_left) {
	isAttacking = false;	
	if (instance_exists(obj_airBox)) {
		instance_destroy(obj_airBox);	
	}
}

if (sprite_index == spr_perish_left || sprite_index == spr_perish_right) {
	image_speed = 0;
	var myScore = instance_create_depth(x, y, 0, obj_name);
	// room_goto(rm_menu_test);
}
