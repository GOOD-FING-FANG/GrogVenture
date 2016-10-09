///move_state()

var left = keyboard_check(vk_left);
var right = keyboard_check(vk_right);
var up = keyboard_check_pressed(vk_up);
var up_release = keyboard_check_released(vk_up);
var down = keyboard_check(vk_down);

if(!place_meeting(x, y+1, Solid)) {
    vspd += grav;
    //Player is in the air
    sprite_index = spr_player_jump;
    image_speed = 0;
    image_index = (vspd > 0);
    
    //Control Jump height
    if(up_release && vspd < -6)
    {vspd = -6;}
}

else {
    vspd = 0;
    
    //Jumping
     if(up) {
        vspd = -16;
        audio_play_sound(snd_jump,5,false);
     }
     
    //Player is on the ground
    if (hspd == 0) {sprite_index = spr_player_idle;}
    else {
        sprite_index = spr_player_walk;
        image_speed = .6;
        }
}

if (right || left) {
    hspd += (right - left)*acc;
    hspd_dir = right - left;
    
    if(hspd > spd) hspd = spd;
    if(hspd < -spd) hspd = -spd;
}
else apply_friction(acc);

if(hspd !=0)
    {image_xscale = sign(hspd);}
    
//Play landing sound
if(place_meeting(x, y+vspd+1, Solid) && vspd > 0) {
    audio_emitter_pitch(audio_em,random_range(.8,1.2));
    audio_emitter_gain(audio_em, .2);
    audio_play_sound_on(audio_em,snd_step,false,6);
}
    
move(Solid);

// Check for ledge grab state
var falling = y-yprevious > 0;
var wasnt_wall = !position_meeting(x+17*image_xscale, yprevious, Solid);
var is_wall = position_meeting(x+17*image_xscale, y, Solid);

if(falling && wasnt_wall && is_wall) {
    hspd = 0;
    vspd = 0;
    
    //Move against the ledge
    while (!place_meeting(x+image_xscale, y, Solid)) {
        x+= image_xscale;
    }
    
    //Make sure we're at the right height
    while (position_meeting(x+17*image_xscale, y-1, Solid)) {
        y--;
    }
    
    sprite_index = spr_player_edge_grab;
    state = ledge_grab_state;
    
    //Play ledge grab sound
    audio_emitter_pitch(audio_em, 1.5);
    audio_emitter_gain(audio_em, .1);
    audio_play_sound_on(audio_em,snd_step,false,6);
}
