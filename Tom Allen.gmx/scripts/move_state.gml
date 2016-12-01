///move_state()

if(global.bufftime == global.buffduration) {
    if(shift_press) {
        audio_play_sound(snd_tom_grunt, 5, false);
        global.portraitversion = 0;
        plJumpHeight += plJumpBuff;
        plSpeed += plSpeedBuff;
    }   
}

else if(global.bufftime <= 0) {
    global.portraitversion = 1;
    global.bufftime = global.buffduration;
    plJumpHeight -= plJumpBuff;
    plSpeed -= plSpeedBuff;
}

if(global.portraitversion == 0) {
    global.bufftime -= 1;
}


if (!place_meeting(x, y+1, obj_solid)) {
    plVspeed += grav;
    
    // Player is in the air
    sprite_index = spr_tom_jump;
    image_speed = 0;
    image_index = (plVspeed > 0);
    
    // Control the jump height
    if (up_release && plVspeed < -6) {
        plVspeed = -6;
    }
} else {
    plVspeed = 0;
    
    // Jumping code
    if (up) {
        plVspeed = plJumpHeight;
        //audio_play_sound(snd_tom_grunt, 5, false);
    }
    
    // Player is on the ground
    if (plHspeed == 0) {
        sprite_index = spr_tom_idle;
    } else {
        sprite_index = spr_tom_walk;
        image_speed = .6;
    }
}

if (right || left) {
    plHspeed += (right-left)*plAccel;
    //plHspeed_dir = right - left;
    
    if (plHspeed > plSpeed) plHspeed = plSpeed;
    if (plHspeed < -plSpeed) plHspeed = -plSpeed;
} else {
    apply_friction(plAccel);
}

if (plHspeed != 0) {
    image_xscale = sign(plHspeed);
}

// Play the landing sound
//if (place_meeting(x, y+plVspeed+1, obj_solid) && plVspeed > 0) {
//    audio_emitter_pitch(audio_em, random_range(.8, 1.2));
//    audio_emitter_gain(audio_em, .2);
//    audio_play_sound_on(audio_em, snd_step, false, 6);
//}

move(obj_solid);
/*
/// Check for ledge grab state
var falling = y-yprevious > 0;
var wasnt_wall = !position_meeting(x+17*image_xscale, yprevious, obj_solid);
var is_wall = position_meeting(x+17*image_xscale, y, obj_solid);

if (falling && wasnt_wall && is_wall) {
    plHspeed = 0;
    plVspeed = 0;
    
    // Move against the ledge
    while (!place_meeting(x+image_xscale, y, obj_solid)) {
        x+=image_xscale;
    }
    
    // Make sure we are the right height
    while (position_meeting(x+17*image_xscale, y-1, obj_solid)) {
        y-=1;
    }
    
    //sprite_index = spr_player_ledge_grab;
    //state = ledge_grab_state;
    
    // Play the ledge grab sound
    //audio_emitter_pitch(audio_em, 1.5);
    //audio_emitter_gain(audio_em, .1);
    //audio_play_sound_on(audio_em, snd_step, false, 6);
}
*/
