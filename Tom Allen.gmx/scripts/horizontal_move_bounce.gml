///horizontal_move_bounce(collision_object)
var collision_object = argument0;

// Horizontal Collisions
if (place_meeting(x+pHspd, y, collision_object)) {
    while (!place_meeting(x+sign(pHspd), y, collision_object)) {
        x += sign(pHspd);
    }
    pHspd = -(pHspd/2);
}
x += pHspd;

// Vertical Collisions
if (place_meeting(x, y+pVspd, collision_object)) {
    while (!place_meeting(x, y+sign(pVspd), collision_object)) {
        y += sign(pVspd);
    }
    pVspd = 0;
}
y += pVspd;
