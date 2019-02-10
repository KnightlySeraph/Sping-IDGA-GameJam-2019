/// @description Init primary vars
global.usingGamePad = false;
instance_create_depth(x, y, 0, STATES);
STATE = STATES.IDLE;
window_set_fullscreen(true);

instance_create_depth(x, y, 0, Connecter); // Connects controller

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
points = 0;

// Gamepad Slot
slot = -1;

// ======================INIT NON-GLOBALS========================
grounded = true; // Is the player on the ground
move = 0; // Drives movement
ori_player_grav = 1;
player_grav = ori_player_grav;
isJumping = false;
oriJumpForce = -12;
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
player_vsp = 0;
isPounding = false;

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


// Taking Damage
invincible = false;
invince_timer = 0;
invince_max = room_speed * 1.5;
spotHit = false;

//SPEED
speed_timer = 0;

audio_play_sound(snd_startAnnouncer, 1, 0);

