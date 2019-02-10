if(instance_exists(obj_player))
{

mask_index = spr_enemy_basic;

switch(state){
	case("FOLLOW"):
		direct = sign(obj_player.x - x);
		updown_time += 1;
		if(updown_time % (room_speed) == 0){
			updown_time = 0;
			updown = -updown;
		}
		y += updown * updown_speed;
		
		target_x = obj_player.x - (direct * 168);
		target_y = obj_player.y + 140;
		
		direction = point_direction(x,y,target_x, target_y);
		
		if(abs(obj_player.x - x) < 172 && y > obj_player.y + 130 && y < obj_player.y + 160){
			speed = 0;	
			state = "ATTACK";
			alarm[2] = room_speed * 0.9;
			attacking = true;
			resting = true;
		}
		else
		{
			speed = spd;	
		}
		
		break;
		
	case("ATTACK"):
		if(attacking) {
			sprite_index = spr_enemy_flying_attack;
		}
		else if(!resting) {
			state = "FOLLOW";
			image_angle = 0;
			sprite_index = spr_enemy_flying;
		}
		hsp = 0;
		break;
		
	case("DEATH"):
		sprite_index = spr_enemy_flying_dead;
		scr_enemyDeath(self);
		break;
}


if(place_meeting(x,y,obj_lightBox) || place_meeting(x,y,obj_stompBox) || place_meeting(x,y,obj_airBox) || place_meeting(x,y,obj_dashBox) || place_meeting(x,y,obj_laserBox)) {
	state = "DEATH";
}
image_xscale = -direct;
if(state != "FALL" && state != "ATTACK"){
	image_speed = spd / 2;
}
else
{
	image_speed = 1;	
}

if(state != "DEATH")
{
	
	if(place_meeting(x,y,obj_player)){
		if(obj_player.stomping){
			hsp = 0;
			while(place_meeting(x,y,obj_player)) y += 1;
			y -= 100;
		}
		else hsp = sign(x - obj_player.x) * maxSpeed;	
	}
	else hsp = 0;

	if (place_meeting(x + hsp, y, obj_floor)){
		while(!place_meeting(x+sign(hsp), y, obj_floor)){
			x += sign(hsp);	
		}
		hsp = 0;
	}
	else if(place_meeting(x,y,obj_platform_solid))
	{
		vsp = -5;	
	}

	x += hsp;
	y += vsp;
}

if(state != "FOLLOW")
{
	speed = 0;	
}

if (last_sprite != sprite_index)
{
   image_index = 0;
   last_sprite = sprite_index;
}

} //DONT DELETE