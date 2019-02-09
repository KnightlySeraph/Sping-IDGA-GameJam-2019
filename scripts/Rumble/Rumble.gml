/// @desc Rumble controller
/// @arg Motor Rumble
/// @arg Time
if (global.usingGamePad) {
	gamepad_set_vibration(slot, argument0, argument0);	
}

with (obj_player) {
	alarm[5] = room_speed * argument1;	
}