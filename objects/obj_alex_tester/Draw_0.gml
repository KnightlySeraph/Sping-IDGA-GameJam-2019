if (createRight) {
	tipDist = point_distance(x, y, room_width, y);
	while(tipDist % sprite_get_width(spr_lightning) != 0) tipDist += 1;
}
else {
	show_debug_message("Should Create left");	
	tipDist = point_distance(x, y, 0, y);
	while(tipDist % sprite_get_width(spr_lightning) != 0) tipDist -= 1;
}


spr_width = sprite_get_width(spr_lightning);
if (createRight) angle_player = point_direction(x, y, room_width, y);
else angle_player = point_direction(x, y, 0, y);
num = tipDist / spr_width;
gap = tipDist/num;
for(i = 0; i < num; i++){
	draw_sprite_ext(spr_lightning, ((timer / 5) + i) % 6, x + lengthdir_x(i * gap, angle_player), y + lengthdir_y(i * gap, angle_player), image_xscale, image_yscale, 0, c_white, image_alpha);	
}
