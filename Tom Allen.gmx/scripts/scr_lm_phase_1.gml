///lawnmower phase 1

var wall_left = place_meeting(obj_lawnmower.bbox_left-1, obj_lawnmower.bbox_bottom, obj_solid);
var wall_right = place_meeting(obj_lawnmower.bbox_right+1, obj_lawnmower.bbox_bottom, obj_solid);
burrowTimer = 0;

// Apply gravity
if (!place_meeting(x, bbox_bottom+1, obj_solid)) {
    vspd += grav;
} else {
    vspd = 0;
        
    // Make sure we face the player
    //if (obj_player.x != x) {
    //    image_xscale = sign(obj_player.x-x);
    //}
    
    // Use friction
    apply_friction(acc);
    
}

hspd = image_xscale * spd;
move(obj_solid);

if(wall_left || wall_right)
{
    if(turnTimes < 3) {
        attackDir *= -1;
        image_xscale *= -1;
        turnTimes += 1;
    }
    else if (turnTimes == 3) {
        burrowing = 1;
        state = scr_lm_burrow;
    }
}

