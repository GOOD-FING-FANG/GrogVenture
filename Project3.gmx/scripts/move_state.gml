///move_state()

var left = keyboard_check(vk_left);
var right = keyboard_check(vk_right);
var up = keyboard_check(vk_up);
var up_release = keyboard_check_released(vk_up);
var down = keyboard_check(vk_down);

if(!place_meeting(x, y+1, Solid))
    {vspd += grav;
    
    //Control Jump height
    if(up_release && vspd < -6)
    {vspd = -6;}
    }

else {
    vspd = 0;
    
    //Jumping
     if(up) {vspd = -16;}
    }

if(right)
    {hspd = spd;}
if(left)
    {hspd = -spd;}

//Friction
if(!left && !right)
    {hspd = 0;}
    
move(Solid);
