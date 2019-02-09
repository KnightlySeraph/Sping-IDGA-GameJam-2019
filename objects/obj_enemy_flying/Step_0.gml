if(instance_exists(obj_player))
{

mask_index = spr_enemy_basic;

switch(state){
	case("FOLLOW"):
		updown_time += 1;
		if(updown_time % (room_speed) == 0){
			updown_time = 0;
			updown = -updown;
		}
		y += updown * updown_speed;
		break;
		
	case("ATTACK"):
		break;
		
	case("DEATH"):
		break;
}


if(place_meeting(x,y,obj_lightBox) || place_meeting(x,y,obj_stompBox)) {
	state = "DEATH";
}
image_xscale = -direct;
image_speed = spd / 2;

if(state != "DEATH")
{
	
	if(place_meeting(x,y,obj_player)){
		hsp = sign(x - obj_player.x) * maxSpeed;	
	}
	else hsp = 0; //DELETE THIS LATER OR ELSE
	//SERIOSLY
	//DONT FORGET

	if (place_meeting(x + hsp, y, obj_floor)){
		while(!place_meeting(x+sign(hsp), y, obj_floor)){
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

} //DONT DELETE