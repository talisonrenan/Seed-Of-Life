// Criar variáveis globais se não existirem
if (!variable_global_exists("pausado")) global.pausado = false;

// ---- SISTEMA DE PAUSE ----
if (global.pausado) {

    // PAUSA: desativa tudo
    instance_deactivate_all(true);

    // Mantém visíveis APENAS os botões da UI
    instance_activate_object(obj_pause);
    instance_activate_object(obj_reproduzir);
    instance_activate_object(obj_retomar);

} else {

    // DESPAUSAR: ativa tudo
    instance_activate_all();

    // Depois disso, desativa os botões errados (prevent flicker)
    // Isso garante que só o botão correto aparece
    if (instance_exists(obj_pause))  obj_pause.visible = !global.pausado;
    if (instance_exists(obj_reproduzir)) obj_reproduzir.visible = global.pausado;
}
