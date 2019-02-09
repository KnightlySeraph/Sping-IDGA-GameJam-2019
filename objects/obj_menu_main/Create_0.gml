/// @description Insert description here
// You can write your code in this editor
menu_step = 0;
menu_index = 0;
menu_committed = -1;
menu_control = true;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 80;

menu_x = gui_width / 4;
menu_y = gui_margin;
menu_space = 200;

playButton = instance_create_depth(menu_x, menu_y, -100, obj_button_play);
controlButton = instance_create_depth(menu_x, menu_y + menu_space, -100, obj_button_controls);
highscoreButton = instance_create_depth(menu_x, menu_y + menu_space * 2, -100, obj_button_highscores);
creditButton = instance_create_depth(menu_x, menu_y + menu_space * 3, -100, obj_button_credits);
exitButton = instance_create_depth(menu_x, menu_y + menu_space * 4, -100, obj_button_exit);

menu[4] = playButton;
menu[3] = controlButton;
menu[2] = highscoreButton;
menu[1] = creditButton;
menu[0] = exitButton;