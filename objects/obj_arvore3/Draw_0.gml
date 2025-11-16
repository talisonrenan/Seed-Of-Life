draw_self();

// Mostrar vida como número centralizado
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

draw_text(x, y - sprite_height * 0.6, string(hp));
