/// @description Insert description here
// You can write your code in this editor
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

if(play_transition)
{
	draw_set_color(c_black);
	draw_rectangle(0, 0, room_width, room_height, false);
}
