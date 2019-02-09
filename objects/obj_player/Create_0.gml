/// @description Init primary vars
global.usingGamePad = false;

Connect();

// ========================ALLOCATE GLOBALS=========================
globalvar hitPointMax;
globalvar apMax;
globalvar maxSpeed;
globalvar moveSpeed;
globalvar hitPoints;
globalvar actionMeter;
globalvar basicDamage;
globalvar stompDamage;
globalvar laserDamage;
globalvar dashDamage;
globalvar airDamage;
globalvar points;

// ========================INIT GLOBALS========================
hitPointMax = 100;
apMax = 100;
maxSpeed = 5;
moveSpeed = maxSpeed;
hitPoints = hitPointMax;
actionMeter = apMax;
basicDamage = 1;
stompDamage = 3;
laserDamage = 3;
dashDamage = 4;
airDamage = 2;

// Gamepad Slot
slot = -1;

// ======================INIT NON-GLOBALS========================
grounded = true; // Is the player on the ground
move = 0; // Drives movement
ori_player_grav = 5;
player_grav = ori_player_grav;
isJumping = false;
oriJumpForce = -18;
jumpForce = oriJumpForce;
jumpLength = 0.3;
peak = 0; // Used for the jump

