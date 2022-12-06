//if it touches the Player, it does Knockback!!
if (place_meeting(x+1, y, oPCParent) ||(place_meeting(x + 1, y, oSwordSlash) && oSwordSlash.visible == true)) {
	xSpeed *= -1;
	ySpeed = -5
	hp--;

	if (hp==0) {
		audio_play_sound(sword_Killing, 1, false);
		instance_destroy();
	}
}

var radiusCheck = collision_rectangle(x-1200,y+99999,x+1200,y-99999, oPCParent, false, 1);
if(radiusCheck){

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
		//move y untill its on the ground
		ySpeed = yMovement(ySpeed, oFloor);
		
		//move x untill its on the ground
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
}