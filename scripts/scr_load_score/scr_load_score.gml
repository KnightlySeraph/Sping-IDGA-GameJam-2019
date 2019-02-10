if(file_exists("Score.ini"))
{
	ini_open("Score.ini");
	highscore_clear();
	for(var j = 0; j < 10; j++)
	{
			global.highScore[j] = 0;
			global.highName[j] = "";
			if(ini_key_exists("Highscore Scores", "Score" + string(j)))
			{
				global.highScore[j] = ini_read_real("Highscore Scores", "Score" + string(j), 0);
				global.highName[j] = ini_read_string("Highscore Names", "Name" + string(j), "Bob");
				highscore_add(global.highName[j], global.highScore[j]);
			}
	}
	ini_close();
}