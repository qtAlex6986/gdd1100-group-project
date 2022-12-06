

if(collision_circle(x, y, popupRadius, oPCParent, false, true)){

	popupId.visible = true;
} else {
	popupId.visible = false;
}

//right-left. returns -1 for left, returns 1 for right, retrns 0 for not moving
var xDirection = keyboard_check(ord("D")) - keyboard_check(ord("A"));

if (isBeingCarried){
	popupId.visible = false;
	if(target != noone) {
		//change direction based on player
		if (xDirection != 0) {
			image_xscale = xDirection*2;
		}
		if (xDirection < 0) {
			x = target.x - 20;
		} else if (xDirection > 0) {
			x = target.x + 20;
		}

		y = target.y;
	}
	

	
}