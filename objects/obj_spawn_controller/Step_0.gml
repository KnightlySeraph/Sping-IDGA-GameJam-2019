timer += 1;
switch(stage){
	case(1):
		if(timer == 1) {
			scr_spawnEnemies(obj_enemy_basic, 2, spawners);
		}
		else if(!instance_exists(obj_enemy_basic)){
			timer = 0;
			stage = 2;
		}
		break;
		
	case(2):
		if(timer == 1) {
			scr_spawnEnemies(obj_enemy_basic, 1, spawners);
		}
}