///FMODGMS_Util_SecondsToSamples(seconds, samplingRate)
function FMODGMS_Util_SecondsToSamples(seconds, samplingRate) {

	// Converts time measured in seconds to samples. Can be used in conjuction with FMODGMS_Snd_Set_LoopPoints
	// for precise loop point control.

	{
	    return seconds * samplingRate;
	}



}
