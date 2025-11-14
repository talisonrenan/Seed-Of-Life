/// @description Alarme 2: Causar Dano

// Obter o índice da sprite de ATAQUE
var sprite_atacado_index = asset_get_index("Sprite_atacado"); 

// MENSAGEM DE DEBUG: Verifica se a sprite foi encontrada
show_debug_message("--- ALARME 2 DISPARADO ---");
show_debug_message("Sprite_atacado Index: " + string(sprite_atacado_index)); 

if (instance_exists(target_object)) {
    // 🚨 CORREÇÃO: Usar object_get_name() para obter o nome do objeto a partir do índice
    show_debug_message("Alvo encontrado: " + object_get_name(target_object.object_index));
    
    // Alvo: obj_personagem
    if (target_object.object_index == obj_personagem) {
        
        // Aplica a sprite de "atacado"
        if (sprite_atacado_index != -1) { 
            
            // Ativa a flag de acerto e muda a sprite
            target_object.is_hit = true; 
            target_object.sprite_index = sprite_atacado_index; 
            target_object.image_index = 0; 
            target_object.image_speed = 1; 
            show_debug_message("Sprite do Personagem alterada para ATAQUE!");
            
        } else {
            show_debug_message("ERRO CRÍTICO: Sprite 'Sprite_atacado' não encontrada no projeto!");
        }
        
    } 
    // Alvo: Árvores
    else if (target_object.object_index == obj_arvore1 || 
             target_object.object_index == obj_arvore2) 
    {
        instance_destroy(target_object);
    }
}