timer += 1;
switch(stage){
	case(1):
		if(timer == 1) scr_spawnEnemies(obj_enemy_basic, 2, spawners, 1);
		else if(!instance_exists(obj_enemy_basic) && timer > 1){
			timer = 0;
			stage = 2;
		}
		break;
		
	case(2):
		if(timer == 1) scr_spawnEnemies(obj_enemy_basic, 1, spawners, 1);
		else if(timer == 2 * second) scr_spawnEnemies(obj_enemy_basic, 1, spawners, 1);
		else if(timer == 4 * second) scr_spawnEnemies(obj_enemy_basic, 2, spawners, 1);
		else if(timer == 5 * second) scr_spawnEnemies(obj_enemy_basic, 1, spawners, 1);
		else if(!instance_exists(obj_enemy_basic) && timer > 5 * second) {
			timer = 0;
			stage = 3;
		}
		break;
		
	case(3):
		if(timer == 1) scr_spawnEnemies(obj_enemy_health, 1, spawners, 1);
		else if(!instance_exists(obj_enemy_health) && timer > 1) {
			timer = 0;
			stage = 4;
		}
		break;
		
	case(4):
		if(timer == 1) scr_spawnEnemies(obj_enemy_basic, 4, spawners, 1);
		else if(timer == 3 * second) scr_spawnEnemies(obj_enemy_basic, 2, spawners, 1);
		else if(!instance_exists(obj_enemy_basic) && timer > 3 * second) {
			timer = 0;
			stage = 5;
		}
		break;
		
	case(5):
		if(timer == 1) scr_spawnEnemies(obj_enemy_shield, 1, spawners, 1);
		else if(!instance_exists(obj_enemy_shield) && timer > 1) {
			timer = 0;
			stage = 6;
		}
		break;
		
	case(6):
		if(timer == 1) {
			scr_spawnEnemies(obj_enemy_basic, 2, spawners, 1);
			scr_spawnEnemies(obj_enemy_shield, 1, spawners, 1);
		}
		else if(timer > 2 * second) scr_spawnEnemies(obj_enemy_basic, 3, spawners, 1);
		else if(timer > 3 * second) scr_spawnEnemies(obj_enemy_health, 1, spawners, 1);
		else if(timer > 4 * second) scr_spawnEnemies(obj_enemy_shield, 2, spawners, 1);
		else if(!instance_exists(obj_enemy_basic) && !instance_exists(obj_enemy_shield) && timer > 4 * second) {
			timer = 0;
			stage = 7;
		}
		break;
		
	case(7):
		if(timer == 1) scr_spawnEnemies(obj_enemy_prize, 1, spawners, 1);
		else if(!instance_exists(obj_enemy_prize) && timer > 1){
			timer = 0;
			stage = 8;
		}
		break;
		
	case(8):
		if(timer == 1){
			scr_spawnEnemies(obj_enemy_basic, 3, spawners, 1);
			scr_spawnEnemies(obj_enemy_shield, 2, spawners, 1);
		}
		else if(timer == 3 * second) scr_spawnEnemies(obj_enemy_basic, 4, spawners, 1);
		else if(timer == 4 * second) scr_spawnEnemies(obj_enemy_shield, 1, spawners, 1);
		else if(!instance_exists(obj_enemy_basic) && !instance_exists(obj_enemy_shield) && timer > 4 * second)
		{
			timer = 0;
			stage = 9;
		}
		break;
		
	case(9):
		if(timer == 1) scr_spawnEnemies(obj_enemy_flying, 1, spawners, 1);
		else if(!instance_exists(obj_enemy_flying) && timer > 1)
		{
			timer = 0;
			stage = 10;
		}
		break;
		
	case(10):
		if(timer == 1)
		{
			scr_spawnEnemies(obj_enemy_basic,2,spawners, 1);
			scr_spawnEnemies(obj_enemy_flying, 2, spawners, 1);
		}
		else if(timer == 1 * second) scr_spawnEnemies(obj_enemy_shield, 3, spawners, 1);
		else if(timer == 4 * second) scr_spawnEnemies(obj_enemy_health, 1, spawners, 1);
		else if(timer == 5 * second) {
			scr_spawnEnemies(obj_enemy_basic, 2, spawners, 1);
			scr_spawnEnemies(obj_enemy_flying, 1, spawners, 1);
		}
		else if(!instance_exists(obj_enemy_basic) && !instance_exists(obj_enemy_shield) && !instance_exists(obj_enemy_flying) && timer > 5 * second) {
			timer = 0;
			stage = 11;
		}
		break;
		
	case(11):
		if(timer == 1) scr_spawnEnemies(obj_enemy_basic, 4, spawners, 1);
		else if(timer > 2 * second) scr_spawnEnemies(obj_enemy_shield, 4, spawners, 1);
		else if(timer > 4 * second) scr_spawnEnemies(obj_enemy_flying, 4, spawners, 1);
		else if(timer > 8 * second) {
			scr_spawnEnemies(obj_enemy_prize, 1, spawners, 1);	
			scr_spawnEnemies(obj_enemy_health, 1, spawners, 1);	
		}
		else if(!instance_exists(obj_enemy_basic) && !instance_exists(obj_enemy_shield) && !instance_exists(obj_enemy_flying) && timer > 8 * second) {
			timer = 0;
			stage = 12;
		}
		break;
		
	case(12):
		if(timer % (5 * second) == 0)
		{
			percentage = irandom_range(1,100);
			if(percentage == 1) scr_spawnEnemies(obj_enemy_prize, 1, spawners, 1);
			else if(percentage <= 6) scr_spawnEnemies(obj_enemy_health, 1, spawners, 1);
			else if(percentage <= 26) scr_spawnEnemies(obj_enemy_flying, irandom_range(1,3), spawners, 1);
			else if(percentage <= 55) scr_spawnEnemies(obj_enemy_shield, irandom_range(1,3), spawners, 1);
			else scr_spawnEnemies(obj_enemy_basic, irandom_range(1,3), spawners, 1);
			
			if(!instance_exists(obj_spotlight)) scr_spawnEnemies(obj_spotlight, 1, spotlights, 1);
		}
		break;
		
	case(13):
		if(timer % (5 * second) == 0)
		{
			scr_spawnEnemies(obj_enemy_basic, 1, spawners, 1);
			scr_spawnEnemies(obj_spotlight, 1, spotlights, 1);
		}
		break;
}