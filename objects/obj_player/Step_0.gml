/// @description Main Player Code
// Debug stuff
// Attmpt to slow game
if (gamepad_button_check_pressed(slot, gp_select)) {
	show_message("Total Index of idle is: " + string(sprite_get_number(spr_idle_left)));	
}
// Set mask across all animations
mask_index = spr_idle_left;
// Movement code
if (global.usingGamePad) {
	key_right = sign(gamepad_axis_value(slot, gp_axislh));
	//key_left = -gamepad_button_check(slot, gp_padl);
	//key_right = gamepad_button_check(slot, gp_padr);
	key_jump = gamepad_button_check_pressed(slot, gp_face1);
}
else { // Player is using the keyboard
	key_right = keyboard_check(ord("D"));
	key_left = -keyboard_check(ord("A"));
	key_jump = keyboard_check_pressed(vk_space);
}

move = key_right + key_left

// Set ground movement animations
if (!isAttacking && grounded) {
	if (move == 0) {
		idling = true;
		moveRight = false;
		moveLeft = false;
	}
	else if (move == 1) {
		moveRight = true;
		moveLeft = false;
		idling = false;
	}
	else if (move == -1) {
		moveLeft = true;
		moveRight = false;
		idling = false;
	}
}

// Set last know facing direction
if (move == 1) {
	faceRight = true;
	faceLeft = false;
}
if (move == -1) {
	faceRight = false;
	faceleft = true;
}

player_hsp = move * moveSpeed;
player_vsp = 0;

// Jump Code
if (key_jump && jump2) {
	isJumping = true;
	// Control the length of the jump
	if (jump1) {
		if (faceRight) {
			jump1right = true;
			jump1left = false;
			jump2right = false;
			jump2left = false;
		}
		else {
			jump1right = false;
			jump1left = true;
			jump2right = false;
			jump2left = false;
		}
	}
	else {
		if (faceRight) {
			jump1right = false;
			jump1left = false;
			jump2right = true;
			jump2left = false;
		}
		else {
			jump1right = false;
			jump1left = false;
			jump2right = false;
			jump2left = true;
		}
	}
	alarm[0] = room_speed * jumpLength;
	if (jump1) {
		jump1 = false;	
	}
	else {
		jump2 = false;	
	}
	
}
if (gamepad_button_check(slot, gp_padd)) {
	show_debug_message("Image Index is: " + string(image_index));	
}

// Set grounded var
if (place_meeting(x, y + 1, obj_floor) && !isJumping) {
	grounded = true;
	// Reset jump animation vars
	jump1right = false;
	jump1left = false;
	jump2right = false;
	jump2left = false;
	// Reset jumps
	jump1 = true;
	jump2 = true;
}
else {
	grounded = false;	
}

// Do stuff based on grounded
if (grounded) {
	// Reset jump
	if (!jump1) {
		jump1 = true;
	}
}

if (isJumping) {
	player_vsp = jumpForce;
	if (jumpForce >= 5) {
		jumpForce += 0.3;	
	}
}

// Gravity
if (!place_meeting(x, y + 1, obj_floor)) {
	player_vsp += player_grav;	
}

// Collision Handler
//Horizontal Collision
if (place_meeting(x + player_hsp, y, obj_floor)){
	while(!place_meeting(x+sign(player_hsp), y, obj_floor)){
		x += sign(player_hsp);	
	}
	player_hsp = 0;
}
//Vertical Collision
if (place_meeting(x, y + player_vsp, obj_floor)){
	while(!place_meeting(x, y+sign(player_vsp), obj_floor)){
		y += sign(player_vsp);	
	}
	player_vsp = 0;
}

// Move the player if they are allowed to move
if (!isAttacking) {
	x += player_hsp;
	y += player_vsp;
}

