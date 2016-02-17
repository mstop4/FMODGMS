// FMODGMS v.0.3.1
// by M.S.T.O.P.

#ifndef FMODGMS_H
#define FMODGMS_H

#define GMexport extern "C" __declspec (dllexport)
#define GMS_true 1
#define GMS_false 0
#define GMS_error -1;

// System Functions
GMexport double FMODGMS_Sys_Create();
GMexport double FMODGMS_Sys_Initialize(double maxChan);
GMexport double FMODGMS_Sys_SetSoftwareFormat(double sampleRate, double speakermode);
GMexport double FMODGMS_Sys_Get_CPUUsage();
GMexport double FMODGMS_Sys_Get_MaxSoundIndex();
GMexport double FMODGMS_Sys_Get_MaxChannelIndex();
GMexport double FMODGMS_Sys_Close();

// Sound Functions
GMexport double FMODGMS_Snd_LoadSound(char* filename);
GMexport double FMODGMS_Snd_LoadStream(char* filename);
GMexport double FMODGMS_Snd_Unload(double index);
GMexport double FMODGMS_Snd_PlaySound(double index, double channel);
GMexport double FMODGMS_Snd_Set_LoopMode(double index, double modem, double times);
GMexport double FMODGMS_Snd_Set_LoopPoints(double index, double start, double end);
GMexport double FMODGMS_Snd_Get_LoopPoints(double index, double which);
GMexport double FMODGMS_Snd_Get_NumTags(double index);
GMexport const char* FMODGMS_Snd_Get_TagName(double soundIndex, double tagIndex);
GMexport const char* FMODGMS_Snd_Get_Type(double index);

// Channel Functions
GMexport double FMODGMS_Chan_CreateChannel();
GMexport double FMODGMS_Chan_RemoveChannel(double index);
GMexport double FMODGMS_Chan_StopChannel(double index);
GMexport double FMODGMS_Chan_Get_Position(double channel);
GMexport double FMODGMS_Chan_Get_ModOrder(double channel);
GMexport double FMODGMS_Chan_Get_ModPattern(double channel);
GMexport double FMODGMS_Chan_Get_ModRow(double channel);

// Utility Functions
GMexport const char* FMODGMS_Util_GetErrorMessage();
double FMODGMS_Util_ErrorChecker();

#endif // GMS_H
