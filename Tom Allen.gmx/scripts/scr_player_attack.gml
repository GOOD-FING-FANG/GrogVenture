var plDirection = obj_player.image_xscale;
var tool = argument0;


with (instance_create(x+(3*plDirection)+obj_player.hspd, y-14, tool))
{
    
    if(instance_exists(tool))
    {
        image_xscale = plDirection;
        image_speed = 0.2;
        
        //hit = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_top, obj_enemyParent, false, true);
    
       /*if (hit != noone)
       {
           with(obj_enemyParent)
          {
               vspd = -3;
               hspd = sign(x - other.x) * 30;
               image_xscale = sign(hspd);
    
            }
        } */
    }
       
    
}

state = states.active; 
