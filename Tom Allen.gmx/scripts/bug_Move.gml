///spider_jump_state
//image_index = image_number-1;

// Apply gravity
if (!place_meeting(x, y+1, obj_solid)) {
    pVspd += grav;
} else {
    pVspd = 0;
    
    // Use friction
    apply_friction(acc);
    
    // Check for idle state
    if (pHspd == 0 && pVspd == 0) {
        state = bug_Idle;
        alarm[0] = 15;
        alarm[1] = 5;
        image_speed = 0;
        image_index = 0;
    }
}

if (pHspd != 0) image_xscale = sign(pHspd);

// Move
horizontal_move_bounce(obj_solid);
