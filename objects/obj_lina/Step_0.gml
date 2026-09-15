//this character can´t move if this variable is false
if (playable_character == false) { exit }

moving_character();

animation(anim_static, anim_walk, anim_vel, hsp, vsp, vel, -vel);