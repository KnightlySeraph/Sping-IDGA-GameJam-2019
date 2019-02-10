/// @desc LightBox(object, direction)
/// @arg object
/// @arg direction

if (argument1 == 1) {
	if (!instance_exists(obj_airBox)) {
		instance_create_depth(argument0.x + 128, argument0.y + 32, 0, obj_airBox);
	}
	else if (instance_exists(obj_airBox)) {
		instance_destroy(obj_airBox);
		instance_create_depth(argument0.x + 128, argument0.y + 32, 0, obj_airBox);
	}
}
else if (argument1 == -1) {
	if (!instance_exists(obj_airBox)) {
		instance_create_depth(argument0.x - 128, argument0.y + 32, 0, obj_airBox);
	}
	else if (instance_exists(obj_airBox)) {
		instance_destroy(obj_airBox);
		instance_create_depth(argument0.x - 128, argument0.y + 32, 0, obj_airBox);
	}
}
