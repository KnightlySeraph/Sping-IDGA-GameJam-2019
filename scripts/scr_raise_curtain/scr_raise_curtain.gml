if(instance_exists(curtains))
{
	if(curtains.image_alpha == 1 && curtains.y > 0)
	{
		curtains.y -= 5;
	}
}