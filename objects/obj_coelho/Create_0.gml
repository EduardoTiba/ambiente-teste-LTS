//mantendo apenas uma máscara de colisão
mask_index = sprite_index;

default_vel = 1;
vel = 1;
hsp = 1;
dash_spd = 20;
false_direc = 1;
/* the variable "direc" i´m going to use this for the dash stuff. Instead of using 0 and 180, that
is the values of direction, i´m going to use 1 and -1. Why? Beacause when the bunny is static, the "hsp"
variable is 0, so the player can do a dash when the bunny is not walking. */

estado = "parado";

parado = [spr_coelho_right, spr_coelho_left];
andando = [spr_coelho_right_walk, spr_coelho_left_walk];

//Método do sistema de movimento (até agora só tem na horizontal)
walk_bunny = function(){
	
	var _right = keyboard_check(ord("D"));
	var _left = keyboard_check(ord("A"));
	var _dash = keyboard_check_pressed(ord("K"));
	var _run = keyboard_check(vk_shift);
	
	hsp = (_right - _left) * vel;	
	x += hsp;

	
	//dash
	if (_dash)
	{
		x += dash_spd * sign(hsp);	
		if (hsp == 0) { x += dash_spd * false_direc }
	}
	
	if (hsp > 0) //direita
	{
		sprite_index = andando[0];	
		estado = "andando";
		false_direc = 1;
	}
	else if (hsp < 0) //esquerda
	{
		sprite_index = andando[1]; 
		estado = "andando";
		false_direc = -1;
	}
	
	if (hsp == 0) //parado
	{
		estado = "parado";
		if (sprite_index == andando[0]) { sprite_index = parado[0] }
		if (sprite_index == andando[1]) { sprite_index = parado[1] }
	}


}

//Método de estado (serve mais para teste do que para uma mecânica, talvez um dia tenha aqui uma mecânica :D)
state_machine = function(){
	
	switch (estado)
	{
		case "andando":
		{
			if (keyboard_check(vk_enter)) { image_blend = c_aqua }
			if (keyboard_check(vk_shift)) { vel = 2 }
			else { vel = default_vel }
		}
		break
		
		case "parado":
		{
			if (keyboard_check(vk_enter)) { image_blend = c_red }
	
		}
		break
	
		case "ativando cura":
		{
			//criando a sprite de cura
			instance_create_layer(x, y, layer, obj_cura);	
			
			//depois troca de estado
			estado = "curando";
		}
		break
		
		case "curando":
		{
			
		}
	}
/* Por que eu fiz esse código de máquina de estados? Bom... eu queria testar uma hipótese minha, que era:
A consequência de uma única tecla, pode mudar dependendo do estado; E realmente, isso é verdade. Veja que a 
tecla "vk_enter" tem diferentes ações dependendo do estado que o objeto se encontra. De primeira eu tava duvi-
dando que fosse ter duas diferentes consequências, mas a minha hipótese tava certa.

Não vou falar que sou um gênio da programação, mas fico feliz de ter entendido um pouco mais da ultilidade das
máquinas de estado. */
}