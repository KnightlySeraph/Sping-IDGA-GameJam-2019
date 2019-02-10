/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_color(c_white);
draw_set_font(Epbb);
draw_text_transformed(500, 500, "Enter name:", 2, 2, 0);
draw_text_transformed(500, 400, "Points:" + string(myPoints), 2, 2, 0);
draw_text_transformed(500, 550, name, 2, 2, 0);
