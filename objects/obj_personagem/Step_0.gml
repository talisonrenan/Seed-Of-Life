/// @description Movimento e Animação do Personagem

// Timer do ataque
if (attack_timer > 0) {
    attack_timer--;
}

// 🔥 NOVO: Timer do cajado
if (cajado_timer > 0) {
    cajado_timer--;
}

// Captura de inputs
var h = keyboard_check(vk_right) - keyboard_check(vk_left);
var v = keyboard_check(vk_down)  - keyboard_check(vk_up);
key_atacar_pressed = keyboard_check_pressed(vk_space);
key_cajado_pressed = keyboard_check_pressed(vk_enter);

// Inputs mobile
if (instance_exists(objmobileesquerda))  if (objmobileesquerda.pressed)  h = -1;
if (instance_exists(objmobiledireita))  if (objmobiledireita.pressed)  h =  1;
if (instance_exists(objmobilecima))     if (objmobilecima.pressed)      v = -1;
if (instance_exists(objmobilebaixo))    if (objmobilebaixo.pressed)     v =  1;
if (instance_exists(objmobileatacar))   if (objmobileatacar.pressed)    key_atacar_pressed = true;

var move_x = h * move_speed;
var move_y = v * move_speed;

// Colisão eixo X
if (move_x != 0) {
    if (!place_meeting(x + move_x, y, obj_colisao_mundo))
        x += move_x;
    else if (!place_meeting(x + sign(move_x), y, obj_colisao_mundo))
        x += sign(move_x);
}

// Colisão eixo Y
if (move_y != 0) {
    if (!place_meeting(x, y + move_y, obj_colisao_mundo))
        y += move_y;
    else if (!place_meeting(x, y + sign(move_y), obj_colisao_mundo))
        y += sign(move_y);
}

// Cooldown do tiro
if (attack_cooldown > 0) {
    attack_cooldown--;
    if (attack_cooldown <= 0) can_shoot = true;
}

// 🔥 NOVO: Cooldown do cajado
if (cajado_cooldown > 0) {
    cajado_cooldown--;
    if (cajado_cooldown <= 0) can_use_cajado = true;
}

// Sistema de sprites e animações
if (!is_dead) {

    if (is_hit) {
        sprite_index = Sprite_atacado;
        image_speed = 1;
    }
    // 🔥 NOVO: Animação do cajado (prioridade alta)
    else if (cajado_timer > 0) {
        sprite_index = Sprite_cajado;
        image_speed = 1;
    }
    else if (attack_timer > 0) {
        sprite_index = Sprite_fireblock;
        image_speed = 1;
    }
    else if (move_x != 0 || move_y != 0) {
        sprite_index = Sprite_idle;
        image_speed = 1;
    }
    // 🔥 NOVO: Uso do cajado
    else if (key_cajado_pressed && can_use_cajado) {

        sprite_index = Sprite_cajado;
        cajado_timer = 20;
        image_speed = 1;

        // Direção e criação da bola
        var _dire_ball = 0;
        var _offset_x = 30;

        if (image_xscale < 0) {
            _dire_ball = 180;
            _offset_x = -30;
        }

        var _xx = x + _offset_x;
        var _yy = y;

        var _ball = instance_create_depth(_xx, _yy, 0, obj_ball);
        _ball.direction = _dire_ball;
        _ball.speed = 6;
        _ball.image_angle = _dire_ball;

        can_use_cajado = false;
        cajado_cooldown = 30;

    }
    else if (key_atacar_pressed && can_shoot) {

        sprite_index = Sprite_fireblock;
        attack_timer = 20;
        image_speed = 1;

        // Direção e criação do tiro
        var _dire_tiro = 0;
        var _offset_x = 30;

        if (image_xscale < 0) {
            _dire_tiro = 180;
            _offset_x = -30;
        }

        var _xx = x + _offset_x;
        var _yy = y;

        var _flecha = instance_create_depth(_xx, _yy, 0, obj_flecha);
        _flecha.direction = _dire_tiro;
        _flecha.speed = 6;
        _flecha.image_angle = _dire_tiro;

        can_shoot = false;
        attack_cooldown = 30;

    } else {
        sprite_index = Sprite_run;
        image_speed = 0;
        image_index = 0;
    }

} else {
    // Sprite de morte
    sprite_index = Sprite_morto;
    image_speed = 0.3;
}

// Ajuste da direção (espelhamento)
var current_scale = abs(image_xscale);

if (move_x > 0) image_xscale = current_scale;
else if (move_x < 0) image_xscale = -current_scale;

image_yscale = current_scale;

// Verificação de morte
if (hp_personagem <= 0 && !is_dead) {

    is_dead = true;
    sprite_index = Sprite_morto;
    image_speed = 0.3;
    image_index = 0;

    move_speed = 0;
    can_shoot = false;
    can_use_cajado = false; // 🔥 NOVO: Desativa cajado também
    death_timer = 180;
}

// Contagem da animação de morte
if (is_dead) {
    death_timer--;
    if (death_timer <= 0) room_goto(fim_de_jogo);
}

// Sistema de dano temporário
if (is_hit && !is_dead) {
    hit_timer--;
    if (hit_timer <= 0) is_hit = false;
}