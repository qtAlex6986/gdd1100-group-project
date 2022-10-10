var up, down, accept, back;

up		  = keyboard_check_pressed(vk_up);
down	  = keyboard_check_pressed(vk_down);
accept	  = keyboard_check_pressed(ord("X"));
back	  = keyboard_check_pressed(ord("F"));

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

//if START is selected, go to room game
if (image_index == 0 && accept) {
	room_goto(rLevel1);
}

//if MENU is selected, go to menu room
if (image_index == 1 && accept) {
	room_goto(rMenu);
}

//if F is pressed, go back
if (back) {
	room_goto(rStartRoom);
}