//Which set of enemies will start spawning.  12 is infinite.
stage = 1;

// Timer for counting seconds
timer = 0;

// How many tics of the timer count as a second
second = 30;

for(i = 0; i < instance_number(obj_spawner); i+=1)
{
	spawners[i] = instance_find(obj_spawner,i);	
}