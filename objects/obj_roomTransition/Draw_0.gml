/// @description Insert description here
// You can write your code in this editor
fadeAlpha = clamp(fadeAlpha + fadeState * fadeSpeed, 0, 1);
if(fadeAlpha == 1)
{
	if(room == rm_menu_test)
	{
		room_goto(room0);
	}
	fadeState = -1;
}
if(fadeAlpha == 0 && fadeState == -1)
{
	instance_destroy();
	draw_set_alpha(1);
}
if(instance_exists(self))
{
	draw_set_color(c_black);
	draw_set_alpha(fadeAlpha);
	draw_rectangle(0, 0, room_width, room_height, false);
}