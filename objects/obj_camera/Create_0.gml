/// @description Insert description here
// You can write your code in this editor
zooming = false;
stick = false;
cameraLerp = obj_player.camLerp;
lerpOut = cameraLerp;
zoomOut = false;
/// @description Smooth Follow on Player
player_cam = camera_create();
zoomScale = 2.5;

width = 2098;
oriHeight = 1180;
height = oriHeight;
aspectRatio = 0.5624404194470925;
zoomSpeed = 100;

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(width, height, 1, 10000);

camera_set_view_mat(player_cam, vm);
camera_set_proj_mat(player_cam, pm);

view_camera[0] = player_cam;

follow = obj_focus;
xTo = x;
yTo = y;

//Shake Stuff
shake_length = 0;
shake_mag = 0;
shake_remain = 0;
buff = 32;

depth = -100;
