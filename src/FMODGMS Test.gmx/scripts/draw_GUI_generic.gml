///draw_GUI_generic()
// Draw non-specific audio info on GUI
{
    shift_hue(16);
    draw_text(16,128,"Position: " + string(FMODGMS_Chan_Get_Position(0)));
    shift_hue(16);
    draw_text(16,144,"Loop Points: " + string(FMODGMS_Snd_Get_LoopPoints(sound[sound_index],0)) + " - " + string(FMODGMS_Snd_Get_LoopPoints(sound[sound_index],1)));
    shift_hue(16);
    draw_text(16,208,"Volume: " + string(channel_volume));  
    shift_hue(16);
    draw_text(16,224,"Playback Freq.: " + string(channel_frequency * channel_pitch) + " Hz# (" + string(channel_frequency) + " x " + string(channel_pitch) + ")"); 
}
