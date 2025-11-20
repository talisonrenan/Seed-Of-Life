/// @description Inicialização do Monstro Boss

// Estado inicial
state = monster_state.IDLE;

// Movimento
move_speed = 1.5;
move_x = 0;
move_y = 0;

// Combate
attack_range = 80  // << AQUI! ERA 70, AGORA RANGE MAIOR
attack_damage = 30;   // Você pode aumentar aqui também
attack_cooldown = 60;
can_attack = true;
target_object = noone;

// Sprites
sprite_idle = monsterboss_run;
sprite_attack = monsterboss_attack;
sprite_index = sprite_idle;
image_speed = 1;

// Escala do monstro
image_xscale = 0.50;
image_yscale = 0.50;

// Colisão reduzida
col_padding = 3

// HITBOX PERSONALIZADA
hitbox_width  = sprite_width * image_xscale - col_padding;
hitbox_height = sprite_height * image_yscale - col_padding;

// Movimentação aleatória quando Idle
speed_monster = 1.2;
direction_monster = irandom_range(0, 359);

// Timers
move_timer = 0;
change_dir_time = irandom_range(40, 80);

// Idle random movement
alarm[0] = room_speed * 3;