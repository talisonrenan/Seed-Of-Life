/// @description Lógica do Monstro (Máquina de Estados)
var target_inst = instance_nearest(x, y, obj_personagem);
var tree1_inst = instance_nearest(x, y, obj_arvore1); 
var tree2_inst = instance_nearest(x, y, obj_arvore2); 

target_object = noone;
var min_dist = -1;

// Lógica de seleção do alvo...
if (instance_exists(target_inst)) {
    min_dist = point_distance(x, y, target_inst.x, target_inst.y);
    target_object = target_inst;
}
if (instance_exists(tree1_inst)) {
    var dist_tree1 = point_distance(x, y, tree1_inst.x, tree1_inst.y);
    if (target_object == noone || dist_tree1 < min_dist) {
        min_dist = dist_tree1;
        target_object = tree1_inst;
    }
}
if (instance_exists(tree2_inst)) {
    var dist_tree2 = point_distance(x, y, tree2_inst.x, tree2_inst.y);
    if (target_object == noone || dist_tree2 < min_dist) {
        min_dist = dist_tree2;
        target_object = tree2_inst;
    }
}

// Lógica da Máquina de Estados
switch (state) {
    case monster_state.IDLE:
        if (target_object != noone && min_dist < 400) { 
            state = monster_state.MOVE;
        }
        sprite_index = sprite_idle;
        image_speed = 0.5; 
        break;
        
    case monster_state.MOVE:
        if (target_object != noone) {
            if (min_dist <= attack_range) {
                state = monster_state.ATTACK;
            } else {
                move_towards_point(target_object.x, target_object.y, move_speed);
            }
        } else {
            state = monster_state.IDLE;
        }
        sprite_index = sprite_idle; 
        image_speed = 1;

        // Mantém a escala de 25% ao virar a sprite
        if (hspeed != 0) {
            image_xscale = sign(hspeed) * 0.25; // ⬅️ ESCALA 0.2
        } else {
            image_xscale = image_xscale;
        }
        break;
        
    case monster_state.ATTACK:
        speed = 0; 
        if (target_object != noone && min_dist <= attack_range) {
            if (can_attack) {
                can_attack = false;
                alarm[1] = attack_cooldown;
                sprite_index = sprite_attack;
                image_index = 0;
                image_speed = 1;
                alarm[2] = sprite_get_number(sprite_attack) / image_speed / 2;
            }
            if (image_index >= sprite_get_number(sprite_attack) - 1) {
                if (instance_exists(target_object)) {
                    state = monster_state.MOVE;
                } else {
                    state = monster_state.IDLE;
                }
            }
        } else {
            state = monster_state.MOVE;
        }
        break;
}

if (state != monster_state.MOVE) {
    speed = 0;
}