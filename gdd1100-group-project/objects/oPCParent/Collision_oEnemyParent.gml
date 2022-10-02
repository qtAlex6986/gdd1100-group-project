//destroys enemy object, and takes knockback by calling alarm

instance_destroy(other);

//this decliration stops player movement untill its not hurt anymore
isHurt = true;

//knockback will be 1.5 seconds
alarm[0] = 90;