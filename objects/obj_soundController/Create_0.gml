/// @description Insert description here
playing = false;
randomize();
Latin = 0.8;
Run = 0.2;

selection = random_range(0, 1);
show_message("Rand is: " + string(selection));

track_to_play = Run_Amok;

if (selection < Latin) {
	track_to_play = Latin_Industries;	
}
else if (selection < Run) {
	track_to_play = Run_Amok;
}
