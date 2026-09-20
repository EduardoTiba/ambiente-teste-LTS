draw_self();

if (draw_effect == false) { exit }
//efeito de indo para cima
gpu_set_blendmode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y+5, image_xscale * 1.2, image_yscale, image_angle, c_red, 0.6);
gpu_set_blendmode(bm_normal);