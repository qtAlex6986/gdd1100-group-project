var attack = keyboard_check_pressed(ord("O"));
var xDirection = keyboard_check(ord("D")) - keyboard_check(ord("A"));

//change direction based on player
if (xDirection != 0) {
	image_xscale = xDirection;
}
if (xDirection < 0) {
	x = oPCParent.x - 30;
} else if (xDirection > 0) {
	x = oPCParent.x + 30;
}

y = oPCParent.y;

if (attack && canAttack) {
	visible = true;
	canAttack = false;
	audio_play_sound(Sword_clang,1,false);
	alarm[0] = 10;
	alarm[1] = 30;
}