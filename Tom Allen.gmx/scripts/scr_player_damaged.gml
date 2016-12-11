///hurt_state()
// Set the sprite
//sprite_index = spr_player_hurt;

if (pHspd != 0) image_xscale = sign(pHspd);

// Apply gravity
if (!place_meeting(x, y+1, obj_solid)) {
    pVspd += grav;
} else {
    pVspd = 0;
    
    // Use friction
    apply_friction(pAccel);
}

direction_move_bounce(obj_solid);

// Change back to the move state
if (pHspd == 0 && pVspd == 0) {
    image_blend = c_white;
    state = states.active;
}
