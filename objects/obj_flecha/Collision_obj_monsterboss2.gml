/// @description Colisão da flecha com o monstro2

// Causar dano no monstro
if (instance_exists(other)) {
    if (variable_instance_exists(other, "hp")) {
        other.hp -= 1; // Reduz 1 de HP
        
        // Efeito visual MAIS SUAVE (apenas um leve piscar)
        other.image_alpha = 0.8; // MENOS transparente
        alarm[3] = 2; // Duração MAIS CURTA
    }
}

// Destruir a flecha
instance_destroy();