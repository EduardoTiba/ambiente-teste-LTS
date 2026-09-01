function animation(var_anim_static, var_anim_moving, var_anim_vel){
	/*
	This function ask for the array of static, then the array of moving animation and
	finally the speed of animation.
	
	Quick note: In the array of moving and static animation, follow the order:
		0 = Right stuff;
		1 = Left stuff;
		2 = up stuff;
		3 = down stuff;
	*/
		switch (hsp)
	{
		//caso esteja indo pra direita
		case 1:
		{
			sprite_index = var_anim_moving[0];
			image_speed = var_anim_vel;
		}
		break
		
		//esquerda
		case -1:
		{
			sprite_index = var_anim_moving[1];	
			image_speed = var_anim_vel;
		}
		break
		
		//se estiver indo pra direita ele para na direita e pra esquerda a mesma coisa
		case 0:
		{
			if (sprite_index == var_anim_moving[0]) { sprite_index = var_anim_static[0] }
			if (sprite_index == var_anim_moving[1]) { sprite_index = var_anim_static[1] }
		}
		break
		
	}
	
	switch (vsp)
	{
		//baixo
		case 1:
		{
			sprite_index = var_anim_moving[3];
			image_speed = var_anim_vel;
		}
		break
		
		//cima
		case -1:
		{
			sprite_index = var_anim_moving[2];
			image_speed = var_anim_vel;
		}
		break
		
		//parando na animação correspondente
		case 0:
		{ 
			if (sprite_index == var_anim_moving[3]) { sprite_index = var_anim_static[3] }	
			if (sprite_index == var_anim_moving[2]) { sprite_index = var_anim_static[2] }	
		}
		break
		
	}
}