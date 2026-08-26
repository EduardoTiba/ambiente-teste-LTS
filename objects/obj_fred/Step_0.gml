//if the player click on the character he have the control or not
control_player();
if (playable_character == true) { show_debug_message("pode me mover") }

//if the player don´t have the control, the character won´t move
if (playable_character == false) { exit }

//function to move
moving_character();

//function for animation
animation(anim_static, anim_moving, anim_vel);