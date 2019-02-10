///spawnEnemies(enemyType, number, spawns[], spd)

enemyType = argument0;
number = argument1;
spawns = argument2;
spd = argument3;

// How many spawns there are
spawn_num = array_length_1d(spawns);
// Spawns that have already bee used
bannedNumbers[0] = spawn_num + 1;
// How many banned spawns there are
banned = 1;

randomize();

// Can't spawn more enemies than there are spawns
if(number > spawn_num) number = spawn_num - 1;

// Create each enemy
for(i = 0; i < number; i++)
{
	// Pick a random spawn
	random_num = irandom_range(0,spawn_num - 1);
	// Check to see if the spawn has been used already
	for(j = 0; j < array_length_1d(bannedNumbers); j++)
	{
		if(random_num == bannedNumbers[j])
		{
			random_num = irandom_range(0,spawn_num - 1);
			j = 0;
		}
	}
	// Ban this spawn
	bannedNumbers[banned] = random_num;
	banned += 1;
	
	// Create the enemy, changing its speed and direction;
	enemy = instance_create_depth(spawns[random_num].x, spawns[random_num].y, depth, enemyType);
	enemy.direct = spawns[random_num].direct;
	enemy.spd = enemy.spd * spd;
	enemy.depth = -1;
	bannedNumbers = noone;
}