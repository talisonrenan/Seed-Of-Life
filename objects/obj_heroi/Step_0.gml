

up = keyboard_check(vk_up);
down = keyboard_check(vk_down);

right = keyboard_check(vk_right);
left = keyboard_check(vk_left);

velocidade_vertical = (down - up ) * velocidade_heroi;


velocidade_horizontal = (right - left) * velocidade_heroi;