/// @description Desenhar personagem e barra de vida

// Desenhar o personagem
draw_self();

// Desenhar barra de vida
if (show_life_bar_personagem && hp_personagem > 0) {

    var bar_x = x - life_bar_width_personagem / 2;
    var bar_y = y + life_bar_offset_personagem;

    draw_set_halign(fa_center);

    // Fundo da barra
    draw_set_color(c_black);
    draw_rectangle(bar_x, bar_y, bar_x + life_bar_width_personagem, bar_y + life_bar_height_personagem, false);

    // Barra verde proporcional à vida
    var life_width = (hp_personagem / max_hp_personagem) * life_bar_width_personagem;
    if (life_width > 0) {
        draw_set_color(c_lime);
        draw_rectangle(bar_x, bar_y, bar_x + life_width, bar_y + life_bar_height_personagem, false);
    }

    // Texto da vida
    draw_set_color(c_white);
    draw_text(x, bar_y - 25, string(hp_personagem) + "/" + string(max_hp_personagem));

    draw_set_halign(fa_left);
}
