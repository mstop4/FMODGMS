///FMODGMS_Sys_OutputModeToString(outputType)
function FMODGMS_Sys_OutputModeToString(outputType) {

	switch (outputType)
	{
	    case FMODGMS_OUTPUTTYPE_AUTODETECT:
	        return "Auto Detect";
        
	    case FMODGMS_OUTPUTTYPE_UNKNOWN:
	        return "Unknown";
        
	    case FMODGMS_OUTPUTTYPE_NOSOUND:
	        return "No sound";
        
	    case FMODGMS_OUTPUTTYPE_WAVWRITER:
	        return "WAV Writer";
        
	    case FMODGMS_OUTPUTTYPE_NOSOUND_NRT:
	        return "No sound (Non-realtime)";
    
	    case FMODGMS_OUTPUTTYPE_WAVWRITER_NRT:
	        return "WAV Writer (Non-realtime)";
    
	    case FMODGMS_OUTPUTTYPE_DSOUND:
	        return "Direct Sound";
    
	    case FMODGMS_OUTPUTTYPE_WINMM:
	        return "windows Multimedia";
    
	    case FMODGMS_OUTPUTTYPE_WASAPI:
	        return "WASAPI";
    
	    case FMODGMS_OUTPUTTYPE_ASIO:
	        return "ASIO 2.0";
    
	    case FMODGMS_OUTPUTTYPE_PULSEAUDIO:
	        return "Pulse Audio";
    
	    case FMODGMS_OUTPUTTYPE_ALSA:
	        return "ALSA";
    
	    case FMODGMS_OUTPUTTYPE_COREAUDIO:
	        return "Core Audio";
    
	    case FMODGMS_OUTPUTTYPE_XAUDIO:
	        return "XAudio";
    
	    case FMODGMS_OUTPUTTYPE_PS3:
	        return "Audio Out (PS3)";
    
	    case FMODGMS_OUTPUTTYPE_AUDIOTRACK:
	        return "Java Audio Track";
    
	    case FMODGMS_OUTPUTTYPE_OPENSL:
	        return "OpenSL ES";
    
	    case FMODGMS_OUTPUTTYPE_WIIU:
	        return "AX (Wii U)";
    
	    case FMODGMS_OUTPUTTYPE_AUDIOOUT:
	        return "Audio Out (PS4/PSVita)";
    
	    case FMODGMS_OUTPUTTYPE_AUDIO3D:
	        return "Audio3D";
    
	    case FMODGMS_OUTPUTTYPE_ATMOS:
	        return "Dolby Atmos (WASAPI)";
    
	    case FMODGMS_OUTPUTTYPE_MAX:
	        return "Max";
	}



}
