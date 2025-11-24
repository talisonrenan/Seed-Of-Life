// Left Pressed Event
if (instance_exists(global.sound_manager)) {
    global.sound_manager.object_appeared("obj_retomar");
}

// Voltar para a room anterior
if (variable_global_exists("room_anterior") && global.room_anterior != noone) {
    room_goto(global.room_anterior);
} else {
    // Se não tiver room anterior, voltar para fase_inicial
    room_goto(fase_inicial);
}