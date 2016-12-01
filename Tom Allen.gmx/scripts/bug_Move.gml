///spider_jump_state
//image_index = image_number-1;

// Apply gravity
if (!place_meeting(x, y+1, obj_solid)) {
    plVspeed += grav;
} else {
    plVspeed = 0;
    
    // Use friction
    apply_friction(acc);
    
    // Check for idle state
    if (plHspeed == 0 && plVspeed == 0) {
        state = bug_Idle;
        alarm[0] = 15;
        alarm[1] = 5;
        image_speed = 0;
        image_index = 0;
    }
}

if (plHspeed != 0) image_xscale = sign(plHspeed);

// Move
horizontal_move_bounce(obj_solid);
