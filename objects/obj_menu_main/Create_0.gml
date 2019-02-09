/// @description Insert description here
// You can write your code in this editor


//main_light_surf = surface_create(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
//main_light_surf_copy = surface_create(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));

main_step = 0;
main_index = -1;
main_committed = -1;
main_control = true;

main_pressed = false;
main_hover = false;
main_lightup = false;

light_horizontal_radius = 170;
light_vertical_radius = 95;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 80;

view_y = camera_get_view_height(view_camera[0]);
view_x = camera_get_view_width(view_camera[0]);
show_debug_message("View height: " + string(view_y))
show_debug_message("View width: " + string(view_x))

main_x = gui_width / 4;
main_y = gui_margin;
main_space = 200;

playButton = instance_create_depth(main_x, main_y, -100, obj_button_play);
controlButton = instance_create_depth(main_x, main_y + main_space, -100, obj_button_controls);
highscoreButton = instance_create_depth(main_x, main_y + main_space * 2, -100, obj_button_highscores);
creditButton = instance_create_depth(main_x, main_y + main_space * 3, -100, obj_button_credits);
exitButton = instance_create_depth(main_x, main_y + main_space * 4, -100, obj_button_exit);

curtains = instance_create_depth(0, 0, -500, obj_curtaindrop);
curtains.image_alpha = 0;

main[4] = playButton;
main[3] = controlButton;
main[2] = highscoreButton;
main[1] = creditButton;
main[0] = exitButton;

for(var n = 0; n < 5; n++)
{
	main[n].image_xscale = 0.6;
	main[n].image_yscale = 0.6;
}