/// @description Insert description here
// You can write your code in this editor
for(var k = 0; k < 5; k++)
{
	with(main[k])
	{
		if(instance_position(mouse_x, mouse_y, self))
		{
			sprite_index = spr_menu_tempHover;
			main_index = k;
		}
		else
		{
			main_index = -1;
			sprite_index = spr_menu_temp;
		}
		if(main_index == k)
		{
			if(mouse_check_button(mb_left))
			{
				main_committed = k;
				sprite_index = spr_menu_tempPress;
			}
		}
	}
}