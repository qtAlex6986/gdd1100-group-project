//this function lets the player jump
function jump( xDirection, ySpeed, isJumping) 
{
	if (xDirection != 0) {
		if (image_index < 19 ) {
			image_index++;
		} else {
			image_index = 1;
		}
		} else {
			image_index = 0;
		}
	
	
		if (isJumping) {
			ySpeed = -17;
			
		}
		return ySpeed;
}