/// @description Alarme 2: Causar Dano

// Verifica se existe alvo
if (instance_exists(target_object)) {

    // Se o alvo for uma árvore
    if (target_object.object_index == obj_arvore1 || 
        target_object.object_index == obj_arvore2 || 
        target_object.object_index == obj_arvore3) {

        if (variable_instance_exists(target_object, "hp")) {
            target_object.hp -= attack_damage; // Dano 30

            if (target_object.hp <= 0) {
                target_object.hp = 0;

                // Aumenta vida do monstro até o máximo
                if (max_hp < 20) {
                    max_hp += 1;
                    hp = max_hp;
                }

                // Sprite de destruição (se existir)
                if (variable_instance_exists(target_object, "sprite_destroyed") &&
                    target_object.sprite_destroyed != -1)
                {
                    target_object.sprite_index = target_object.sprite_destroyed;
                }

                // Esconde barra de vida da árvore (se existir)
                if (variable_instance_exists(target_object, "show_life_bar")) {
                    target_object.show_life_bar = false;
                }

                // Reset do alvo
                target_object = noone;
                state = monster_state.IDLE;
            }
        }
    }

    // Se o alvo for o personagem
    else if (target_object.object_index == obj_personagem) {

        var personagem_damage = 2;

        if (variable_instance_exists(target_object, "hp_personagem")) {

            target_object.hp_personagem -= personagem_damage;

            // Ativa estado de acerto
            target_object.is_hit = true;
            target_object.hit_timer = 11;

            // Troca de sprite
            target_object.sprite_index = Sprite_atacado;
            target_object.image_index = 0;
            target_object.image_speed = 1;

            // Recuo do personagem
            var direcao_recuo = point_direction(x, y, target_object.x, target_object.y);
            var forca_recuo = 8;

            target_object.x += lengthdir_x(forca_recuo, direcao_recuo);
            target_object.y += lengthdir_y(forca_recuo, direcao_recuo);
        }
    }
}
