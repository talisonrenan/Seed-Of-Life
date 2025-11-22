/// @description Movimento e Animação do Personagem

// ==========================================================
// 1. Captura de Inputs
// ==========================================================
// Inputs de Teclado
var h = keyboard_check(vk_right) - keyboard_check(vk_left);
var v = keyboard_check(vk_down)  - keyboard_check(vk_up);

key_atacar = keyboard_check(vk_space);

// Inputs Mobile (se existir boton)
if (instance_exists(objmobileesquerda))  if (objmobileesquerda.pressed)  h = -1;
if (instance_exists(objmobiledireita))  if (objmobiledireita.pressed)  h =  1;
if (instance_exists(objmobilecima))      if (objmobilecima.pressed)      v = -1;
if (instance_exists(objmobilebaixo))     if (objmobilebaixo.pressed)     v =  1;

var attacking = false;
if (instance_exists(objmobileatacar)) if (objmobileatacar.pressed) key_atacar = true;
var move_x = h * move_speed;
var move_y = v * move_speed;

// --- Colisão X ---
if (move_x != 0) {
    if (!place_meeting(x + move_x, y, obj_colisao_mundo))
        x += move_x;
    else if (!place_meeting(x + sign(move_x), y, obj_colisao_mundo))
        x += sign(move_x);
}

// --- Colisão Y ---
if (move_y != 0) {
    if (!place_meeting(x, y + move_y, obj_colisao_mundo))
        y += move_y;
    else if (!place_meeting(x, y + sign(move_y), obj_colisao_mundo))
        y += sign(move_y);
}






// ==========================================================
// 4. Troca de Sprite e Animação (mantido do seu código)
// ==========================================================
if (is_hit == false) {
    if (move_x != 0 || move_y != 0) {
        sprite_index = Sprite_idle;
        image_speed = 1;
    }else if (key_atacar == true){
		sprite_index = Sprite_fireblock;
		
	
	}else {
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
