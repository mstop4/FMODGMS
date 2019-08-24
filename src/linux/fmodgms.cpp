/*--------------------------------------------------------
//  fmodgms.cpp
//
//  FMODGMS v.0.10.1
//
//  GML bindings to the FMOD Studio low-level API for
//  GameMaker:Studio.
//
//  FMOD Studio version: 1.10.07
----------------------------------------------------------*/

#ifndef FMODGMS_CPP
#define FMODGMS_CPP

//#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
#include <iterator>
#include <cmath>
//#include <locale>
//#include <codecvt>
#include <stdio.h>
#include "fmod.hpp"
#include "fmod_errors.h"
#include "fmodgms.hpp"

#pragma region Global variables

// System Stuff
FMOD::System *sys = NULL;
std::vector <FMOD::Channel*> channelList;
std::vector <FMOD::Sound*> soundList;
std::vector <FMOD::DSP*> effectList;
FMOD::ChannelGroup *masterGroup;
FMOD_RESULT result;
const char* errorMessage;
std::string tagString;

// DLS stuff
FMOD_CREATESOUNDEXINFO *soundParams = new FMOD_CREATESOUNDEXINFO();
std::string dlsName;

// Spectrum DSP Stuff
FMOD::DSP *fftdsp = NULL;
float domFreq;
int playbackRate = 48000;
int windowSize = 128;
int nyquist = windowSize / 2;
std::vector <float> binValues(nyquist);
FMOD_DSP_PARAMETER_FFT *fftParams;

// Unicode stuff
//std::wstring_convert<std::codecvt_utf8_utf16<char16_t>, char16_t> u16Converter;

#pragma endregion

#pragma region System Functions

// Creates the system
GMexport double FMODGMS_Sys_Create()
{
	result = FMOD::System_Create(&sys);
	return FMODGMS_Util_ErrorChecker();
}

// Initializes the system
GMexport double FMODGMS_Sys_Initialize(double maxChan)
{
	//Init System
	int mc = (int)round(maxChan);

	for (int i = 0; i < nyquist; i++)
	{
		binValues[i] = 0;
	}

	result = sys->init(mc, FMOD_INIT_NORMAL, 0);

	soundParams->cbsize = sizeof(FMOD_CREATESOUNDEXINFO);
	soundParams->dlsname = 0;
	fftdsp = NULL;
	
	//if (result != FMOD_OK)
	return FMODGMS_Util_ErrorChecker();
}

// Updates the FMOD system  and spectrum DSP
GMexport double FMODGMS_Sys_Update()
{
	result = sys->update();
	if (result != FMOD_OK)
		return FMODGMS_Util_ErrorChecker();
	
	//Check to see if anything is playing before gathering spectrum data
	bool playState = false;
	masterGroup->isPlaying(&playState);

	if (playState && fftdsp != NULL)
	{
		result = fftdsp->getParameterData(FMOD_DSP_FFT_SPECTRUMDATA, (void **)&fftParams, 0, 0, 0);
		if (result != FMOD_OK)
			return FMODGMS_Util_ErrorChecker();
		
		int numChan = fftParams->numchannels;

		for (int j = 0; j < nyquist; j++)
		{
			binValues[j] = 0;

			for (int i = 0; i < numChan; i++)
				binValues[j] += fftParams->spectrum[i][j];

			binValues[j] /= numChan;
		}
	}

	return FMODGMS_Util_ErrorChecker();
}

// Closes and releases the system
GMexport double FMODGMS_Sys_Close()
{
	// Free sounds
	while (!soundList.empty())
	{
		soundList.back()->release();
		soundList.pop_back();
	}

	// Free DSP
	if (fftdsp != NULL)
	{
		result = masterGroup->removeDSP(fftdsp);
		if (result != FMOD_OK)
			return FMODGMS_Util_ErrorChecker();

		result = fftdsp->release();
		if (result != FMOD_OK)
			return FMODGMS_Util_ErrorChecker();
	}
	
	// Free system
	result = sys->close();
	if (result != FMOD_OK)
		return FMODGMS_Util_ErrorChecker();

	result = sys->release();
	if (result != FMOD_OK)
		return FMODGMS_Util_ErrorChecker();

	return FMODGMS_Util_ErrorChecker();

	//Free willy
}

// Sets the output mode for the platform
GMexport double FMODGMS_Sys_Set_OutputMode(double outputType)
{
	/*
	Output Types

	0 - Auto Detect (All, default)
	1 - Unknown (All) - shoudld only be used with FMODGMS_Sys_Get_OutputMode
	2 - No sound (All)
	3 - WAV Writer (All)
	4 - No sound, non-realtime (All)
	5 - WAV Writer, non-realtime (All)
	6 - Direct Sound (Windows, default for XP or lower)
	7 - Windows Multimedia (Windows)
	8 - Windows Audio Session API (Windows, default for Vista or higher)
	9 - ASIO 2.0 (Windows)
	10 - Pulse Audio (Linux, default if available)
	11 - Advanced Linux Sound Architecture (Linux, default if above isn't available)
	12 - Core Audio (Mac/iOS default)
	13 - XAudio (Xbox 360 default)
	14 - Audio Out (PS3 default)
	15 - Java Audio Track (Android, default for 2.2 or lower)
	16 - OpenSL ES (Android, default for 2.3 or higher)
	17 - AX (Wii U default)
	18 - Audio Out (PS4/PSVita default)
	19 - Audio3D (PS4)
	20 - Dolby Atmos WASAPI (Windows)
	21 - Max
	*/

	FMOD_OUTPUTTYPE ot = (FMOD_OUTPUTTYPE)(int)round(outputType);
	result = sys->setOutput(ot);
	return FMODGMS_Util_ErrorChecker();
}

// Sets the playback sample rate and speaker mode
GMexport double FMODGMS_Sys_Set_SoftwareFormat(double sampleRate, double speakermode)
{
	/*
	Speaker Modes

	0 - Default
	1 - Raw
	2 - Monoaural
	3 - Stereo
	4 - Quadriphonic
	5 - Surround
	6 - 5.1
	7 - 7.1
	8 - Max
	*/

	playbackRate = (int)round(sampleRate);
	FMOD_SPEAKERMODE sm = (FMOD_SPEAKERMODE)(int)round(speakermode);

	result = sys->setSoftwareFormat(playbackRate, sm, FMOD_MAX_CHANNEL_WIDTH);
	return FMODGMS_Util_ErrorChecker();
}

// Changes the DSP buffer size and quantity (defaults: size = 1024, num = 4)
GMexport double FMODGMS_Sys_Set_DSPBufferSize(double size, double numBuffers)
{
	unsigned int s = (unsigned int)round(size);
	int nb = (int)round(numBuffers);

	result = sys->setDSPBufferSize(s, nb);
	return FMODGMS_Util_ErrorChecker();
}

// Gets the speaker mode used by the system
GMexport double FMODGMS_Sys_Get_SpeakerMode()
{
	FMOD_SPEAKERMODE speakermode;
	sys->getSoftwareFormat(0, &speakermode, 0);

	return (double)speakermode;
}

// Gets the playback sample rate
GMexport double FMODGMS_Sys_Get_SampleRate()
{
	return (double)playbackRate;
}

// Gets the total CPU usage
GMexport double FMODGMS_Sys_Get_CPUUsage()
{
	float totalCPU;
	sys->getCPUUsage(0, 0, 0, 0, &totalCPU);

	return totalCPU;
}

// Gets the system's output type
GMexport double FMODGMS_Sys_Get_OutputMode()
{
	FMOD_OUTPUTTYPE output;
	sys->getOutput(&output);

	return (double)output;
}

// Gets the highest index in soundList (number of sounds - 1)
GMexport double FMODGMS_Sys_Get_MaxSoundIndex()
{
	return soundList.size() - 1.0f;
}

// Returns the highest index in channelList (number of channels - 1)
GMexport double FMODGMS_Sys_Get_MaxChannelIndex()
{
	return channelList.size() - 1.0f;
}

// Returns the DSP buffer size
GMexport double FMODGMS_Sys_Get_DSPBufferSize()
{
	unsigned int size;
	sys->getDSPBufferSize(&size, 0);

	return (double)size;
}

