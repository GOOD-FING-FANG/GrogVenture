/// Player's Active State

get_input();

//Buff is available
if(global.bufftime == global.buffduration) {
    if(shift_press) {
        audio_play_sound(snd_tom_grunt, 5, false);
        global.portraitversion = 0;
        pJumpHeight += pJumpBuff;
        pSpd += pSpdBuff;
    }   
}

//Buff expires
else if(global.bufftime <= 0) {
    global.portraitversion = 1;
    global.bufftime = global.buffduration;
    pJumpHeight -= pJumpBuff;
    pSpd -= pSpdBuff;
}

//reset Buff
if(global.portraitversion == 0) {
    global.bufftime -= 1;
}

//Jump
if (!place_meeting(x, y+1, obj_solid)) {
    
    pVspd += grav;
    
    // Player is in the air
    sprite_index = spr_tom_jump;
    image_speed = 0;
    image_index = (pVspd > 0);
    
    if (space && !doubleJumped) {
        pVspd = pDblJump;
        doubleJumped = true;
    }
    
    //audio_play_sound(snd_tom_grunt, 5, false);
    
    // Control the jump height
    if (space_release && pVspd < -6) {
        pVspd = -6;
    }
    
} else {
    pVspd = 0;
    
    // Jumping code
    if (space) {
        pVspd = pJumpHeight;
        doubleJumped = false;
        //audio_play_sound(snd_tom_grunt, 5, false);
    }
    
    // Player is on the ground
    if (pHspd == 0) {
        
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
    pHspd += (right-left)*pAccel;
    //pHspd_dir = right - left;
    
    //enforce speed limit
    if (pHspd > pSpd) pHspd = pSpd;
    if (pHspd < -pSpd) pHspd = -pSpd;
} else {
    apply_friction(pAccel);
}

if (pHspd != 0) {
    image_xscale = sign(pHspd);
}

// Play the landing sound
//if (place_meeting(x, y+pVspd+1, obj_solid) && pVspd > 0) {
//    audio_emitter_pitch(audio_em, random_range(.8, 1.2));
//    audio_emitter_gain(audio_em, .2);
//    audio_play_sound_on(audio_em, snd_step, false, 6);
//}

move(obj_solid);

