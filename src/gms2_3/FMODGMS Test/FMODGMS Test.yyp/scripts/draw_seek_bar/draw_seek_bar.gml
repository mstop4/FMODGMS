///draw_seek_bar(sound_index)
function draw_seek_bar(sound_index) {
	{
	    // Draw "Seek" bar
	    shift_hue(16);
	    draw_text(16,144,string_hash_to_newline("Position: "));
	    draw_rectangle_colour(136,144,436,160,c_gray,c_gray,c_black,c_black,false);
    
	    var len = FMODGMS_Snd_Get_Length(sound[sound_index]);
    
	    shift_hue(0);
	    draw_rectangle(136,144,136 + (FMODGMS_Chan_Get_Position(0) / len) * 300,160,false);
	    draw_set_color(c_black);
	    draw_rectangle(136,144,136 + (FMODGMS_Chan_Get_Position(0) / len) * 300,160,true);

	    var loop_start = FMODGMS_Snd_Get_LoopPoints(sound[sound_index],FMODGMS_LOOPPOINT_START) / len;
	    var loop_end = FMODGMS_Snd_Get_LoopPoints(sound[sound_index],FMODGMS_LOOPPOINT_END) / len;
    
	    draw_set_colour(c_black);
	    draw_rectangle(136,144,436,160,true);

	    draw_set_colour(c_white);
	    draw_line(136 + loop_start * 300,144,136 + loop_start * 300,160);
	    draw_line(136 + loop_end * 300,144,136 + loop_end * 300,160);
	    shift_hue(16);
	}



}
