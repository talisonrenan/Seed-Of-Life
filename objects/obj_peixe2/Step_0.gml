// Movimento automático
x += hspd * direcao;

// Virar sem esticar
image_xscale = escala_x * direcao; 
image_yscale = escala_y;           // altura fixa

// Limites da sala
if (x <= 0) direcao = 1;
if (x >= room_width) direcao = -1;
