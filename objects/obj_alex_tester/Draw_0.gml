if (createRight) {
	x_direct = room_width;
	while((x_direct - x) % sprite_get_width(spr_lightning) != 0) x_direct += 1;
}
else {
	show_debug_message("Should Create left");
	x_direct = 0;
	while((x_direct + x) % sprite_get_width(spr_lightning) != 0) x_direct -= 1;
}
tipDist = point_distance(x, y, x_direct, y);

spr_width = sprite_get_width(spr_lightning);
if (createRight) angle_player = point_direction(x, y, x_direct, y);
else angle_player = point_direction(x, y, 0, y);
num = tipDist / spr_width;
gap = tipDist/num;
for(i = 0; i < num; i++){
	draw_sprite_ext(spr_lightning, ((timer / 5) + i) % 6, x + lengthdir_x(i * gap, angle_player), y + lengthdir_y(i * gap, angle_player), image_xscale, image_yscale, 0, c_white, image_alpha);	
}
