/// @description Lógica do Monstro (Máquina de Estados)

var target_inst = instance_nearest(x, y, obj_personagem);
var tree1_inst  = instance_nearest(x, y, obj_arvore1);
var tree2_inst  = instance_nearest(x, y, obj_arvore2);
var tree3_inst  = instance_nearest(x, y, obj_arvore3);

target_object = noone;
var min_dist = 1000000; // Valor inicial grande

// Selecionar alvo mais próximo - PERSONAGEM
if (instance_exists(target_inst)) {
    min_dist = point_distance(x, y, target_inst.x, target_inst.y);
    target_object = target_inst;
}

// --- COLOCAR AQUI A PARTE DAS ÁRVORES ---
// Verificar árvore 1
if (instance_exists(tree1_inst)) {
    var d = point_distance(x, y, tree1_inst.x, tree1_inst.y);
    // Só considerar árvores com vida > 0
    if (variable_instance_exists(tree1_inst, "hp") && tree1_inst.hp > 0) {
        if (target_object == noone || d < min_dist) {
            min_dist = d;
            target_object = tree1_inst;
        }
    }
}

// Verificar árvore 2
if (instance_exists(tree2_inst)) {
    var d = point_distance(x, y, tree2_inst.x, tree2_inst.y);
    if (variable_instance_exists(tree2_inst, "hp") && tree2_inst.hp > 0) {
        if (target_object == noone || d < min_dist) {
            min_dist = d;
            target_object = tree2_inst;
        }
    }
}

// Verificar árvore 3
if (instance_exists(tree3_inst)) {
    var d = point_distance(x, y, tree3_inst.x, tree3_inst.y);
    if (variable_instance_exists(tree3_inst, "hp") && tree3_inst.hp > 0) {
        if (target_object == noone || d < min_dist) {
            min_dist = d;
            target_object = tree3_inst;
        }
    }
}
// --- FIM DA PARTE DAS ÁRVORES ---

// ------------- MÁQUINA DE ESTADOS -------------
switch (state) {

    // -------------------------------------------
    case monster_state.IDLE:
        if (target_object != noone && min_dist < 400) {
            state = monster_state.MOVE;
        }
        sprite_index = sprite_idle;
        image_speed = 0.5;
    break;

    // -------------------------------------------
    case monster_state.MOVE:
        if (target_object != noone) {
            // Verificar se o alvo ainda é válido (não foi destruído)
            if (!instance_exists(target_object) || 
                (target_object.object_index != obj_personagem && 
                 variable_instance_exists(target_object, "hp") && 
                 target_object.hp <= 0)) {
                target_object = noone;
                state = monster_state.IDLE;
            }
            else if (min_dist <= attack_range) {
                state = monster_state.ATTACK;
            } else {
                move_towards_point(target_object.x, target_object.y, move_speed);
            }
        } else {
            state = monster_state.IDLE;
        }

        sprite_index = sprite_idle;
        image_speed = 1;

        // Manter escala SEM esticar
        if (hspeed != 0) {
            image_xscale = sign(hspeed) * 0.10;
        }
    break;

    // -------------------------------------------
    case monster_state.ATTACK:
        speed = 0;

        // Verificar se o alvo ainda existe e tem vida
        if (target_object != noone && instance_exists(target_object)) {
            
            // Se for árvore, verificar se ainda tem vida
            var target_valid = true;
            if (target_object.object_index == obj_arvore1 || 
                target_object.object_index == obj_arvore2 || 
                target_object.object_index == obj_arvore3) {
                if (!variable_instance_exists(target_object, "hp") || target_object.hp <= 0) {
                    target_valid = false;
                }
            }
            
            if (target_valid && min_dist <= attack_range) {
                if (can_attack) {
                    can_attack = false;
                    alarm[1] = attack_cooldown;

                    sprite_index = sprite_attack;
                    image_index = 0;
                    image_speed = 1;

                    alarm[2] = sprite_get_number(sprite_attack) / 2;
                }

                // Verificar se a animação de ataque terminou
                if (image_index >= sprite_get_number(sprite_attack) - 1) {
                    state = monster_state.MOVE;
                }
            }
            else {
                state = monster_state.MOVE;
            }
        }
        else {
            state = monster_state.IDLE;
        }
    break;
}

// Se não estiver movendo, ficar parado
if (state != monster_state.MOVE) {
    speed = 0;
}