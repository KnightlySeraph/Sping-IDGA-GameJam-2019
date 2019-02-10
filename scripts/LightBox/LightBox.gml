/// @desc LightBox(object, direction)
/// @arg object
/// @arg direction

if (argument1 == 1) {
	if (!instance_exists(obj_lightBox)) {
		instance_create_depth(argument0.x + argument0.lightHit_xRange, argument0.y + argument0.lightHit_yRange, 0, obj_lightBox);
	}
	else if (instance_exists(obj_lightBox)) {
		instance_destroy(obj_lightBox);
		instance_create_depth(argument0.x + argument0.lightHit_xRange, argument0.y + argument0.lightHit_yRange, 0, obj_lightBox);
	}
}
else if (argument1 == -1) {
	if (!instance_exists(obj_lightBox)) {
		instance_create_depth(argument0.x - argument0.lightHit_xRange, argument0.y + argument0.lightHit_yRange, 0, obj_lightBox);
	}
	else if (instance_exists(obj_lightBox)) {
		instance_destroy(obj_lightBox);
		instance_create_depth(argument0.x - argument0.lightHit_xRange, argument0.y + argument0.lightHit_yRange, 0, obj_lightBox);
	}	
}