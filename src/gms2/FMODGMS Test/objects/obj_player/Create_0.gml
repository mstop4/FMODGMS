/// Init FMODGMS
{
    randomize();

    FMODGMS_Util_SecondsToSamples(2,44100);
    
    // Check to see if FMODGMS has loaded properly
    if (FMODGMS_Util_Handshake() == "FMODGMS is working.")
        show_message_async("Success! FMODGMS has been loaded.");
    
    else
        show_message_async("Error! FMODGMS was not loaded prorperly.");
    
    // Create the system
    FMODGMS_Sys_Create();
    
    // Uncomment out the line below to use ASIO on Windows.
    //FMODGMS_Sys_Set_OutputMode(FMODGMS_OUTPUTTYPE_ASIO);
    
    // Initialize the system
    FMODGMS_Sys_Initialize(32);
    
    // Initialize the spectrum visualizer
    FMODGMS_FFT_Init(128);
    
    output_mode = FMODGMS_Sys_OutputModeToString(FMODGMS_Sys_Get_OutputMode());
	
	// Set decode buffer length
	FMODGMS_Snd_Set_DecodeBufferSize(3200);

    // Number of bins in Spectrum data
    //show_message(FMODGMS_FFT_Set_WindowSize(128));
    numBins = FMODGMS_FFT_Get_NumBins();
    peakDamping = 0.5;
    
    // init spectrum visualizer bins
    for (var i=0; i<numBins; i++)
    {
        avgBin[i] = 1;
    } 
    
    // Load sounds
    sound[0] = FMODGMS_Snd_LoadSound(working_directory + "cronolog.s3m");
    sound[1] = FMODGMS_Snd_LoadSound(working_directory + "lemming1.mod");
    sound[2] = FMODGMS_Snd_LoadSound(working_directory + "giana_sisters.xm");
    sound[3] = FMODGMS_Snd_LoadSound(working_directory + "super_mario_rpg-barrel_volcano.it");    
    sound[4] = FMODGMS_Snd_LoadSound(working_directory + "hiyalooped.mp3"); 
    sound[5] = FMODGMS_Snd_LoadSound(working_directory + "looptest.ogg");   
    
    // MIDIs are only guaranteed to work in Windows
    
    // Load MIDI with default system synth 
    sound[6] = FMODGMS_Snd_LoadSound(working_directory + "DKC_Water-KM.mid");
    
    // Load MIDI with included DLS bank
    FMODGMS_Snd_Set_DLS(working_directory + "Fury.dls");
    sound[7] = FMODGMS_Snd_LoadSound(working_directory + "DKC_Water-KM.mid");
    FMODGMS_Snd_Remove_DLS();

    // set custom loop points for looptest.ogg
    FMODGMS_Snd_Set_LoopPoints(sound[5],176400,352800);
    FMODGMS_Snd_Set_LoopMode(sound[5],1,-1);
    
    // set custom loop points for hiyalooped.mp3
    FMODGMS_Snd_Set_LoopPoints(sound[4],2168851,6680062);
    FMODGMS_Snd_Set_LoopMode(sound[4],1,-1);
    
    // set default loop points for DKC_Water-KM.mid
    if (os_type <> os_linux) 
    {
        FMODGMS_Snd_Set_LoopMode(sound[6],1,-1);
        FMODGMS_Snd_Set_LoopMode(sound[7],1,-1);        
    }
    
    //create a channel
    channel[0] = FMODGMS_Chan_CreateChannel();
    
    // Other Variables
    //vu_on = true;
    sound_index = 0;
    sound_type = FMODGMS_Snd_TypeToString(FMODGMS_Snd_Get_Type(sound[sound_index]));
    is_playing = false;
    is_paused = false;
    hue = irandom(255);
    hue_shift = 0;
    channel_volume = 1;
    channel_frequency = 1;
    channel_pitch = 1;
    effect = -1;
    effectIndex = -1;
    normalize_spectrum = false;
    
    window_set_caption("FMODGMS Player Demo - The colours!");
}

