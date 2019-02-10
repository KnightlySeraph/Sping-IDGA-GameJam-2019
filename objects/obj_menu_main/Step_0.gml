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
	if(draw_back)
	{		
		if(instance_position(mouse_x, mouse_y, backButton))
		{
			show_debug_message("Back hover");
			back_hover = true;
		}
		else
		{
			back_hover = false;
		}
		if(back_hover)
		{
			if(mouse_check_button_pressed(mb_left))
			{
				back_pressed = true;
			}
		}
	}
	switch(main_committed)
	{
	case(0):
		game_end();
		break;
	case(1):
		scr_lower_curtain();
		if(curtains.y >= 1080)
		{
			if(!instance_exists(obj_optionTransition) && !draw_credits)
			{
				castTransition = instance_create_depth(x, y, -1000, obj_optionTransition);
			}
			else if(instance_exists(obj_optionTransition))
			{
				if(castTransition.option_fadeAlpha == 1)
				{
					draw_credits = true;
					instance_deactivate_object(curtains);
					for(var k = 0; k < 5; k++)
					{
						instance_deactivate_object(main[k]);
					}
				}
				//instance_activate_object(backButton);
				//draw_back = true;
			}
		}
		break;
	case(2):
		scr_lower_curtain();
		if(curtains.y >= 1080)
		{
			if(!instance_exists(obj_optionTransition) && !draw_score)
			{
				scoreTransition = instance_create_depth(x, y, -1000, obj_optionTransition);
			}
			else if(instance_exists(obj_optionTransition))
			{
				if(scoreTransition.option_fadeAlpha == 1)
				{
					draw_score = true;
					//draw_enter = true;
					instance_deactivate_object(curtains);
					for(var k = 0; k < 5; k++)
					{
						instance_deactivate_object(main[k]);
					}
				//instance_activate_object(backButton);
				//draw_back = true;
				}
			}
		}
		break;
	case(3):
		scr_lower_curtain();
		if(curtains.y >= 1080)
		{
			if(!instance_exists(obj_optionTransition) && !draw_controls)
			{
				controlsTransition = instance_create_depth(x, y, -1000, obj_optionTransition);
			}
			else if(instance_exists(obj_optionTransition))
			{
				if(controlsTransition.option_fadeAlpha == 1)
				{
					draw_controls = true;
					instance_deactivate_object(curtains);
					for(var k = 0; k < 5; k++)
					{
						instance_deactivate_object(main[k]);
					}
				//instance_activate_object(backButton);
				//draw_back = true;
				}
			}
		}
		break;
	case(4):
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
				instance_deactivate_object(curtains);
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
}

/*
if(draw_enter)
{
	if(keyboard_check_pressed(vk_enter))
	{
		show_debug_message("I should work");
		global.name = message;
		scr_addScore();
		show_debug_message("I'm back!");
		draw_enter = false;
	}
	if (string_length(keyboard_string) <= limit)
	{
		message = keyboard_string;
	}
	else
	{
		keyboard_string = message;
	}
}
*/
if(keyboard_check_pressed(vk_enter))
{
	room_restart();
}