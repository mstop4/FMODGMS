/*--------------------------------------------------------
//  fmodgms.cpp
//
//  FMODGMS v.0.7.1
//  By: M.S.T.O.P.
//
//  GML bindings to the FMOD Studio low-level API for
//  GameMaker:Studio.
//
//  FMOD Studio version: 1.08.15
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

// Spectrum DSP Stuff
FMOD::DSP *fftdsp;
float domFreq;
int playbackRate;
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
	if (result != FMOD_OK)
		return FMODGMS_Util_ErrorChecker();

	// Init Spectrum DSP
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

// Updates the FMOD system  and spectrum DSP
GMexport double FMODGMS_Sys_Update()
{
	result = sys->update();
	if (result != FMOD_OK)
		return FMODGMS_Util_ErrorChecker();
	
	//Check to see if anything is playing before gathering spectrum data
	bool playState = false;
	masterGroup->isPlaying(&playState);

	if (playState)
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
	result = masterGroup->removeDSP(fftdsp);
	if (result != FMOD_OK)
		return FMODGMS_Util_ErrorChecker();

	result = fftdsp->release();
	if (result != FMOD_OK)
		return FMODGMS_Util_ErrorChecker();

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

// Gets the playback sample rate
GMexport double FMODGMS_Sys_Get_SampleRate()
{
	return (double)playbackRate;
}

// Return total CPU usage
GMexport double FMODGMS_Sys_Get_CPUUsage()
{
	float totalCPU;
	sys->getCPUUsage(0, 0, 0, 0, &totalCPU);

	return totalCPU;
}

// Returns the highest index in soundList (number of sounds - 1)
GMexport double FMODGMS_Sys_Get_MaxSoundIndex()
{
	return soundList.size() - 1.0f;
}

// Returns the highest index in channelList (number of channels - 1)
GMexport double FMODGMS_Sys_Get_MaxChannelIndex()
{
	return channelList.size() - 1.0f;
}

#pragma endregion

#pragma region FFT (Spectrum) Functions

// Sets the FFT window size (winodw size = 2 * nyquist = 2 * number of bins) 
// FMODGMS_FFT_Get_NumBins should be called after this function to ensure the game know what the new number of bins are
// NOTE: Doesn't work yet
GMexport double FMODGMS_FFT_Set_WindowSize(double size)
{
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
	result = fftdsp->getParameterFloat(FMOD_DSP_FFT_DOMINANT_FREQ, &domFreq, 0, 0);
	if (result != FMOD_OK)
		return FMODGMS_Util_ErrorChecker();
	else
		return domFreq;
}

// Returns the value of a certain bin in the spectrum
GMexport double FMODGMS_FFT_Get_BinValue(double index)
{
	unsigned int i = (unsigned int)index;

	if (i < binValues.size())
		return binValues[i];
	else
		return GMS_error;
}

// Returns the number of nims in the spectrum data (= nyquist = windowSize / 2)
GMexport double FMODGMS_FFT_Get_NumBins()
{
	return (double)nyquist;
}

//Normalizes the current spectrum data, use before getting if desirable
GMexport double FMODGMS_FFT_Normalize()
{
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
	result = sys->createSound(filename, FMOD_DEFAULT, 0, &sound);

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
		return -1;
}

// Loads a sound toa stream and indexes it in soundList
GMexport double FMODGMS_Snd_LoadStream(char* filename)
{
	FMOD::Sound *sound;
	result = sys->createStream(filename, FMOD_DEFAULT, 0, &sound);

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
		return -1;
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
			(double)(int)tag.type;
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
	int value = (int)round(v);
	FMOD_DSP_PARAMETER_DESC* desc = NULL;
	if (effect->getParameterInfo(param, &desc) != FMOD_OK)
	{
		errorMessage = "Could not get effect parameter info, probably invalid param index";
		return GMS_error;
	}

	if (desc->type == FMOD_DSP_PARAMETER_TYPE_FLOAT)
	{
		if (effect->setParameterFloat(param, (float)value) == FMOD_OK)
			return FMODGMS_Util_ErrorChecker();
	}
	else if (desc->type == FMOD_DSP_PARAMETER_TYPE_INT)
	{
		if (effect->setParameterInt(param, (int)round(value)) == FMOD_OK)
			return FMODGMS_Util_ErrorChecker();
	}
	else if (desc->type == FMOD_DSP_PARAMETER_TYPE_BOOL)
	{
		if (effect->setParameterBool(param, (bool)(value > 0.5)) == FMOD_OK)
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
