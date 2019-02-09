/// @description Init primary vars
global.usingGamePad = false;

Connect();

// ========================ALLOCATE GLOBALS=========================
globalvar hitPointMax;
globalvar apMax;
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
hitPoints = hitPointMax;
actionMeter = apMax;
basicDamage = 1;
stompDamage = 3;
laserDamage = 3;
dashDamage = 4;
airDamage = 2;

// Gamepad Slot
slot = -1;
