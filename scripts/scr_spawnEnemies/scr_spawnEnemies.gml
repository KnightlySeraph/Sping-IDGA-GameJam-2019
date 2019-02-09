///spawnEnemies(enemyType, number, spawns[], spd)

enemyType = argument0;
number = argument1;
spawns = argument2;
spd = argument3;

spawn_num = array_length_1d(spawns);
bannedNumbers[0] = 5;
banned = 1;

randomize();

if(number > spawn_num - 1) number = spawn_num - 1;

for(i = 0; i < number; i++)
{
	random_num = irandom_range(0,spawn_num - 1);
	for(j = 0; j < array_length_1d(bannedNumbers); j++)
	{
		if(random_num == bannedNumbers[j])
		{
			random_num = irandom_range(0,spawn_num - 1);
			j = 0;
		}
	}
	bannedNumbers[banned] = random_num;
	banned += 1;
	
	enemy = instance_create_depth(spawns[random_num].x, spawns[random_num].y, depth, enemyType);
	enemy.direct = spawns[random_num].direct;
	enemy.spd = enemy.spd * spd;
}