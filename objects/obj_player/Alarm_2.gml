/// @description Reset camera zoom
// You can write your code in this editor
//obj_camera.height = lerp(obj_camera.height, 768, 0.5);

//with (obj_camera) {
//	event_user(0);	
//}

with (obj_camera) {
	while (height != 768) {
		height = lerp(height, 768, 0.01);
		show_debug_message("Loop Run, height is: " + string(height));
		event_user(0);
	}
}