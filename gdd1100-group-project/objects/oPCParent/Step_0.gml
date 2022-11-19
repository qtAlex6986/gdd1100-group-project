//inputs

//this checks if he is hurt


//right-left. returns -1 for left, returns 1 for right, retrns 0 for not moving
var xDirection = keyboard_check(ord("D")) - keyboard_check(ord("A"));
//checking if player hits up arrow
var isJumping = keyboard_check_pressed(vk_space);
//checking to seee if player is on ground
var onTheGround = place_meeting(x, y + 1, oFloor);

var pickUpWeapon = keyboard_check_pressed(ord("E"));

//Code picks up weapon
if (pickUpWeapon){
	//creates list of weapons
	var pickupList = ds_list_create();
	var pickupCount = collision_circle_list(x, y, pickupRadius, oWeaponParent, false, true, pickupList, true);
	
	//assigns targeted weapon to object ID
	if(pickupCount > 0) {
		//first we need to know if we are holding on to a weapon
		if(weapon == noone) {
			weapon = pickupList[| 0];
			
			weapon.target = id;
			weapon.isBeingCarried = true;
			
		} else {
			//is holding a weapon
			for(var i = 0; i < pickupCount; i++) {
				if (pickupList[| i] != weapon) {
					//drop original weapon 
					weapon.target = noone;
					weapon.isBeingCarried = false;
					
					//get new weapon
					weapon = pickupList[| i];
					weapon.target = id;
					weapon.isBeingCarried = true;
					
					break;
				}
			}
		}
	}
	//destroy list to prevent memory leaks
	ds_list_destroy(pickupList);
}

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