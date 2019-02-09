/// @description Insert description here
// You can write your code in this editor
if(main_lightup && main_index != -1)
{
	show_debug_message("Drawing light");
	/*
	if(surface_exists(main_light_surf))
	{
		surface_copy(main_light_surf_copy, main_light_surf.x, main_light_surf.y, main_light_surf);
	}
	surface_set_target(main_light_surf_copy);
	*/
	gpu_set_blendmode(bm_normal);
	draw_set_alpha(0.8);
	draw_ellipse_color(main[main_index].x - light_horizontal_radius, main[main_index].y - light_vertical_radius, main[main_index].x + light_horizontal_radius, main[main_index].y + light_vertical_radius, c_white, c_yellow, false);
	//draw_surface(main_light_surf_copy, main_light_surf_copy.x, main_light_surf_copy.y)
	//surface_reset_target();
	gpu_set_blendmode(bm_normal);
}
else
{ show_debug_message("Stop."); }
	/*
	draw_set_alpha(0);
	for(var m = 0; m < 5; m++)
	{
		draw_ellipse_color(main[m].x - light_horizontal_radius, main[m].y - light_vertical_radius, main[m].x + light_horizontal_radius, main[m].y + light_vertical_radius, c_white, c_yellow, false);
	}
}
//else { surface_free(main_light_surf_copy); }
	