var tool = argument0;
var plDirection = obj_player.image_xscale;

if (alarm[0] <= 0)
{
    alarm[0] = 30;
    with (instance_create(x+(3*plDirection), y-14, tool))
    {
        image_xscale = plDirection;
        image_speed = 0.2;
        
        hit = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_top, obj_enemyParent, false, true);
        if (hit != noone)
        {
            with(obj_enemyParent)
            {
                vspd = -3;
                hspd = sign(x - other.x) * 40;
                image_xscale = sign(hspd);
            
            }
        }
        
    }
    
}

state = states.active;
