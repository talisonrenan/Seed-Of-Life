/// @description Inicialização do Personagem

// ➡️ Nova escala do personagem para 0.2 (20%)
var personagem_escala = 0.25 

image_xscale = personagem_escala; 
image_yscale = personagem_escala;

// Define a velocidade de movimento
move_speed = 6;

// 🚨 ESSENCIAL: Flag para o estado de acerto/dano
is_hit = false;