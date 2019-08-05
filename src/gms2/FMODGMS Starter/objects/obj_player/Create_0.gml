/// @desc Init FMODGMS

// Check to see if FMODGMS has loaded properly
if (FMODGMS_Util_Handshake() == "FMODGMS is working.")
    show_message_async("Success! FMODGMS has been loaded.");

else
    show_message_async("Error! FMODGMS was not loaded prorperly.");

// Create the system
FMODGMS_Sys_Create();

// Initialize the system
FMODGMS_Sys_Initialize(32);

// Load sound
sound = FMODGMS_Snd_LoadSound(working_directory + "SE_Executive Pay II.it");

// create a channel
channel = FMODGMS_Chan_CreateChannel();

// other variables
is_playing = false;
is_paused = false;

window_set_caption("FMODGMS Starter Project - No colours... :(");