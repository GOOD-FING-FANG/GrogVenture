///spider_jump_state
//image_index = image_number-1;

// Apply gravity
if (!place_meeting(x, bbox_bottom+1, obj_solid)) {
    vspd += grav;
} else {
    vspd = 0;
    
    //image_speed = .5;
        
    // Make sure we face the player
    if (obj_player.x != x) {
        image_xscale = sign(obj_player.x-x);
    }
    
    // Use friction
    apply_friction(acc);
    
    // Check for idle state
    
        //alarm[0] = 15;
        //alarm[1] = 5;
        //image_speed = 0;
        //image_index = 0;
    
}

        
//if (hspd != 0) image_xscale = sign(hspd);

// Move


if (distance_to_object(obj_player) > sight) {
    alarm[0] = 60;
    states = saw_leash;
}
else
{
    move(obj_solid);
    wanderSteps = 0;
}
