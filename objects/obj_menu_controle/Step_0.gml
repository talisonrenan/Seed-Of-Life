



if (keyboard_check_pressed(vk_down)) {
	select1 = (select1 + 1) mod menu_total;	
	
}

if (keyboard_check_pressed(vk_up)) {

	select1 = (select1 - 1 + menu_total) mod menu_total;

}


if (keyboard_check_pressed(vk_enter)) {
	with (instance_find(opcao_menu[select1], 0)){
		executar_room();
	
	}

}