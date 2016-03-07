# FMODGMS
FMOD Studio low-level API wrapper for GameMaker:Studio's Windows and Linux modules

What's inside
-------------

- __FMODGMS.gmez__ - FMODGMS GameMaker: Studio extension
- __FMODGMS_Test_win.zip__ - FMODGMS test program for Windows
- __FMODGMS_test_linux.tar.gz__ - FMODGMS test program for Linux
- __src__ - library and test program source code
 - _FMODGMS Test.gmx_ - GameMaker: Studio project for test program
 - _linux_ - FMODGMS source for Linux
 - _vc/FMODGMS_ - FMODGMS source for VS 2013

Latest changes
---------

v.0.4.1
-------

__FMODGMS libary__

- Improved FMODGMS_Sys_Close
- Minor Fixes

__FMODGMS Test Program__

- Added MIDI demo to Windows build. Demo would crash in Linux if no MIDI synth were found on the system.

v.0.4
-------

__FMODGMS libary__

- Added the following functions:
 - FMODGMS_Sys_Update
 - FMODGMS_Chan_Set_Position
 - FMODGMS_Chan_Set_Volume
 - FMODGMS_Chan_Set_Frequency
 - FMODGMS_Chan_Set_Pitch
 - FMODGMS_Chan_Set_ModOrder
 - FMODGMS_Chan_Set_ModRow
 - FMODGMS_Chan_Get_Volume
 - FMODGMS_Chan_Get_Frequency
 - FMODGMS_Chan_Get_Pitch
- Some minor optimizations

__FMODGMS Test Program__

- Added functions to manipulate volume, frequency and pitch
- Added MP3 demo with custom loop points. (Represents a more typical use case than the OGG demo.)
