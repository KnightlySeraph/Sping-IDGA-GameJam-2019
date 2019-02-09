///@description End Attack, Start Rest
attacking = false;
alarm[1] = room_speed;
if(damage_box != noone)
{
	with(damage_box)
	{
		instance_destroy();	
	}
	damage_box = noone;
}