// Returns the number of DSP buffers
GMexport double FMODGMS_Sys_Get_NumDSPBuffers()
{
	int numBuffers;
	sys->getDSPBufferSize(0, &numBuffers);

	return (double)numBuffers;
}

#pragma endregion

#pragma region FFT (Spectrum) Functions

// Init Spectrum DSP
GMexport double FMODGMS_FFT_Init(double wSize)
{
	windowSize = (int)round(wSize);

	result = sys->getMasterChannelGroup(&masterGroup);
	if (result != FMOD_OK)
		return FMODGMS_Util_ErrorChecker();

	result = sys->createDSPByType(FMOD_DSP_TYPE_FFT, &fftdsp);
	if (result != FMOD_OK)
		return FMODGMS_Util_ErrorChecker();

	result = masterGroup->addDSP(FMOD_CHANNELCONTROL_DSP_TAIL, fftdsp);
	if (result != FMOD_OK)
		return FMODGMS_Util_ErrorChecker();

	result = sys->getSoftwareFormat(&playbackRate, 0, 0);
	if (result != FMOD_OK)
		return FMODGMS_Util_ErrorChecker();

	result = fftdsp->setParameterInt(FMOD_DSP_FFT_WINDOWTYPE, FMOD_DSP_FFT_WINDOW_TRIANGLE);
	if (result != FMOD_OK)
		return FMODGMS_Util_ErrorChecker();

	result = fftdsp->setParameterInt(FMOD_DSP_FFT_WINDOWSIZE, windowSize);
	return FMODGMS_Util_ErrorChecker();
}

// Sets the FFT window size (winodw size = 2 * nyquist = 2 * number of bins) 
// FMODGMS_FFT_Get_NumBins should be called after this function to ensure the game know what the new number of bins are
// NOTE: Doesn't work yet
GMexport double FMODGMS_FFT_Set_WindowSize(double size)
{
	if (fftdsp == NULL)
	{
		errorMessage = "FFT not initialized";
		return GMS_error;
	}
	windowSize = (int)round(size);
	nyquist = windowSize / 2;
	binValues.clear();
	for (int i = 0; i < nyquist; i++)
	{
		binValues[i] = 0;
	}

	result = fftdsp->setParameterInt(FMOD_DSP_FFT_WINDOWSIZE, windowSize);
	return FMODGMS_Util_ErrorChecker();
}

// Returns the domainant frequency
GMexport double FMODGMS_FFT_Get_DominantFrequency()
{
	if (fftdsp == NULL)
	{
		errorMessage = "FFT not initialized";
		return GMS_error;
	}
	result = fftdsp->getParameterFloat(FMOD_DSP_FFT_DOMINANT_FREQ, &domFreq, 0, 0);
	if (result != FMOD_OK)
		return FMODGMS_Util_ErrorChecker();
	else
		return domFreq;
}

// Returns the value of a certain bin in the spectrum
GMexport double FMODGMS_FFT_Get_BinValue(double index)
{
	if (fftdsp == NULL)
	{
		errorMessage = "FFT not initialized";
		return GMS_error;
	}
	unsigned int i = (unsigned int)index;

	if (i < binValues.size())
		return binValues[i];
	else
		return GMS_error;
}

// Returns the number of nims in the spectrum data (= nyquist = windowSize / 2)
GMexport double FMODGMS_FFT_Get_NumBins()
{
	if (fftdsp == NULL)
	{
		errorMessage = "FFT not initialized";
		return GMS_error;
	}
	return (double)nyquist;
}

// Normalizes the current spectrum data, use before getting if desirable
GMexport double FMODGMS_FFT_Normalize()
{
	if (fftdsp == NULL)
	{
		errorMessage = "FFT not initialized";
		return GMS_error;
	}
	auto maxIterator = std::max_element(&binValues[0], &binValues[nyquist - 1]);
	float maxVol = *maxIterator;
	for (int i = 0; i < windowSize; i++)
	{
		binValues[i] = binValues[i] / maxVol;
	}
	return FMODGMS_Util_ErrorChecker();
}

#pragma endregion

#pragma region Sound Functions

// Loads a sound and indexes it in soundList
GMexport double FMODGMS_Snd_LoadSound(char* filename)
{
	FMOD::Sound *sound = NULL;
	result = sys->createSound(filename, FMOD_DEFAULT, soundParams, &sound);

	// we cool?
	double isOK = FMODGMS_Util_ErrorChecker();

	// Yes, index the sound
	if (isOK == GMS_true)
	{
		soundList.push_back(sound);
		return soundList.size() - 1;
	}

	// No? Then don't index the new sound
	else
		return GMS_error;
}

// Loads a sound toa stream and indexes it in soundList
GMexport double FMODGMS_Snd_LoadStream(char* filename)
{
	FMOD::Sound *sound;
	result = sys->createStream(filename, FMOD_DEFAULT, soundParams, &sound);

	// we cool?
	double isOK = FMODGMS_Util_ErrorChecker();

	// Yes, index the sound
	if (isOK == GMS_true)
	{
		soundList.push_back(sound);
		return soundList.size() - 1;
	}

	// No? Then don't index the new sound
	else
		return GMS_error;
}

// Loads a sound, with optional advanced parameters, and indexes it in soundList.
//
// mode is FMOD_MODE bit flags.
//
// exInfo is an pointer to a buffer with data for FMOD_CREATESOUNDEXINFO.
// Optional. To use all default values, pass 0 to the exInfo parameter itself.
// The buffer must be 8 byte aligned. Values should be unsigned.
// It must contain every value for FMOD_CREATESOUNDEXINFO in correct order as documented in fmod.
// Use value 0 for default settings.
GMexport double FMODGMS_Snd_LoadSound_Ext(char* location, double mode, uint64_t* exInfo)
{
	FMOD::Sound *sound = NULL;
	FMOD_MODE _mode = FMOD_DEFAULT | (unsigned int)(mode+0.5);

	//if exInfo is used, transfer data to struct and pass to createSound
	if (exInfo != 0)
	{
		FMOD_CREATESOUNDEXINFO _exInfo;
		_exInfo.cbsize =				(int)sizeof(_exInfo);
		_exInfo.length =				(unsigned int)exInfo[0];
		_exInfo.fileoffset =			(unsigned int)exInfo[1];
		_exInfo.numchannels =			(int)exInfo[2];
		_exInfo.defaultfrequency =		(int)exInfo[3];
		_exInfo.format =				(FMOD_SOUND_FORMAT)exInfo[4];
		_exInfo.decodebuffersize =		(unsigned int)exInfo[5];
		_exInfo.initialsubsound =		(int)exInfo[6];
		_exInfo.numsubsounds =			(int)exInfo[7];
		_exInfo.inclusionlist =			(int*)exInfo[8];
		_exInfo.inclusionlistnum =		(int)exInfo[9];
		_exInfo.pcmreadcallback =		0; //not supported
		_exInfo.pcmsetposcallback =		0; //not supported
		_exInfo.nonblockcallback =		0; //not supported
		_exInfo.dlsname =				(const char*)exInfo[13];
		_exInfo.encryptionkey =			(const char*)exInfo[14];
		_exInfo.maxpolyphony =			(int)exInfo[15];
		_exInfo.userdata =				(void*)exInfo[16];
		_exInfo.suggestedsoundtype =	(FMOD_SOUND_TYPE)exInfo[17];
		_exInfo.fileuseropen =			0; //not supported
		_exInfo.fileuserclose =			0; //not supported
		_exInfo.fileuserread =			0; //not supported
		_exInfo.fileuserseek =			0; //not supported
		_exInfo.fileuserasyncread =		0; //not supported
		_exInfo.fileuserasynccancel =	0; //not supported
		_exInfo.fileuserdata =			(void*)exInfo[24];
		_exInfo.filebuffersize =		(int)exInfo[25];
		_exInfo.channelorder =			(FMOD_CHANNELORDER)exInfo[26];
		_exInfo.channelmask =			(FMOD_CHANNELMASK)exInfo[27];
		_exInfo.initialsoundgroup =		0; //not supported
		_exInfo.initialseekposition =	(unsigned int)exInfo[29];
		_exInfo.initialseekpostype =	(FMOD_TIMEUNIT)exInfo[30];
		_exInfo.ignoresetfilesystem =	(int)exInfo[31];
		_exInfo.audioqueuepolicy =		(unsigned int)exInfo[32];
		_exInfo.minmidigranularity =	(unsigned int)exInfo[33];
		_exInfo.nonblockthreadid =		(unsigned int)exInfo[34];
		_exInfo.fsbguid =				0; //not supported
		result = sys->createSound(location, _mode, &_exInfo, &sound);
	}
	else
		result = sys->createSound(location, _mode, NULL, &sound);
	
	// we cool?
	double isOK = FMODGMS_Util_ErrorChecker();

	// Yes, index the sound
	if (isOK == GMS_true)
	{
		soundList.push_back(sound);
		return soundList.size() - 1;
	}

	// No? Then don't index the new sound
	else
		return GMS_error;
}

