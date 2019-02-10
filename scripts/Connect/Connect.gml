/// @desc Call to check gamepad
controller_count = gamepad_get_device_count();
for(i = 0; i < controller_count; i++){
	if(gamepad_is_connected(i)){
		global.usingGamePad = true;
		//Create a Deadzone for the Gamepad of 0.05
		gamepad_set_axis_deadzone(i, 0.5);
		slot = i;
		break;
	}
	else{
		global.usingGamePad = false;
	}
}
