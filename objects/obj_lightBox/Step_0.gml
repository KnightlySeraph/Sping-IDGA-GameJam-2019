/// @description Insert description here
// You can write your code in this editor

// Delete self when not attacking
if (obj_player.image_index == 3.0 && (obj_player.attackIndex == 0 || obj_player.attackIndex == 1)) {
	show_debug_message("obj destroyed");
	instance_destroy();
}
else if (obj_player.isAttacking == false) {
	instance_destroy();	
}