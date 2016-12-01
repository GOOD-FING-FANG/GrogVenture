///spider_idle_state
if (instance_exists(obj_player)) {
    var dis = distance_to_object(obj_player);
    

    
    if (dis < sight && alarm[0] <= 0) {
        image_speed = .5;
        
        // Make sure we face the player
        if (obj_player.x != x) {
            image_xscale = sign(obj_player.x-x);
        }
    }
    else if (dis > sight) {
        if(wanderSteps < wanderRange && alarm[1] <= 0) {
            x += wanderDir;
            wanderSteps++;
            
        }
        else if (wanderSteps == wanderRange) {
            wanderDir *= -1;
            wanderSteps *= -1;
            image_xscale = wanderDir;
        }
    }
    
    
}
