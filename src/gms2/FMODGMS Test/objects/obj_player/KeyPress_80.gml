///Pause/Unpause current sound
if (is_playing)
{
    if (!is_paused)
    {
        FMODGMS_Chan_PauseChannel(channel[0]);
        is_paused = true;
    }
    
    else
    {
        FMODGMS_Chan_ResumeChannel(channel[0]);
        is_paused = false;
    }
}

