/// @description Insert description here
// You can write your code in this editor
if(main_exists)
{
	if(main_lightup && main_index != -1)
	{
		gpu_set_blendmode(bm_normal);
		draw_set_alpha(0.8);
		draw_ellipse_color(main[main_index].x - light_horizontal_radius, main[main_index].y - light_vertical_radius, main[main_index].x + light_horizontal_radius, main[main_index].y + light_vertical_radius, c_white, c_yellow, false);
		gpu_set_blendmode(bm_normal);
		draw_set_alpha(1);
	}

	if(main_pressed)
	{
		gpu_set_blendmode(bm_normal);
		draw_set_alpha(0.8);
		draw_ellipse_color(main[main_index].x - light_horizontal_radius, main[main_index].y - light_vertical_radius, main[main_index].x + light_horizontal_radius, main[main_index].y + light_vertical_radius, c_yellow, c_orange, false);
		gpu_set_blendmode(bm_normal);
		draw_set_alpha(1);
	}
}

if(draw_credits)
{
	draw_sprite(spr_cutrain_cast, 1, 0, 0);
}
else if(draw_controls)
{
	draw_sprite(spr_curtain_directions, 1, 0, 0);
}
else if(draw_score)
{
	draw_sprite(spr_curtain_sponsors, 1, 0, 0);
	draw_highscore(100, 100, room_width - 100, room_height - 100);
}
if(draw_enter)
{
	draw_text(room_width/2, room_height/2, "Enter your name:")
	draw_text(room_width/2, room_height/2 + 10, message);
}

if(play_transition)
{
	draw_set_color(c_black);
	draw_rectangle(0, 0, room_width, room_height, false);
}
