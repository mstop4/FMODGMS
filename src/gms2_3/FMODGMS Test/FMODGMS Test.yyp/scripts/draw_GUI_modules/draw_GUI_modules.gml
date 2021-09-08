///draw_GUI_modules()
function draw_GUI_modules() {
	// Draw MP3-specific info on GUI
	{  
	    draw_seek_bar(sound_index);
    
	    draw_text(16,160,string_hash_to_newline("Order: " + string(FMODGMS_Chan_Get_ModOrder(0)))); // only works with module files
	    shift_hue(16);
	    draw_text(16,176,string_hash_to_newline("Pattern: " + string(FMODGMS_Chan_Get_ModPattern(0)))); // only works with module files
	    shift_hue(16);
	    draw_text(16,192,string_hash_to_newline("Row: " + string(FMODGMS_Chan_Get_ModRow(0)))); // only works with module files
	    shift_hue(16);
	    draw_text(16,208,string_hash_to_newline("Volume: " + string(channel_volume)));  
	    shift_hue(16);
	    draw_text(16,224,string_hash_to_newline("Playback Freq.: " + string(channel_frequency * channel_pitch) + " Hz# (" + string(channel_frequency) + " x " + string(channel_pitch) + ")"));  
	}



}
