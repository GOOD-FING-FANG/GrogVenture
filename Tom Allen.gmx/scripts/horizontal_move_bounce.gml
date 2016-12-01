///horizontal_move_bounce(collision_object)
var collision_object = argument0;

// Horizontal Collisions
if (place_meeting(x+plHspeed, y, collision_object)) {
    while (!place_meeting(x+sign(plHspeed), y, collision_object)) {
        x += sign(plHspeed);
    }
    plHspeed = -(plHspeed/2);
}
x += plHspeed;

// Vertical Collisions
if (place_meeting(x, y+plVspeed, collision_object)) {
    while (!place_meeting(x, y+sign(plVspeed), collision_object)) {
        y += sign(plVspeed);
    }
    plVspeed = 0;
}
y += plVspeed;
