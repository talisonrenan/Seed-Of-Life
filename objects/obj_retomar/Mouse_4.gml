// Cria a variável se não existir e despausa o jogo
if (!variable_global_exists("pausado")) {
    global.pausado = true;
}

global.pausado = false;

// Esconde retomar, mostra pause
if (instance_exists(obj_retomar)) obj_retomar.visible = false;
if (instance_exists(obj_pause)) obj_pause.visible = true;