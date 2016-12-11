///spider_idle_state
if (instance_exists(obj_player)) {
    var dis = distance_to_object(obj_player);
    

    
    if (dis <= sight && alarm[0] <= 0) {
        image_speed = .5;
        
        // Make sure we face the player
        if (obj_player.x != x) {
            image_xscale = sign(obj_player.x-x);
        }
    }
    
    // Not within aggro range
    else if (dis > sight) {
        if(wanderSteps < wanderRange && alarm[1] <= 0) {
            //if(!place_meeting(x, y+1, obj_solid))
            //{
            //    pVspd+=grav;
            //}
            if(!place_meeting(bbox_right+1, bbox_bottom+1, obj_solid) || place_meeting(x+wanderDir, y, obj_solid))
            {
                wanderDir *= -1;
                wanderSteps = 0;
                image_xscale = wanderDir;
            }
            else
            {
                x += wanderDir;
                wanderSteps++;
            }
            
        }
        else if (wanderSteps == wanderRange) {
            wanderDir *= -1;
            wanderSteps *= -1;
            image_xscale = wanderDir;
        }
    }
    
    
}
