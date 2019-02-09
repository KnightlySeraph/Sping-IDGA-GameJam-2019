switch(state){
	case("FOLLOW"):
		break;
		
	case("ATTACK"):
		break;
		
	case("PATH"):
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