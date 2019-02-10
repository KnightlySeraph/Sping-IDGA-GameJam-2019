/// @description Init primary vars
global.usingGamePad = false;
instance_create_depth(x, y, 0, STATES);
STATE = STATES.IDLE;

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
ori_player_grav = 9;
player_grav = ori_player_grav;
isJumping = false;
oriJumpForce = -26;
jumpForce = oriJumpForce;
jumpLength = 0.3;
jump1 = true;
jump2 = true;
isAttacking = false;
stomping = false;
rumble = false;
key_left = 0;
key_right = 0;
attackIndex = 0;
attackDelay = 1;
faceRight = true;
faceLeft = false;
firing = false;
isDashing = false;

camLerp = 0.01;

// Hitboxing
lightHit_xRange = 192;
lightHit_yRange = 128;

// Anim vars
idling = true;
moveRight = false;
moveLeft = true;
jump1right = false;
jump1left = false;
jump2right = false;
jump2left = false;
fallLeft = false;
fallRight = false;
laserRight = false;
laserLeft = false;


