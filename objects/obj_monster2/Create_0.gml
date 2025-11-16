/// @description Inicialização do Monstro

state = monster_state.IDLE;
move_speed = 1.5;
attack_range = 32;

target_object = noone;
attack_damage = 10;
attack_cooldown = 60;
can_attack = true;

sprite_idle = monster2_idle;
sprite_attack = monster2_attack;

sprite_index = sprite_idle;
image_speed = 1;

// ESCALA DO MONSTRO (15%)
image_xscale = 0.10;
image_yscale = 0.10;

// IDLE → anda aleatoriamente a cada 3 segundos
alarm[0] = room_speed * 3;
