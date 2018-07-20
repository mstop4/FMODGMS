/// @description FMODGMS_Util_BeatsToSamples(beats, bpm, samplingRate)
/// @param beats
/// @param  bpm
/// @param  samplingRate

// Converts time measured in beats to samples, assuming a constant BPM. Can be used in conjuction with FMODGMS_Snd_Set_LoopPoints
// for precise loop point control.

{
    return argument[2] * argument[0] / argument[1] * 60;
}
