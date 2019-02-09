/// @desc Call to check gamepad
controller_count = gamepad_get_device_count();
for(i = 0; i < controller_count; i++){
	if(gamepad_is_connected(i)){
		global.usingGamePad = true;
		//Create a Deadzone for the Gamepad of 0.05
		gamepad_set_axis_deadzone(i, 0.1);
		obj_player.slot = i;
		show_message("Connected");
		break;
	}
	else{
		global.usingGamePad = false;
	}
}
