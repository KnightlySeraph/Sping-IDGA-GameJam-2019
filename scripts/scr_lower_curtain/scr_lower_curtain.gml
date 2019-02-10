if(instance_exists(curtains))
{
	if(curtains.image_alpha == 1 && curtains.y < 1080)
	{
		curtains.y += 5;
	}
}