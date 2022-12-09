//Disable Blending Alpha 
gpu_set_blendenable(false);

//Pause Toggle - If P key is pressed...
if (keyboard_key_press(ord("P"))){
	//If game is not paused...
	if (!paused){
		//Set paused to true and Deactivate all except for this menu
		paused = true;
		instance_deactivate_all(true);
		
		//Draw menu based on the resolution of our view point/camera
		pauseSurf = surface_create(view_get_hport(0),view_get_wport(0));
			surface_set_target(pauseSurf);	
		draw_surface(application_surface, 0, 0);
		surface_reset_target();
		
		//Back up Surface to our buffer incase it is lost
		
		
	}
	else {
		//If paused, then set paused to false and reactivate instances
		paused = false;
		instance_activate_all();
	}
}