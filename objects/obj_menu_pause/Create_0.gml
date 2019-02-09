/// @description Insert description here
// You can write your code in this editor
pause_step = 0;
pause_index = 0;
pause_committed = -1;
pause_control = true;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 80;

pause_x = gui_width / 4;
pause_y = gui_margin;
pause_space = 200;

plautton = instance_create_depth(pause_x, pause_y, -100, obj_button_play);
controlButton = instance_create_depth(pause_x, pause_y + pause_space, -100, obj_button_controls);
highscoreButton = instance_create_depth(pause_x, pause_y + pause_space * 2, -100, obj_button_highscores);
creditButton = instance_create_depth(pause_x, pause_y + pause_space * 3, -100, obj_button_credits);
exitButton = instance_create_depth(pause_x, pause_y + pause_space * 4, -100, obj_button_exit);

pause[4] = playButton;
pause[3] = controlButton;
pause[2] = highscoreButton;
pause[1] = creditButton;
pause[0] = exitButton;