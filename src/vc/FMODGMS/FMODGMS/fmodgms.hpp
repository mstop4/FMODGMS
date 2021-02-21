/*--------------------------------------------------------
//  fmodgms.hpp
//
//  FMODGMS v.0.10.0
//
//  GML bindings to the FMOD Core API for GameMaker:Studio.
//
//  FMOD Studio version: 2.01.07
----------------------------------------------------------*/

#ifndef FMODGMS_HPP
#define FMODGMS_HPP

#include "kissfft/kiss_fftr.h"

#define GMexport extern "C" __declspec (dllexport)
#define GMS_true 1
#define GMS_false 0
#define GMS_error -1;

// System Functions
GMexport double FMODGMS_Sys_Create();
GMexport double FMODGMS_Sys_Initialize(double maxChan);
GMexport double FMODGMS_Sys_Update();
GMexport double FMODGMS_Sys_Close();
GMexport double FMODGMS_Sys_Set_OutputMode(double outputType);
GMexport double FMODGMS_Sys_Set_SoftwareFormat(double sampleRate, double speakermode);
GMexport double FMODGMS_Sys_Set_DSPBufferSize(double size, double numBuffers);
GMexport double FMODGMS_Sys_Get_SampleRate();
GMexport double FMODGMS_Sys_Get_SpeakerMode();
GMexport double FMODGMS_Sys_Get_CPUUsage();
GMexport double FMODGMS_Sys_Get_OutputMode();
GMexport double FMODGMS_Sys_Get_DSPBufferSize();
GMexport double FMODGMS_Sys_Get_NumDSPBuffers();
GMexport double FMODGMS_Sys_Get_MaxSoundIndex();
GMexport double FMODGMS_Sys_Get_MaxChannelIndex();

// FFT (Spectrum) Functions
GMexport double FMODGMS_FFT_Init(double wSize);
GMexport double FMODGMS_FFT_Set_WindowSize(double size);
GMexport double FMODGMS_FFT_Get_DominantFrequency();
GMexport double FMODGMS_FFT_Get_BinValue(double index);
GMexport double FMODGMS_FFT_Get_NumBins();
GMexport double FMODGMS_FFT_Normalize();

// Sound Functions
GMexport double FMODGMS_Snd_LoadSound(char* filename);
GMexport double FMODGMS_Snd_LoadSound_Ext(char* location, double mode, uint64_t* exInfo);
GMexport double FMODGMS_Snd_LoadStream(char* filename);
GMexport double FMODGMS_Snd_Unload(double index);
GMexport double FMODGMS_Snd_PlaySound(double index, double channel);
GMexport double FMODGMS_Snd_Set_DLS(char* filename);
GMexport double FMODGMS_Snd_Remove_DLS();
GMexport double FMODGMS_Snd_Set_LoopMode(double index, double mode, double times);
GMexport double FMODGMS_Snd_Set_LoopPoints(double index, double startTimeInSamples, double endTimeInSamples);
GMexport double FMODGMS_Snd_Set_ModChannelVolume(double index, double modChannel, double vol);
GMexport const char* FMODGMS_Snd_Get_DLS();
GMexport double FMODGMS_Snd_Get_LoopPoints(double index, double whichOne);
GMexport double FMODGMS_Snd_Get_Length(double index);
GMexport double FMODGMS_Snd_Get_ModChannelVolume(double index, double modChannel);
GMexport double FMODGMS_Snd_Get_ModNumChannels(double index);
GMexport double FMODGMS_Snd_Get_NumChannels(double index);
GMexport double FMODGMS_Snd_Get_BitsPerSample(double index);
GMexport double FMODGMS_Snd_Get_DefaultFrequency(double index);
GMexport double FMODGMS_Snd_ReadData(double index, double pos, double length, void* buffer);

// Tag Functions
GMexport double FMODGMS_Snd_Get_NumTags(double index);
GMexport const char* FMODGMS_Snd_Get_TagName(double soundIndex, double tagIndex);
GMexport double FMODGMS_Snd_Get_TagTypeFromIndex(double soundIndex, double tagIndex);
GMexport double FMODGMS_Snd_Get_TagDataTypeFromIndex(double soundIndex, double tagIndex);
GMexport double FMODGMS_Snd_Get_TagRealFromIndex(double soundIndex, double tagIndex);
GMexport const char* FMODGMS_Snd_Get_TagStringFromIndex(double soundIndex, double tagIndex);

GMexport double FMODGMS_Snd_Get_TagTypeFromName(double soundIndex, char* tagName);
GMexport double FMODGMS_Snd_Get_TagDataTypeFromName(double soundIndex, char* tagName);
GMexport double FMODGMS_Snd_Get_TagRealFromName(double soundIndex, char* tagName);
GMexport const char* FMODGMS_Snd_Get_TagStringFromName(double soundIndex, char* tagName);

GMexport double FMODGMS_Snd_Get_Type(double index);

// Channel Functions
GMexport double FMODGMS_Chan_CreateChannel();
GMexport double FMODGMS_Chan_RemoveChannel(double channel);
GMexport double FMODGMS_Chan_PauseChannel(double channel);
GMexport double FMODGMS_Chan_ResumeChannel(double channel);
GMexport double FMODGMS_Chan_StopChannel(double channel);
GMexport double FMODGMS_Chan_Set_Position(double channel, double pos);
GMexport double FMODGMS_Chan_Set_Volume(double channel, double vol);
GMexport double FMODGMS_Chan_Set_Frequency(double channel, double freq);
GMexport double FMODGMS_Chan_Set_Pitch(double channel, double pitch);
GMexport double FMODGMS_Chan_Set_ModOrder(double channel, double ord);
GMexport double FMODGMS_Chan_Set_ModRow(double channel, double row);
GMexport double FMODGMS_Chan_Set_Mute(double channel, double mute);
GMexport double FMODGMS_Chan_Get_Position(double channel);
GMexport double FMODGMS_Chan_Get_Volume(double channel);
GMexport double FMODGMS_Chan_Get_Frequency(double channel);
GMexport double FMODGMS_Chan_Get_Pitch(double channel);
GMexport double FMODGMS_Chan_Get_ModOrder(double channel);
GMexport double FMODGMS_Chan_Get_ModPattern(double channel);
GMexport double FMODGMS_Chan_Get_ModRow(double channel);
GMexport double FMODGMS_Chan_Get_Mute(double channel);
GMexport double FMODGMS_Chan_Is_Playing(double channel);
GMexport double FMODGMS_Chan_Add_Effect(double channel, double effect, double index);
GMexport double FMODGMS_Chan_Remove_Effect(double channel, double effect);
GMexport double FMODGMS_Chan_Get_Level(double channel);

//DSP Effect Functions
GMexport double FMODGMS_Effect_Create(double type);
GMexport double FMODGMS_Effect_Set_Parameter(double effect, double param, double value);
GMexport double FMODGMS_Effect_Get_Parameter(double effect, double param);
GMexport double FMODGMS_Effect_Remove(double effect);
GMexport double FMODGMS_Effect_RemoveAll();

// Utility Functions
GMexport const char* FMODGMS_Util_GetErrorMessage();
GMexport const char* FMODGMS_Util_Handshake();
GMexport double FMODGMS_Util_FFT(float* bufferIn, float* bufferOut, double numPoints, double normalize);

// Internal helper functions
double FMODGMS_Util_ErrorChecker();
void u16ToASCII(std::u16string const &s);

#endif // FMODGMS_HPP
