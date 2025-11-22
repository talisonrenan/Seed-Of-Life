pressed = false;

// quantos índices vamos checar (8 é um bom valor; pode aumentar para 10 se quiser)
var maxTouches = 8;

// Se os botões estão desenhados em GUI (Draw GUI), use device_mouse_x_to_gui / device_mouse_y_to_gui
// Caso estejam em room normal, troque por device_mouse_x / device_mouse_y
var use_gui_coords = true;

for (var d = 0; d < maxTouches; d++) {
    // primeiro, veja se esse "dispositivo" (dedo) está pressionando
    if (device_mouse_check_button(d, mb_left)) {

        // pega a posição desse toque no sistema GUI ou no room
        var tx = use_gui_coords ? device_mouse_x_to_gui(d) : device_mouse_x(d);
        var ty = use_gui_coords ? device_mouse_y_to_gui(d) : device_mouse_y(d);

        // se o toque está dentro da máscara do botão, marca pressed
        if (position_meeting(tx, ty, id)) {
            pressed = true;
            break; // já achou — pode sair do loop
        }
    }
}

// Fallback para desktop caso device_mouse_* não seja acionado:
// (útil se você quiser garantir funcionamento por mouse no editor)
if (!pressed) {
    if (mouse_check_button(mb_left)) {
        if (position_meeting(mouse_x, mouse_y, id)) pressed = true;
    }
}
