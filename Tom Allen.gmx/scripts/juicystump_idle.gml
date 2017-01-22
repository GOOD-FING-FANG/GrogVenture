///Juicy Stump idle state

//var wall_collision = place_meeting(x+sign(hspd), y, obj_solid)
//var ledge_left = !place_meeting(bbox_left-1, bbox_bottom+1, obj_solid);
//var ledge_right = !place_meeting(bbox_right+1, bbox_bottom+1, obj_solid);
//sprite_get_width(sprite_index)

if (instance_exists(obj_player)) {
    var dis = distance_to_object(obj_player);
    
    if(!place_meeting(x, y+1, obj_solid))
    {
        vspd += grav;
        move(obj_solid);
    }
    else vspd = 0;

    // Within aggro range
    if (dis <= sight) {
        if(awake == 0)
        {
            alarm[1] = 30;
            state = juicystump_emerge; 
        }
        
        else
        {
        
            if (obj_player.x != x) {
                image_xscale = sign(obj_player.x-x);
            }
    
            
            if(alarm[0] <= 0)
            {
                if (instance_exists(obj_player)) {
                    hspd = sign(obj_player.x-x)*spd;
                    if (hspd != 0) image_xscale = sign(hspd);
                    vspd = -abs(hspd*2);
                }
        
                move(obj_solid);
                state = juicystump_move;
     
            }
            
        }
    }
    
    // Not within aggro range
   // else if (dis > sight) {
   
        //todo: stump climbing out of the ground when in aggro range
        
   // }
    
    
}
