/// @description Insert description here
// You can write your code in this editor
for(var k = 0; k < 5; k++)
{
	if(place_meeting(mouse_x, mouse_y, main[k]))
	{
		var hoverbutton = main[k];
		hoverbutton.sprite_index = spr_menu_tempHover;
	}
}