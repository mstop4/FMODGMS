/// @description FMODGMS_Snd_TypeToString(sound_type_index)
/// @param sound_type_index

//NB: Not all possible effects are covered

switch (argument[0])
{
    case FMODGMS_EFFECT_CHORUS:
    return "Chorus";
    break;
    
    case FMODGMS_EFFECT_DISTORTION:
    return "Distortion";
    break;
    
    case FMODGMS_EFFECT_ECHO:
    return "Echo";
    break;
    
    case FMODGMS_EFFECT_FLANGE:
    return "Flange";
    break;
    
    case FMODGMS_EFFECT_HIGHPASS:
    return "Highpass";
    break;
    
    case FMODGMS_EFFECT_LOWPASS:
    return "Lowpass";
    break;
    
    case FMODGMS_EFFECT_REVERB:
    return "Reverb";
    break;
    
    case FMODGMS_EFFECT_TREMOLO:
    return "Tremolo";
    break;
    
    case -1:
    return "None";
    break;
    
    default:
    return "Other";
}
