///@description End Attack, Start Rest
attacking = false;
alarm[1] = room_speed * 1.3;
if(damage_box != noone)
{
	with(damage_box)
	{
		instance_destroy();	
	}
	damage_box = noone;
}