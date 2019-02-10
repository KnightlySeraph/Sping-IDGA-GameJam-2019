/// @description Insert description here
if (room == room0 && !playing) {
	playing = true;
	audio_play_sound(track_to_play, 1, true);
}


// Cycle Music
if (global.usingGamePad) {
	if (gamepad_button_check_pressed(obj_player.slot, gp_shoulderlb)) {
		audio_stop_sound(track_to_play);
		if (i < (length - 1)) {
			i++;
		}
		else {
			i = 0;	
		}
		track_to_play = music_list[i];
		audio_play_sound(track_to_play, 1, true);
	}
}