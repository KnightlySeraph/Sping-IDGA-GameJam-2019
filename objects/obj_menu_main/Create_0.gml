/// @description Insert description here
// You can write your code in this editor

main_step = 0;
main_index = -1;
main_committed = -1;
main_control = true;
main_exists = true;

main_pressed = false;
main_hover = false;
main_lightup = false;
play_transition = false;

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

curtains_open_left = instance_create_depth(0, room_height, -600, obj_open);
curtains_open_right = instance_create_depth(room_width, room_height, -600, obj_open);
curtains_open_left.image_speed = 0;
curtains_open_right.image_speed = 0;
curtains_open_right.image_xscale *= -1;
curtains_open_left.image_alpha = 0;
curtains_open_right.image_alpha = 0;

curtains_top = instance_create_depth(0, 0, -601, obj_curtain_top);
curtains_top.image_alpha = 0;
curtain_up = false;

main[4] = playButton;
main[3] = controlButton;
main[2] = highscoreButton;
main[1] = creditButton;
main[0] = exitButton;

for(var n = 0; n < 5; n++)
{
	main[n].image_xscale = 0.7;
	main[n].image_yscale = 0.7;
}