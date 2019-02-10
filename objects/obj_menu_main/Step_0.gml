/// @description Insert description here
// You can write your code in this editor
if(main_control)
{
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
			main_step += 1;
			main_control = false;
			alarm[0] = 10;
		}
	}
}
else if(!main_control)
{
	if(instance_exists(curtains))
	{
		if(curtains.image_alpha == 1 && curtains.y < 1080)
		{
			curtains.y += 5;
		}
		else if(curtains.y >= 1080)
		{
			play_transition = true;
			curtains_open_left.image_alpha = 1;
			curtains_open_right.image_alpha = 1;
			curtains_top.image_alpha = 1;
			instance_destroy(curtains);
			curtains_open_left.image_speed = 1;
			curtains_open_right.image_speed = 1;
			for(var a = 0; a < 5; a++)
			{
				instance_destroy(main[a]);
			}
			main_exists = false;
			layer_set_visible("Background", false);
		}
	}
	if(curtains_open_left.image_index > curtains_open_left.image_number-1)
	{
		curtains_open_left.image_speed = 0;
		curtains_open_right.image_speed = 0;
		curtain_up = true;
	}
	else if(curtains_open_left.image_index > curtains_open_left.image_number-1)
	{
		curtains_open_left.image_speed = 0;
		curtains_open_right.image_speed = 0;
		curtain_up = true;
	}
	if(curtain_up && curtains_top.y > -300)
	{
		curtains_top.y -= 5;
	}
	else if(curtains_top.y <= -300)
	{
		if(!instance_exists(obj_roomTransition))
		{
			var tempRoomFade = instance_create_depth(x,y, -1000, obj_roomTransition);
		}
	}
}