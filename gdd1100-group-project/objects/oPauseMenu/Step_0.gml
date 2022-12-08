//Pause Menu Set Up
//If room is anything other than the start menu...
if (room != rStartRoom){
//Check if the key P is pressed...
	if (keyboard_check_pressed(ord("P"))){
		//Change paused to it's inverse
		paused = !paused;
		//If the game is not paused, then reactivate all instances
		//and reset surf
		if (paused == false){
			instance_activate_all();
			surface_free(paused_surf);
            paused_surf = -1;
        }
    }
	//If pause is true, then activate alarms that Stalls the Game
	if (paused == true) {
		alarm[0]++;
		alarm[1]++;
	}
}