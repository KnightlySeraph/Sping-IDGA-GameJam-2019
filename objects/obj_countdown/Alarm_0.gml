/// @description Insert description here
if (sprite_index == spr_three) {
	sprite_index = spr_two;
	alarm[0] = timer * room_speed;
}
else if (sprite_index == spr_two) {
	sprite_index = spr_one;
	alarm[0] = timer * room_speed;
}
else if (sprite_index == spr_one) {
	sprite_index = spr_go;
	alarm[0] = timer * room_speed;	
}
else {
	alarm[1] = timer * room_speed;	
}