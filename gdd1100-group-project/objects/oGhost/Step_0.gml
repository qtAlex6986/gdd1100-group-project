
//This sets up the collision proxy. 
//The first 4 integers define the size. In this case, our 
//rectangle is 400x400 relative to the object 
var collisionRadius = collision_rectangle(x + -700, y + -700, x + 700, y + 700, oPC, true, 1);
//If collision of this proxy. is true, then the ghost starts going towards the Pc
if((collisionRadius)){
	speed = 6;
	direction = point_direction(x, y, oPCParent.x  , oPCParent.y - 10 );
	sprite_index = sGhostFollowing;
} //If the player is not in this radius, the Ghost sits idle
else if (collisionRadius && (x - oPCParent.x) < 10 ){
	speed = 4;
	direction = point_direction(x, y, oPCParent.x  , oPCParent.y - 10 );
	sprite_index = sGhostFollowing;
}
else {
	speed = 0;
	//Maybe add sleep idle? If the pc character is not colliding,
	// the ghost "sleeps" or sits in place. We can have it move aswell!
	sprite_index = sGhostIdle;
}


//Controls Sprite Index
if(hspeed > 0){
	image_xscale = -2;
}
else if (hspeed < 0){
	image_xscale = 2;
}


