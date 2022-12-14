
//Pause Toggle - If P key is pressed...
if (keyboard_check_pressed(ord("P"))){
	//If game is not paused...
	if (!paused){
		//Set paused to true and Deactivate all except for this menu
		paused = true;
		instance_deactivate_all(true);
		
		savedRoom = room;
		room_goto(rPauseRoom);
		
	}
	else {
		//If not paused, then set paused to false and reactivate instances/ clear memory
		paused = false;
		instance_activate_all();
		room_goto(room);
	}
}
