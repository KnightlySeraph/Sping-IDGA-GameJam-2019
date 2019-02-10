// The states are WALK, FALL, and DEATH
state = "WALK";

hsp = 0;
vsp = 0;
grav = 2;
spd = 12;
direct = -1;

image_speed = 8;

last_sprite = sprite_index;

timer = 0;
// DEath Variables
hit = false;
death_rot = 1;
type = noone;
combo = 0;

damage_box = noone;

point = 10;
heal = 1;
increase = 2;