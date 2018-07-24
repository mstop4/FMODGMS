///FMODGMS_Util_SamplesToBeats(samples, bpm, samplingRate)

// Converts time measured in samples to beats, assuming a constant BPM.

{
    return argument[0] / argument[2] * argument[1] / 60;
}
