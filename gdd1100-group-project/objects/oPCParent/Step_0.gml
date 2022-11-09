//inputs

//this checks if he is hurt


//right-left. returns -1 for left, returns 1 for right, retrns 0 for not moving
var xDirection = keyboard_check(ord("D")) - keyboard_check(ord("A"));
//checking if player hits up arrow
var isJumping = keyboard_check_pressed(vk_space);
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
		//call jump function. if collection jump boots, extend jump
		if (jumpBoost && isJumping) {
			jumpNum = -5;
		} else {
			jumpNum = 0;
		}
		ySpeed = jump(xDirection, ySpeed, isJumping) + jumpNum;
	}

	//if colliding with Floor stop movement
	xSpeed = xMovement(xSpeed, oFloor);
	ySpeed = yMovement(ySpeed, oFloor);

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
	ySpeed = yMovement(ySpeed, oFloor);
	

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
	audio_play_sound(sword_hits_armor, 1, false);
	hp--;
	if(hp==0) {
		audio_play_sound(possible_player_death_sound, 1, false);
		show_message("you died");
		
		game_end();
	}
	
}