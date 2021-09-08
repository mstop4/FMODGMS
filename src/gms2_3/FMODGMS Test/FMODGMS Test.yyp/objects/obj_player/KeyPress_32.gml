/// Start/Stop playing current sound
{
    if (is_playing)
    {
        is_playing = false;
        FMODGMS_Chan_StopChannel(channel[0]);
    }
    
    else
    {
        is_playing = true;
        FMODGMS_Snd_PlaySound(sound[sound_index],channel[0]);
        channel_volume = FMODGMS_Chan_Get_Volume(0);
        channel_frequency = FMODGMS_Chan_Get_Frequency(0);
        channel_pitch = FMODGMS_Chan_Get_Pitch(0);
    }
    
    is_paused = false;
}

