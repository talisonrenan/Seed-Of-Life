/// @description Lógica do Monstro (Máquina de Estados)

// ----------------------------------------------
// BUSCA DE ALVOS
// ----------------------------------------------
var target_inst = instance_nearest(x, y, obj_personagem);
var tree1_inst  = instance_nearest(x, y, obj_arvore1);
var tree2_inst  = instance_nearest(x, y, obj_arvore2);
var tree3_inst  = instance_nearest(x, y, obj_arvore3);

target_object = noone;
var min_dist = 1000000;

// Personagem
if (instance_exists(target_inst)) {
    min_dist = point_distance(x, y, target_inst.x, target_inst.y);
    target_object = target_inst;
}

// Árvore 1
if (instance_exists(tree1_inst)) {
    var d = point_distance(x, y, tree1_inst.x, tree1_inst.y);
    if (variable_instance_exists(tree1_inst, "hp") && tree1_inst.hp > 0) {
        if (target_object == noone || d < min_dist) {
            min_dist = d;
            target_object = tree1_inst;
        }
    }
}

// Árvore 2
if (instance_exists(tree2_inst)) {
    var d = point_distance(x, y, tree2_inst.x, tree2_inst.y);
    if (variable_instance_exists(tree2_inst, "hp") && tree2_inst.hp > 0) {
        if (target_object == noone || d < min_dist) {
            min_dist = d;
            target_object = tree2_inst;
        }
    }
}

// Árvore 3
if (instance_exists(tree3_inst)) {
    var d = point_distance(x, y, tree3_inst.x, tree3_inst.y);
    if (variable_instance_exists(tree3_inst, "hp") && tree3_inst.hp > 0) {
        if (target_object == noone || d < min_dist) {
            min_dist = d;
            target_object = tree3_inst;
        }
    }
}


// -------------------------------------------------------
// MÁQUINA DE ESTADOS
// -------------------------------------------------------
switch (state)
{
    // ---------------------------------------------------
    case monster_state.IDLE:

        move_x = 0;
        move_y = 0;

        if (target_object != noone && min_dist < 400) {
            state = monster_state.MOVE;
        }

        sprite_index = sprite_idle;
        image_speed = 0.5;
    break;


    // ---------------------------------------------------
	case monster_state.MOVE:

	    if (target_object == noone) {
	        state = monster_state.IDLE;
	    }
	    else
	    {
	        if (!instance_exists(target_object) ||
	            (target_object.object_index != obj_personagem &&
	             variable_instance_exists(target_object, "hp") &&
	             target_object.hp <= 0))
	        {
	            target_object = noone;
	            state = monster_state.IDLE;
	        }
	        else if (min_dist <= attack_range)
	        {
	            state = monster_state.ATTACK;
	        }
	        else
	        {
	            var dir = point_direction(x, y, target_object.x, target_object.y);
	            move_x = lengthdir_x(move_speed, dir);
	            move_y = lengthdir_y(move_speed, dir);

	            if (hp < max_hp * 0.3) {
	                move_x *= 1.5;
	                move_y *= 1.5;
	            }
	        }
	    }

	    sprite_index = sprite_idle;
	    image_speed = 1;

	    if (move_x != 0) image_xscale = sign(move_x) * 0.41;

	break;


    // ---------------------------------------------------
    case monster_state.ATTACK:

        move_x = 0;
        move_y = 0;

        if (target_object != noone && instance_exists(target_object))
        {
            var target_valid = true;

            if (target_object.object_index == obj_arvore1 ||
                target_object.object_index == obj_arvore2 ||
                target_object.object_index == obj_arvore3)
            {
                if (target_object.hp <= 0) target_valid = false;
            }

            if (target_valid && min_dist <= attack_range)
            {
                if (can_attack)
                {
                    can_attack = false;
                    alarm[1] = attack_cooldown;

                    sprite_index = sprite_attack;
                    image_index = 0;
                    image_speed = 1;

                    alarm[2] = sprite_get_number(sprite_attack) / 2;
                }

                if (image_index >= sprite_get_number(sprite_attack) - 1)
                {
                    state = monster_state.MOVE;
                }
            }
            else
            {
                state = monster_state.MOVE;
            }
        }
        else
        {
            state = monster_state.IDLE;
        }
    break;
}


// -------------------------------------------------------
// COLISÃO SUAVE
// -------------------------------------------------------
var step_x = move_x;
var step_y = move_y;

// X
if (step_x != 0) {
    if (!place_meeting(x + step_x, y, obj_colisao_mundo)) {
        x += step_x;
    } else {
        if (!place_meeting(x + sign(step_x), y, obj_colisao_mundo)) {
            x += sign(step_x);
        }
        step_x = 0;
    }
}

// Y
if (step_y != 0) {
    if (!place_meeting(x, y + step_y, obj_colisao_mundo)) {
        y += step_y;
    } else {
        if (!place_meeting(x, y + sign(step_y), obj_colisao_mundo)) {
            y += sign(step_y);
        }
        step_y = 0;
    }
}


// -------------------------------------------------------
// VERIFICAÇÃO DE VITÓRIA DO MONSTRO
// -------------------------------------------------------
var all_trees_destroyed = true;

// Árvore 1
var tree1_count = instance_number(obj_arvore1);
for (var i = 0; i < tree1_count; i++) {
    var tree = instance_find(obj_arvore1, i);
    if (tree.hp > 0) {
        all_trees_destroyed = false;
        break;
    }
}

// Árvore 2
if (all_trees_destroyed) {
    var tree2_count = instance_number(obj_arvore2);
    for (var i = 0; i < tree2_count; i++) {
        var tree = instance_find(obj_arvore2, i);
        if (tree.hp > 0) {
            all_trees_destroyed = false;
            break;
        }
    }
}

// Árvore 3
if (all_trees_destroyed) {
    var tree3_count = instance_number(obj_arvore3);
    for (var i = 0; i < tree3_count; i++) {
        var tree = instance_find(obj_arvore3, i);
        if (tree.hp > 0) {
            all_trees_destroyed = false;
            break;
        }
    }
}

// Fim de jogo
if (all_trees_destroyed) {
    room_goto(fim_de_jogo);
}
