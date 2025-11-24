// Left Released Event
if (instance_exists(global.sound_manager)) {
    global.sound_manager.object_appeared("obj_musica_1");
}

// Atualizar estado global
global.musica_tocando = true;

// Trocar para botão ligado
instance_change(obj_ativarmusica, true);