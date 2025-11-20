/// @description Movimento e Animação do Personagem

// ==========================================================
// 1. Captura de Inputs
// ==========================================================
key_left  = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_up    = keyboard_check(vk_up);
key_down  = keyboard_check(vk_down);

// ==========================================================
// 2. Cálculo do Movimento
// ==========================================================
var move_x = (key_right - key_left) * move_speed;
var move_y = (key_down - key_up) * move_speed;

// ==========================================================
// 3. COLISÃO SUAVE COM DESLIZAMENTO (NOVO)
// ==========================================================

var step_x = move_x;
var step_y = move_y;

// --- COLISÃO X ---
if (step_x != 0) {
    // Se não tiver colisão → move direto
    if (!place_meeting(x + step_x, y, obj_colisao_mundo)) {
        x += step_x;
    } else {
        // Se bater → tenta deslizar 1 pixel sem travar
        if (!place_meeting(x + sign(step_x), y, obj_colisao_mundo)) {
            x += sign(step_x);
        }
        step_x = 0;
    }
}

// --- COLISÃO Y ---
if (step_y != 0) {
    if (!place_meeting(x, y + step_y, obj_colisao_mundo)) {
        y += step_y;
    } else {
        // Desliza sem travar
        if (!place_meeting(x, y + sign(step_y), obj_colisao_mundo)) {
            y += sign(step_y);
        }
        step_y = 0;
    }
}

// ==========================================================
// 4. Troca de Sprite e Animação (mantido do seu código)
// ==========================================================
if (is_hit == false) {
    if (move_x != 0 || move_y != 0) {
        sprite_index = Sprite_idle;
        image_speed = 1;
    } else {
        sprite_index = Sprite_run;
        image_speed = 0;
        image_index = 0;
    }
}

// ==========================================================
// 5. Ajuste da Direção (espelhamento) — mantido do seu código
// ==========================================================
var current_scale = abs(image_xscale);

if (move_x > 0) {
    image_xscale = current_scale;
} else if (move_x < 0) {
    image_xscale = -current_scale;
}

image_yscale = current_scale;
