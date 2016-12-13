var tool = argument0;
var plDirection = obj_player.image_xscale;

if (alarm[0] <= 0)
{
    instance_create(x+(3*plDirection), y-14, tool);
    tool.image_xscale = 2*plDirection;
    tool.image_yscale = 2;
    tool.image_speed = 0.5;
    alarm[0] = 60;
    
}

state = states.active;
