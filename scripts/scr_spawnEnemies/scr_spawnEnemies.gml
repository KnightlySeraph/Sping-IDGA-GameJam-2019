///spawnEnemies(enemyType, number, spawns[])

enemyType = argument0;
number = argument1;
spawns = argument2;

bannedNumbers[0] = 5;
banned = 1;

randomize();
show_debug_message(irandom_range(0,3));

if(number > array_length_1d(spawns)) number = array_length_1d(spawns);

for(i = 0; i < number; i++)
{
	random_num = irandom_range(0,array_length_1d(spawns));
	for(j = 0; j < array_length_1d(bannedNumbers); j++)
	{
		if(random_num == bannedNumbers[j])
		{
			random_num = irandom_range(0,array_length_1d(spawns));
			j = 0;
		}
	}
	bannedNumbers[banned] = random_num;
	banned += 1;
	
	instance_create_depth(spawns[i].x, spawns[i].y, depth, enemyType);
}

