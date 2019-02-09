if(file_exists("Score.ini"))
{
	ini_open("Score.ini");
	highscore_clear();
	loadScore[10] = 0;
	loadName[10] = "";
	for(var j = 0; j < 10; j++)
	{
		loadScore[j] = ini_read_real("Highscore Scores", "Score" + string(i), 0);
		loadName[j] = ini_read_string("Highscore Names", "Name" + string(i), "Bob");
		highscore_add(loadName[j], loadScore[j]);
	}
	ini_close();
}