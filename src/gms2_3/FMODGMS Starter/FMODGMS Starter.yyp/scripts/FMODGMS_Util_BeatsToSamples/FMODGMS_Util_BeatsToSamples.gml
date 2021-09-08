/// @description FMODGMS_Util_BeatsToSamples(beats, bpm, samplingRate)
/// @param beats
/// @param  bpm
/// @param  samplingRate
function FMODGMS_Util_BeatsToSamples(beats, bpm, samplingRate) {

	// Converts time measured in beats to samples, assuming a constant BPM. Can be used in conjuction with FMODGMS_Snd_Set_LoopPoints
	// for precise loop point control.

	{
	    return samplingRate * beats / bpm * 60;
	}



}
