/// @description Movimento da Bola

// Aplicar fricção para movimento suave
if (speed > 0) {
    speed -= friction;
    if (speed < 0) speed = 0;
}

// Destruir após o tempo de vida
life_timer--;
if (life_timer <= 0) {
    instance_destroy();
}

// Destruir quando sair da tela
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}