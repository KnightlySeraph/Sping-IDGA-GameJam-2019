/// @description Set attack related vars
if (sprite_index == spr_attack1_left || sprite_index == spr_attack1_right) {
	attackIndex++;
	isAttacking = false;
}
if (sprite_index == spr_attack2_left || sprite_index = spr_attack2_right) {
	attackIndex++;
	isAttacking = false;
}
if (sprite_index == spr_attack3_left || sprite_index == spr_attack3_right) {
	attackIndex = 0;
	isAttacking = false;
}
