/// @description Insert description here
if (room == room0 && !playing) {
	playing = true;
	audio_play_sound(track_to_play, 1, true);
}

// Acreddation
if (track_to_play == Italy_Jr) {
	credit = "Current Track " + string(audio_get_name(track_to_play)) + " by Underbelly";
}
else if (track_to_play == Tavern_Fight) {
	credit = "Current Track Tavern Fight from the Divinity Original Sin II Soundtrack";	
}
else credit = "Current Track " + string(audio_get_name(track_to_play)) + " by Kevin MacLeod";

// Cycle Music
if (global.usingGamePad) {
	if (gamepad_button_check_pressed(slot, gp_shoulderlb)) {
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
else {
	if (keyboard_check_pressed(vk_tab)) {
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