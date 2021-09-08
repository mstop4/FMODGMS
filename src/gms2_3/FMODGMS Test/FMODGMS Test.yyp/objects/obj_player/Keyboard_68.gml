channel_pitch -= 0.01;

// No negative multiplers allowed

if (channel_pitch < 0.01)
    channel_pitch = 0.01;

FMODGMS_Chan_Set_Pitch(0,channel_pitch);

