/// @description Insert description here
// You can write your code in this editor
main_step = 0;
main_index = 0;
main_committed = -1;
main_control = true;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 80;

main_x = gui_width / 4;
main_y = gui_margin;
main_space = 200;

playButton = instance_create_depth(main_x, main_y, -100, obj_button_play);
controlButton = instance_create_depth(main_x, main_y + main_space, -100, obj_button_controls);
highscoreButton = instance_create_depth(main_x, main_y + main_space * 2, -100, obj_button_highscores);
creditButton = instance_create_depth(main_x, main_y + main_space * 3, -100, obj_button_credits);
exitButton = instance_create_depth(main_x, main_y + main_space * 4, -100, obj_button_exit);

main[4] = playButton;
main[3] = controlButton;
main[2] = highscoreButton;
main[1] = creditButton;
main[0] = exitButton;