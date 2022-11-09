//this function returns ySpeed for moving object in relitive to gravity
function yMovement(ySpeed, object) 
{	if (place_meeting(x, y + ySpeed, object)){
	
		//this loop creates pixel perfect collision
		while (!place_meeting(x, y  + sign(ySpeed) , object)) {
			y += sign(ySpeed);	
		}
		ySpeed = 0;	
	}
	return ySpeed;
}