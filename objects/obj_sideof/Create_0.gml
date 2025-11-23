if (!instance_exists(obj_sound_manager)) {
    global.sound_manager = instance_create_depth(0, 0, -1000, obj_sound_manager);
}
global.sound_manager.object_appeared("obj_sideof");