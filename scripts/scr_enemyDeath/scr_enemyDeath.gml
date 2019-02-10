enemy = argument0

enemy.image_angle += enemy.death_rot;
if(enemy.death_rot > 1) enemy.death_rot -= random_range(0.1, 0.3);
if((place_meeting(enemy.x,enemy.y,obj_lightBox) || place_meeting(enemy.x,enemy.y,obj_airBox) || place_meeting(enemy.x,enemy.y,obj_dashBox)) && !enemy.hit)
{
	enemy.hit = true;
	enemy.hsp = -sign(obj_player.x - enemy.x) * 0.8;
	enemy.vsp = -4;
	enemy.grav = 0.2;
	enemy.death_rot = 10 + random_range(1,10);
	enemy.type = "light";
	enemy.combo += 1;
	if(obj_player.sprite_index = spr_attack3_left || obj_player.sprite_index = spr_attack3_right) {
		enemy.vsp *= 1.5;
		enemy.hsp *= 1.5;
	}
	
	random_num = irandom_range(3,7);
	for(i = 0; i<random_num; i++)
	{
		instance_create_depth(enemy.x, enemy.y, enemy.depth - 1, obj_pow);	
	}
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
}
else if(place_meeting(enemy.x, enemy.y, obj_laserBox) && !hit)
{
	enemy.hit = true;
	enemy.hsp = -sign(obj_player.x - enemy.x) * 1.4;
	enemy.vsp = -5;
	enemy.grav = 0.1;
	enemy.death_rot = 10 + random_range(1,10);
	enemy.type = "laser";
	enemy.combo += 1;	
	
	random_num = irandom_range(3,7);
	for(i = 0; i<random_num; i++)
	{
		instance_create_depth(enemy.x, enemy.y, enemy.depth - 1, obj_pow);	
	}
}
else if(!place_meeting(enemy.x,enemy.y,obj_lightBox) && !place_meeting(enemy.x,enemy.y,obj_airBox) && !place_meeting(enemy.x,enemy.y,obj_dashBox) && enemy.hit && enemy.type == "light")
{
	enemy.hsp = -sign(obj_player.x - enemy.x) * combo;
	enemy.vsp = -10;
	enemy.hit = false;
	enemy.grav = 0.6;
	if(obj_player.sprite_index = spr_attack3_left || obj_player.sprite_index = spr_attack3_right) {
		enemy.vsp *= 1.5;
		enemy.hsp *= 1.5;
	}
}
else if(!place_meeting(enemy.x,enemy.y,obj_stompBox) && hit && type == "stomp")
{
	enemy.hsp = -sign(obj_player.x - enemy.x) * combo * 3;
	enemy.vsp = -15;
	enemy.hit = false;
	enemy.grav = 0.5;
}
else if(!place_meeting(enemy.x, enemy.y, obj_laserBox) && hit && type == "laser")
{
	enemy.hsp = -sign(obj_player.x - enemy.x) * combo * 4;
	enemy.vsp = -5;
	enemy.hit = false;
	enemy.grav = 0.5;
}
enemy.x += enemy.hsp;
enemy.y += enemy.vsp
enemy.vsp += enemy.grav;

if(place_meeting(enemy.x, enemy.y, obj_darkness))
{
	with(enemy) instance_destroy();
}