/// @description FMODGMS_Util_SecondsToSamples(seconds, samplingRate)
/// @param seconds
/// @param  samplingRate

// Converts time measured in seconds to samples. Can be used in conjuction with FMODGMS_Snd_Set_LoopPoints
// for precise loop point control.

{
    return argument[0] * argument[1];
}
