/// @description Inicialização do Monstro Boss

// Estado inicial
state = monster_state.IDLE;

// Movimento
move_speed = 3.0;
move_x = 0;
move_y = 0;

// Combate
attack_range = 80;
attack_damage = 30;
attack_cooldown = 60;
can_attack = true;
target_object = noone;

// Sprites
sprite_idle = monsterboss_run;
sprite_attack = monsterboss_attack;
sprite_index = sprite_idle;
image_speed = 1;

// Escala do monstro
image_xscale = 0.17;
image_yscale = 0.41;

// Colisão reduzida
col_padding = 1.5;

// Hitbox personalizada
hitbox_width  = sprite_width * image_xscale - col_padding;
hitbox_height = sprite_height * image_yscale - col_padding;

// Movimentação aleatória em Idle
speed_monster = 2.5;
direction_monster = irandom_range(0, 359);

// Timers
move_timer = 0;
change_dir_time = irandom_range(30, 60);

// Sistema de vida
max_hp = 20;
hp = max_hp;
show_life_bar = true;
life_bar_width = 60;
life_bar_height = 8;
life_bar_offset = -60;

// Alarme de movimento
alarm[0] = room_speed * 2;
