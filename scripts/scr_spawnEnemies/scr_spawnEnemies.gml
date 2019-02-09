///spawnEnemies(enemyType, number, spawns[], spd)

enemyType = argument0;
number = argument1;
spawns = argument2;
spd = argument3;

spawn_num = array_length_1d(spawns);
bannedNumbers[0] = 5;
banned = 1;

randomize();
show_debug_message(irandom_range(0,3));

if(number > spawn_num) number = spawn_num;

for(i = 0; i < number; i++)
{
	random_num = irandom_range(0,spawn_num);
	for(j = 0; j < array_length_1d(bannedNumbers); j++)
	{
		if(random_num == bannedNumbers[j])
		{
			random_num = irandom_range(0,spawn_num);
			j = 0;
		}
	}
	bannedNumbers[banned] = random_num;
	banned += 1;
	
	enemy = instance_create_depth(spawns[i].x, spawns[i].y, depth, enemyType);
	enemy.direct = spawns[i].direct;
	enemy.spd = enemy.spd * spd;
}