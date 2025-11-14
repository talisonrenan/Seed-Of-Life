/// @description Alarme 0: Novo Destino (Vagar)

if (state == monster_state.IDLE) {
    var target_x = x + random_range(-200, 200);
    var target_y = y + random_range(-200, 200);
    
    move_towards_point(target_x, target_y, move_speed);
    
    state = monster_state.MOVE;
    
    alarm[0] = room_speed * 2; 
}