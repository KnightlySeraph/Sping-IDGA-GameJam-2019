// Decrease effect of gravity
/// @arg object
/// @arg factor
/// @arg time

if (!obj_player.stomping) {
	argument0.player_grav = argument0.player_grav * argument1;

	with (argument0) {
		alarm[1] = argument2 * room_speed;	
	}
}
