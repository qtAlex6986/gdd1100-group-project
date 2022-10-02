/// Enemy changes direction upon collision 

if (place_meeting(x + hsp, y, oFloor)) 
{
	while (!place_meeting(x + sign(hsp), y, oFloor))
	{ 
		x = x + sign(hsp);
	}
	hsp = -hsp; 
} 

x = x + hsp; 