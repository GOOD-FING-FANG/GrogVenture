///saw_jump_state
//image_index = image_number-1;
var wall_left = place_meeting(bbox_left-1, bbox_bottom, obj_solid);
var wall_right = place_meeting(bbox_right+1, bbox_bottom, obj_solid);

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


//if (distance_to_object(obj_player) > sight) {
//    alarm[0] = 60;
//    states = saw_leash;
//}
//else
//{
    hspd = image_xscale * chaseSpd;
    move(obj_solid);
    if((wall_left || wall_right) && vspd == 0)
    {
        state = saw_broken;
    }
    //wanderSteps = 0;
//}
