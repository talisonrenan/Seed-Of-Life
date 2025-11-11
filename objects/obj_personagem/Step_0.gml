// Evento Step do personagem

// Movimento básico
key_left  = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_up    = keyboard_check(vk_up);
key_down  = keyboard_check(vk_down);

// Define velocidade
var move_speed = 4;

// Movimento direto (sem hspeed/vspeed)
var move_x = (key_right - key_left) * move_speed;
var move_y = (key_down - key_up) * move_speed;

// Atualiza posição
x += move_x;
y += move_y;

// Troca de sprite com base no movimento
if (move_x != 0 || move_y != 0) {
    sprite_index = Sprite6;
    image_speed = 0.2;
} else {
    sprite_index = sprite5;
    image_speed = 0;
    image_index = 0;
}

// Direção (virar sprite)
if (move_x > 0) image_xscale = 1;
if (move_x < 0) image_xscale = -1;