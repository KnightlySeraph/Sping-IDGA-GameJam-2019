// States are FOLLOW, ATTACK, PATH, DEATH and FALL
state = "FOLLOW";

hsp = 0;
vsp = 0;
grav = 0.5;
spd = 2;
direct = 1;

attacking = false;
resting = false;

dead = false;

if(instance_exists(obj_player))
{
	max_height = obj_player.sprite_height * 1.5;
}
else max_height = 0;

color = c_white;
anti_sezure = 0;

last_sprite = sprite_index;

damage_box = noone;

hit = false;
death_rot = 1;