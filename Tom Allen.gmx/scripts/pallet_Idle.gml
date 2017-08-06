///pallet_idle_state
var wall_collision = place_meeting(x+wanderDir, y, obj_solid);
var ledge_left = !place_meeting(bbox_left-1, bbox_bottom+1, obj_solid);
var ledge_right = !place_meeting(bbox_right+1, bbox_bottom+1, obj_solid);

if (instance_exists(obj_player)) {
    var dis = distance_to_object(obj_player);
    
    if(!place_meeting(x, y+1, obj_solid))
    {
        vspd += grav;
        move(obj_solid);
    }
    else vspd = 0;

    // Within aggro range
    if (dis <= sight && !thrown) {
        //sprite_index = spr_palletthrow;
        //image_speed = .5;
        
        instance_create(obj_pallet.x,obj_pallet.y,obj_palletface);
        with(obj_palletface) {
            hspd = obj_pallet.hspd + sign(obj_pallet.hspd)*2;
            vspd = obj_pallet.vspd;
        }
        
        hspd = 0;
        thrown = true;
        
        // Make sure we face the player
        if (obj_player.x != x) {
            image_xscale = sign(obj_player.x-x);
        }
    }
    
    // Not within aggro range
    else if (dis > sight && !thrown) {
        
        
        if(wanderSteps < wanderRange) {
            
            
            if(wall_collision || ledge_left || ledge_right)
            {
                wanderDir *= -1;
                wanderSteps = 0;
                image_xscale = wanderDir;
            }

            hspd = 1 * wanderDir;
            move(obj_solid);
            wanderSteps++;
            
        }
        else if (wanderSteps == wanderRange) {
            wanderDir *= -1;
            wanderSteps *= -1;
            image_xscale = wanderDir;
        }
    }
    
    
}
