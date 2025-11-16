/// @description Inicialização do Personagem

// ➡️ Nova escala do personagem para 0.2 (20%)

image_xscale = 0.17
image_yscale = 0.27

// Define a velocidade de movimento
move_speed = 3;

// 🚨 ESSENCIAL: Flag para o estado de acerto/dano
is_hit = false;

// Create Event do obj_personagem
function colisao_piso() {
    if (place_meeting(x, y+1, obj_piso)) {
        // Lógica de pisar no chão
        vspeed = 0;
        grounded = true;
    }
}
