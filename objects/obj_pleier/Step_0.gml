Xinput = keyboard_check(ord("D")) - keyboard_check(ord("A"));
Yinput = keyboard_check(ord("S")) - keyboard_check(ord("W"));
shoot  = keyboard_check(ord("K"));

if (Xinput != 0 or Yinput != 0)
{
	//pegando os valores de todas as direções, pelo o que eu entendi, essa variável vai ser
	//criada a todo momento, assim o x e y do player sempre será o 0, (hipótese)
	dir = point_direction(0, 0, Xinput, Yinput);
	move_x = lengthdir_x(speed_x, dir);
	move_y = lengthdir_y(speed_y, dir);
	
	//movendo o pleier
	x += move_x;
	y += move_y;
	show_debug_message(move_x)
}

if (Xinput == 1) { direc = 0 }
if (Xinput == -1) { direc = 180 }

if (Yinput == 1) { direc = 270 }
if (Yinput == -1) { direc = 90 }

//se o timer de carregar for maior que 0, então ele vai diminuindo
if (timer_charging > 0) { timer_charging-- }

//só pode atirar se apertar a tecla "K" e se o timer tiver zerado
if (shoot == true and timer_charging == 0)
{
	//criando o tiro
	var _tiro = instance_create_layer(x, y, layer, obj_tiro);
	//definindo variáveis pro tiro
	_tiro.speed = 2;
	_tiro.direction = direc;
	//tempo de intervalo entre os tiros
	timer_charging = tempo_charging;
	
	
}

