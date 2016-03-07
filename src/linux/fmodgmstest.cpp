#include <iostream>
#include <stdio.h>
#include "fmodgms.h"

double soundIndex;
double channelIndex;


int main()
{
	FMODGMS_Sys_Create();
	std::cout << "Creating system... " << FMODGMS_Util_GetErrorMessage() << std::endl;

	FMODGMS_Sys_Initialize(8.0f);
	std::cout << "Initializing system... " << FMODGMS_Util_GetErrorMessage() << std::endl;

	soundIndex = FMODGMS_Snd_LoadStream("flighty.wav");
	std::cout << "Loading sound " << soundIndex << " ... " << FMODGMS_Util_GetErrorMessage() << std::endl;

	FMODGMS_Snd_Set_LoopPoints(0, 211680, 10372320-1);
	std::cout << "Setting loop points... " << FMODGMS_Util_GetErrorMessage() << std::endl;

	FMODGMS_Snd_Set_LoopMode(0, 1, -1);
	std::cout << "Setting loop mode... " << FMODGMS_Util_GetErrorMessage() << std::endl;

	std::cout << FMODGMS_Snd_Get_LoopPoints(0, 1) << std::endl;

	channelIndex = FMODGMS_Chan_CreateChannel();
	std::cout << "Creating channel " << channelIndex << " ... " << FMODGMS_Util_GetErrorMessage() << std::endl;

	FMODGMS_Snd_PlaySound(soundIndex, 0);
	std::cout << "Playing sound... " << FMODGMS_Util_GetErrorMessage() << std::endl;

	getchar();

	FMODGMS_Chan_StopChannel(0);
	std::cout << "Stopping channel... " << FMODGMS_Util_GetErrorMessage() << std::endl;

	getchar();

getchar();

	FMODGMS_Snd_Unload(0);
	std::cout << "Unloading sound... " << FMODGMS_Util_GetErrorMessage() << std::endl;

	FMODGMS_Sys_Close();
	std::cout << "Closing system... " << FMODGMS_Util_GetErrorMessage() << std::endl;
	return 1;
}
