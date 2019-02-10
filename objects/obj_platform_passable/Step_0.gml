if(instance_exists(obj_player))
{
	//Check if the player is above the platform or if they are holding down.
	if(obj_player.y < (832 - obj_player.sprite_height / 2))
	{
		//Create the platform that is solid, then delete this one.
		new = instance_create_depth(x,y,depth,obj_platform_solid);
		new.image_xscale = image_xscale;
		new.image_yscale = image_yscale;
		instance_destroy();
	}
}