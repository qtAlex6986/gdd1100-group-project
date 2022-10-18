//this code just makes a camera follow the player
var xCam = clamp(oPCParent.x - wCam / 2, 0, room_width - wCam);
var yCam = clamp(oPCParent.y - hCam / 2, 0, room_height - hCam);

var curX = camera_get_view_x(view_camera[0]);
var curY = camera_get_view_y(view_camera[0]);

var newX = lerp(curX, xCam, 0.1);
var newY = lerp(curY, yCam, 0.1);

camera_set_view_pos(view_camera[0], newX, newY);