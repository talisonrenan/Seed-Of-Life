// Left Released Event - Clicou para LIGAR som
// Atualizar estado global para som ativo
global.musica_tocando = true;

// Reativar TODOS os sons do jogo (volume 100%)
audio_master_gain(1);

// Trocar para botão ligado
instance_change(obj_ativarmusica, true);

// FORÇAR a tocar a música da room ATUAL
if (instance_exists(obj_sound_manager)) {
    // Determinar qual música tocar baseado na room atual
    var music_to_play = -1;
    var should_loop = true;
    
    switch (room) {
        case tela_inicio:
        case creditos:
        case controles:
        case menu:
            music_to_play = trilha_sonora;
            should_loop = true;
            break;
        case fase_inicial:
        case fase_secundaria:
            music_to_play = batalha;
            should_loop = true;
            break;
        case tela_de_vitoria:
            music_to_play = ganhou;
            should_loop = false;
            break;
        case fim_de_jogo:
            music_to_play = fim_de_jogo3;
            should_loop = false;
            break;
    }
    
    // Tocar a música se encontrou uma para a room atual
    if (music_to_play != -1) {
        obj_sound_manager.play_music(music_to_play, should_loop);
    }
}