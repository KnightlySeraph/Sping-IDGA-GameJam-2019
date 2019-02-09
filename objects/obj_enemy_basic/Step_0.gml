if(instance_exists(obj_player))
{

switch(state){
	case("FOLLOW"):
		if(obj_player.y < y - max_height) state = "PATH";
		else if(abs(obj_player.x - x) < 50) {
			state = "ATTACK";
			alarm[0] = 60;
			attacking = true;
			resting = true;
		}
		else {
			direct = sign(obj_player.x - x);
			hsp = direct * spd;
			x += hsp;
		}
		break;
		
	case("ATTACK"):
		//REPLACE WITH ACTUAL ATTACK CODE LATER
		if(attacking) {
			image_angle = irandom_range(0,360)
		}
		else if(!resting) {
			state = "FOLLOW";
			image_angle = 0;
		}
		else
		{
			image_angle = 0;
			image_index = 0;
		}
		break;
		
	case("PATH"):
		if(obj_player.y > y - max_height) state = "FOLLOW";
		else {
			hsp = direct * spd;
			if (place_meeting(x + hsp, y, obj_floor)){
				while(!place_meeting(x+sign(hsp), y, obj_floor)){
					x += sign(hsp);	
				}
				hsp = 0;
				direct = -direct;
			}
			x += hsp;
		}
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
image_xscale = -direct;
image_speed = spd / 2;

} //KEEP THIS AROUND