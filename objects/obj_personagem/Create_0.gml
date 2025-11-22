/// @description Inicialização do Personagem

// Escala do personagem
image_xscale = 0.14;
image_yscale = 0.25;

// Velocidade de movimento
move_speed = 3;

// Sistema de vida
max_hp_personagem = 20;
hp_personagem = max_hp_personagem;
show_life_bar_personagem = true;
life_bar_width_personagem = 60;
life_bar_height_personagem = 8;
life_bar_offset_personagem = -40;

// Controle de tiro
can_shoot = true;
attack_cooldown = 0;
key_atacar_pressed = false;
attack_timer = 0;

// Sistema de dano e morte
is_dead = false;
death_timer = 0;
hit_timer = 0;
is_hit = false;

// Variáveis do cajado
can_use_cajado = true;
cajado_cooldown = 0;
key_cajado_pressed = false;
cajado_timer = 0;
