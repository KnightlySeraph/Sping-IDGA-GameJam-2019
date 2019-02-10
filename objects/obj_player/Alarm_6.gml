/// @description Laser Special Attacks
//Instantiate energy beam


if (global.usingGamePad) Rumble(1, 1);
Shake(12, 90);
SlowSpeed(obj_player, 15, 0.5);

// Create the hitbox
if (!instance_exists(obj_laserBox)) {
	instance_create_depth(x, y + 128, 0, obj_laserBox);
	if (laserRight) obj_laserBox.heading = 1;
	else obj_laserBox.heading = -1;
}
else if (instance_exists(obj_laserBox)) {
	instance_destroy(obj_laserBox);
	instance_create_depth(x, y + 128, 0, obj_laserBox);
	if (laserRight) obj_laserBox.heading = 1;
	else obj_laserBox.heading = 1;
}

 
