/// @description Insert description here
playing = false;
randomize();
Latin = 0.8;
Run = 0.2;

selection = random_range(0, 1);
show_message("Rand is: " + string(selection));

music_list = [Run_Amok, Latin_Industries];
i = 0;
length = 2;

track_to_play = Run_Amok;

if (selection < Latin) {
	track_to_play = Latin_Industries;	
}
else if (selection < Run) {
	track_to_play = Run_Amok;
}
