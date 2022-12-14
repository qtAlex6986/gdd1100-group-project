var up, down, accept, pKey;
;
 
pKey	  = keyboard_check_pressed(ord("P"));
up		  = keyboard_check_pressed(vk_up);
down	  = keyboard_check_pressed(vk_down);
accept	  = keyboard_check_pressed(ord("X"));


//changes sprite image to keep in bounds of menu
if (up && image_index > 0) {
	image_index--;
}
if (down && image_index < 2) {
	image_index++;
}

//if EXIT is selected, exit game
if (image_index == 2 && accept) {
	game_end();
}

//if Save is selected, then save
if (image_index == 0 && accept) {
	
}

//if Load is selected, go to menu room
if (image_index == 1 && accept) {
	image_index = 3;
}

