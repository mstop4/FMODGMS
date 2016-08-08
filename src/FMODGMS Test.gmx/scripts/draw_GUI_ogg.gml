///draw_GUI_ogg()
// Draw OGG-specific info on GUI
{
    draw_seek_bar(sound_index);
    
    // get tags
    draw_text(16,176,"Title: " + FMODGMS_Snd_Get_TagStringFromName(sound[5],"TITLE"));
    shift_hue(16);
    
    draw_text(16,192,"Genre: " + FMODGMS_Snd_Get_TagStringFromName(sound[5],"GENRE"));
    shift_hue(16);
        
    draw_text(16,240,"Volume: " + string(channel_volume));  
    shift_hue(16);
    draw_text(16,254,"Playback Freq.: " + string(channel_frequency * channel_pitch) + " Hz# (" + string(channel_frequency) + " x " + string(channel_pitch) + ")");
} 
