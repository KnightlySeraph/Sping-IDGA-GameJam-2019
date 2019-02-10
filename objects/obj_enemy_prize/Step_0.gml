if(instance_exists(obj_player))
{
	
mask_index = spr_enemy_prize;

timer += 1;

switch(state){
	case("WALK"):
		sprite_index = spr_enemy_prize;
		if(place_meeting(x,y,obj_floor)) instance_destroy();
		if(!place_meeting(x, y+1, obj_floor) && !place_meeting(x, y+1, obj_platform_passable)) state = "FALL";
		hsp = direct * spd;
		x += hsp;
		break;
		
	case("FALL"):
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
			hsp = direct * spd;
			x += hsp;
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


if(place_meeting(x,y,obj_lightBox) || place_meeting(x,y,obj_stompBox) || place_meeting(x,y,obj_airBox) || place_meeting(x,y,obj_dashBox) || place_meeting(x,y,obj_laserBox)) {
	state = "DEATH";
}

if(timer % 3 == 0)
{
	instance_create_depth(x,y,depth, obj_sparkle);
}

} // DO NOT DELETE