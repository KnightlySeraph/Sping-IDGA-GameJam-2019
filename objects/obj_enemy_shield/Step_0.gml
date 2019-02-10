if(instance_exists(obj_player))
{

mask_index = spr_enemy_shield;

switch(state){
	case("FOLLOW"):
		// If the player is too high up, start pathing
		if(obj_player.y < y - max_height) state = "PATH";
		// If the player is too low, walk off the platform
		else if(obj_player.y > y)
		{
			direct = sign((room_width / 2) - x);
			hsp = direct * spd;
		}
		// If the player is close enough, move into attack
		else if(abs(obj_player.x - x) < 170) {
			direct = sign(obj_player.x - x);
			state = "ATTACK";
			alarm[2] = room_speed * 0.9;
			attacking = true;
			resting = true;
		}
		else {
			// Walk towards the player
			direct = sign(obj_player.x - x);
			hsp = direct * spd;
		}
		break;
		
	case("ATTACK"):
		if(attacking) {
			sprite_index = spr_enemy_basic_attack;
		}
		else if(!resting) {
			state = "FOLLOW";
			image_angle = 0;
			sprite_index = spr_enemy_shield;
		}
		hsp = 0;
		break;
		
	case("PATH"):
		// If the player is low enough, follow them
		if(obj_player.y > y - max_height) state = "FOLLOW";
		else {
			//Walk back and forth upon hitting walls
			hsp = direct * spd;
		}
		break;
		
	case("DEATH"):
		sprite_index = spr_enemy_basic_dead;
		scr_enemyDeath(self);
		break;
		
	case("FALL"):
		// Fall to the ground, then go back to following
		sprite_index = spr_enemy_basic_fall;
		if (place_meeting(x, y + vsp, obj_floor) || place_meeting(x, y + vsp, obj_platform_passable)){
			while(!place_meeting(x, y+sign(vsp), obj_floor) && !place_meeting(x, y+sign(vsp), obj_platform_passable)){
				y += sign(vsp);	
			}
			vsp = 0;
			state = "FOLLOW";
			sprite_index = spr_enemy_shield;
		}
		else {
			y += vsp;
			vsp += grav;
		}
		hsp = 0;
		break;
}

// If there is no floor below, go into falling
if((!place_meeting(x, y+1, obj_floor) && !place_meeting(x, y+1, obj_platform_passable)) && state != "DEATH") state = "FALL";
if(((place_meeting(x,y,obj_lightBox) || place_meeting(x,y,obj_airBox) || place_meeting(x,y,obj_dashBox)) && direct != sign(obj_player.x - x)) || place_meeting(x,y,obj_laserBox) || place_meeting(x,y,obj_stompBox)) {
	state = "DEATH";
	alarm[0] = -1;
	alarm[1] = -1;
	alarm[2] = -1;
}
image_xscale = -direct;
image_speed = spd / 2;

if(state != "DEATH")
{
	if(place_meeting(x,y,obj_player)){
		hsp = sign(x - obj_player.x) * maxSpeed;	
	}

	if (place_meeting(x + hsp, y, obj_floor) || place_meeting(x + hsp, y, obj_platform_passable)){
		while(!place_meeting(x+sign(hsp), y, obj_floor) && !place_meeting(x+sign(hsp), y, obj_platform_passable)){
			x += sign(hsp);	
		}
		hsp = 0;
		if(!place_meeting(x,y,obj_player)) direct = -direct;
	}

	x += hsp;
}

if (last_sprite != sprite_index)
{
   image_index = 0;
   last_sprite = sprite_index;
}

} //KEEP THIS AROUND