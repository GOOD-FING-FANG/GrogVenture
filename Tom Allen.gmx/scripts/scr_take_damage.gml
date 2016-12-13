///take_damage
if (state != states.damage) {
    //audio_emitter_pitch(audio_em, 1.6);
    //audio_emitter_gain(audio_em, 1.4);
    //audio_play_sound_on(audio_em, snd_ouch, false, 8);

    image_blend = make_colour_rgb(220, 150, 150);
    vspd = -12;
    hspd = (sign(x-other.x)*10);
    
    state = states.damage;
    
    move(obj_solid);
    
    if (instance_exists(obj_player)) {
        obj_player.hp -= 4;
    }
}
