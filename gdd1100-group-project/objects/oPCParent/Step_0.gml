//inputs

//this checks if he is hurt


//right-left. returns -1 for left, returns 1 for right, retrns 0 for not moving
var xDirection = keyboard_check(ord("D")) - keyboard_check(ord("A"));
//checking if player hits up arrow
var jump = keyboard_check_pressed(vk_space);
//checking to seee if player is on ground
var onTheGround = place_meeting(x, y + 1, oFloor);


//first checks if the player is hurt. If not then move
if (!isHurt) {
	//changing direction based on previouse direction/input
	if (xDirection != 0) image_xscale = xDirection*3.5;

	xSpeed = xDirection * moveSpeed;
	ySpeed++;
	
	

	//jumping
	if (onTheGround) {
		//sprite checking
		
		if (xDirection != 0) {
			if (image_index < 19 ) {
				image_index++;
			} else {
				image_index = 1;
			}
		} else {
			image_index = 0;
		}
	
	
		if (jump) {
			ySpeed = -17;
			
		}
	}

	//if colliding with Floor stop movement
	if (place_meeting(x + xSpeed, y, oFloor)){
	
		//this loop creates pixel perfect collision
		while (!place_meeting(x + sign(xSpeed), y , oFloor)) {
			x += sign(xSpeed);	
		}
		xSpeed = 0;	
	}
	if (place_meeting(x, y + ySpeed, oFloor)){
	
		//this loop creates pixel perfect collision
		while (!place_meeting(x, y  + sign(ySpeed) , oFloor)) {
			y += sign(ySpeed);	
		}
		ySpeed = 0;	
	}

	x += xSpeed;
	y += ySpeed;
} else  if (isHurt) {
	//add knockback aniamtion
	image_index = 21;
	//this variable keeps the y moving even if hurt
	ySpeed++;
	//if knockback is going to hit the wall, dont let it collide inside
	if (place_meeting(x + (-xSpeed * knockbackTimer), y, oFloor)) {

		xSpeed = 0;
	} 
	//if knockback is going to hit the wall, dont let it collide inside
	if (place_meeting(x, y + ySpeed, oFloor)){
		//this loop creates pixel perfect collision
		while (!place_meeting(x, y  + sign(ySpeed) , oFloor)) {
			y += sign(ySpeed);	
		}
		ySpeed = 0;
	}
	

	//decrease speed of knockback
	if(knockbackTimer >= 0.4) {
		knockbackTimer -= 0.01;
	}
	
	//change everything back to normal once its on the ground
	if(knockbackTimer <= 0.4 && onTheGround) {
		isHurt = false;
		knockbackTimer = knockback;
	}
	x += -xSpeed * knockbackTimer;
	y += ySpeed;
}//knockback

//if colliding with enemy, take away halth and isHurt = true
if (!isHurt && place_meeting(x, y, oEnemyParent)) {
	isHurt = true;
	hp--;
	//show_message(hp);
	if(hp==0) {
		show_message(hp);
		game_end();
	}
	
}