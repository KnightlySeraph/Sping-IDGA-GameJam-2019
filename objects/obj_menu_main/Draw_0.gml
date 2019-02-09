/// @description Insert description here
// You can write your code in this editor
if(main_lightup && main_index != -1)
{
	show_debug_message("Drawing light");
	gpu_set_blendmode(bm_subtract);
	draw_ellipse_color(main[main_index].x - light_horizontal_radius, main[main_index].y - light_vertical_radius, main[main_index].x + light_horizontal_radius, main[main_index].y + light_vertical_radius, c_white, c_yellow, false);
	gpu_set_blendmode(bm_normal);
}