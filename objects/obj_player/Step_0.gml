/// @description Main Player Code
// Debug stuff
if (keyboard_check_pressed(ord("T"))) {
	show_debug_message("Player y coord is " + string(y) + " Peak is " + string(peak));	
}
// Movement code
if (global.usingGamePad) {
	
}
else { // Player is using the keyboard
	key_right = keyboard_check(ord("D"));
	key_left = -keyboard_check(ord("A"));
	key_jump = keyboard_check_pressed(vk_space);
}

move = key_right + key_left

player_hsp = move * moveSpeed;
player_vsp = 0;

// Jump Code
if (key_jump && jump2) {
	isJumping = true;	
	// Control the length of the jump
	alarm[0] = room_speed * jumpLength;
	if (jump1) {
		jump1 = false;	
	}
	else {
		jump2 = false;	
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
	if (!jump1 || !jump2) {
		jump1 = true;
		jump2 = true;
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

// Move the player
x += player_hsp;
y += player_vsp;


