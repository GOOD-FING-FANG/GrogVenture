///lawnmower's burrow animation

if( burrowTimer < 80 )
{
    if(alarm[1] <= 0)
    {
        alarm[1] = 2;
        burrowTimer++;
        if(burrowTimer <= 40)
            obj_lawnmower.x += attackDir*2;
        //image_blend = make_colour_hsv(255, 25*burrowTimer, 255); 
    }
}

else if(burrowTimer == 80) 
{

    //teleport to other side of arena
    //left side x = 224, right side x = 832
    if(obj_lawnmower.image_xscale == 1) {
        obj_lawnmower.x = 256;
    }
    else if(obj_lawnmower.image_xscale == -1) {
        obj_lawnmower.x = 832;
    }
    
    obj_lawnmower.image_xscale *= -1;
    turnTimes = -1;
    attackDir *= -1;
    state = scr_lm_phase_1;
}
