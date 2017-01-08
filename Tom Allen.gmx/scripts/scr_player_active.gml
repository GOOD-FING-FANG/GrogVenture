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

// ---------- Attack ----------
if(ctrl && alarm[0] <= 0)
{
    state = states.attacking;
    alarm[0] = 30;
}

// ---------- Jump ----------

// Player is in the air
if (!place_meeting(x, y+1, obj_solid)) {
    
    vspd += grav;
     
    sprite_index = spr_tom_jump;
    image_speed = 0;
    image_index = (vspd > 0);
    
    // Double Jump
    if (space && !doubleJumped) {
        vspd = pDblJump;
        doubleJumped = true;
    }
    
    //audio_play_sound(snd_tom_grunt, 5, false);
    
    // Control the jump height
    if (space_release && vspd < -6) {
        vspd = -6;
    }

}

// Player is on the ground 
else {
    vspd = 0;
    
    // Jumping code
    if (space && !down) {
        vspd = pJumpHeight;
        doubleJumped = false;
        //audio_play_sound(snd_tom_grunt, 5, false);
    }
    
    // Not jumping and not moving
    if (hspd == 0) {
        
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
    //else {
    //    sprite_index = spr_tom_walk;
    //    image_speed = .6;
    //}
}

// ---------- End Jump ----------

// ---------- Horizontal Movement ----------

// Moving right or left
if ((!down && right) || (!down && left)) {
    sprite_index = spr_tom_walk;
    image_speed = .6;
    object_set_mask(obj_player, spr_tom_mask)
    hspd += (right-left)*pAccel;

    // enforce speed limit
    if (hspd > pSpd) hspd = pSpd;
    if (hspd < -pSpd) hspd = -pSpd;
} 

// Crawling right or left
else if ((down && right) || (down && left)) {
    sprite_index = spr_tom_crouch;
    object_set_mask(obj_player, spr_tom_crouch_mask);
    hspd += (right-left)*pAccel;

    // enforce speed limit
    if (hspd > pSpd) hspd = pSpd/3;
    if (hspd < -pSpd) hspd = -pSpd/3;
} 

// Stop moving, apply friction
else {
    apply_friction(pAccel);
}

// Set sprite direction
if (hspd != 0) {
    image_xscale = sign(hspd);
}

// ---------- End Horizontal Movement ----------

// ---------- Movement and Collision ----------
if(down) move_carefully(obj_solid);
else move(obj_solid);



// Play the landing sound
//if (place_meeting(x, y+vspd+1, obj_solid) && vspd > 0) {
//    audio_emitter_pitch(audio_em, random_range(.8, 1.2));
//    audio_emitter_gain(audio_em, .2);
//    audio_play_sound_on(audio_em, snd_step, false, 6);
//}
