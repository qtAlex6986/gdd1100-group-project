//This sets up the collision proxy. 
//The first 4 integers define the size. In this case, our 
//rectangle is 400x400 relative to the object 
var collisionRadius = collision_rectangle(x + -200, y + -200, x + 200, y + 200, oPC, true, 1);

//If collision of this proxy. is true, then the ghost starts going towards the Pc
if((collisionRadius)){
	speed = 4;
	direction = point_direction(x, y, oPC.x, oPC.y);
	
}
//If the player is not in this radius, the Ghost flys in a circle
else {
	speed = 0;
	//Maybe add sleep idle? If the pc character is not colliding,
	// the ghost "sleeps" or sits in place. We can have it move aswell!
}


	