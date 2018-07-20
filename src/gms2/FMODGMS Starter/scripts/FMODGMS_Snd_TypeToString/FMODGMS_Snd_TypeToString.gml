/// @description FMODGMS_Snd_TypeToString(sound_type_index)
/// @param sound_type_index
switch (argument[0])
{
    case FMODGMS_SOUND_TYPE_UNKNOWN:
    return "Unknown";
    break;
    
    case FMODGMS_SOUND_TYPE_AIFF:
    return "AIFF";
    break;
    
    case FMODGMS_SOUND_TYPE_ASF:
    return "ASF - Microsoft Advanced Systems Format";
    break;
    
    case FMODGMS_SOUND_TYPE_DLS:
    return "DLS - SoundFont / Dowloadable Sound Bank";
    break;
    
    case FMODGMS_SOUND_TYPE_FLAC:
    return "FLAC lossless codec";
    break;
    
    case FMODGMS_SOUND_TYPE_FSB:
    return "FMOD Sample Bank";
    break;
    
    case FMODGMS_SOUND_TYPE_IT:
    return "IT - Impluse Tracker module";
    break;
    
    case FMODGMS_SOUND_TYPE_MIDI:
    return "MIDI Sequence";
    break;
    
    case FMODGMS_SOUND_TYPE_MOD:
    return "MOD - Protracker / Fasttracker module";
    break;
    
    case FMODGMS_SOUND_TYPE_MPEG:
    return "MP2/MP3 - MPEG";
    break;
    
    case FMODGMS_SOUND_TYPE_OGGVORBIS:
    return "OGG - Ogg Vorbis";
    break;
    
    case FMODGMS_SOUND_TYPE_PLAYLIST:
    return "Playlist - ASX/PLS/M3U/WAX";
    break;
    
    case FMODGMS_SOUND_TYPE_RAW:
    return "RAW - Raw PCM data";
    break;
    
    case FMODGMS_SOUND_TYPE_S3M:
    return "S3M - ScreamTracker 3 module";
    break;
    
    case FMODGMS_SOUND_TYPE_USER:
    return "User-created";
    break;
    
    case FMODGMS_SOUND_TYPE_WAV:
    return "WAV - Microsoft Wave";
    break;
    
    case FMODGMS_SOUND_TYPE_XM:
    return "XM - FastTracker 2 module";
    break;
    
    case FMODGMS_SOUND_TYPE_XMA:
    return "Xbox 360 XMA";
    break;
    
    case FMODGMS_SOUND_TYPE_AUDIOQUEUE:
    return "iPhone hardware decoder";
    break;
    
    case FMODGMS_SOUND_TYPE_AT9:
    return "PS4 / PSVita ATRAC 9";
    break;
    
    case FMODGMS_SOUND_TYPE_VORBIS:
    return "Vorbis";
    break;
    
    case FMODGMS_SOUND_TYPE_MEDIA_FOUNDATION:
    return "Windows Store Application built-in system codecs";
    break;
    
    case FMODGMS_SOUND_TYPE_MEDIA_CODEC:
    return "Android MediaCodec";
    break;
    
    case FMODGMS_SOUND_TYPE_FADPCM:
    return "FMOD Adaptive Differential PCM";
    break;
    
    case FMODGMS_SOUND_TYPE_MAX:
    return "Max Number of Formats";
    break;
    
    default:
    return "Unknown Format";
}
