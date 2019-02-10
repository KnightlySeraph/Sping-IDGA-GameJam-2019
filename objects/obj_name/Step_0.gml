/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(vk_enter))
{
	global.name = name;
	scr_addScore(myPoints);
	room_goto(rm_menu_test);
}
if(string_length(keyboard_string) <= limit)
{
	name = keyboard_string;
}
else
{
	keyboard_string = name;
}