FMODGMS_Chan_Remove_Effect(0,effect);
FMODGMS_Effect_RemoveAll();

prevEffect = effectIndex
do
effectIndex = choose(   FMODGMS_EFFECT_CHORUS,
                        FMODGMS_EFFECT_DISTORTION,
                        FMODGMS_EFFECT_ECHO,
                        FMODGMS_EFFECT_FLANGE,
                        FMODGMS_EFFECT_HIGHPASS,
                        FMODGMS_EFFECT_LOWPASS,
                        FMODGMS_EFFECT_REVERB,
                        FMODGMS_EFFECT_TREMOLO);
until (prevEffect != effectIndex);

                        
effect = FMODGMS_Effect_Create(effectIndex);
//FMODGMS_Effect_Set_Parameter(effect, 0, 0);
FMODGMS_Chan_Add_Effect(0,effect,0);