// Unload a sound and removes it from soundList
GMexport double FMODGMS_Snd_Unload(double index)
{
	int i = (int)round(index);
	int sndListSize = soundList.size();

	if (sndListSize > i && i >= 0)
	{
		soundList.erase(soundList.begin());
		errorMessage = "No errors.";
		return GMS_true;
	}

	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

// Plays a sound on a given channel
GMexport double FMODGMS_Snd_PlaySound(double index, double channel)
{
	int i = (int)round(index);
	int c = (int)round(channel);
	//bool *n = false;
	int chanListSize = channelList.size();

	// check to see if channel is already playing. if so, stop it.
	if (chanListSize > c && c >= 0)
	{
		/*channelList[c]->isPlaying(n);

		if (&n)
		channelList[c]->stop;*/
	}

	// index out of bounds
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}

	// play sound
	result = sys->playSound(soundList[i], 0, false, &channelList[c]);

	return FMODGMS_Util_ErrorChecker();
}

// Sets to current active DLS bank to be loaded with subsequent MIDI files
// --------------
// TODO: This function should incorporate the use of FMODGMS_Snd_LoadSound_Ext
// instead of using it own private FMOD_CREATESOUNDEXINFO object
// --------------
GMexport double FMODGMS_Snd_Set_DLS(char* filename)
{
	dlsName = filename;
	soundParams->dlsname = dlsName.c_str();
	return FMODGMS_Util_ErrorChecker();
}

// Reverts DLS bank back to default
GMexport double FMODGMS_Snd_Remove_DLS()
{
	soundParams->dlsname = 0;
	return FMODGMS_Util_ErrorChecker();
}

// Set loop mode and count for a particular sound
GMexport double FMODGMS_Snd_Set_LoopMode(double index, double mode, double times)
{
	int i = (int)round(index);
	int sndListSize = soundList.size();

	if (i < sndListSize && i >= 0)
	{
		int m = (int)round(mode);
		int t = (int)round(times);

		switch (m)
		{
			// loop off
		case 0:
			result = soundList[i]->setMode(FMOD_LOOP_OFF);
			break;

			// loop on
		case 1:
			result = soundList[i]->setMode(FMOD_LOOP_NORMAL);
			break;

			// loop bidi
		case 2:
			result = soundList[i]->setMode(FMOD_LOOP_BIDI);
			break;

		default:
			errorMessage = "Unknown loop mode";
		}

		result = soundList[i]->setLoopCount(t);

		return FMODGMS_Util_ErrorChecker();
	}

	else
	{
		errorMessage = "Index out of bounds";
		return GMS_error;
	}
}

// Sets the loop points for a particular sound. Can be used in conjuction with FMODGMS_Util_SecondsToSamples
// or FMODGMS_Util_BeatsToSamples for precise loop point control.
GMexport double FMODGMS_Snd_Set_LoopPoints(double index, double startTimeInSamples, double endTimeInSamples)
{
	int i = (int)round(index);
	int sndListSize = soundList.size();

	if (i < sndListSize && i >= 0)
	{
		int s = (int)round(startTimeInSamples);
		int e = (int)round(endTimeInSamples);

		result = soundList[i]->setLoopPoints(s, FMOD_TIMEUNIT_PCM, e, FMOD_TIMEUNIT_PCM);

		return FMODGMS_Util_ErrorChecker();
	}

	else
	{
		errorMessage = "Index out of bounds";
		return GMS_error;
	}
}

