estado = "sem comando";
gravidade = 0.1;
salto = 20;
tempo_ar = 30;
timer_ar = 0;

//timer
timer_salto = 0;
tempo_salto = 60;

state_machine = function(){
	
	//sempre, independente do estado, roda esse código
	y += gravidade;
	
	switch (estado)
	{
		case "sem comando":
		{
			gravidade = lerp(gravidade, 10, 0.005);
		}
		break
		
		case "salto":
		{
			//o timer de ficar no ar diminui
			timer_ar--;
			//o valor da gravidade faz o player ser jogado para cima
			gravidade = -0.8;
			
			if (timer_ar <= 0)
			{
				estado = "sem comando" 
				timer_ar = 0;
			}
		}
	}
}

control = function(){
	
	var _sobe, _atira;
	_sobe	= keyboard_check_pressed(vk_space);
	_atira	= mouse_check_button(mb_left);
	
	if (_sobe)
	{
		estado = "salto";
		timer_ar = tempo_ar;
	}
}