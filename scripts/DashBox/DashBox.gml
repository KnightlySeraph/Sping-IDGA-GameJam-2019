/// @desc LightBox(object, direction)
/// @arg object
/// @arg direction

if (argument1 == 1) {
	if (!instance_exists(obj_dashBox)) {
		instance_create_depth(argument0.x + 128, argument0.y + 256, 0, obj_dashBox);
	}
	else if (instance_exists(obj_dashBox)) {
		instance_destroy(obj_dashBox);
		instance_create_depth(argument0.x + 128, argument0.y + 256, 0, obj_dashBox);
	}
}
else if (argument1 == -1) {
	if (!instance_exists(obj_dashBox)) {
		instance_create_depth(argument0.x - 128, argument0.y + 256, 0, obj_dashBox);
	}
	else if (instance_exists(obj_dashBox)) {
		instance_destroy(obj_dashBox);
		instance_create_depth(argument0.x - 128, argument0.y + 256, 0, obj_dashBox);
	}
}
