///saw_idle_state
var wall_left = place_meeting(bbox_left-1, bbox_bottom, obj_solid);
var wall_right = place_meeting(bbox_right+1, bbox_bottom, obj_solid);
var ledge_left = place_meeting(bbox_left-1, bbox_bottom+1, obj_solid);
var ledge_right = place_meeting(bbox_right+1, bbox_bottom+1, obj_solid);
//sprite_get_width(sprite_index)

if (instance_exists(obj_player)) {
    var dis = distance_to_object(obj_player);
    
    if(!place_meeting(x, bbox_bottom+1, obj_solid))
    {
        vspd += grav;
        move(obj_solid);
    }
    else vspd = 0;

    // Within aggro range
    //if (dis <= sight && alarm[0] <= 0) {
    if (dis <= sight && (obj_player.y <= y && obj_player.y+40 >= y)) {
        
        state = saw_spinup;
    }
    
    // Not within aggro range
    else /*if (dis > sight)*/ {
        
        
        if(wanderSteps < wanderRange && alarm[1] <= 0) {
            
            
            if(wall_left || wall_right || ledge_left || ledge_right)
            {
                wanderDir *= -1;
                wanderSteps = 0;
                image_xscale = wanderDir;
            }

            hspd = idleSpd * wanderDir;
            move(obj_solid);
            wanderSteps += idleSpd;
            
        }
        else if (wanderSteps == wanderRange) {
            wanderDir *= -1;
            wanderSteps *= -1;
            image_xscale = wanderDir;
        }
    }
    
    
}
