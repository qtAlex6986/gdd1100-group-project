//Handles GUI based on the room the PC is in
switch (room){
	//When in level 1 or 2...
	case(rLevel1 || rLevel2):
	//Pause Menu Draw GUI Code
	//Check if Game is Paused.. If it is...
	if (paused == true){
		//And checks if our paused instance already exists
		if (!surface_exists(paused_surf)) {
			//If paused_surf is its base case, then deactivate instances
			if (paused_surf == -1) {
				instance_deactivate_all(true);
			}
			//Preserve what is already there for our GUI
			paused_surf = surface_create(room_width, room_height);
			surface_set_target(paused_surf);
			draw_surface(application_surface, 0, 0);
			surface_reset_target();
		}
		else {
			//If Surface doesnt already exist, Draw it!
			draw_surface(paused_surf, 0, 0);
			draw_set_alpha(0.5);
		    draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
			 draw_set_alpha(1);
			 draw_set_halign(fa_center);
			 draw_text_transformed_colour(room_width / 2, room_height / 2, "PAUSED", 2, 2, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);
		}
	}//End GUI Code
	break;

}// End Switch