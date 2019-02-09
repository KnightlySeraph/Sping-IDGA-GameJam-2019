/// @description Insert description here
// You can write your code in this editor
for(var k = 0; k < 5; k++)
{
	with(main[k])
	{
		if(instance_position(mouse_x, mouse_y, self))
		{
			show_debug_message(string(self))
			sprite_index = spr_menu_tempHover;
		}
		else
		{
			sprite_index = spr_menu_temp;
		}
	}
}