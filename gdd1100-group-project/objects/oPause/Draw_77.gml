//Disable Blending Alpha 
gpu_set_blendenable(false);

//If paused, draw our frozen screen to surface
if (paused) {
	surface_set_target(application_surface);
	
	if (surface_exists(pauseSurf)) draw_surface(pauseSurf, 0,0);
	else{
		if (room == rLevel1) pauseSurf = surface_create(resHeight,resWidthLevel1);
		if (room == rLevel2) pauseSurf = surface_create(resHeight,resWidthLevel2);
		buffer_set_surface(pauseSurfBuffer, pauseSurf, 0);
	}
	
	surface_reset_target();
}

//Pause Toggle - If P key is pressed...
if (keyboard_check_pressed(ord("P"))){
	//If game is not paused...
	if (!paused){
		//Set paused to true and Deactivate all except for this menu
		paused = true;
		instance_deactivate_all(true);
		
		//Draw menu based on the resolution of our view point/camera
		if (room == rLevel1) pauseSurf = surface_create(resHeight,resWidthLevel1);
		if (room == rLevel2) pauseSurf = surface_create(resHeight,resWidthLevel2);
			surface_set_target(pauseSurf);	
		draw_surface(application_surface, 0, 0);
		surface_reset_target();
		
		//Back up Surface to our buffer incase it is lost
		if ((buffer_exists(pauseSurfBuffer))){
			buffer_delete(pauseSurfBuffer);
		}
		
		if (room == rLevel1) pauseSurfBuffer = buffer_create((resHeight*resWidthLevel1*4), buffer_fixed, 1);
		if (room == rLevel2) pauseSurfBuffer = buffer_create((resHeight*resWidthLevel2*4), buffer_fixed, 1);
		buffer_get_surface(pauseSurfBuffer, pauseSurf, 0);
	}
	else {
		//If paused, then set paused to false and reactivate instances/ clear memory
		paused = false;
		instance_activate_all();
		
		if (surface_exists(pauseSurf)) surface_free(pauseSurf);
		if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
	}
}

//reenable alpha blending
gpu_set_blendenable(true);