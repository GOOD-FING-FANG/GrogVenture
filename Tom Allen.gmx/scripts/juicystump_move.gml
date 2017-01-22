///Juicy Stump move state

//image_index = image_number-1;

// Apply gravity
if (!place_meeting(x, y+1, obj_solid)) {
    vspd += grav;
} else {
    vspd = 0;
    
    // Use friction
    apply_friction(acc);
    
    // Check for idle state
    if (hspd == 0 && vspd == 0) {
        state = juicystump_idle;
        alarm[0] = 15;
        image_speed = 0;
        //image_index = 0;
    }
}

//if (hspd != 0) image_xscale = sign(hspd);
//image_xscale = -sign(obj_player.image_xscale);
//image_xscale = sign(obj_player.x-self.x);

image_index = awake;

// Move
move(obj_solid);

