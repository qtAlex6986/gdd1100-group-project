
//Checks for room which room we are in 
if (room == rLevel1 || room = rLevel2){
	
	//Checked if the p key is pressed...
if (keyboard_check_pressed(ord("P"))){
	//Sets paused to the opposite of what it is
    paused = !paused;
	//If pause is false, start the came again
    if (paused == false)
        {
        instance_activate_all();
        surface_free(paused_surf);
                paused_surf = -1;
        }
    }
	//If pause is true, active alarms
if (paused == true){
    alarm[0]++;
  }
}