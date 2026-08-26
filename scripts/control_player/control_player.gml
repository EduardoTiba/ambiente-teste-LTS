function control_player(){

	/*
	Para essa função, primeiro deve definir a variável booleana "playable_character" no objeto que queira
	que essa função rode. Sugiro iniciar em false mesmo.
	*/

	//ao clicar em algum dos personagens, a variável "playable_character" se torna true
	if (mouse_check_button_pressed(mb_left)) { playable_character = !playable_character }
}