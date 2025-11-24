// Left Released Event
if (instance_exists(global.sound_manager)) {
    global.sound_manager.object_appeared("obj_ativarmusica");
}

// Parar TODOS os sons
audio_stop_sound(trilha_sonora);
audio_stop_sound(batalha);
audio_stop_sound(loop_menu);

// Atualizar estado global
global.musica_tocando = false;

// Trocar para botão desligado
instance_change(obj_musica_1, true);