jumpTimer --; 
ySpeed ++
var onGround = place_meeting(x, y + 1, oFloor);

if (jumpTimer <= 0) { 

	xSpeed = 5 * xDirection; 
	
	//if on the ground, jump
	if (onGround) {
		ySpeed = -10;
		image_index = 1;
	}
	//reset timer
	jumpTimer = 90;

}//if

//if on the ground, stay Idle
if (onGround) {
	image_index = 0;
}

//this code keeps the slime in the air untill it collides with something
//if not on the ground, continue to fall into place
if (!onGround) {
	if (place_meeting(x, y + ySpeed, oFloor)) {
		while (!place_meeting(x, y  + sign(ySpeed) , oFloor)) {
			y += sign(ySpeed);	
		}
		ySpeed = 0;
	}
		if (place_meeting(x + xSpeed, y, oFloor)) {
		while (!place_meeting(x + sign(1*xDirection), y , oFloor)) {
			x += sign(xSpeed);	
		}
		xSpeed = 0;
		xDirection *= -1;
	} 
}
x += xSpeed;
y += ySpeed
