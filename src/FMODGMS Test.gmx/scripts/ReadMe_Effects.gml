/*
How to use effect parameters:
Below you'll find a link to fmod_dsp_effects.h. It contains definitions of the various DSP effects and parameters available
so that you don't have to look it up online. 
In case you don't know C: The FMODGMS_Effects_* functions take numbers, to find
the appropriate number, look at the enums below. The parameters are listed in order, starting from 0.
For example, let's look at the parameters for the ECHO effect:

typedef enum
{
    FMOD_DSP_ECHO_DELAY,       /* (Type:float) - Echo delay in ms.  10  to 5000.  Default = 500. 
    FMOD_DSP_ECHO_FEEDBACK,    /* (Type:float) - Echo decay per delay.  0 to 100.  100.0 = No decay, 0.0 = total decay (ie simple 1 line delay).  Default = 50.0. 
    FMOD_DSP_ECHO_DRYLEVEL,    /* (Type:float) - Original sound volume in dB.  -80.0 to 10.0.  Default = 0. 
    FMOD_DSP_ECHO_WETLEVEL     /* (Type:float) - Volume of echo signal to pass to output in dB.  -80.0 to 10.0.  Default = 0. 
} FMOD_DSP_ECHO;

The parameter for feedback is number two in the list (FMOD_DSP_ECHO_FEEDBACK), therefore its parameter
index is 1. (remember, number one is 0). As you can see afterwards it takes a value from 0 to 100.

As for effects themselves, they are listed in the very first enum below. But to make things easier,
the most common ones have GM macros, f.ex. FMODGMS_EFFECT_CHORUS

TODO: Add all the parameters as Game Maker macros instead? I can't be bothered


LINK: https://github.com/mstop4/FMODGMS/blob/master/src/vc/FMODGMS/FMODGMS/fmod_dsp_effects.h
*/

