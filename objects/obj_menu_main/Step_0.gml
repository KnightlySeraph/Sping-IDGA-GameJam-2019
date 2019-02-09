/// @description Insert description here
// You can write your code in this editor
for(var k = 0; k < 5; k++)
{
	if(instance_position(mouse_x, mouse_y, main[k]))
	{
		main_lightup = true;
		main_hover = true;
		main_light_index = k;
		main_index = k;
		break;
	}
	if(k == 4)
	{
		main_index = -1;
		main_light_index = -1;
		main_committed = -1;
		main_hover = false;
		main_pressed = false;
	}
}

if(main_hover)
{
	if(mouse_check_button_pressed(mb_left))
	{
		main_pressed = true;
		main_committed = main_index;
	}
}