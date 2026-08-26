function multiplayer(){
	//this function don´t actually works...
}


function moving_character(){
	
	/*
	before using this function, please, don´t forget to create the variables
	"hsp", "vsp" and "vel"
	
	"hsp" and "vsp" always starts as 0. And "vel" you can decide... That´s the speed
	*/
	
	//getting the inputs
	right	= keyboard_check(ord("D")) or keyboard_check(vk_right);
	left	= keyboard_check(ord("A")) or keyboard_check(vk_left);
	down	= keyboard_check(ord("S")) or keyboard_check(vk_down);
	up		= keyboard_check(ord("W")) or keyboard_check(vk_up);

	//returns 1 or -1 or 0
	hsp = (right - left) * vel;
	vsp = (down - up) * vel;
	
	//fixing the vector stuff, kidda problematic...
	if (hsp != 0 or vsp != 0)
	{
		//get the direction where the guy is going
		dir = point_direction(0, 0, hsp, vsp);
		
		//moving towards that direction
		move_x = lengthdir_x(vel, dir);
		move_y = lengthdir_y(vel, dir);
		
		//actually moving the player
		x += move_x;
		y += move_y;
	}
}
