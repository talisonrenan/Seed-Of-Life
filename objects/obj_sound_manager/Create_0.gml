// CREATE EVENT - obj_sound_manager
current_music = -1;
current_music_id = -1;

// Sistema de mudo global
if (!variable_global_exists("musica_tocando")) {
    global.musica_tocando = true;
}

// Aplicar estado inicial do som
if (global.musica_tocando) {
    audio_master_gain(1); // Som ligado
} else {
    audio_master_gain(0); // Som desligado
}

// Função principal para tocar música
function play_music(sound_id, loop = true) {
    // Só troca se for uma música DIFERENTE da atual
    if (current_music_id != sound_id) {
        // Para a música atual se estiver tocando
        if (audio_is_playing(current_music)) {
            audio_stop_sound(current_music);
        }
        
        // Atualiza para a nova música
        current_music = sound_id;
        current_music_id = sound_id;
        audio_play_sound(sound_id, 0.7, loop);
    }
}

// Tocar efeitos sonoros
function play_sfx(sound_id) {
    audio_play_sound(sound_id, 1.0, false);
}

// Parar música
function stop_music() {
    if (audio_is_playing(current_music)) {
        audio_stop_sound(current_music);
    }
    current_music = -1;
    current_music_id = -1;
}

// --- SISTEMA AUTOMÁTICO POR OBJETO E ROOM ---

// Quando um objeto específico aparece, toca sua música
function object_appeared(object_name) {
    switch (object_name) {
        case "obj_vitoria":
            play_music(ganhou, false);
            break;
        case "obj_casa_2":
        case "obj_palmeira":
        case "obj_fase_inicial":  // ADICIONE ESTA LINHA
        case "obj_fase_secundaria": // ADICIONE ESTA LINHA
            play_music(batalha, true);
            break;
        case "obj_menu":
            play_music(loop_menu, true);
            break;
        case "obj_fim_de_jogo":
            play_music(fim_de_jogo3, false);
            break;
        case "obj_sideof": 
            play_music(trilha_sonora, true);
            break;
    }
}

// Quando uma room é carregada, toca a música correta
function room_loaded() {
    switch (room) {
        case tela_inicio:
        case creditos:
        case controles:
        case menu:
            play_music(loop_menu, true);
            break;
        case fase_inicial:
        case fase_secundaria:
            play_music(batalha, true); // AGORA toca "batalha" nas fases
            break;
        case tela_de_vitoria:
            play_music(ganhou, false);
            break;
        case fim_de_jogo:
            play_music(fim_de_jogo3, false);
            break;
    }
}

// Quando clica em um botão específico
function button_clicked(button_name) {
    switch (button_name) {
        case "obj_jogar":
            play_sfx(start);
            stop_music(); // Para música do menu antes de ir pra fase
            break;
        case "obj_proximafase":
            play_sfx(proxima_fase);
            break;
    }
}