enemy = argument0

enemy.image_angle += enemy.death_rot;
if(enemy.death_rot > 1) enemy.death_rot -= random_range(0.1, 0.3);
if((place_meeting(enemy.x,enemy.y,obj_lightBox) || place_meeting(enemy.x,enemy.y,obj_airBox) || place_meeting(enemy.x,enemy.y,obj_dashBox)) && !enemy.hit)
{
	enemy.hit = true;
	enemy.hsp = -sign(obj_player.x - enemy.x) * 0.1;
	enemy.vsp = -3;
	enemy.grav = 0.2;
	enemy.death_rot = 10 + random_range(1,10);
	enemy.type = "light";
	if(place_meeting(x,y,obj_dashBox)) enemy.type = "dash";
	enemy.combo += 1;
	if(obj_player.sprite_index = spr_attack3_left || obj_player.sprite_index = spr_attack3_right) {
		enemy.vsp *= 1.5;
		enemy.hsp *= 1.5;
	}
	if(enemy.type = "dash")
	{
		enemy.vsp = -5;
		enemy.hsp = -sign(obj_player.x - enemy.x) * 0.5;
	}
	
	random_num = irandom_range(3,7);
	for(i = 0; i<random_num; i++)
	{
		instance_create_depth(enemy.x, enemy.y, enemy.depth - 1, obj_pow);	
	}
	points += enemy.point * enemy.combo;
}
else if(place_meeting(enemy.x,enemy.y,obj_stompBox) && !hit)
{
	enemy.hit = true;
	enemy.hsp = -sign(obj_player.x - enemy.x) * 1.2;
	enemy.vsp = -3;
	enemy.grav = 0.1;
	enemy.death_rot = 10 + random_range(1,10);
	enemy.type = "stomp";
	enemy.combo += 1;	
	
	random_num = irandom_range(3,7);
	for(i = 0; i<random_num; i++)
	{
		instance_create_depth(enemy.x, enemy.y, enemy.depth - 1, obj_pow);	
	}
	points += enemy.point * enemy.combo;
}
else if(place_meeting(enemy.x, enemy.y, obj_laserBox) && !hit)
{
	enemy.hit = true;
	enemy.hsp = -sign(obj_player.x - enemy.x) * 1.4;
	enemy.vsp = -10;
	enemy.grav = 0.1;
	enemy.death_rot = 10 + random_range(1,10);
	enemy.type = "laser";
	enemy.combo += 1;	
	
	random_num = irandom_range(3,7);
	for(i = 0; i<random_num; i++)
	{
		instance_create_depth(enemy.x, enemy.y, enemy.depth - 1, obj_pow);	
	}
	points += enemy.point * enemy.combo;
}
else if(!place_meeting(enemy.x,enemy.y,obj_lightBox) && !place_meeting(enemy.x,enemy.y,obj_airBox) && !place_meeting(enemy.x,enemy.y,obj_dashBox) && enemy.hit && enemy.type == "light")
{
	enemy.hsp = -sign(obj_player.x - enemy.x) * (-0.2 + (0.2 * combo));
	enemy.vsp = -10;
	enemy.hit = false;
	enemy.grav = 0.32 + (0.05 * combo);
	if(obj_player.sprite_index = spr_attack3_left || obj_player.sprite_index = spr_attack3_right) {
		enemy.vsp *= 1.5;
		enemy.hsp *= 1.5;
		enemy.grav = 0.45;
	}
	else if(obj_player.sprite_index = spr_attack2_left || obj_player.sprite_index = spr_attack2_right){
		enemy.vsp += (combo * 0.2);
	}
}
else if(!place_meeting(enemy.x,enemy.y,obj_stompBox) && hit && enemy.type == "stomp")
{
	enemy.hsp = -sign(obj_player.x - enemy.x) * combo * 3;
	enemy.vsp = -15;
	enemy.hit = false;
	enemy.grav = 0.45 + (combo * 0.2);
}
else if(!place_meeting(enemy.x, enemy.y, obj_laserBox) && hit && enemy.type == "laser")
{
	enemy.hsp = -sign(obj_player.x - enemy.x) * combo * 4;
	enemy.vsp = -5;
	enemy.hit = false;
	enemy.grav = 1 + (combo * 0.3);
}
else if(!place_meeting(enemy.x, enemy.y, obj_dashBox) && hit && enemy.type == "dash")
{
	enemy.hsp = -sign(obj_player.x - enemy.x) * (combo * 0.1);
	enemy.vsp = -12;
	enemy.hit = false;
	enemy.grav = 1 + (combo * 0.3);
}
enemy.x += enemy.hsp;
enemy.y += enemy.vsp
enemy.vsp += enemy.grav;

if(place_meeting(enemy.x, enemy.y, obj_darkness))
{
	with(enemy) {
		if(damage_box != noone){
			with(damage_box){
				instance_destroy();	
			}
			damage_box = noone;
		}
		instance_destroy();
	}
}