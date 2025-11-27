// Left Released Event - Clicou para LIGAR som
// Atualizar estado global para som ativo
global.musica_tocando = true;

// Reativar TODOS os sons do jogo (volume 100%)
audio_master_gain(1);

// Trocar para botão ligado
instance_change(obj_ativarmusica, true);