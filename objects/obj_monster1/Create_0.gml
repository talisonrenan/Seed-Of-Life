/// @description Inicialização do Monstro
enum monster_state {
    IDLE,
    MOVE,
    ATTACK
}
state = monster_state.IDLE;
move_speed = 1.5; 
attack_range = 32; 
target_object = noone; 
attack_damage = 10; 
attack_cooldown = 60; 
can_attack = true;
sprite_idle = monster1idle;
sprite_attack = monster1attack;
sprite_index = sprite_idle;
image_speed = 1;

// ➡️ Escala do monstro reduzida para 0.25 (25%)
image_xscale = 0.25; 
image_yscale = 0.25;

alarm[0] = room_speed * 3;