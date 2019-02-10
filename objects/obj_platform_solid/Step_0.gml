if(instance_exists(obj_player))
{
	//Check if the player is above the platform or if they are holding down.
	if(round(obj_player.y + (obj_player.sprite_height/2)) > y)
	{
		//Creat the platform that isn't passable, then delete this one.
		new = instance_create_depth(x,y,depth,obj_platform_passable)
		new.image_xscale = image_xscale;
		new.image_yscale = image_yscale;
		
		instance_destroy();
	}
}