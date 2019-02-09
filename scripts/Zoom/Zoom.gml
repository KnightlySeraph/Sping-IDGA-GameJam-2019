/// @desc Zoom(zoom, speed, length)

obj_camera.height = lerp(obj_camera.height, argument0, argument1);

with (obj_player) {
	alarm[2] = room_speed * argument2;	
}

with (obj_camera) {
	event_user(0);
}



