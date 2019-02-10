/// @description Insert description here
playing = false;
randomize();
Latin = 0.01;
Spaz = 0.7;
Run = 0.4;
Italy = 1;

selection = random_range(0, 1);
show_message("Rand is: " + string(selection));

music_list = [Run_Amok, Latin_Industries, Italy_Jr, Spazmatic_Polka];
length = array_length_1d(music_list);
i = 0;

track_to_play = Run_Amok;

if (selection < Latin) {
	track_to_play = Latin_Industries;	
}
else if (selection < Run) {
	track_to_play = Run_Amok;
}
else if (selection < Spaz) {
	track_to_play = Spazmatic_Polka;
}
else if (selection < Italy) {
	track_to_play = Italy_Jr;
}
