if(instance_exists(obj_player))
{

show_debug_message(state);

switch(state){
	case("FOLLOW"):
		if(obj_player.y < y - max_height) state = "PATH";
		direct = obj_player.x - x;
		hsp = direct * spd;
		x += hsp;
		break;
		
	case("ATTACK"):
		break;
		
	case("PATH"):
		if(obj_player.y > y - max_height) state = "FOLLOW";
		break;
		
	case("KNOCKBACK"):
		break;
		
	case("DEATH"):
		break;
		
	case("FALL"):
		if (place_meeting(x, y + vsp, obj_floor)){
			while(!place_meeting(x, y+sign(vsp), obj_floor)){
				y += sign(vsp);	
			}
			vsp = 0;
			state = "FOLLOW";
		}
		else {
			y += vsp;
			vsp += grav;
		}
		break;
}

if(!place_meeting(x, y+1, obj_floor)) state = "FALL";

} //KEEP THIS AROUND