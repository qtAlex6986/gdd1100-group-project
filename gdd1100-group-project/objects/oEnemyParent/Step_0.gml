/// Enemy changes direction upon collision 

if (place_meeting(x + walkSpeed, y, oFloor)) 
{
	walkSpeed = -walkSpeed; 
} 
if (place_meeting(x + walkSpeed, y, oPCParent)) {
	walkSpeed *= -1
	hp--;
	if (hp <= 0) {
		instance_destroy();
	}
}

x += walkSpeed; 