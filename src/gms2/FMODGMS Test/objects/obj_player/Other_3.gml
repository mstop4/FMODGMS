/// Free FMODGMS
{
    FMODGMS_Chan_StopChannel(channel);
    
    for (var i=0; i<8; i++)
    {
        FMODGMS_Snd_Unload(sound[i]);
    }
    
    FMODGMS_Chan_Remove_Effect(channel[0],effect);
    FMODGMS_Effect_RemoveAll();
    
    FMODGMS_Chan_RemoveChannel(channel);
    
    FMODGMS_Sys_Close();
}

