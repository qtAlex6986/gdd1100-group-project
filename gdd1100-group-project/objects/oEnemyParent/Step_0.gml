var radiusCheck = collision_rectangle(x-1200,y+99999,x+1200,y-99999, oPCParent, false, 1);
if(radiusCheck){
	/// Enemy changes direction upon collision 

	//if touches wall, go other direction
	if (place_meeting(x + walkSpeed, y, oFloor)) 
	{
		walkSpeed = -walkSpeed; 
	} 

	//if it touches player, go other direction
	if (place_meeting(x + 1, y, oPCParent)) {
		walkSpeed *= -1
		hp--;
		if (hp <= 0) {
			instance_destroy();
		}
	}

	x += walkSpeed; 
}