///switch_track(index)
// Switch audio track
{
    if (sound_index <> argument0 && is_playing)
    {
        FMODGMS_Chan_StopChannel(0);
        FMODGMS_Snd_PlaySound(sound[argument0],0);
        channel_volume = FMODGMS_Chan_Get_Volume(0);
        channel_frequency = FMODGMS_Chan_Get_Frequency(0);
        channel_pitch = FMODGMS_Chan_Get_Pitch(0);
        is_paused = false;
    }
    
    sound_index = argument0;
    sound_type = FMODGMS_Snd_TypeToString(FMODGMS_Snd_Get_Type(sound[sound_index]));
}
