///saw_idle_state
var wall_left = place_meeting(bbox_left-1, bbox_bottom, obj_solid);
var wall_right = place_meeting(bbox_right+1, bbox_bottom, obj_solid);
//var ledge_left = place_meeting(bbox_left-1, bbox_bottom+1, obj_solid);
//var ledge_right = place_meeting(bbox_right+1, bbox_bottom+1, obj_solid);
//sprite_get_width(sprite_index)

if (instance_exists(obj_player)) {
    
    if(!place_meeting(x, bbox_bottom+1, obj_solid))
    {
        vspd += grav;
        move(obj_solid);
    }
    else vspd = 0;

}
