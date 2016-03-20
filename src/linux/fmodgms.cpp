/*-------------------------------------------------
//
//  FMODGMS v.0.5.0
// By: M.S.T.O.P.
//
//  Wrapper library that allows communication between
//  the FMOD low level API and GameMaker: Studio.
//
--------------------------------------------------*/

#ifndef FMODGMS_CPP
#define FMODGMS_CPP

//#include <iostream>
//#include <string>
#include <vector>
#include <stdio.h>
#include <string.h>
#include "fmod.hpp"
#include "fmod_errors.h"
#include "fmodgms.hpp"

#pragma region Global variables

// System Stuff
FMOD::System *sys = NULL;
std::vector <FMOD::Channel*> channelList;
std::vector <FMOD::Sound*> soundList;
FMOD::ChannelGroup *masterGroup;
FMOD_RESULT result;
const char* errorMessage;

// Spectrum DSP Stuff
FMOD::DSP *fftdsp;
float domFreq;
int playbackRate;
int windowSize = 128;
int nyquist = windowSize / 2;
std::vector <float> binValues(nyquist);
FMOD_DSP_PARAMETER_FFT *fftParams;

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
	int mc = (int)maxChan;

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

	playbackRate = (int)sampleRate;
	FMOD_SPEAKERMODE sm = (FMOD_SPEAKERMODE)(int)speakermode;

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
	windowSize = (int)size;
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
	int i = (int)index;
	int sndListSize = soundList.size();

	if (sndListSize > i)
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
	int i = (int)index;
	int c = (int)channel;
	//bool *n = false;
	int chanListSize = channelList.size();

	// check to see if channel is already playing. if so, stop it.
	if (chanListSize > c)
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
	int i = (int)index;
	int m = (int)mode;
	int t = (int)times;

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

// Sets the loop points for a particular sound.
GMexport double FMODGMS_Snd_Set_LoopPoints(double index, double start, double end)
{
	int i = (int)index;
	int s = (int)start;
	int e = (int)end;

	result = soundList[i]->setLoopPoints(s, FMOD_TIMEUNIT_PCM, e, FMOD_TIMEUNIT_PCM);

	return FMODGMS_Util_ErrorChecker();
}

// Gets the loop points for a particular sound.
GMexport double FMODGMS_Snd_Get_LoopPoints(double index, double which)
{
	// 0 = start;
	// 1 = end;

	int i = (int)index;

	unsigned int start = 0;
	unsigned int end = 0;

	soundList[i]->getLoopPoints(&start, FMOD_TIMEUNIT_PCM, &end, FMOD_TIMEUNIT_PCM);

	if (which < 1.0)
		return (double)start;
	else
		return (double)end;
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
	int c = (int)channel;
	int chanListSize = channelList.size();

	if (chanListSize > c)
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
	int c = (int)channel;
	int chanListSize = channelList.size();

	if (chanListSize > c)
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
	int c = (int)channel;
	int chanListSize = channelList.size();

	if (chanListSize > c)
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
	int c = (int)channel;
	int chanListSize = channelList.size();

	if (chanListSize > c)
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
	int c = (int)channel;

	unsigned int p;
	if (pos < 0)
		p = 0;
	else
		p = (unsigned int)pos;

	int chanListSize = channelList.size();

	if (chanListSize > c)
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
	int c = (int)channel;
	float v = (float)vol;
	int chanListSize = channelList.size();

	if (chanListSize > c)
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
	int c = (int)channel;
	float f = (float)freq;
	int chanListSize = channelList.size();

	if (chanListSize > c)
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
	int c = (int)channel;
	float p = (float)pitch;
	int chanListSize = channelList.size();

	if (chanListSize > c)
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

	if (chanListSize > c)
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
	int c = (int)channel;
	int chanListSize = channelList.size();

	if (chanListSize > c)
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

// Returns the current position of the sound being played on the channel
GMexport double FMODGMS_Chan_Get_Position(double channel)
{
	int c = (int)channel;
	int chanListSize = channelList.size();

	if (chanListSize > c)
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
	int c = (int)channel;
	int chanListSize = channelList.size();

	if (chanListSize > c)
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
	int c = (int)channel;
	int chanListSize = channelList.size();

	if (chanListSize > c)
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
	int c = (int)channel;
	int chanListSize = channelList.size();

	if (chanListSize > c)
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
	int c = (int)channel;
	int chanListSize = channelList.size();

	if (chanListSize > c)
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
	int c = (int)channel;
	int chanListSize = channelList.size();

	if (chanListSize > c)
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
	int c = (int)channel;
	int chanListSize = channelList.size();

	if (chanListSize > c)
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

// Get number of tags in a sound
GMexport double FMODGMS_Snd_Get_NumTags(double index)
{
	int i = (int)index;
	int sndListSize = soundList.size();

	if (sndListSize > i)
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
	int si = (int)soundIndex;
	int sndListSize = soundList.size();

	if (sndListSize > si)
	{
		int numTags;
		int ti = (int)tagIndex;

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

// Returns the type of sound
GMexport const char* FMODGMS_Snd_Get_Type(double index)
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

	int i = (int)index;
	int sndListSize = soundList.size();

	if (sndListSize > i)
	{
		FMOD_SOUND_TYPE type;
		soundList[i]->getFormat(&type, 0, 0, 0);

		switch ((int)type)
		{
		case 0:
			return "Unknown";
			break;

		case 1:
			return "AIFF";
			break;

		case 2:
			return "ASF - Microsoft Advanced Systems Format";
			break;

		case 3:
			return "DLS - SoundFont / Dowloadable Sound Bank";
			break;

		case 4:
			return "FLAC lossless codec";
			break;

		case 5:
			return "FMOD Sample Bank";
			break;

		case 6:
			return "IT - Impluse Tracker module";
			break;

		case 7:
			return "MIDI Sequence";
			break;

		case 8:
			return "MOD - Protracker / Fasttracker module";
			break;

		case 9:
			return "MP2/MP3 - MPEG";
			break;

		case 10:
			return "OGG - Ogg Vorbis";
			break;

		case 11:
			return "Playlist - ASX/PLS/M3U/WAX";
			break;

		case 12:
			return "RAW - Raw PCM data";
			break;

		case 13:
			return "S3M - ScreamTracker 3 module";
			break;

		case 14:
			return "User-created";
			break;

		case 15:
			return "WAV - Microsoft Wave";
			break;

		case 16:
			return "XM - FastTracker 2 module";
			break;

		case 17:
			return "Xbox 360 XMA";
			break;

		case 18:
			return "iPhone hardware decoder";
			break;

		case 19:
			return "PS4 / PSVita ATRAC 9";
			break;

		case 20:
			return "Vorbis";
			break;

		case 21:
			return "Windows Store Application built-in system codecs";
			break;

		case 22:
			return "Android MediaCodec";
			break;

		case 23:
			return "FMOD Adaptive Differential PCM";
			break;

		case 24:
			return "Max";
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

#pragma endregion

#endif //FMODGMS_CPP
