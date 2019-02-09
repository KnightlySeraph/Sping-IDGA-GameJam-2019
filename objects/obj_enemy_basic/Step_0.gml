if(instance_exists(obj_player))
{

switch(state){
	case("FOLLOW"):
		// If the player is too high up, start pathing
		if(obj_player.y < y - max_height) state = "PATH";
		// If the player is close enough, move into attack
		else if(abs(obj_player.x - x) < 110) {
			state = "ATTACK";
			alarm[0] = 60;
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
		//REPLACE WITH ACTUAL ATTACK CODE LATER
		if(attacking) {
			anti_sezure += 1;
			if(anti_sezure % 5 == 0) color = choose(c_orange, c_lime, c_aqua);
		}
		else if(!resting) {
			color = c_white;
			state = "FOLLOW";
			image_angle = 0;
		}
		else
		{
			color = c_white;
			image_angle = 0;
			image_index = 0;
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
		hsp = 0;
		break;
}

// If there is no floor below, go into falling
if(!place_meeting(x, y+1, obj_floor)) state = "FALL";
image_xscale = -direct;
image_speed = spd / 2;

if(place_meeting(x,y,obj_player)){
	hsp = sign(x - obj_player.x) * maxSpeed;	
}

if (place_meeting(x + hsp, y, obj_floor)){
	while(!place_meeting(x+sign(hsp), y, obj_floor)){
		x += sign(hsp);	
	}
	hsp = 0;
	if(!place_meeting(x,y,obj_player)) direct = -direct;
}

x += hsp;

} //KEEP THIS AROUND