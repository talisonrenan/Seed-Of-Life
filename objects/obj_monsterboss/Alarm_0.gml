/// @description Alarme 0: Novo Destino (Vagar)
if (state == monster_state.IDLE) {
    var tx = x + random_range(-200, 200);
    var ty = y + random_range(-200, 200);

    move_towards_point(tx, ty, move_speed);

    state = monster_state.MOVE;
    alarm[0] = room_speed * 2;
}

