//variáveis que vou usar para ser o tempo entre o cima baixo
timer_pra_mudar_de_direcao = 60;
tempo_pra_mudar_de_direcao = 60;

//cima é 0 e baixo é 1
indo_para = 1;

estado = "baixo";

//velocidade
vel = 1;

state_machine = function(){
	switch (estado)
	{
		case "mudando de estado":
		{
			//ajustando o timer para o tempo
			timer_pra_mudar_de_direcao = tempo_pra_mudar_de_direcao;
			
			//se for 0 vai pra cima
			if (indo_para == 0) { estado = "cima" }
			//se for 1 vai pro estado de baixo
			if (indo_para == 1) { estado = "baixo" }
		}
		break 
		
		case "baixo":
		{
			//indo pra baixo
			y += vel;
		}
		break
		
		case "cima":
		{	
			y -= vel;
		}
		break
	}
}
	
timer = function(){
	
	//o tempo do timer só diminui se for maior que 0
	if (timer_pra_mudar_de_direcao > 0)
	{
		timer_pra_mudar_de_direcao--;	
	}
	
	//se chegar em zero ele muda tanto de baixo pra cima quanto de cima pra baixo
	if (timer_pra_mudar_de_direcao <= 0) { indo_para = !indo_para }
	
	//se for 0 ele vai pra cima e se for 1 ele vai pra baixo
	if (indo_para == 0 or indo_para == 1) { estado = "mudando de estado" }

}