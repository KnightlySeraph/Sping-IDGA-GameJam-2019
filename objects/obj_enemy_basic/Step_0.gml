if(instance_exists(obj_player))
{

switch(state){
	case("FOLLOW"):
		// If the player is too high up, start pathing
		if(obj_player.y < y - max_height) state = "PATH";
		// If the player is close enough, move into attack
		else if(abs(obj_player.x - x) < 50) {
			state = "ATTACK";
			alarm[0] = 60;
			attacking = true;
			resting = true;
		}
		else {
			// Walk towards the player
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
		// If the player is low enough, follow them
		if(obj_player.y > y - max_height) state = "FOLLOW";
		else {
			//Walk back and forth upon hitting walls
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
		// Fall to the ground, then go back to following
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

// If there is no floor below, go into falling
if(!place_meeting(x, y+1, obj_floor)) state = "FALL";
image_xscale = -direct;
image_speed = spd / 2;

} //KEEP THIS AROUND