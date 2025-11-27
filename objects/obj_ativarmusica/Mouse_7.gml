// Left Released Event - Clicou para DESLIGAR som
// Atualizar estado global para mudo
global.musica_tocando = false;

// Silenciar TODOS os sons do jogo (volume 0%)
audio_master_gain(0);

// Trocar para botão desligado
instance_change(obj_musica_1, true);