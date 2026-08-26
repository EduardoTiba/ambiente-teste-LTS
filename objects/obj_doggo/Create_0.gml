//ele está seguindo o personagem que chamou ele?
seguindo = false;

//distância limite do personagem
distancia_limite = 60;

//essa variável vai impedir que o doggo possa ser chamado mesmo quando está perto do personagem
sem_comando = true;

//estado inicial dele é "sem comando", mas vai mudar
estado = "sem comando";

//máquina de estados
state_machine = function(){
	switch (estado)
	{
		case "sem comando":
		{
			//checando se o doggo pode receber comando. Só pode se ele estiver mais distante que o limite
			if (distance_to_object(obj_personagem_radical) >= distancia_limite) { sem_comando = true }
			
			//O doggo só pode realizar o comando de seguir, se o personagem chamar e se o doggo estiver sem nenhum comando
			if (seguindo == true and sem_comando == true) 
			{
				//show_message("Ta vindo");
				//se ele está seguindo, então toca o audio
				audio_play_sound(snd_dog_coming, 1, 1);
				//depois de tocar o áudio, ele muda de estado
				estado = "seguindo" 
			}
		}
		break
		
		case "seguindo":
		{	
			//ajustado a velocidade do doggo
			speed = 2;
			//o doggo se move, em direção ao x e y do personagem
			move_towards_point(obj_personagem_radical.x, obj_personagem_radical.y, speed);	
			
			//se ele ficar próximo do personagem ele muda de estado
			if (distance_to_point(obj_personagem_radical.x, obj_personagem_radical.y) <= distancia_limite) 
			{ 
				//quando o doggo está perto do personagem, ele não pode mais receber comando
				sem_comando = false;
				//muda para o estado de "chegando perto"
				estado = "chegando perto"
			} 
		}
		break
		
		//esse estado serve mais para mudar os valores necessários para preparar o doggo para ficar novamente sem comando 
		case "chegando perto":
		{
			//o doggo para de se mover
			speed = 0;
			//a variável seguindo é false	
			seguindo = false;
			//para o som do doggo
			audio_stop_all();
			//ele faz o som de chegar
			audio_play_sound(snd_miau, 1, false);
			//depois ele vai para o estado de parado novamente
			estado = "sem comando";
		}
		break
	}
}