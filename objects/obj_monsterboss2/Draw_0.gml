/// @description Desenhar monstro e barra de vida (ESTILO DA IMAGEM, VERMELHO)

// Desenhar o monstro
draw_self();

// Barra de vida
if (show_life_bar && hp > 0) {

    var bar_x = x - life_bar_width / 2;
    var bar_y = y + life_bar_offset;

    draw_set_halign(fa_center);

    // Fundo da barra (vida total)
    draw_set_color(c_black);
    draw_rectangle(bar_x, bar_y, bar_x + life_bar_width, bar_y + life_bar_height, false);

    // Vida atual (vermelho)
    var life_width = (hp / max_hp) * life_bar_width;
    if (life_width > 0) {
        draw_set_color(c_red);
        draw_rectangle(bar_x, bar_y, bar_x + life_width, bar_y + life_bar_height, false);
    }

    // Texto da vida
    draw_set_color(c_white);
    draw_text(x, bar_y - 25, string(hp) + "/" + string(max_hp));

    draw_set_halign(fa_left);
}

