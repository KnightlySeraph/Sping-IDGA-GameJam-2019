if(instance_exists(obj_player))
{
	
mask_index = spr_enemy_health;

switch(state){
	case("WALK"):
		sprite_index = spr_enemy_health;
		if(place_meeting(x,y,obj_floor)) instance_destroy();
		if(!place_meeting(x, y+1, obj_floor) && !place_meeting(x, y+1, obj_platform_passable)) state = "FALL";
		hsp = direct * spd;
		x += hsp;
		break;
		
	case("FALL"):
		sprite_index = spr_enemy_health_fall;
		if (place_meeting(x, y + vsp, obj_floor) || place_meeting(x, y + vsp, obj_platform_passable)){
			while(!place_meeting(x, y+sign(vsp), obj_floor) && !place_meeting(x, y+sign(vsp), obj_platform_passable)){
				y += sign(vsp);	
			}
			vsp = 0;
			state = "WALK";
		}
		else {
			y += vsp;
			vsp += grav;
		}
		break;
		
	case("DEATH"):
		sprite_index = spr_enemy_health_dead;
		scr_enemyDeath(self);
		break;
}

image_xscale = -direct;

if (last_sprite != sprite_index)
{
   image_index = 0;
   last_sprite = sprite_index;
}


if(place_meeting(x,y,obj_lightBox) || place_meeting(x,y,obj_stompBox)) {
	state = "DEATH";
}

} // DO NOT DELETE