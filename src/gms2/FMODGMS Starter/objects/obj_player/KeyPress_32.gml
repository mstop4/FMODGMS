/// @desc Start/Stop playing current sound
{
    if (is_playing)
    {
        is_playing = false;
        FMODGMS_Chan_StopChannel(channel);
    }
    
    else
    {
        is_playing = true;
        FMODGMS_Snd_PlaySound(sound,channel);
    }
    
    is_paused = false;
}