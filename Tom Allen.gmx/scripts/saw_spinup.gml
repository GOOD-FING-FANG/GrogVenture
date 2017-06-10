///Saw's spin-up animation

if( spinTimer < 10 )
{
    if(alarm[1] <= 0)
    {
        alarm[1] = 2;
        spinTimer++;
        image_blend = make_colour_hsv(255, 25*spinTimer, 255); 
    }
}

else if(spinTimer == 10) 
{
    awake = 1;
    state = saw_move;
}
