/// @description Main Player Code
// Debug stuff
// Attmpt to slow game
if (gamepad_button_check_pressed(slot, gp_shoulderr)) {
	Zoom(768 / 2, 2);	
}
// Attempt Shake
if (gamepad_button_check(slot, gp_face4)) {
	Shake(18, 90);	
}
if (gamepad_button_check_pressed(slot, gp_select)) {
	show_message("Move: " + string(move));	
}
if (global.usingGamePad) {
	if (gamepad_button_check_pressed(slot, gp_face4)){
		if (!rumble) {
			rumble = true;
			gamepad_set_vibration(slot, 1, 1);	
		}
		else {
			rumble = false;
			gamepad_set_vibration(slot, 0, 0);	
		}
	}
	
}
if (keyboard_check_pressed(ord("T"))) {
	if (isAttacking) {
		isAttacking = false;	
	}
	else {
		isAttacking = true;	
	}
}
// Movement code
if (global.usingGamePad) {
	key_right = sign(gamepad_axis_value(slot, gp_axislh));
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
if (key_jump && jump1) {
	isJumping = true;	
	// Control the length of the jump
	alarm[0] = room_speed * jumpLength;
	if (jump1) {
		jump1 = false;	
	}
	
}

// Set grounded var
if (place_meeting(x, y + 1, obj_floor)) {
	grounded = true;	
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
if (global.usingGamePad) {
	// Basic Attack
	if (gamepad_button_check(slot, gp_face3) && grounded) {
		isAttacking = true;
		image_index = 0; // Reset the image index
		if (attackIndex == 0) {
			if (faceRight) {
				sprite_index = spr_attack1_right;	
			}
			else {
				sprite_index = spr_attack2_left;
			}
		}
		else if (attackIndex == 1) {
			if (faceRight) {
				sprite_index = spr_attack2_right;	
			}
			else {
				sprite_index = spr_attack2_left;	
			}
			
		}
		else if (attackIndex == 2) {
			if (faceRight) {
				sprite_index = spr_attack3_right;	
			}
			else {
				sprite_index = spr_attack3_left;
			}
		}
	}
}

//===================ANIMATION HANDLER=====================
if (idling) {
	sprite_index = spr_idle_left;	
}
if (moveRight) {
	sprite_index = spr_run_right;	
}
if (moveLeft) {
	sprite_index = spr_run_left;
}



