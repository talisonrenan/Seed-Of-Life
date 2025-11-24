// Step Event - Lógica do pause
if (!variable_global_exists("pausado")) global.pausado = false;

// ---- SISTEMA DE PAUSE ----
if (global.pausado) {
    // PAUSA: desativa tudo
    instance_deactivate_all(true);
    
    // Se estiver em qualquer room de jogo, mantém apenas a UI necessária
    if (room == fase_inicial || room == fase_secundaria) {
        instance_activate_object(obj_menu);
        instance_activate_object(obj_pause);
        instance_activate_object(obj_reproduzir);
    }
    
} else {
    // DESPAUSAR: ativa tudo
    instance_activate_all();
}