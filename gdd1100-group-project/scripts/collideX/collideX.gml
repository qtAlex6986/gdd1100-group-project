//this function returns xSpeed for moving object in relitive to collision
function xMovement(xSpeed, object) 
{
	if (place_meeting(x + xSpeed, y, object)){
	
		//this loop creates pixel perfect collision
		while (!place_meeting(x + sign(xSpeed), y , object)) {
			x += sign(xSpeed);	
		}
		xSpeed = 0;	
	}
	return xSpeed;
}