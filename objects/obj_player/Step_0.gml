/// @description Main Player Code
// Debug stuff
// Attmpt to slow game
if (gamepad_button_check_pressed(slot, gp_select)) {
	//show_message("Total Index of idle is: " + string(sprite_get_number(spr_idle_left)));	
	// show_message("Image Index is: " + string(image_index) + " Move is Set to: " + string(move) + " isDashing is set to: " + string(isDashing));
	// if (sprite_index == spr_attack2_left) show_message("Current sprite: " + string(sprite_index));
	//show_message("isAttacking is: " + string(isAttacking) + " Basic attack index: " + string(attackIndex) + " isDashing is: " + string(isDashing));
	// show_message("STATE: " + string(STATE));
}
// Player death
if (hitPoints <= 0) {
	dying = true;	
	stomping = false;
	isDashing = false;
	isAttacking = false;
	if(!instance_exists(obj_stompBox)) {
		instance_create_depth(x, y + 216, 0, obj_stompBox);	
	}
	if (faceRight) STATE = STATES.DEATH_RIGHT;
	else STATE = STATES.DEATH_LEFT;
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

// Set animation state based on move var, animation cannot be accessed while the player is considered to be attacking
if (grounded && !isAttacking  && !isDashing && !dying) {
	if (move == 0) {
		if (faceRight) STATE = STATES.IDLE_RIGHT;
		else STATE = STATES.IDLE;
	}
	else if (move == 1) {
		STATE = STATES.RUN_RIGHT;
	}
	else if (move == -1) {
		STATE = STATES.RUN_LEFT;
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

// Jump Code
// Disallow jumps when attacking
if (!isAttacking && !dying) {
	if (key_jump && jump2) {
		isJumping = true;
		// Set the correct animation state
		if (jump1) {
			if (faceRight) {
				STATE = STATES.JUMP1_RIGHT;
			}
			else {
				STATE = STATES.JUMP1_LEFT;
			}
		}
		else {
			if (faceRight) {
				STATE = STATES.JUMP2_RIGHT;
			}
			else {
				STATE = STATES.JUMP2_LEFT;
			}
		}
		// Control the length of the jump
		alarm[0] = room_speed * jumpLength;
	
		// Implements double jump
		if (jump1) {
			jump1 = false;	
		}
		else {
			jump2 = false;	
		}	
	}
}

// Set grounded var
if (place_meeting(x, y + 1, obj_floor) && !isJumping) {
	grounded = true;
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
else if (!grounded) {
	// Change player animation to fall unless doing airial attack
	if (!stomping && player_vsp > 0 && !isAttacking && !dying) { // Set an animation state
		if (faceRight) STATE = STATES.FALL_RIGHT;
		else STATE = STATES.FALL_LEFT;
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
}
y += player_vsp;

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
		// Set the pound animation state
		// isPounding = true;
		image_index = 0;
		if (faceRight) STATE = STATES.POUND_RIGHT;
		else STATE = STATES.POUND_LEFT;
	}
}
if (isDashing) {
	if (instance_exists(obj_dashBox)) {
		with (obj_dashBox) {
			x = obj_player.x;
			y = obj_player.y + 256;
		}
	}
	if (image_index > 6 && image_index < 9) {
		if (faceRight) DashBox(obj_player, 1);
		else DashBox(obj_player, -1);
	}
	if (image_index > 9 && image_index < 11) {
		// Do some special effects
		Rumble(0.6, 0.7);
		Shake(6, 30);
		isAttacking = true;
	}
}
// Fix infinite attack comboing
if (attackIndex > 2) {
	attackIndex = 0;
	isDashing = false;
	sprite_index = spr_idle_left;
}
// ================================================GAMEPAD BINDS AND LOGIC============================================
if (global.usingGamePad) {
	// Basic Attack
	if (gamepad_button_check(slot, gp_face3) && grounded && !isAttacking && move == 0) {
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
				STATE = STATES.ATTACK_RIGHT1; // Set Animation State
				LightBox(obj_player, 1);
			}
			else {
				STATE = STATES.ATTACK_LEFT1; // Set Animation State
				LightBox(obj_player, -1);
			}
		}
		else if (attackIndex == 1) {
			if (faceRight) {
				STATE = STATES.ATTACK_RIGHT2; // Set Animation State
				LightBox(obj_player, 1);
			}
			else {
				STATE = STATES.ATTACK_LEFT2; // Set Animation State
				LightBox(obj_player, -1);
			}
			
		}
		else if (attackIndex == 2) {
			if (faceRight) {
				STATE = STATES.ATTACK_RIGHT3; // Set Animation State
				alarm[7] = 0.7 * room_speed;
			}
			else {
				STATE = STATES.ATTACK_LEFT3; // Set Animation State
				alarm[7] = 0.7 * room_speed;
			}
		}
	}
	// Arial Attack
	if (gamepad_button_check_pressed(slot, gp_face3) && !grounded && !stomping && !isAttacking) {
		isAttacking = true;
		// Change animation state
		image_index = 0;
		if (faceRight) AirBox(obj_player, 1);
		else AirBox(obj_player, -1);
		if (faceRight) STATE = STATES.AIR_ATTACK_RIGHT;
		else STATE = STATES.AIR_ATTACK_LEFT;
	}
	// Heavy Attack -- STOMP
	if (gamepad_button_check_pressed(slot, gp_face4) && !grounded && !isAttacking && !stomping) {
		isAttacking = true;
		alarm[10] = room_speed * 0.5;
		if (faceRight) {
			STATE = STATES.DIVE_RIGHT;
		}
		else {
			STATE = STATES.DIVE_LEFT;
		}
	}
	// Heavy Attack -- LASER
	if (gamepad_button_check_pressed(slot, gp_face4) && grounded && !isAttacking && !stomping && !firing) {
		isAttacking = true;
		firing = true;
		// Delay specials alarm
		alarm[6] = 1 * room_speed;
		alarm[8] = 1.1 * room_speed;
		// Delete boxo
		alarm[11] = 1.5 * room_speed;
		Zoom(384, 1, 0.01, 0.2);
		if (faceRight) {
			STATE = STATES.LASER_ATTACK_RIGHT;
			laserRight = true;
		}
		else {
			STATE = STATES.LASER_ATTACK_LEFT;
			laserLeft = true;
		}
	}
	// Dash Attack
	if (gamepad_button_check_pressed(slot, gp_face2) && grounded && !isDashing && (move == 1 || move == -1) && !isAttacking && !stomping && !firing) {
		isDashing = true;	
		alarm[9] = 2 * room_speed;
		image_index = 0;
		if (faceRight) {
			STATE = STATES.DASH_ATTACK_RIGHT;
		}
		else {
			STATE = STATES.DASH_ATTACK_LEFT;
		}
	}
}
// ===============================================KEYBOARD BINDS AND LOGIC========================================================
else {
	// Basic Attack
	if (keyboard_check(ord("J")) && grounded && !isAttacking && move == 0) {
		show_debug_message("Attempting Attack");
		isAttacking = true;
		image_index = 0; // Reset the image index
		// Start ktimer to reset combo
		Shake(1, 10);
		
		
		alarm[4] = attackDelay * room_speed;
		if (attackIndex == 0) {
			show_debug_message("Attack index 0 entered");
			if (faceRight) {
				STATE = STATES.ATTACK_RIGHT1; // Set Animation State
				LightBox(obj_player, 1);
			}
			else {
				STATE = STATES.ATTACK_LEFT1; // Set Animation State
				LightBox(obj_player, -1);
			}
		}
		else if (attackIndex == 1) {
			if (faceRight) {
				STATE = STATES.ATTACK_RIGHT2; // Set Animation State
				LightBox(obj_player, 1);
			}
			else {
				STATE = STATES.ATTACK_LEFT2; // Set Animation State
				LightBox(obj_player, -1);
			}
			
		}
		else if (attackIndex == 2) {
			if (faceRight) {
				STATE = STATES.ATTACK_RIGHT3; // Set Animation State
				alarm[7] = 0.7 * room_speed;
			}
			else {
				STATE = STATES.ATTACK_LEFT3; // Set Animation State
				alarm[7] = 0.7 * room_speed;
			}
		}
	}
	// Arial Attack
	if (keyboard_check_pressed(ord("J")) && !grounded && !stomping && !isAttacking) {
		isAttacking = true;
		// Change animation state
		image_index = 0;
		if (faceRight) AirBox(obj_player, 1);
		else AirBox(obj_player, -1);
		if (faceRight) STATE = STATES.AIR_ATTACK_RIGHT;
		else STATE = STATES.AIR_ATTACK_LEFT;
	}
	// Heavy Attack -- STOMP
	if (keyboard_check_pressed(ord("K")) && !grounded && !isAttacking && !stomping) {
		isAttacking = true;
		alarm[10] = room_speed * 0.5;
		if (faceRight) {
			STATE = STATES.DIVE_RIGHT;
		}
		else {
			STATE = STATES.DIVE_LEFT;
		}
	}
	// Heavy Attack -- LASER
	if (keyboard_check_pressed(ord("K")) && grounded && !isAttacking && !stomping && !firing) {
		isAttacking = true;
		firing = true;
		// Delay specials alarm
		alarm[6] = 1 * room_speed;
		alarm[8] = 1.1 * room_speed;
		// Delete boxo
		alarm[11] = 1.5 * room_speed;
		Zoom(384, 1, 0.01, 0.2);
		if (faceRight) {
			STATE = STATES.LASER_ATTACK_RIGHT;
			laserRight = true;
		}
		else {
			STATE = STATES.LASER_ATTACK_LEFT;
			laserLeft = true;
		}
	}
	// Dash Attack
	if (keyboard_check_pressed(ord("L")) && grounded && !isDashing && (move == 1 || move == -1) && !isAttacking && !stomping && !firing) {
		isDashing = true;	
		alarm[9] = 2 * room_speed;
		image_index = 0;
		moveSpeed *= 2;
		if (faceRight) {
			STATE = STATES.DASH_ATTACK_RIGHT;
		}
		else {
			STATE = STATES.DASH_ATTACK_LEFT;
		}
	}
}

//===================ANIMATION HANDLER=====================
if (STATE = STATES.IDLE) {
	sprite_index = spr_idle_left;	
}
if (STATE = STATES.IDLE_RIGHT) {
	sprite_index = spr_idle_right;	
}
if (STATE = STATES.RUN_LEFT) {
	sprite_index = spr_run_left;	
}
if (STATE = STATES.RUN_RIGHT) {
	sprite_index = spr_run_right;	
}
if (STATE = STATES.FALL_LEFT) {
	sprite_index = spr_fall_left;	
}
if (STATE = STATES.FALL_RIGHT) {
	sprite_index = spr_fall_right;	
}
if (STATE = STATES.JUMP1_LEFT) {
	sprite_index = spr_jump1_left;	
}
if (STATE = STATES.JUMP1_RIGHT) {
	sprite_index = spr_jump1_right;	
}
if (STATE = STATES.JUMP2_LEFT) {
	sprite_index = spr_jump2_left;	
}
if (STATE = STATES.JUMP2_RIGHT) {
	sprite_index = spr_jump2_right;	
}
if (STATE = STATES.ATTACK_LEFT1) {
	sprite_index = spr_attack1_left;	
}
if (STATE = STATES.ATTACK_LEFT2) {
	sprite_index = spr_attack2_left;	
}
if (STATE = STATES.ATTACK_LEFT3) {
	sprite_index = spr_attack3_left;	
}
if (STATE = STATES.ATTACK_RIGHT1) {
	sprite_index = spr_attack1_right;	
}
if (STATE = STATES.ATTACK_RIGHT2) {
	sprite_index = spr_attack2_right;	
}
if (STATE = STATES.ATTACK_RIGHT3) {
	sprite_index = spr_attack3_right;	
}
if (STATE = STATES.LASER_ATTACK_LEFT) {
	sprite_index = spr_laser_left;	
}
if (STATE = STATES.LASER_ATTACK_RIGHT) {
	sprite_index = spr_laser_right;	
}
if (STATE = STATES.POUND_LEFT) {
	sprite_index = spr_groundPound_left;	
}
if (STATE = STATES.POUND_RIGHT) {
	sprite_index = spr_groundPound_right;	
}
if (STATE = STATES.DASH_ATTACK_LEFT) {
	sprite_index = spr_dashAttack_left;	
}
if (STATE = STATES.DASH_ATTACK_RIGHT) {
	sprite_index = spr_dashAttack_right;	
}
if (STATE = STATES.DIVE_RIGHT) {
	sprite_index = spr_dive_right;	
}
if (STATE = STATES.DIVE_LEFT) {
	sprite_index = spr_dive_left;	
}
if (STATE = STATES.AIR_ATTACK_LEFT) {
	sprite_index = spr_air_left;	
}
if (STATE = STATES.AIR_ATTACK_RIGHT) {
	sprite_index = spr_air_right;	
}
if (STATE = STATES.DEATH_RIGHT) {
	sprite_index = spr_perish_right;	
}
if (STATE = STATES.DEATH_LEFT) {
	sprite_index = spr_perish_left;	
}


// Taking Damage

if(hitPoints > 100) hitPoints = 100;
if(hitPoints < 0) hitPoints = 0;

if((place_meeting(x,y,obj_enemy_basic_damage) || spotHit) && !invincible) {
	invincible = true;
	hitPoints -= 10;
}


if(invincible) {
	invince_timer += 1;
	if(invince_timer > invince_max) {
		invincible = false;
		invince_timer = 0;
		spotHit = false;
	}
	image_alpha = random_range(0.5,0.8);
}
else {
	image_alpha = 1;	
}

// NEED FOR SPEED
if(speed_timer > 0)
{
	moveSpeed = maxSpeed * 3;
	speed_timer -= 1;
	if(speed_timer % 5 == 0)
	{
		instance_create_depth(x,y,depth, obj_sparkle);	
	}
}
else
{
	moveSpeed = maxSpeed;	
}
