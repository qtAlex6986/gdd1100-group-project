//inputs

//right-left. returns -1 for left, returns 1 for right, retrns 0 for not moving
var xDirection = keyboard_check(vk_right) - keyboard_check(vk_left);
//checking if player hits up arrow
var jump = keyboard_check_pressed(vk_up);
//checking to seee if player is on ground
var onTheGround = place_meeting(x, y + 1, oPC.thisFloor);

//changing direction based on previouse direction/input
if (xDirection != 0) image_xscale = xDirection;

xSpeed = xDirection * moveSpeed;
ySpeed++;

//jumping
if (onTheGround) {
	if (jump) {
		ySpeed = -15
	}
}

//if colliding with Floor stop movement
if (place_meeting(x + xSpeed, y, oPC.thisFloor)){
	
	//this loop creates pixel perfect collision
	while (!place_meeting(x + sign(xSpeed), y , oPC.thisFloor)) {
		x += sign(xSpeed);	
	}
	xSpeed = 0;	
}
if (place_meeting(x, y + ySpeed, oPC.thisFloor)){
	
	//this loop creates pixel perfect collision
	while (!place_meeting(x, y  + sign(ySpeed) , oPC.thisFloor)) {
		y += sign(ySpeed);	
	}
	ySpeed = 0;	
}

x += xSpeed;
y += ySpeed