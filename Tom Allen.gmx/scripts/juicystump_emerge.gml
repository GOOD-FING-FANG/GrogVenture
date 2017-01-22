///Juicy Stump's emergence animation

if( emergeTimer < 4 )
{
    if(alarm[1] <= 0)
    {
        y -= 5;
        alarm[1] = 30;
        emergeTimer++;
        
    }
}

else if(emergeTimer == 4) 
{
    awake = 1;
    state = juicystump_idle;
}
