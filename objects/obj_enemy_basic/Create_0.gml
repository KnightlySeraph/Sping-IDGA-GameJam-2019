// States are FOLLOW, ATTACK, PATH, KNOCKBACK, DEATH and FALL
state = "FOLLOW";

hsp = 0;
vsp = 0;
grav = 0.5;
spd = 5;
direct = 1;

dead = false;

if(instance_exists(obj_player))
{
	max_height = obj_player.sprite_height * 1.5;
}
else max_height = 0;

depth = -10;

show_debug_message("SCREATE");