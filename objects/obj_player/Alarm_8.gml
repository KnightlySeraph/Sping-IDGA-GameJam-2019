/// @description LASER
if (!instance_exists(obj_alex_tester)) {
	//show_message("Laser Left is: " + string(laserLeft) + " & Laser Right is: " + string(laserRight));
	if (laserRight) instance_create_depth(x + 128 + 64, y + 128, 0, obj_alex_tester);
	else instance_create_depth(x - 128 - 64, y + 128, 0, obj_alex_tester);
	if (laserRight) obj_alex_tester.createRight = true;
	else obj_alex_tester.createRight = false;
}

laserRight = false;
laserLeft = false;
firing = false;
