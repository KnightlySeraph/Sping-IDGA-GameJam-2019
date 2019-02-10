image_xscale = direct;

if(rocking){
	timer += 1;
	image_angle += rock_direct;
	if(timer % room_speed == 0)
	{
		rock_direct = -rock_direct;	
	}
	y += 0.5;
}
else if(crash)
{
	image_alpha = random_range(0.4, 0.8);
	timer += 1;
	if(timer > 10)
	{
		instance_destroy();	
	}
}
else
{
	image_angle = 0;
	if(place_meeting(x,y,obj_floor) || place_meeting(x,y,obj_platform_passable))
	{
		crash = true;
		timer = 0;
	}
	if(place_meeting(x,y,obj_player)){
		obj_player.spotHit = true;	
		Shake(12,30);
	}
	vsp += grav;
	y += vsp;
}