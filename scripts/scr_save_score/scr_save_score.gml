if (file_exists("Score.ini")) 
{
file_delete("Score.ini");
}
ini_open("Score.ini");
show_debug_message("Created save file");
myScore[10] = 0;
myName[10] = "";
for(var i = 0; i < 10; i++)
{
	show_debug_message("In for loop");
	if(highscore_value(i) != 0 && highscore_name(i) != "nobody")
	{
	myScore[i] = highscore_value(i);
	myName[i] = highscore_name(i);
	show_debug_message("Score and name stored");
	ini_write_real("Highscore Scores", "Score" + string(i), myScore[i]);
	ini_write_string("Highscore Names", "Name" + string(i), myName[i]);
	show_debug_message("Write to file.");
	}
}
ini_close();
show_debug_message("file closed");