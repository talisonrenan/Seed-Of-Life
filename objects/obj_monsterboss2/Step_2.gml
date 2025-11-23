// Verificação de morte do monstro
if (hp <= 0) {
    room_goto(tela_de_vitoria);
    instance_destroy();
}
