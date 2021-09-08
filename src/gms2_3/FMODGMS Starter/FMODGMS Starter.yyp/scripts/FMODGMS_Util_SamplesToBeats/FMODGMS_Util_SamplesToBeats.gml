/// @description FMODGMS_Util_SamplesToBeats(samples, bpm, samplingRate)
/// @param samples
/// @param  bpm
/// @param  samplingRate
function FMODGMS_Util_SamplesToBeats(samples, bpm, samplingRate) {

	// Converts time measured in samples to beats, assuming a constant BPM.

	{
	    return samples / samplingRate * bpm / 60;
	}



}
