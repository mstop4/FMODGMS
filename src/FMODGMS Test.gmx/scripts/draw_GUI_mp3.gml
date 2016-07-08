///draw_GUI_mp3()

    draw_set_color(make_color_hsv((hue+64 mod 256),128,255));
    draw_text(16,128,"Position: " + string(FMODGMS_Chan_Get_Position(0)));
    draw_set_color(make_color_hsv((hue+80 mod 256),128,255));
    draw_text(16,144,"Loop Points: " + string(FMODGMS_Snd_Get_LoopPoints(sound[sound_index],0)) + " - " + string(FMODGMS_Snd_Get_LoopPoints(sound[sound_index],1)));
    draw_set_color(make_color_hsv((hue+96 mod 256),128,255));
    
    // get tags
    draw_text(16,176,"Title: " + FMODGMS_Snd_Get_TagStringFromName(sound[4],"TITLE"));
    draw_set_color(make_color_hsv((hue+112 mod 256),128,255));
    draw_text(16,192,"Artist: " + FMODGMS_Snd_Get_TagStringFromName(sound[4],"ARTIST"));
    draw_set_color(make_color_hsv((hue+128 mod 256),128,255));
    draw_text(16,208,"Album: " + FMODGMS_Snd_Get_TagStringFromName(sound[4],"ALBUM"));
    draw_set_color(make_color_hsv((hue+144 mod 256),128,255));
    
    
    draw_text(16,240,"Volume: " + string(channel_volume));  
    draw_set_color(make_color_hsv((hue+160 mod 256),128,255));
    draw_text(16,256,"Playback Freq.: " + string(channel_frequency * channel_pitch) + " Hz# (" + string(channel_frequency) + " x " + string(channel_pitch) + ")");  
