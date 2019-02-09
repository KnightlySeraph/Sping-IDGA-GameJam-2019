
tipDist = point_distance(x, y, x, 0);
spr_width = sprite_get_width(spr_enemy_string);
angle_player = point_direction(x, y, x, 0);
num = tipDist / spr_width;
gap = tipDist/num;
for(i = 0; i < num; i++){
	draw_sprite_ext(spr_enemy_string, -1, x + lengthdir_x(i * gap, angle_player), y + lengthdir_y(i * gap, angle_player), image_xscale, image_yscale, 0, c_white, image_alpha);	
}

draw_self();

