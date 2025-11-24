// Left Pressed Event
if (instance_exists(global.sound_manager)) {
    global.sound_manager.object_appeared("obj_menu");
}

// Salvar a room atual ANTES de ir para o menu
global.room_anterior = room;

// Ir para o menu
room_goto(menu);