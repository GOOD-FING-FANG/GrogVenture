///scr_text("Text",speed,obj_speaking)

//Initialize text box (see obj_text)
txt = instance_create(0,0,obj_text);
with (txt)
{
    padding = 16; //Separation between edge of box and text
    maxlength = view_wview[0]/3; //Widest allowed box
    text = argument0;
    spd = argument1;
    font = fnt_dialogue;
    
    //text_length needed by obj_text to "type" text
    text_length = string_length(text);
    font_size = font_get_size(fnt_dialogue);
    
    draw_set_font(font);
    
    //Determine the size of the text
    text_width = string_width_ext(text,font_size+(font_size/2),maxlength);
    text_height = string_height_ext(text,font_size+(font_size/2),maxlength);
    
    //Determine the size of the box for the text
    boxwidth = text_width+(padding*2);
    boxheight = text_height+(padding*2);
    
    //Determine position for the text box to be located based on object position
    box_x = argument2.x - boxwidth/2;
    box_y = argument2.y - (sprite_get_height(object_get_sprite(argument2))/2) - boxheight - (padding*2);

    //Check to see if box will be positioned offscreen and move if needed
    if(box_x < view_xview[0])
    {
        box_x = view_xview[0] + padding;
    }
    else if((box_x + boxwidth) > (view_xview[0] + view_wview[0]))
    {
        box_x = view_xview[0] + view_wview[0] - padding - boxwidth;
    }
    
    x = box_x;
    y = box_y;
}
