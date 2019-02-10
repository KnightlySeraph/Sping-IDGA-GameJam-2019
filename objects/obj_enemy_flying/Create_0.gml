// States are FOLLOW, ATTACK, and DEATH
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
	max_height = 300;
}
else max_height = 0;

last_sprite = sprite_index;

damage_box = noone;

// Flying Variables
updown = 1;
updown_speed = 0.5;
updown_time = 0;
target_x = x;
target_y = y;

// DEath Variables
hit = false;
death_rot = 1;
type = noone;
combo = 0;