/// @description Alarme 2: Causar Dano

// Verifica se existe alvo
if (instance_exists(target_object)) {

    // Se o alvo for uma árvore
    if (target_object.object_index == obj_arvore1 || 
        target_object.object_index == obj_arvore2 || 
        target_object.object_index == obj_arvore3) {

        // DEBUG: Mostrar mensagem no console
        show_debug_message("Atacando árvore! HP antes: " + string(target_object.hp));
        
        // Reduz o HP da árvore
        if (variable_instance_exists(target_object, "hp")) {
            target_object.hp -= attack_damage;
            
            // DEBUG: Mostrar HP após o ataque
            show_debug_message("HP depois: " + string(target_object.hp));

            if (target_object.hp <= 0) {
                target_object.hp = 0;
                
                // DEBUG: Árvore destruída
                show_debug_message("ÁRVORE DESTRUÍDA!");
                
                // Mudar sprite se tiver sprite de destruição
                if (variable_instance_exists(target_object, "sprite_destroyed") && target_object.sprite_destroyed != -1) {
                    target_object.sprite_index = target_object.sprite_destroyed;
                }
                
                // Opcional: Esconder barra de vida
                if (variable_instance_exists(target_object, "show_life_bar")) {
                    target_object.show_life_bar = false;
                }
                
                // Árvore destruída - procurar novo alvo
                target_object = noone;
                state = monster_state.IDLE;
            }
        }
        else {
            show_debug_message("ERRO: Variável hp não existe na árvore!");
        }
    }

    // Se o alvo for personagem
    else if (target_object.object_index == obj_personagem) {
        var sprite_atacado_index = asset_get_index("Sprite_atacado");
        if (sprite_atacado_index != -1) {
            target_object.is_hit = true;
            target_object.sprite_index = sprite_atacado_index;
            target_object.image_index = 0;
            target_object.image_speed = 1;
        }
    }
}