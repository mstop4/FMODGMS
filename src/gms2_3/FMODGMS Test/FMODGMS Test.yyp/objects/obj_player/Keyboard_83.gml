channel_frequency -= 100;

// Only the OGG track can go below 0 Hz (for reverse playback).
// Make sure MOD tracks don't or else this function will stop working.

if (sound_index <> 4 && channel_frequency < 100)
    channel_frequency = 100;

FMODGMS_Chan_Set_Frequency(0,channel_frequency);

