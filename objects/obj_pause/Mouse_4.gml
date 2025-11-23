// Cria a variável se não existir e pausa o jogo
if (!variable_global_exists("pausado")) {
    global.pausado = false;
}

global.pausado = true;

// Esconde pause, mostra retomar
if (instance_exists(obj_pause)) obj_pause.visible = false;
if (instance_exists(obj_retomar)) obj_retomar.visible = true;