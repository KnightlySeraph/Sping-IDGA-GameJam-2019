/// @desc Zoom(zoom, length)
/// @arg zoom
/// @arg length

with (obj_camera) {
	newHeight = argument0;
	zooming = true;
	stick = true;
	alarm[0] = argument1 * room_speed;
}



