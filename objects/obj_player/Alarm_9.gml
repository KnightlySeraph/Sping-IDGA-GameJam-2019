/// @description End Dash
// You can write your code in this editor
isDashing = false;

if (instance_exists(obj_dashBox)) {
	instance_destroy(obj_dashBox);	
}

moveSpeed = maxSpeed;