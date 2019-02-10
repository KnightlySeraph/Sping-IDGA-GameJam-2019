/// @description Insert description here
// You can write your code in this editor
option_fadeAlpha = clamp(option_fadeAlpha + option_fadeState * option_fadeSpeed, 0, 1);
if(option_fadeAlpha == 1)
{
	option_fadeState = -1;
}
if(option_fadeAlpha == 0 && option_fadeState == -1)
{
	instance_destroy();
	show_debug_message("Transition over");
	draw_set_alpha(1);
}
if(instance_exists(self))
{
	draw_set_color(c_black);
	draw_set_alpha(option_fadeAlpha);
	draw_rectangle(0, 0, room_width, room_height, false);
}