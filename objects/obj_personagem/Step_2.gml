// 📌 No Evento Animation End (Fim de Animação) do obj_personagem

var sprite_atacado_index = asset_get_index("Sprite_atacado");

if (sprite_index == sprite_atacado_index) {
    // Desativa a flag de acerto
    is_hit = false; 
    
    // Verifica se o personagem estava se movendo para voltar à animação correta
    if (keyboard_check(vk_left) || keyboard_check(vk_right) || keyboard_check(vk_up) || keyboard_check(vk_down)) {
        // Se estava movendo, volta para RUN
        sprite_index = Sprite_run; 
        image_speed = 1;
    } else {
        // Se estava parado, volta para IDLE
        sprite_index = Sprite_idle; 
        image_index = 0;
        image_speed = 0;
    }
}