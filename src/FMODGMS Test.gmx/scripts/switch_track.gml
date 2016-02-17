///switch_track(index)

{
    if (sound_index <> argument0 && is_playing)
    {
        FMODGMS_Chan_StopChannel(0);
        FMODGMS_Snd_PlaySound(sound[argument0],0);
    }
    
    sound_index = argument0;
}
