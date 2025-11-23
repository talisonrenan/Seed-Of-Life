// INICIALIZA A VARIÁVEL GLOBAL ANTES DE TUDO
global.pausado = false;

// Atualiza cooldown das teclas
if (global.pause_key_cooldown > 0) {
    global.pause_key_cooldown--;
}

// Verifica input do teclado para pause/despause
if (global.pause_key_cooldown <= 0) {
    // Tecla P para pausar
    if (keyboard_check_pressed(ord("P"))) && !global.pausado {
        global.pausado = true;
        global.pause_key_cooldown = 10;
    }
    
    // Tecla R para despausar
    if (keyboard_check_pressed(ord("R"))) && global.pausado {
        global.pausado = false;
        global.pause_key_cooldown = 10;
    }
}

// Aplica o estado de pause ao jogo
if (global.pausado) {
    // Pausa a room atual (mais eficiente)
    room_speed = 0;
} else {
    // Retorna à velocidade normal (ex: 60 fps)
    room_speed = 60;
}