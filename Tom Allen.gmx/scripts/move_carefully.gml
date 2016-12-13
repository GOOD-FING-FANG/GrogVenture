///move(collision_object)
var collision_object = argument0;

// Horizontal Collisions
// Prevent falling off left ledge
if (!place_meeting(bbox_left-1, bbox_bottom+1, obj_solid) && sign(hspd) == -1)
{
    hspd = 0;
}
// Prevent falling off right ledge
else if (!place_meeting(bbox_right+1, bbox_bottom+1, obj_solid) && sign(hspd) == 1)
{
    hspd = 0;
}
else if (place_meeting(x+hspd, y, collision_object)) {
    while (!place_meeting(x+sign(hspd), y, collision_object)) {
        x += sign(hspd);
    }
    hspd = 0;
}
x += hspd;

// Vertical Collisions
if (place_meeting(x, y+vspd, collision_object)) {
    while (!place_meeting(x, y+sign(vspd), collision_object)) {
        y += sign(vspd);
    }
    vspd = 0;
}
y += vspd;

