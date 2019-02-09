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
if (grounded && key_jump) {
	isJumping = true;	
	// Control the length of the jump
	alarm[0] = room_speed * jumpLength;
	// Check what the peak height is
	totalIncrease = jumpForce;
	decrease = jumpForce;
	totalFrame = room_speed * jumpLength;
	for (i = 0; i < totalFrame; i++) {
			decrease += 0.3;
			totalIncrease -= decrease;
	}
	peak = y - totalIncrease;
}

if (isJumping) {
	player_vsp = jumpForce;
	if (jumpForce >= 5) {
		jumpForce += 0.3;	
	}
	if (y < peak - 10 && y > peak + 10) {
		show_message("Hover Call");
		Hover(obj_player, 0.2);
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


