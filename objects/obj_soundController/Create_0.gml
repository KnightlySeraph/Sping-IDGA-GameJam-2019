/// @description Insert description here
playing = false;
randomize();
Latin = 0.02;
Spaz = 0.06;	
Exit = 0.11; 
Italy = .16;
Adv = .21;
Cart = .26;
Jaunt = .31;
Mus = .36;
Pop = .41;
Cruise = .46;
Meat = .51;
Run = .56;
Tavern = 1;

selection = random_range(0, 1);
// show_message("Rand is: " + string(selection));

music_list = [Tavern_Fight, Run_Amok, Italy_Jr, Spazmatic_Polka, Cruising_Goblins, Pop_Weasel, Exit_Premise, Adventure_Meme, Jaunty_Gumption, Music_Delight, Meatball_Parade, Cartoon_Battle];
length = array_length_1d(music_list);
i = 0;

track_to_play = Run_Amok;

if (selection < Latin) {
	track_to_play = Latin_Industries;	
}
else if (selection < Spaz) {
	track_to_play = Spazmatic_Polka;
}
else if (selection < Exit) {
	track_to_play = Exit_Premise;
}
else if (selection < Italy) {
	track_to_play = Italy_Jr;
}
else if (selection < Adv) {
	track_to_play = Adventure_Meme;
}
else if (selection < Cart) {
	track_to_play = Cartoon_Battle;
}
else if (selection < Jaunt) {
	track_to_play = Jaunty_Gumption;
}
else if (selection < Mus) {
	track_to_play = Music_Delight;
}
else if (selection < Pop) {
	track_to_play = Pop_Weasel;
}
else if (selection < Cruise) {
	track_to_play = Cruising_Goblins;
}
else if (selection < Meat) {
	track_to_play = Meatball_Parade;
}
else if (selection < Run) {
	track_to_play = Run_Amok;	
}
else {
	track_to_play = Tavern_Fight;	
}

credit = "Title " + string(object_get_name(track_to_play));