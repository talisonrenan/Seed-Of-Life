// Creation Code - fase_inicial
if (variable_global_exists("restaurar_estado") && global.restaurar_estado) {
    
    // ===== RESTAURAR JOGADOR =====
    if (global.tem_jogador && instance_exists(obj_jogador)) {
        obj_jogador.x = global.jogador_x;
        obj_jogador.y = global.jogador_y;
        obj_jogador.hp = global.jogador_hp;
    }
    
    // ===== RESTAURAR MONSTROS =====
    if (instance_exists(obj_parent_pausavel) && variable_global_exists("monster_count")) {
        var count = 0;
        with (obj_parent_pausavel) {
            if (count < global.monster_count) {
                x = global.monster_x[count];
                y = global.monster_y[count];
                hp = global.monster_hp[count];
                state = global.monster_state[count];
                count++;
            }
        }
    }
    
    // Limpar flag
    global.restaurar_estado = false;
}

// Tocar som do jogo se música estiver ligada
if (global.musica_tocando && !audio_is_playing(batalha)) {
    audio_play_sound(batalha, 10, true);
}