// =====================COMBAT CODE=======================
// Handle per frame code dealing with combat
if (stomping) {
	player_grav = 50;
	if (grounded) {
		SlowSpeed(obj_player, 10, 0.5);
		Shake(18, 30);
		Zoom(384, 0.5, 0.01, 0.1);
		// Create Hitbox
		if (global.usingGamePad) Rumble(0.8, 1.5);
		player_grav = ori_player_grav;
		stomping = false;
		if (!instance_exists(obj_stompBox)) {
			instance_create_depth(x, y + 216, 0, obj_stompBox);
		}
		else if (instance_exists(obj_stompBox)) {
			instance_destroy(obj_stompBox);
			instance_create_depth(x, y + 216, 0, obj_stompBox);
		}
	}
}
if (global.usingGamePad) {
	// Basic Attack
	if (gamepad_button_check(slot, gp_face3) && grounded && !isAttacking) {
		show_debug_message("Attempting Attack");
		isAttacking = true;
		image_index = 0; // Reset the image index
		// Start ktimer to reset combo
		Shake(1, 10);
		Rumble(0.2, 1);
		
		alarm[4] = attackDelay * room_speed;
		if (attackIndex == 0) {
			show_debug_message("Attack index 0 entered");
			if (faceRight) {
				sprite_index = spr_attack1_right;
				if (!instance_exists(obj_lightBox)) {
					instance_create_depth(x + lightHit_xRange, y + lightHit_yRange, 0, obj_lightBox);
				}
				else if (instance_exists(obj_lightBox)) {
					instance_destroy(obj_lightBox);
					instance_create_depth(x + lightHit_xRange, y + lightHit_yRange, 0, obj_lightBox);
				}
			}
			else {
				sprite_index = spr_attack1_left;
				if (!instance_exists(obj_lightBox)) {
					instance_create_depth(x - lightHit_xRange, y + lightHit_yRange, 0, obj_lightBox);
				}
				else if (instance_exists(obj_lightBox)) {
					instance_destroy(obj_lightBox);
					instance_create_depth(x - lightHit_xRange, y + lightHit_yRange, 0, obj_lightBox);
				}
			}
		}
		else if (attackIndex == 1) {
			if (faceRight) {
				sprite_index = spr_attack2_right;
				if (!instance_exists(obj_lightBox)) {
					instance_create_depth(x + lightHit_xRange, y + lightHit_yRange, 0, obj_lightBox);
				}
				else if (instance_exists(obj_lightBox)) {
					instance_destroy(obj_lightBox);
					instance_create_depth(x + lightHit_xRange, y + lightHit_yRange, 0, obj_lightBox);
				}
			}
			else {
				sprite_index = spr_attack2_left;
				if (!instance_exists(obj_lightBox)) {
					instance_create_depth(x - lightHit_xRange, y + lightHit_yRange, 0, obj_lightBox);
				}
				else if (instance_exists(obj_lightBox)) {
					instance_destroy(obj_lightBox);
					instance_create_depth(x - lightHit_xRange, y + lightHit_yRange, 0, obj_lightBox);
				}
			}
			
		}
		else if (attackIndex == 2) {
			if (faceRight) {
				sprite_index = spr_attack3_right;
				alarm[7] = 0.7 * room_speed;
			}
			else {
				sprite_index = spr_attack3_left;
				alarm[7] = 0.7 * room_speed;
			}
		}
	}
	// Heavy Attack -- STOMP
	if (gamepad_button_check_pressed(slot, gp_face4) && !grounded && !isAttacking && !stomping) {
		stomping = true;
		player_grav = ori_player_grav;
		player_grav = 50;
	}
	// Heavy Attack -- LASER
	if (gamepad_button_check_pressed(slot, gp_face4) && grounded && !isAttacking && !stomping && !firing) {
		isAttacking = true;
		firing = true;
		// Delay specials alarm
		alarm[6] = 1 * room_speed;
		alarm[8] = 1.05 * room_speed;
		Zoom(384, 1, 0.01, 0.2);
		if (faceRight) {
			sprite_index = spr_laser_right;		
			laserRight = true;
		}
		else {
			sprite_index = spr_laser_left;
			laserLeft = true;
		}
	}
}
else {
	// Basic Attack
	if (keyboard_check(ord("J")) && grounded && !isAttacking) {
		show_debug_message("Attempting Attack");
		isAttacking = true;
		image_index = 0; // Reset the image index
		// Start ktimer to reset combo
		Shake(1, 10);
		alarm[4] = attackDelay * room_speed;
		if (attackIndex == 0) {
			show_debug_message("Attack index 0 entered");
			if (faceRight) {
				sprite_index = spr_attack1_right;
				if (!instance_exists(obj_lightBox)) {
					instance_create_depth(x + lightHit_xRange, y + lightHit_yRange, 0, obj_lightBox);
				}
				else if (instance_exists(obj_lightBox)) {
					instance_destroy(obj_lightBox);
					instance_create_depth(x + lightHit_xRange, y + lightHit_yRange, 0, obj_lightBox);
				}
			}
			else {
				sprite_index = spr_attack1_left;
				if (!instance_exists(obj_lightBox)) {
					instance_create_depth(x - lightHit_xRange, y + lightHit_yRange, 0, obj_lightBox);
				}
				else if (instance_exists(obj_lightBox)) {
					instance_destroy(obj_lightBox);
					instance_create_depth(x - lightHit_xRange, y + lightHit_yRange, 0, obj_lightBox);
				}
			}
		}
		else if (attackIndex == 1) {
			if (faceRight) {
				sprite_index = spr_attack2_right;
				if (!instance_exists(obj_lightBox)) {
					instance_create_depth(x + lightHit_xRange, y + lightHit_yRange, 0, obj_lightBox);
				}
				else if (instance_exists(obj_lightBox)) {
					instance_destroy(obj_lightBox);
					instance_create_depth(x + lightHit_xRange, y + lightHit_yRange, 0, obj_lightBox);
				}
			}
			else {
				sprite_index = spr_attack2_left;
				if (!instance_exists(obj_lightBox)) {
					instance_create_depth(x - lightHit_xRange, y + lightHit_yRange, 0, obj_lightBox);
				}
				else if (instance_exists(obj_lightBox)) {
					instance_destroy(obj_lightBox);
					instance_create_depth(x - lightHit_xRange, y + lightHit_yRange, 0, obj_lightBox);
				}
			}
			
		}
		else if (attackIndex == 2) {
			if (faceRight) {
				sprite_index = spr_attack3_right;
				if (!instance_exists(obj_lightBox)) {
					instance_create_depth(x + lightHit_xRange, y + lightHit_yRange, 0, obj_lightBox);
				}
				else if (instance_exists(obj_lightBox)) {
					instance_destroy(obj_lightBox);
					instance_create_depth(x + lightHit_xRange, y + lightHit_yRange, 0, obj_lightBox);
				}
			}
			else {
				sprite_index = spr_attack3_left;
				if (!instance_exists(obj_lightBox)) {
					instance_create_depth(x - lightHit_xRange, y + lightHit_yRange, 0, obj_lightBox);
				}
				else if (instance_exists(obj_lightBox)) {
					instance_destroy(obj_lightBox);
					instance_create_depth(x - lightHit_xRange, y + lightHit_yRange, 0, obj_lightBox);
				}
			}
		}
	}
	// Heavy Attack -- STOMP
	if (keyboard_check_pressed(ord("K")) && !grounded && !isAttacking && !stomping) {
		stomping = true;
		player_grav = ori_player_grav;
		player_grav = 50;
	}
	// Heavy Attack -- LASER
	if (keyboard_check_pressed(ord("K")) && grounded && !isAttacking && !stomping && !firing) {
		isAttacking = true;
		isFiring = true;
		// Delay specials alarm
		alarm[6] = 1 * room_speed;
		Zoom(384, 1, 0.01, 0.2);
		if (faceRight) {
			sprite_index = spr_laser_right;		
		}
		else {
			sprite_index = spr_laser_left;
		}
	}
}

//===================ANIMATION HANDLER=====================
if (!isAttacking) {
	if (grounded) {
		if (idling) {
		sprite_index = spr_idle_left;	
		}
		if (moveRight) {
			sprite_index = spr_run_right;	
		}
		if (moveLeft) {
			sprite_index = spr_run_left;
		}	
	}
	if (jump1left) {
		sprite_index = spr_jump1_left;
	}	
	if (jump1right) {
		sprite_index = spr_jump1_right;
	}	
	if (jump2left) {
		sprite_index = spr_jump2_left;
	}
	if (jump2right) {
		sprite_index = spr_jump2_right;
	}	
}



