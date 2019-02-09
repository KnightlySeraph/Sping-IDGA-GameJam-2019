if(instance_exists(obj_player))
{

switch(state){
	case("FOLLOW"):
		if(obj_player.y < y - max_height) state = "PATH";
		else if(abs(obj_player.x - x) < 50) state = "ATTACK";
		else {
			direct = sign(obj_player.x - x);
			hsp = direct * spd;
			x += hsp;
		}
		break;
		
	case("ATTACK"):
		//REPLACE WITH ACTUAL ATTACK CODE LATER
		if(!abs(obj_player.x - x) < 50) state = "FOLLOW";
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
image_xscale = -direct;

} //KEEP THIS AROUND

if(image_angle > 15 && rock_direct == 1)
{
	rock_direct = -1;
}
else if(image_angle < -15 && rock_direct == -1)
{
	rock_direct = 1;	
}
image_angle += rock_direct * 2;