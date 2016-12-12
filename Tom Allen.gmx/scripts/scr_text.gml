///scr_text("Text",speed,x,y);

//Initiate text box (see obj_text)
txt = instance_create(argument2,argument3,obj_text);
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
}
