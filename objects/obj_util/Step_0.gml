/// @description Insert description here
// You can write your code in this editor
// FullScreen
if ((keyboard_check_pressed(vk_f11) || gamepad_button_check_pressed(slot, gp_select)) && window_get_fullscreen()) {
	window_set_fullscreen(false);	
}
else if (keyboard_check_pressed(vk_f11) || gamepad_button_check_pressed(slot, gp_select)) {
	window_set_fullscreen(true);	
}

// Quit game and stuff
if (global.usingGamePad && gamepad_button_check_pressed(slot, gp_start)) room_goto(rm_menu_test); 