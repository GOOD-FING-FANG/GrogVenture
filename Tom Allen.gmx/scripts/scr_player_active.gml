/// Player's Active State

get_input();



// ---------- Buff ----------

//Buff is available
if(bufftime == buffduration) {
    if(shift_press) {
        buffState = buffStates.grog;
    }
    if(tab_press) {
        buffState = buffStates.groggrog;
    }
}

// ---------- End Buff ----------

// ---------- Jump ----------

// Player is in the air
if (!place_meeting(x, y+1, obj_solid)) {
    
    pVspd += grav;
     
    sprite_index = spr_tom_jump;
    image_speed = 0;
    image_index = (pVspd > 0);
    
    // Double Jump
    if (space && !doubleJumped) {
        pVspd = pDblJump;
        doubleJumped = true;
    }
    
    //audio_play_sound(snd_tom_grunt, 5, false);
    
    // Control the jump height
    if (space_release && pVspd < -6) {
        pVspd = -6;
    }

}

// Player is on the ground 
else {
    pVspd = 0;
    
    // Jumping code
    if (space) {
        pVspd = pJumpHeight;
        doubleJumped = false;
        //audio_play_sound(snd_tom_grunt, 5, false);
    }
    
    // Not jumping and not moving
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
    } 
    
    // Not jumping, but moving
    else {
        sprite_index = spr_tom_walk;
        image_speed = .6;
    }
}

// ---------- End Jump ----------

// ---------- Horizontal Movement ----------

// Moving right or left
if (right || left) {
    pHspd += (right-left)*pAccel;

    // enforce speed limit
    if (pHspd > pSpd) pHspd = pSpd;
    if (pHspd < -pSpd) pHspd = -pSpd;
} 

// Stop moving, apply friction
else {
    apply_friction(pAccel);
}

// Set sprite direction
if (pHspd != 0) {
    image_xscale = sign(pHspd);
}

// ---------- End Horizontal Movement ----------

// ---------- Movement and Collision ----------
move(obj_solid);



// Play the landing sound
//if (place_meeting(x, y+pVspd+1, obj_solid) && pVspd > 0) {
//    audio_emitter_pitch(audio_em, random_range(.8, 1.2));
//    audio_emitter_gain(audio_em, .2);
//    audio_play_sound_on(audio_em, snd_step, false, 6);
//}