// Sets the channel volume of a module file
GMexport double FMODGMS_Snd_Set_ModChannelVolume(double index, double modChannel, double vol)
{
	int i = (int)round(index);
	int mc = (int)round(modChannel);
	int sndListSize = soundList.size();

	if (sndListSize > i && i >= 0)
	{
		// check to see if the sound is a module
		FMOD_SOUND_TYPE type;
		soundList[i]->getFormat(&type, 0, 0, 0);

		if (type == FMOD_SOUND_TYPE_MOD ||
			type == FMOD_SOUND_TYPE_S3M ||
			type == FMOD_SOUND_TYPE_XM ||
			type == FMOD_SOUND_TYPE_IT)
		{
			// to see if modchannel is out of bounds
			int numChan;
			soundList[i]->getMusicNumChannels(&numChan);

			if (numChan > mc && 0 <= mc)
			{
				soundList[i]->setMusicChannelVolume(mc, (float)vol);
				errorMessage = "No errors.";
				return GMS_true;
			}

			else
			{
				errorMessage = "Module channel out of bounds.";
				return GMS_error;
			}
		}

		// not a module
		else
		{
			errorMessage = "Not a MOD, S3M, XM, or IT.";
			return GMS_error;
		}
	}

	// index out of bounds
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

// Get the currently set DLS bank
GMexport const char* FMODGMS_Snd_Get_DLS()
{
	return soundParams->dlsname;
}

// Gets the loop points for a particular sound.
GMexport double FMODGMS_Snd_Get_LoopPoints(double index, double whichOne)
{
	// whichOne
	// 0 = start;
	// 1 = end;

	int i = (int)round(index);
	int sndListSize = soundList.size();

	if (sndListSize > i && i >= 0)
	{
		unsigned int start = 0;
		unsigned int end = 0;

		soundList[i]->getLoopPoints(&start, FMOD_TIMEUNIT_PCM, &end, FMOD_TIMEUNIT_PCM);

		if (whichOne < 1.0)
			return (double)start;
		else
			return (double)end;
	}

	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

// Gets the length of an audio file in PCM samples
GMexport double FMODGMS_Snd_Get_Length(double index)
{
	int i = (int)round(index);
	int sndListSize = soundList.size();

	if (sndListSize > i && i >= 0)
	{
		unsigned int len;
		soundList[i]->getLength(&len, FMOD_TIMEUNIT_PCM);
		return (double)len;
	}

	// index out of bounds
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

// Gets the channel volume of a module file
GMexport double FMODGMS_Snd_Get_ModChannelVolume(double index, double modChannel)
{
	int i = (int)round(index);
	int mc = (int)round(modChannel);
	int sndListSize = soundList.size();

	if (sndListSize > i && i >= 0)
	{
		// check to see if the sound is a module
		FMOD_SOUND_TYPE type;
		soundList[i]->getFormat(&type, 0, 0, 0);

		if (type == FMOD_SOUND_TYPE_MOD ||
			type == FMOD_SOUND_TYPE_S3M ||
			type == FMOD_SOUND_TYPE_XM ||
			type == FMOD_SOUND_TYPE_IT)
		{
			// to see if modchannel is out of bounds
			int numChan;
			soundList[i]->getMusicNumChannels(&numChan);

			if (numChan > mc && 0 <= mc)
			{
				float vol;
				soundList[i]->getMusicChannelVolume(mc,&vol);
				errorMessage = "No errors.";
				return (double)vol;
			}

			else
			{
				errorMessage = "Module channel out of bounds.";
				return GMS_error;
			}
		}

		// not a module
		else
		{
			errorMessage = "Not a MOD, S3M, XM, or IT.";
			return GMS_error;
		}
	}

	// index out of bounds
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

// Gets the number of channels in a module file
GMexport double FMODGMS_Snd_Get_ModNumChannels(double index)
{
	int i = (int)round(index);
	int sndListSize = soundList.size();

	if (sndListSize > i && i >= 0)
	{
		// check to see if sound is a module
		FMOD_SOUND_TYPE type;
		soundList[i]->getFormat(&type, 0, 0, 0);

		if (type == FMOD_SOUND_TYPE_MOD ||
			type == FMOD_SOUND_TYPE_S3M ||
			type == FMOD_SOUND_TYPE_XM ||
			type == FMOD_SOUND_TYPE_IT)
		{
			int nc;
			soundList[i]->getMusicNumChannels(&nc);
			return (double)nc;
		}

		// not a module
		else
		{
			errorMessage = "Not a MOD, S3M, XM, or IT.";
			return GMS_error;
		}
	}

	// index out of bounds
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

//Gets number of channels (e.g 2 for left and right) of sound
GMexport double FMODGMS_Snd_Get_NumChannels(double index)
{
	int i = (int)(index+0.5);
	int sndListSize = soundList.size();

	if (sndListSize > i && i >= 0)
	{
		int channels;

		result = soundList[i]->getFormat(NULL, NULL, &channels, NULL);
		if (result == FMOD_OK)
			return (double)channels;
		else
		{
			errorMessage = "Failed to get data";
			return GMS_error;
		}
		
	}
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

//Gets number of bits per sample (resolution) of sound
GMexport double FMODGMS_Snd_Get_BitsPerSample(double index)
{
	int i = (int)(index + 0.5);
	int sndListSize = soundList.size();

	if (sndListSize > i && i >= 0)
	{
		int bits;

		result = soundList[i]->getFormat(NULL, NULL, NULL, &bits);
		if (result == FMOD_OK)
			return (double)bits;
		else
		{
			errorMessage = "Failed to get data";
			return GMS_error;
		}

	}
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

//Gets default frequency (samples per second) of sound
GMexport double FMODGMS_Snd_Get_DefaultFrequency(double index)
{
	int i = (int)(index + 0.5);
	int sndListSize = soundList.size();

	if (sndListSize > i && i >= 0)
	{
		float freq;

		result = soundList[i]->getDefaults(&freq, NULL);
		if (result == FMOD_OK)
			return (double)freq;
		else
		{
			errorMessage = "Failed to get data";
			return GMS_error;
		}

	}
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

// Populates a buffer with raw data in PCM format from a section of the sound.
// pos and length are in unit bytes.
// Return value, if not error, is how many bytes were read (may be less than length if for example reaching end of sound).
// NB: You should read the remarks in fmod's documentation for this function before using it.
GMexport double FMODGMS_Snd_ReadData(double index, double pos, double length, void* buffer)
{
	int i = (int)(index+0.5);
	int sndListSize = soundList.size();

	//check for parameter validity
	if (sndListSize < i || i < 0)
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
	unsigned int maxLength = 0;
	soundList[i]->getLength(&maxLength, FMOD_TIMEUNIT_PCMBYTES);
	if (length > maxLength || length < 0)
	{
		errorMessage = "Invalid length";
		return GMS_error;
	}
	if (pos > maxLength || pos < 0)
	{
		errorMessage = "Invalid position";
		return GMS_error;
	}
	unsigned int _pos = (unsigned int)(pos + 0.5);
	unsigned int _length = (unsigned int)(length + 0.5);

	//seek to pos
	result = soundList[i]->seekData(_pos);
	if (result != FMOD_OK)
	{
		errorMessage = "Failed to seek to pos";
		return GMS_error;
	}

	sys->update();
			
	//read sound and populate buffer
	unsigned int read = 0;
	result = soundList[i]->readData(buffer, _length, &read);
	if (result != FMOD_OK && result != FMOD_ERR_FILE_EOF)
	{
		errorMessage = "Failed to read data.";
		return GMS_error;
	}

	return (double)read;
}

#pragma endregion

#pragma region Channel Functions

// Creates a new channel
GMexport double FMODGMS_Chan_CreateChannel()
{
	FMOD::Channel *chan = NULL;
	channelList.push_back(chan);

	errorMessage = "No errors.";
	return channelList.size() - 1;
}

//Deletes a channel
GMexport double FMODGMS_Chan_RemoveChannel(double channel)
{
	int c = (int)round(channel);
	int chanListSize = channelList.size();

	if (chanListSize > c && c >= 0)
	{
		if (channelList[c] != NULL)
		{
			channelList[c]->stop();
			channelList.erase(channelList.begin());
			errorMessage = "No errors.";
			return GMS_true;
		}

		else
		{
			errorMessage = "Channel is null.";
			return GMS_error;
		}
	}

	// index out of bounds
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

// Pauses a channel
GMexport double FMODGMS_Chan_PauseChannel(double channel)
{
	int c = (int)round(channel);
	int chanListSize = channelList.size();

	if (chanListSize > c && c >= 0)
	{
		if (channelList[c] != NULL)
		{
			channelList[c]->setPaused(true);
			errorMessage = "No errors.";
			return GMS_true;
		}

		else
		{
			errorMessage = "Channel is null.";
			return GMS_error;
		}
	}

	// index out of bounds
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

//Resumes a puased channel
GMexport double FMODGMS_Chan_ResumeChannel(double channel)
{
	int c = (int)round(channel);
	int chanListSize = channelList.size();

	if (chanListSize > c && c >= 0)
	{
		if (channelList[c] != NULL)
		{
			channelList[c]->setPaused(false);
			errorMessage = "No errors.";
			return GMS_true;
		}

		else
		{
			errorMessage = "Channel is null.";
			return GMS_error;
		}
	}

	// index out of bounds
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

// Stops a channel
GMexport double FMODGMS_Chan_StopChannel(double channel)
{
	int c = (int)round(channel);
	int chanListSize = channelList.size();

	if (chanListSize > c && c >= 0)
	{
		if (channelList[c] != NULL)
		{
			channelList[c]->stop();
			errorMessage = "No errors.";
			return GMS_true;
		}

		else
		{
			errorMessage = "Channel is null.";
			return GMS_error;
		}
	}

	// index out of bounds
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

// Sets the playing position of a channel
GMexport double FMODGMS_Chan_Set_Position(double channel, double pos)
{
	int c = (int)round(channel);

	unsigned int p;
	if (pos < 0)
		p = 0;
	else
		p = (unsigned int)pos;

	int chanListSize = channelList.size();

	if (chanListSize > c && c >= 0)
	{
		result = channelList[c]->setPosition(p, FMOD_TIMEUNIT_PCM);
		errorMessage = "No errors.";
		return GMS_true;
	}

	// index out of bounds
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

// Sets the volume of a channel
GMexport double FMODGMS_Chan_Set_Volume(double channel, double vol)
{
	int c = (int)round(channel);
	float v = (float)vol;
	int chanListSize = channelList.size();

	if (chanListSize > c && c >= 0)
	{
		result = channelList[c]->setVolume(v);
		errorMessage = "No errors.";
		return GMS_true;
	}

	// index out of bounds
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

//Sets playback frequency of a channel
GMexport double FMODGMS_Chan_Set_Frequency(double channel, double freq)
{
	int c = (int)round(channel);
	float f = (float)freq;
	int chanListSize = channelList.size();

	if (chanListSize > c && c >= 0)
	{
		result = channelList[c]->setFrequency(f);
		errorMessage = "No errors.";
		return GMS_true;
	}

	// index out of bounds
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

//Sets frequency multiplier of a channel
GMexport double FMODGMS_Chan_Set_Pitch(double channel, double pitch)
{
	int c = (int)round(channel);
	float p = (float)pitch;
	int chanListSize = channelList.size();

	if (chanListSize > c && c >= 0)
	{
		result = channelList[c]->setPitch(p);
		errorMessage = "No errors.";
		return GMS_true;
	}

	// index out of bounds
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

// Sets the order position of a channel playing a MOD
GMexport double FMODGMS_Chan_Set_ModOrder(double channel, double ord)
{
	int c = (int)channel;
	int chanListSize = channelList.size();

	if (chanListSize > c && c >= 0)
	{
		// get handle of sound currently playing in channel
		FMOD::Sound *snd;
		channelList[c]->getCurrentSound(&snd);

		// check to see if the sound is a module
		FMOD_SOUND_TYPE type;
		snd->getFormat(&type, 0, 0, 0);

		if (type == FMOD_SOUND_TYPE_MOD ||
			type == FMOD_SOUND_TYPE_S3M ||
			type == FMOD_SOUND_TYPE_XM ||
			type == FMOD_SOUND_TYPE_IT)
		{
			unsigned int _ord;
			if (ord < 0)
				_ord = 0;
			else
				_ord = (unsigned int)ord;

			channelList[c]->setPosition(_ord, FMOD_TIMEUNIT_MODORDER);
			errorMessage = "No errors.";
			return GMS_true;
		}

		// not a module
		else
		{
			errorMessage = "Not a MOD, S3M, XM, or IT.";
			return GMS_error;
		}
	}

	// index out of bounds
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

// Sets the row position of a channel playing a MOD
GMexport double FMODGMS_Chan_Set_ModRow(double channel, double row)
{
	int c = (int)round(channel);
	int chanListSize = channelList.size();

	if (chanListSize > c && c >= 0)
	{
		// get handle of sound currently playing in channel
		FMOD::Sound *snd;
		channelList[c]->getCurrentSound(&snd);

		// check to see if the sound is a module
		FMOD_SOUND_TYPE type;
		snd->getFormat(&type, 0, 0, 0);

		if (type == FMOD_SOUND_TYPE_MOD ||
			type == FMOD_SOUND_TYPE_S3M ||
			type == FMOD_SOUND_TYPE_XM ||
			type == FMOD_SOUND_TYPE_IT)
		{
			unsigned int r;
			if (row < 0)
				r = 0;
			else
				r = (unsigned int)row;

			channelList[c]->setPosition(r, FMOD_TIMEUNIT_MODROW);
			errorMessage = "No errors.";
			return GMS_true;
		}

		// not a module
		else
		{
			errorMessage = "Not a MOD, S3M, XM, or IT.";
			return GMS_error;
		}
	}

	// index out of bounds
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

//Sets current mute status (1= muted, 0=unmuted)
GMexport double FMODGMS_Chan_Set_Mute(double channel, double mute)
{
	int c = (int)round(channel);
	int chanListSize = channelList.size();

	if (chanListSize > c && c >= 0)
	{
		channelList[c]->setMute((mute > 0.5));
		return FMODGMS_Util_ErrorChecker();
	}

	// index out of bounds
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

// Returns the current position of the sound being played on the channel
GMexport double FMODGMS_Chan_Get_Position(double channel)
{
	int c = (int)round(channel);
	int chanListSize = channelList.size();

	if (chanListSize > c && c >= 0)
	{
		/*
		// get handle of sound currently playing in channel
		FMOD::Sound *snd;
		channelList[c]->getCurrentSound(&snd);
		*/

		unsigned int pos;
		channelList[c]->getPosition(&pos, FMOD_TIMEUNIT_PCM);
		errorMessage = "No errors.";
		return (double)pos;
	}

	// index out of bounds
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

// Returns the volume of a channel
GMexport double FMODGMS_Chan_Get_Volume(double channel)
{
	int c = (int)round(channel);
	int chanListSize = channelList.size();

	if (chanListSize > c && c >= 0)
	{
		float vol;
		channelList[c]->getVolume(&vol);
		errorMessage = "No errors.";
		return (double)vol;
	}

	// index out of bounds
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

// Returns the frequency the channel is being played at
GMexport double FMODGMS_Chan_Get_Frequency(double channel)
{
	int c = (int)round(channel);
	int chanListSize = channelList.size();

	if (chanListSize > c && c >= 0)
	{
		float freq;
		channelList[c]->getFrequency(&freq);
		errorMessage = "No errors.";
		return (double)freq;
	}

	// index out of bounds
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

//Returns the frequency multipler of a channel
GMexport double FMODGMS_Chan_Get_Pitch(double channel)
{
	int c = (int)round(channel);
	int chanListSize = channelList.size();

	if (chanListSize > c && c >= 0)
	{
		float pitch;
		channelList[c]->getPitch(&pitch);
		errorMessage = "No errors.";
		return (double)pitch;
	}

	// index out of bounds
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

// Returns current order of a module playing in a particular channel
GMexport double FMODGMS_Chan_Get_ModOrder(double channel)
{
	int c = (int)round(channel);
	int chanListSize = channelList.size();

	if (chanListSize > c && c >= 0)
	{
		// get handle of sound currently playing in channel
		FMOD::Sound *snd;
		channelList[c]->getCurrentSound(&snd);

		// check to see if the sound is a module
		FMOD_SOUND_TYPE type;
		snd->getFormat(&type, 0, 0, 0);

		if (type == FMOD_SOUND_TYPE_MOD ||
			type == FMOD_SOUND_TYPE_S3M ||
			type == FMOD_SOUND_TYPE_XM ||
			type == FMOD_SOUND_TYPE_IT)
		{
			unsigned int pos;
			channelList[c]->getPosition(&pos, FMOD_TIMEUNIT_MODORDER);
			errorMessage = "No errors.";
			return (double)pos;
		}

		// not a module
		else
		{
			errorMessage = "Not a MOD, S3M, XM, or IT.";
			return GMS_error;
		}
	}

	// index out of bounds
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

// Returns current pattern of a module playing in a particular channel
GMexport double FMODGMS_Chan_Get_ModPattern(double channel)
{
	int c = (int)round(channel);
	int chanListSize = channelList.size();

	if (chanListSize > c && c >= 0)
	{
		// get handle of sound currently playing in channel
		FMOD::Sound *snd;
		channelList[c]->getCurrentSound(&snd);

		// check to see if the sound is a module
		FMOD_SOUND_TYPE type;
		snd->getFormat(&type, 0, 0, 0);

		if (type == FMOD_SOUND_TYPE_MOD ||
			type == FMOD_SOUND_TYPE_S3M ||
			type == FMOD_SOUND_TYPE_XM ||
			type == FMOD_SOUND_TYPE_IT)
		{
			unsigned int pos;
			channelList[c]->getPosition(&pos, FMOD_TIMEUNIT_MODPATTERN);
			errorMessage = "No errors.";
			return (double)pos;
		}

		// not a module
		else
		{
			errorMessage = "Not a MOD, S3M, XM, or IT.";
			return GMS_error;
		}
	}

	// index out of bounds
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

// Returns current row of a module playing in a particular channel
GMexport double FMODGMS_Chan_Get_ModRow(double channel)
{
	int c = (int)round(channel);
	int chanListSize = channelList.size();

	if (chanListSize > c && c >= 0)
	{
		// get handle of sound currently playing in channel
		FMOD::Sound *snd;
		channelList[c]->getCurrentSound(&snd);

		// check to see if the sound is a module
		FMOD_SOUND_TYPE type;
		snd->getFormat(&type, 0, 0, 0);

		if (type == FMOD_SOUND_TYPE_MOD ||
			type == FMOD_SOUND_TYPE_S3M ||
			type == FMOD_SOUND_TYPE_XM ||
			type == FMOD_SOUND_TYPE_IT)
		{
			unsigned int pos;
			channelList[c]->getPosition(&pos, FMOD_TIMEUNIT_MODROW);
			errorMessage = "No errors.";
			return (double)pos;
		}

		// not a module
		else
		{
			errorMessage = "Not a MOD, S3M, XM, or IT.";
			return GMS_error;
		}
	}

	// index out of bounds
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

//Gets current mute status (1= muted, 0=unmuted)
GMexport double FMODGMS_Chan_Get_Mute(double channel)
{
	int c = (int)round(channel);
	int chanListSize = channelList.size();

	if (chanListSize > c && c >= 0)
	{
		bool muted;
		if (channelList[c]->getMute(&muted) == FMOD_OK)
		{
			return (double)muted;
		}
		else
		{
			errorMessage = "Could not get mute status";
			return GMS_false;
		}
	}

	// index out of bounds
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

// Checks if the given channel is currently playing a sound
GMexport double FMODGMS_Chan_Is_Playing(double channel)
{
	int c = (int)round(channel);
	int chanListSize = channelList.size();
	
	if (chanListSize > c && c >= 0)
	{
		bool playing;
		if (channelList[c]->isPlaying(&playing) == FMOD_OK)
		{
			return (double)playing;
		}
		else
		{
			errorMessage = "Could not get playing status";
			return GMS_false;
		}
	}
	// index out of bounds
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

//Adds an effect e to the i-th index of effect chain of a channel
GMexport double FMODGMS_Chan_Add_Effect(double channel, double e, double i)
{
	int c = (int)round(channel);
	int chanListSize = channelList.size();

	if (chanListSize > c && c >= 0)
	{
		int effectIndex = (int)round(e);
		if ((effectIndex < 0) || (effectIndex >= (int)effectList.size()))
		{
			errorMessage = "Invalid effect index";
			return GMS_error;
		}
		FMOD::DSP* effect = effectList[effectIndex];

		if (channelList[c]->addDSP((int)round(i), effect) == FMOD_OK)
			return FMODGMS_Util_ErrorChecker();
		else
		{
			errorMessage = "Could not add effect to channel";
			return GMS_error;
		}
	}
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

//Removes an effect e from the effect chain of a channel
GMexport double FMODGMS_Chan_Remove_Effect(double channel, double e)
{
	int c = (int)round(channel);
	int chanListSize = channelList.size();

	if (chanListSize > c && c >= 0)
	{
		int effectIndex = (int)round(e);
		if ((effectIndex < 0) || (effectIndex >= (int)effectList.size()))
		{
			errorMessage = "Invalid effect index";
			return GMS_error;
		}
		FMOD::DSP* effect = effectList[effectIndex];

		if (channelList[c]->removeDSP(effect) == FMOD_OK)
			return FMODGMS_Util_ErrorChecker();
		else
		{
			errorMessage = "Could not remove effect from channel";
			return GMS_error;
		}
	}
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

//Get current level/loudness of audio (RMS value)
GMexport double FMODGMS_Chan_Get_Level(double channel)
{
	int c = (int)round(channel);
	int chanListSize = channelList.size();

	if (chanListSize > c && c >= 0)
	{
		FMOD::DSP* headDSP;
		channelList[c]->getDSP(FMOD_CHANNELCONTROL_DSP_TAIL, &headDSP);

		//enable channel metering if it isn't already
		bool meteringEnabled = 0;
		if (headDSP->getMeteringEnabled(NULL, &meteringEnabled) != FMOD_OK)
			return FMODGMS_Util_ErrorChecker();
		if (!meteringEnabled)
			headDSP->setMeteringEnabled(true, false);

		//get level using metering on head dsp
		FMOD_DSP_METERING_INFO meteringInfo;
		if (headDSP->getMeteringInfo(&meteringInfo, NULL) != FMOD_OK)
			return FMODGMS_Util_ErrorChecker();
		double level = 0;
		short numChannels = meteringInfo.numchannels;
		for (int i = 0; i < numChannels; i++)
			level += (double)meteringInfo.rmslevel[i];
		level /= numChannels;

		if (FMODGMS_Util_ErrorChecker() == GMS_true)
			return level;
		else
			return GMS_error;
	}
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}


// Get number of tags in a sound
GMexport double FMODGMS_Snd_Get_NumTags(double index)
{
	int i = (int)round(index);
	int sndListSize = soundList.size();

	if (sndListSize > i && i >= 0)
	{
		int numTags;
		soundList[i]->getNumTags(&numTags, 0);

		errorMessage = "No errors.";
		return (double)numTags;
	}

	// index out of bounds
	else
	{
		errorMessage = "Index out of bounds.";
		return GMS_error;
	}
}

// Get a tag name for a particular sound
GMexport const char* FMODGMS_Snd_Get_TagName(double soundIndex, double tagIndex)
{
	int si = (int)round(soundIndex);
	int sndListSize = soundList.size();

	if (sndListSize > si && si >= 0)
	{
		int numTags;
		int ti = (int)round(tagIndex);

		soundList[si]->getNumTags(&numTags, 0);

		if (numTags > ti)
		{
			FMOD_TAG tag;
			soundList[si]->getTag(0, ti, &tag);

			return tag.name;
		}

		else
		{
			errorMessage = "Tag index out of bounds.";
			return errorMessage;
		}
	}

	// index out of bounds
	else
	{
		errorMessage = "Sound index out of bounds.";
		return errorMessage;
	}
}

// Get a tag's type from a given index
GMexport double FMODGMS_Snd_Get_TagTypeFromIndex(double soundIndex, double tagIndex)
{
	int si = (int)round(soundIndex);
	int sndListSize = soundList.size();

	if (sndListSize > si && si >= 0)
	{
		int numTags;
		int ti = (int)round(tagIndex);

		soundList[si]->getNumTags(&numTags, 0);

		if (numTags > ti)
		{
			FMOD_TAG tag;
			soundList[si]->getTag(0, ti, &tag);

			return (double)(int)tag.type;
		}

		else
		{
			errorMessage = "Tag index out of bounds.";
			return GMS_error;
		}
	}

	// index out of bounds
	else
	{
		errorMessage = "Sound index out of bounds.";
		return GMS_error;
	}
}

// Get a tag's data type from a given index
GMexport double FMODGMS_Snd_Get_TagDataTypeFromIndex(double soundIndex, double tagIndex)
{
	int si = (int)round(soundIndex);
	int sndListSize = soundList.size();

	if (sndListSize > si && si >= 0)
	{
		int numTags;
		int ti = (int)round(tagIndex);

		soundList[si]->getNumTags(&numTags, 0);

		if (numTags > ti)
		{
			FMOD_TAG tag;
			soundList[si]->getTag(0, ti, &tag);

			return (double)(int)tag.datatype;
		}

		else
		{
			errorMessage = "Tag index out of bounds.";
			return GMS_error;
		}
	}

	// index out of bounds
	else
	{
		errorMessage = "Sound index out of bounds.";
		return GMS_error;
	}
}

// Get a tag's numerical value (int, float) from a given index
GMexport double FMODGMS_Snd_Get_TagRealFromIndex(double soundIndex, double tagIndex)
{
	int si = (int)round(soundIndex);
	int sndListSize = soundList.size();

	if (sndListSize > si && si >= 0)
	{
		int numTags;
		int ti = (int)round(tagIndex);

		soundList[si]->getNumTags(&numTags, 0);

		if (numTags > ti)
		{
			FMOD_TAG tag;
			soundList[si]->getTag(0, ti, &tag);

			if (tag.datatype == FMOD_TAGDATATYPE_INT)
			{
				int *i = (int*)tag.data;
				double rt = (double)*i;
				return rt;
			}

			else if (tag.datatype == FMOD_TAGDATATYPE_FLOAT)
			{
				float *f = (float*)tag.data;
				return (double)*f;
			}

			else
			{
				errorMessage = "Tag is not a numerical value.";
				return GMS_error;
			}
		}

		else
		{
			errorMessage = "Tag index out of bounds.";
			return GMS_error;
		}
	}

	// index out of bounds
	else
	{
		errorMessage = "Sound index out of bounds.";
		return GMS_error;
	}
}

// Get a tag's string value from a given index
GMexport const char* FMODGMS_Snd_Get_TagStringFromIndex(double soundIndex, double tagIndex)
{
	int si = (int)round(soundIndex);
	int sndListSize = soundList.size();

	if (sndListSize > si && si >= 0)
	{
		int numTags;
		int ti = (int)round(tagIndex);

		soundList[si]->getNumTags(&numTags, 0);

		if (numTags > ti)
		{
			FMOD_TAG tag;
			soundList[si]->getTag(0, ti, &tag);

			if (tag.datatype >= FMOD_TAGDATATYPE_STRING && tag.datatype < FMOD_TAGDATATYPE_CDTOC)
			{
				// 8-bit string
				if (tag.datatype == FMOD_TAGDATATYPE_STRING || tag.datatype == FMOD_TAGDATATYPE_STRING_UTF8)
				{
					return (const char*)tag.data;
				}

				// 16-bit string
				else if (tag.datatype == FMOD_TAGDATATYPE_STRING_UTF16)
				{
					std::u16string u16str((char16_t*)tag.data + 1, tag.datalen / 2);
					u16ToASCII(u16str);
					return tagString.c_str();

					/*const char16_t* chr16str = u16str.c_str();
					tagString = u16Converter.to_bytes(chr16str);
					return tagString.c_str();*/
				}

				else if (tag.datatype == FMOD_TAGDATATYPE_STRING_UTF16BE)
				{
					std::u16string u16str((char16_t*)tag.data, tag.datalen / 2);
					u16ToASCII(u16str);
					return tagString.c_str();

					/*const char16_t* chr16str = u16str.c_str();
					tagString = u16Converter.to_bytes(chr16str);
					return tagString.c_str();*/
				}
			}


			else
			{
				errorMessage = "Tag is not a string.";
				return errorMessage;
			}
		}

		else
		{
			errorMessage = "Tag index out of bounds.";
			return errorMessage;
		}
	}

	// index out of bounds
	else
	{
		errorMessage = "Sound index out of bounds.";
		return errorMessage;
	}

	return "What?";
}

// Get a tag's type from a given name
GMexport double FMODGMS_Snd_Get_TagTypeFromName(double soundIndex, char* tagName)
{
	int si = (int)round(soundIndex);
	int sndListSize = soundList.size();

	if (sndListSize > si && si >= 0)
	{
		int numTags;
		FMOD_TAG tag;
		bool tagFound = false;

		soundList[si]->getNumTags(&numTags, 0);

		// iterate through tags and find the one that matches tagName
		for (int i = 0; i < numTags; i++)
		{
			soundList[si]->getTag(0, i, &tag);

			if (strcmp(tag.name, tagName) == 0)
			{
				tagFound = true;
				break;
			}
		}

		if (tagFound)
		{
			return (double)(int)tag.type;
		}

		else
		{
			errorMessage = "Tag not found.";
			return GMS_error;
		}
	}

	// index out of bounds
	else
	{
		errorMessage = "Sound index out of bounds.";
		return GMS_error;
	}

	return GMS_error;
}

// Get a tag's data type from a given name
GMexport double FMODGMS_Snd_Get_TagDataTypeFromName(double soundIndex, char* tagName)
{
	int si = (int)round(soundIndex);
	int sndListSize = soundList.size();

	if (sndListSize > si && si >= 0)
	{
		int numTags;
		FMOD_TAG tag;
		bool tagFound = false;

		soundList[si]->getNumTags(&numTags, 0);

		// iterate through tags and find the one that matches tagName
		for (int i = 0; i < numTags; i++)
		{
			soundList[si]->getTag(0, i, &tag);

			if (strcmp(tag.name, tagName) == 0)
			{
				tagFound = true;
				break;
			}
		}

		if (tagFound)
		{
			return (double)(int)tag.datatype;
		}

		else
		{
			errorMessage = "Tag not found.";
			return GMS_error;
		}
	}

	// index out of bounds
	else
	{
		errorMessage = "Sound index out of bounds.";
		return GMS_error;
	}
}

// Get a tag's numerical value (int, float) from a given name
GMexport double FMODGMS_Snd_Get_TagRealFromName(double soundIndex, char* tagName)
{
	int si = (int)round(soundIndex);
	int sndListSize = soundList.size();

	if (sndListSize > si && si >= 0)
	{
		int numTags;
		FMOD_TAG tag;
		bool tagFound = false;

		soundList[si]->getNumTags(&numTags, 0);

		// iterate through tags and find the one that matches tagName
		for (int i = 0; i < numTags; i++)
		{
			soundList[si]->getTag(0, i, &tag);

			if (strcmp(tag.name, tagName) == 0)
			{
				tagFound = true;
				break;
			}
		}

		if (tagFound)
		{
			if (tag.datatype == FMOD_TAGDATATYPE_INT)
			{
				int *i = (int*)tag.data;
				double rt = (double)*i;
				return rt;
			}

			else if (tag.datatype == FMOD_TAGDATATYPE_FLOAT)
			{
				float *f = (float*)tag.data;
				return (double)*f;
			}

			else
			{
				errorMessage = "Tag is not a numerical value.";
				return GMS_error;
			}
		}

		else
		{
			errorMessage = "Tag not found.";
			return GMS_error;
		}
	}

	// index out of bounds
	else
	{
		errorMessage = "Sound index out of bounds.";
		return GMS_error;
	}
}

// Get a tag's string value from a given name
GMexport const char* FMODGMS_Snd_Get_TagStringFromName(double soundIndex, char* tagName)
{
	int si = (int)round(soundIndex);
	int sndListSize = soundList.size();

	if (sndListSize > si && si >= 0)
	{
		int numTags;
		FMOD_TAG tag;
		bool tagFound = false;

		soundList[si]->getNumTags(&numTags, 0);

		// iterate through tags and find the one that matches tagName
		for (int i = 0; i < numTags; i++)
		{
			soundList[si]->getTag(0, i, &tag);

			if (strcmp(tag.name, tagName) == 0)
			{
				tagFound = true;
				break;
			}
		}

		if (tagFound)
		{
			if (tag.datatype >= FMOD_TAGDATATYPE_STRING && tag.datatype < FMOD_TAGDATATYPE_CDTOC)
			{
				if (tag.datatype >= FMOD_TAGDATATYPE_STRING && tag.datatype < FMOD_TAGDATATYPE_CDTOC)
				{
					// 8-bit string
					if (tag.datatype == FMOD_TAGDATATYPE_STRING || tag.datatype == FMOD_TAGDATATYPE_STRING_UTF8)
					{
						return (const char*)tag.data;
					}

					// 16-bit string
					else if (tag.datatype == FMOD_TAGDATATYPE_STRING_UTF16)
					{
						std::u16string u16str((char16_t*)tag.data + 1, tag.datalen / 2);
						u16ToASCII(u16str);
						return tagString.c_str();

						/*const char16_t* chr16str = u16str.c_str();
						tagString = u16Converter.to_bytes(chr16str);
						return tagString.c_str();*/


					}

					else if (tag.datatype == FMOD_TAGDATATYPE_STRING_UTF16BE)
					{
						std::u16string u16str((char16_t*)tag.data, tag.datalen / 2);
						u16ToASCII(u16str);
						return tagString.c_str();

						/*const char16_t* chr16str = u16str.c_str();
						tagString = u16Converter.to_bytes(chr16str);
						return tagString.c_str();*/
					}
				}
			}

			else
			{
				errorMessage = "Tag is not a string.";
				return errorMessage;
			}
		}

		else
		{
			errorMessage = "Tag not found.";
			return errorMessage;
		}
	}

	// index out of bounds
	else
	{
		errorMessage = "Sound index out of bounds.";
		return errorMessage;
	}

	return "What?";
}

// Returns the type of sound
GMexport double FMODGMS_Snd_Get_Type(double index)
{
	/*
	Types

	0 - Unknown
	1 - AIFF
	2 - ASF
	3 - DLS
	4 - FLAC
	5 - FSB
	6 - IT
	7 - MIDI
	8 - MOD
	9 - MPEG
	10 - OGG Vorbis
	11 - Playlist
	12 - Raw
	13 - S3M
	14 - User
	15 - WAV
	16 - XM
	17 - XMA
	18 - Audio Queue
	19 - AT9
	20 - Vorbis
	21 - Media Foundation
	22 - Media Codec
	23 - FADPCM
	24 - Max
	*/

	int i = (int)round(index);
	int sndListSize = soundList.size();

	if (sndListSize > i && i >= 0)
	{
		FMOD_SOUND_TYPE type;
		soundList[i]->getFormat(&type, 0, 0, 0);

		return (double)(int)type;
	}

	// index out of bounds
	else
	{
		errorMessage = "Sound index out of bounds.";
		return GMS_error;
	}

	return -999;
}

#pragma endregion

#pragma region Effect Functions

//Creates a DSP effect. For types see enum FMOD_DSP_TYPE in fmod_dsp_effects.h
GMexport double FMODGMS_Effect_Create(double t)
{
	int type = (int)round(t);
	if ((type < 0) || (type >= FMOD_DSP_TYPE_MAX))
	{
		errorMessage = "Invalid effect type";
		return GMS_error;
	}

	FMOD::DSP* effect = NULL;
	if (sys->createDSPByType((FMOD_DSP_TYPE)type, &effect) == FMOD_OK)
	{
		effectList.push_back(effect);
		return effectList.size() - 1;
	}

	errorMessage = "FMOD could not create effect.";
	return GMS_error;
}

//Sets a parameter a of effect e to value v. For parameters of different effects, see fmod_dsp_effects.h
GMexport double FMODGMS_Effect_Set_Parameter(double e, double p, double v)
{
	int effectIndex = (int)round(e);
	if ((effectIndex < 0) || (effectIndex >= (int)effectList.size()))
	{
		errorMessage = "Invalid effect index";
		return GMS_error;
	}
	FMOD::DSP* effect = effectList[effectIndex];

	int param = (int)round(p);
	FMOD_DSP_PARAMETER_DESC* desc = NULL;
	if (effect->getParameterInfo(param, &desc) != FMOD_OK)
	{
		errorMessage = "Could not get effect parameter info, probably invalid param index";
		return GMS_error;
	}

	if (desc->type == FMOD_DSP_PARAMETER_TYPE_FLOAT)
	{
		if (effect->setParameterFloat(param, (float)v) == FMOD_OK)
			return FMODGMS_Util_ErrorChecker();
	}
	else if (desc->type == FMOD_DSP_PARAMETER_TYPE_INT)
	{
		if (effect->setParameterInt(param, (int)round(v)) == FMOD_OK)
			return FMODGMS_Util_ErrorChecker();
	}
	else if (desc->type == FMOD_DSP_PARAMETER_TYPE_BOOL)
	{
		if (effect->setParameterBool(param, (bool)(v > 0.5)) == FMOD_OK)
			return FMODGMS_Util_ErrorChecker();
	}
	else
	{
		errorMessage = "Unsupported effect parameter type";
		return GMS_error;
	}
	
	errorMessage = "Could not set effect parameter";
	return GMS_error;
}

GMexport double FMODGMS_Effect_Get_Parameter(double e, double p)
{
	int effectIndex = (int)round(e);
	if ((effectIndex < 0) || (effectIndex >= (int)effectList.size()))
	{
		errorMessage = "Invalid effect index";
		return GMS_error;
	}
	FMOD::DSP* effect = effectList[effectIndex];

	int param = (int)round(p);
	FMOD_DSP_PARAMETER_DESC* desc = NULL;
	if (effect->getParameterInfo(param, &desc) != FMOD_OK)
	{
		errorMessage = "Could not get effect parameter info, probably invalid param index";
		return GMS_error;
	}

	if (desc->type == FMOD_DSP_PARAMETER_TYPE_FLOAT)
	{
		float value;
		if (effect->getParameterFloat(param, &value, NULL, 0) == FMOD_OK)
			return (double)value;
	}
	else if (desc->type == FMOD_DSP_PARAMETER_TYPE_INT)
	{
		int value;
		if (effect->getParameterInt(param, &value, NULL, 0) == FMOD_OK)
			return (double)value;
	}
	else if (desc->type == FMOD_DSP_PARAMETER_TYPE_BOOL)
	{
		bool value;
		if (effect->getParameterBool(param, &value, NULL, 0) == FMOD_OK)
			return (double)value;
	}
	else
	{
		errorMessage = "Unsupported effect parameter type";
		return GMS_error;
	}

	errorMessage = "Could not get effect parameter";
	return GMS_error;
}

//Frees an effect from the memory
GMexport double FMODGMS_Effect_Remove(double e)
{
	int effectIndex = (int)round(e);
	if ((effectIndex < 0) || (effectIndex >= (int)effectList.size()))
	{
		errorMessage = "Invalid effect index";
		return GMS_error;
	}
	FMOD::DSP* effect = effectList[effectIndex];
	if (effect->release() == FMOD_OK)
	{
		effectList[effectIndex] = NULL;
		return FMODGMS_Util_ErrorChecker();
	}

	errorMessage = "Could not remove effect, is it still attached to some audio?";
	return GMS_error;
}

//Frees all existing effects
GMexport double FMODGMS_Effect_RemoveAll()
{
	bool success = true;
	for (int i = 0; i < (int)effectList.size(); i++)
	{
		if (effectList[i] != NULL)
		{
			if (FMODGMS_Effect_Remove(i) != FMOD_OK)
				success = false;
		}
	}
	if (success == false)
	{
		errorMessage = "Failed to remove some effects, are they still attached to some audio?";
		return GMS_error;
	}

	effectList.clear();
	return FMODGMS_Util_ErrorChecker();
}

#pragma endregion

#pragma region Utility Functions

// Relays FMOD error message to GM:S
GMexport const char* FMODGMS_Util_GetErrorMessage()
{
	return errorMessage;
}

// Returns a string so that GM:S can check if FMODGMS has laoded properly or not
GMexport const char* FMODGMS_Util_Handshake()
{
	return "FMODGMS is working.";
}

// Simple wrapper for KissFFT (real-optimized). Can be used for applying FFT on an offline chunk of samples
// buffers must be 4 byte aligned GM buffers, with raw samples of type float32
// bufferOut receives one fourth of the input buffer size (real values up to max frequency, half nyquist))
// numPoints must be EVEN and 4096 or less
// If not error, return value is the RMS loudness level of the sample chunk
GMexport double FMODGMS_Util_FFT(float* bufferIn, float* bufferOut, double numPoints, double normalize)
{
	int _numPoints = (int)(numPoints + 0.5);
	if (_numPoints <= 0 || (_numPoints & 1) == 1 || _numPoints > 4096)
	{
		errorMessage = "numPoints must be even and positive.";
		return GMS_error;
	}

	//apply hann window (and measure loudness)
	double loudness = 0;
	float bufferInTemp[4096];
	for (int i = 0; i < _numPoints; i++)
	{
		bufferInTemp[i] = bufferIn[i]*powf(sinf((float)3.141592*i/(_numPoints-1)),2);
		loudness += pow(bufferInTemp[i], 2);
	}

	//do fft
	kiss_fftr_cfg cfg = kiss_fftr_alloc(_numPoints, 0, NULL, NULL);
	if (cfg == NULL)
	{
		errorMessage = "Failed to allocate memory.";
		return GMS_error;
	}
	int numPointsQuarter = (int)(_numPoints / 4. + 0.5);
	kiss_fft_cpx bufferOutTemp[1024];
	kiss_fftr(cfg, bufferInTemp, bufferOutTemp);
	for (int i = 0; i < numPointsQuarter; i++)
	{
		bufferOut[i] = (sqrt(bufferOutTemp[i].i*bufferOutTemp[i].i + bufferOutTemp[i].r*bufferOutTemp[i].r)/_numPoints);
	}
	
	//optional normalizing
	if (normalize > 0.5)
	{
		float normalizeFactor = 1;
		for (int i = 0; i < numPointsQuarter; i++)
		{
			if (bufferOut[i] > normalizeFactor)
				normalizeFactor = bufferOut[i];
		}
		for (int i = 0; i < numPointsQuarter; i++)
		{
			bufferOut[i] /= normalizeFactor;
		}
	}
	
	kiss_fftr_free(cfg);

	return sqrt(loudness/_numPoints);
}

// Helper function: converts FMOD Results to error message strings and returns GMS_true (1.0) if 
// the Result is FMOD_OK and GMS_error (-1) otherwise
double FMODGMS_Util_ErrorChecker()
{
	//errorMessage = _strdup(FMOD_ErrorString(result)); // convert const char* to char * by duplication
	errorMessage = FMOD_ErrorString(result);

	if (result != FMOD_OK)
	{
		printf("FMOD error! (%d) %s\n", result, FMOD_ErrorString(result));
		return GMS_error;
	}

	else
		return GMS_true;
}

// Helper function: converts UTF-16 characters in a string to ASCII if possible
void u16ToASCII(std::u16string const &s)
{
	std::string out;

	std::transform(begin(s), end(s), back_inserter(out), [](char16_t c)
	{
		if (c < 255) return (char)c;
		else return '?';
	});

	tagString = out;
}

#pragma endregion

#endif //FMODGMS_CPP
