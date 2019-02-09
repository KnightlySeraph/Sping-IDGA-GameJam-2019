/// @description Main Player Code

// Movement code
if (global.usingGamePad) {
	
}
else { // Player is using the keyboard
	key_right = keyboard_check_pressed(ord("D"));
	key_left = keyboard_check_pressed(ord("D"));
	key_jump = keyboard_check_pressed(vk_space);
}

move = key_right + sign(key_left);


