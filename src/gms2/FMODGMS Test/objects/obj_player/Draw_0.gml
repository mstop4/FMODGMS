/// Draw GUI
{
    //draw_set_font(fnt_unicode);
    //draw_text(0,0,"鳃");

    draw_set_font(fnt_normal);
    draw_set_halign(fa_left);

    // CPU Usage
    shift_hue(0);
    draw_text(16,32,string_hash_to_newline("CPU Usage: "));
    
    var cpu_usage = FMODGMS_Sys_Get_CPUUsage();
    
    draw_set_halign(fa_center);
    shift_hue(16);
    draw_text(210,16,string_hash_to_newline(string(cpu_usage) + "%"));
    
    // CPU usage meter
    var cur_col = draw_get_colour();
    draw_rectangle_colour(160,32,260,48,c_gray,c_gray,c_black,c_black,false);
    draw_rectangle_colour(160,32,160+cpu_usage,48,c_black,c_black,c_black,c_black,true);
    draw_rectangle_colour(160,32,160+cpu_usage,48,cur_col,cur_col,cur_col,cur_col,false);
    
    // Output Mode
    shift_hue(16);
    draw_set_halign(fa_right);
    draw_text(room_width-32,32,string_hash_to_newline("Output Mode: " + output_mode));
    
    // FPS
    shift_hue(16);
    draw_set_halign(fa_left);
    draw_text(320,32,string_hash_to_newline("FPS: " + string(fps) + "/" + string(room_speed)));
    
    // Sound info
    shift_hue(16);
    
    draw_text(16,64,string_hash_to_newline("Audio Type: " + sound_type));
    
    shift_hue(16);
    
    //Play state
    if (!is_playing)
        draw_text(16,96,string_hash_to_newline("State: Stopped"));
    else
    {
        if (is_paused)
            draw_text(16,96,string_hash_to_newline("State: Paused"));
        else
            draw_text(16,96,string_hash_to_newline("State: Playing"));            
    } 
    
    shift_hue(16);
    
    // Effect
    draw_text(16,112,string_hash_to_newline("Active Effect: " + FMODGMS_Effect_TypeToString(effectIndex)));  
    
    shift_hue(16);
    
    // dominant Frequency
    draw_text(496,112,string_hash_to_newline("Dominant Freq.: " + string(FMODGMS_FFT_Get_DominantFrequency()) + " Hz"));  

    // spectrum background
    draw_rectangle_colour(496,144,496+numBins*5,244,c_black,c_black,$202020,$202020,false);
    
    // channel level
    if (is_playing)
    {
        draw_set_colour(c_dkgray);
        draw_circle(760,185,FMODGMS_Chan_Get_Level(0)*100,0);
    }
    
    // spectrum bars
    if (keyboard_check(ord("N")))
        max_bar_height = 100;
    else
        max_bar_height = 200;
        
    for (var i=0; i<numBins; i++)
    {
        var col;
        
        if (avgBin[i] <= 0.5)
            col = merge_colour(c_lime,c_yellow,avgBin[i]*2);
        else
            col = merge_colour(c_yellow,c_red,(avgBin[i]-0.5)*2);
    
        draw_set_colour(col);
        draw_rectangle(496+i*5+1,244-avgBin[i]*max_bar_height,496+i*5+4,244,false);
    }   
      
    // draw playback info based on filetype
    
    // modules (MOD, XM, S3M, IT)
    if (sound_index < 4)
        draw_GUI_modules();
    // MP3
    else if (sound_index == 4)
        draw_GUI_mp3();
    //OGG
    else if (sound_index == 5)
        draw_GUI_ogg();
    //MIDI + DLS
    else if (sound_index == 7)
        draw_GUI_midi_dls();
    //the rest
    else
        draw_GUI_generic();
    
    draw_set_color(c_white);
    draw_text(16,304,string_hash_to_newline("Space -- Play/Stop#P -- Pause/Unpause#Q/A -- Change volume#W/S -- Change frequency#E/D -- Change pitch"));
    
    // Disallow MIDI demo in Linux build
    if (os_type == os_linux)
        draw_text(416,304,string_hash_to_newline("1-6 -- Switch track#F4 -- Toggle fullscreen#Esc -- Quit#L -- Add random effect#K -- Remove Effect"));
    else
        draw_text(416,304,string_hash_to_newline("1-7 -- Switch track#F4 -- Toggle fullscreen#Esc -- Quit#L -- Add random effect#K -- Remove Effect"));
    
    shift_hue(16);
    draw_text(16,416,string_hash_to_newline("FMODGMS Player Demo " +  GM_version + " - by M.S.T.O.P."));
    shift_hue(16);
    draw_text(16,432,string_hash_to_newline("FMODGMS version: 0.9.0"));
    shift_hue(16);
    draw_text(16,448,string_hash_to_newline("FMOD version: Studio 1.10.0"));
    
}

