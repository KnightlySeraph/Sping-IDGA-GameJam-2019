if (file_exists("Score.ini")) file_delete("Score.ini");
ini_open("Score.ini");
myScore[10] = 0;
myName[10] = "";
for(var i = 0; i < 10; i++)
{
	myScore[i] = highscore_value(i);
	myName[i] = highscore_name(i);
	ini_write_real("Highscore Scores", "Score" + string(i), myScore[i]);
	ini_write_string("Highscore Names", "Name" + string(i), myName[i]);
}
ini_close();