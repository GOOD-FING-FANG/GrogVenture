///move_state()

//Buff is available
if(global.bufftime == global.buffduration) {
    if(shift_press) {
        audio_play_sound(snd_tom_grunt, 5, false);
        global.portraitversion = 0;
        plJumpHeight += plJumpBuff;
        plSpeed += plSpeedBuff;
    }   
}

//Buff expires
else if(global.bufftime <= 0) {
    global.portraitversion = 1;
    global.bufftime = global.buffduration;
    plJumpHeight -= plJumpBuff;
    plSpeed -= plSpeedBuff;
}

//reset Buff
if(global.portraitversion == 0) {
    global.bufftime -= 1;
}

//Jump
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
        
        //Crouch
        if (down) {
            sprite_index = spr_tom_crouch;
            object_set_mask(obj_player, spr_tom_crouch_mask);
        }
        //Stand
        else {
            sprite_index = spr_tom_idle;
            object_set_mask(obj_player, spr_tom_mask)
        }
    } else {
        sprite_index = spr_tom_walk;
        image_speed = .6;
    }
}


//Right/Left Movement
if (right || left) {
    plHspeed += (right-left)*plAccel;
    //plHspeed_dir = right - left;
    
    //enforce speed limit
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

