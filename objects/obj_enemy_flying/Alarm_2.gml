/// @description Create Damage Box
alarm[0] = room_speed * 0.4;
damage_box = instance_create_depth(x+(direct * 77), y - 32, depth - 2, obj_enemy_basic_damage);
damage_box.owner = self;