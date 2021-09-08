// The colours!
{
    FMODGMS_Sys_Update();
    hue_shift = 0;
    hue = (hue + 1) mod 256;
    
    // normalize spectrum
    if (normalize_spectrum)
        FMODGMS_FFT_Normalize();
    
    // update spectrum visualizer values
    for (var i=0; i<numBins; i++)
    {
        /*var bin = clamp(FMODGMS_FFT_Get_BinValue(i),0,1);
        avgBin[i] = avgBin[i] * peakDamping + bin * (1-peakDamping);*/
        
        avgBin[i] = clamp(FMODGMS_FFT_Get_BinValue(i),0,1);
    }  
}

/* */
/*  */
