image_index = direct;

if(rocking){
	timer += 1;
	image_angle += rock_direct;
	if(timer % 10 == 0)
	{
		rock_direct = -rock_direct;	
	}
}
else
{
	image_angle = 0;
	if(place_meeting(x,y,obj_floor) || place_meeting(x,y,obj_platform_passable))
	{
		instance_destroy();	
	}
	vsp += grav;
	y += vsp;
}