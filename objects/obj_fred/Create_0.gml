//this character can be controled by the player?
playable_character = false;

//moving variables
hsp = 0;
vsp = 0;
vel = 1;

//animation variables and arrays
anim_vel = 3;
anim_moving = [spr_fred_walking_right, spr_fred_walking_left, spr_fred_walking_up, spr_fred_walking_down]
anim_static = [spr_fred_right, spr_fred_left, spr_fred_up, spr_fred_static];