estado = "sem comando";
gravidade = 0.1;
salto = 20;

//tempo padrão ficar no ar
tempo_ar = 20;
timer_ar = 0;
draw_effect = false;

//tempo máximo pra ficar no ar
tempo_max_ar = 60;
timer_max_ar = 0;

state_machine = function(){
	
	//sempre, independente do estado, roda esse código
	y += gravidade;
	
	switch (estado)
	{
		case "sem comando":
		{
			//jogando o player pra baixo, num efeito bem bom
			gravidade = lerp(gravidade, 10, 0.002);
			
			//zerando o timer de ficar no ar
			timer_ar = 0;
			/* Só to zerando agora pra dar um tempo entre os saltos */
		}
		break
		
		case "salto curto":
		{
			//pode desenhar o efeito 
			draw_effect = true;
			
			//só roda o timer se estiver zerado
			if (timer_ar <= 0) { timer_ar = tempo_ar }
			gravidade = -1;
			
			timer_ar--;
			
			if (timer_ar <= 0)  
			{
				estado = "sem comando";
				draw_effect = false;
			}
		}
        break
	}
}

control = function(){
	
	var _salto_baixo, _salto_alto, _atira;
	_salto_baixo = keyboard_check_pressed(vk_space);
	_atira	= mouse_check_button(mb_left);
	
	if (_salto_baixo) { estado = "salto curto" }
}
