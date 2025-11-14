/// @description Movimento e Animação do Personagem

// 1. Captura de Inputs
key_left  = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_up    = keyboard_check(vk_up);
key_down  = keyboard_check(vk_down);

// 2. Cálculo do Movimento
var move_x = (key_right - key_left) * move_speed;
var move_y = (key_down - key_up) * move_speed;

// ==========================================================
// 3. 🛡️ CÓDIGO DE COLISÃO SÓLIDA COM DESLIZAMENTO (NOVO)
// ==========================================================

// --- Colisão no Eixo X (Horizontal) ---
if (move_x != 0) {
    // Verifica se haverá colisão na nova posição X
    if (place_meeting(x + move_x, y, obj_colisao_mundo)) {
        
        // Move o personagem até o ponto exato antes da colisão
        while (!place_meeting(x + sign(move_x), y, obj_colisao_mundo)) {
            x += sign(move_x);
        }
        move_x = 0; // Para o movimento no eixo X
    }
    x += move_x; // Aplica o movimento X restante (que agora é 0 ou o movimento total)
}

// --- Colisão no Eixo Y (Vertical) ---
if (move_y != 0) {
    // Verifica se haverá colisão na nova posição Y
    if (place_meeting(x, y + move_y, obj_colisao_mundo)) {
        
        // Move o personagem até o ponto exato antes da colisão
        while (!place_meeting(x, y + sign(move_y), obj_colisao_mundo)) {
            y += sign(move_y);
        }
        move_y = 0; // Para o movimento no eixo Y
    }
    y += move_y; // Aplica o movimento Y restante
}


// ==========================================================
// 4. Troca de Sprite e Animação (COM VERIFICAÇÃO DE DANO)
// ==========================================================
if (is_hit == false) { 
    if (move_x != 0 || move_y != 0) { // O personagem se moveu?
        // Se estiver se movendo
        sprite_index = Sprite_run;
        image_speed = 1;
    } else {
        // Se estiver parado
        sprite_index = Sprite_idle;
        image_speed = 0; 
        image_index = 0;
    }
}

// 5. Ajuste da Direção (Espelhar) e Escala
var current_scale = abs(image_xscale); 

if (move_x > 0) {
    image_xscale = current_scale; 
} else if (move_x < 0) {
    image_xscale = -current_scale; 
}

image_yscale = current_scale;