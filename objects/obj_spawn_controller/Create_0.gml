//Which set of enemies will start spawning.  12 is infinite.
stage = 12;

// Timer for counting seconds
timer = 0;

// How many tics of the timer count as a second
second = 30;

for(i = 0; i < instance_number(obj_spawner); i+=1)
{
	spawners[i] = instance_find(obj_spawner,i);	
}

for(i = 0; i < instance_number(obj_lightspawner); i+=1)
{
	spotlights[i] = instance_find(obj_lightspawner, i);	
}

difficulty = 1;
basic_rate = 2;
shield_rate = 1;
fly_rate = 1;
light_rate = 1;

randomize();
