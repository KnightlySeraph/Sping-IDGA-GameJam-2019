/// @description Create third basic combo hit box
// You can write your code in this editor

if (faceRight) {
	if (!instance_exists(obj_lightBox)) {
		instance_create_depth(x + lightHit_xRange, y + lightHit_yRange, 0, obj_lightBox);
	}
	else if (instance_exists(obj_lightBox)) {
		instance_destroy(obj_lightBox);
		instance_create_depth(x + lightHit_xRange, y + lightHit_yRange, 0, obj_lightBox);
		}
	}
	else {
		if (!instance_exists(obj_lightBox)) {
			instance_create_depth(x - lightHit_xRange, y + lightHit_yRange, 0, obj_lightBox);
		}
		else if (instance_exists(obj_lightBox)) {
			instance_destroy(obj_lightBox);
			instance_create_depth(x - lightHit_xRange, y + lightHit_yRange, 0, obj_lightBox);
		}
	}