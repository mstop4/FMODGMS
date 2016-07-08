///draw_GUI_ogg()

    draw_set_color(make_color_hsv((hue+64 mod 256),128,255));
    draw_text(16,128,"Position: " + string(FMODGMS_Chan_Get_Position(0)));
    draw_set_color(make_color_hsv((hue+80 mod 256),128,255));
    draw_text(16,144,"Loop Points: " + string(FMODGMS_Snd_Get_LoopPoints(sound[sound_index],0)) + " - " + string(FMODGMS_Snd_Get_LoopPoints(sound[sound_index],1)));
    draw_set_color(make_color_hsv((hue+96 mod 256),128,255));
    draw_text(16,208,"Volume: " + string(channel_volume));  
    draw_set_color(make_color_hsv((hue+112 mod 256),128,255));
    draw_text(16,224,"Playback Freq.: " + string(channel_frequency * channel_pitch) + " Hz# (" + string(channel_frequency) + " x " + string(channel_pitch) + ")"); 
 
