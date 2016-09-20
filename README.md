# FMODGMS
A ***GameMaker: Studio* extension** that provides **GML bindings to the [FMOD](http://www.fmod.org) Studio low-level API.** Compatible with **Windows**, **Mac** (coming soon), and **Linux** games.

**Stable:** *0.6.1* - FMOD Studio 1.08.07 - Windows, Linux  
**Beta:** *0.7.0* - FMOD Studio 1.08.11 - Windows, Linux

Features
--------

- Load and play a wide variety of audio formats not natively supported by *GameMaker:Studio* (e.g. MP3, MIDI, MOD, S3M, XM, IT, etc.).
- Add custom loop points to sounds. This allows, for example, a music track to have an intro section that can seamlessly transition into an infinitely looping main section without having to break them up into two separate files.
- Dynamically change to volume, playback frequency and relative pitch of a sound.
- Analyze an audio stream using Fast Fourier Transform (FFT) and obtain its spectrum data.
- Extract tag information from audio files (e.g. ID3 tags from MP3s and Vorbis tags from OGGs).

What's inside
-------------

- __FMODGMS.gmez__ - FMODGMS GameMaker: Studio extension
- __FMODGMS_Test_win.zip__ - FMODGMS demo program for Windows
- __FMODGMS_test_linux.tar.gz__ - FMODGMS demo program for Linux
- __src__ - library and test program source code
 - _FMODGMS Test.gmx_ - GameMaker: Studio project for test program
 - _linux_ - FMODGMS source for Linux
 - _vc/FMODGMS_ - FMODGMS source for VS 2013

Possible Features in the Future
--------

- Mac support.
- More options for FFT and spectrum data functionality.
- More MIDI support.
- Android support.

For a list of changes and development history, [click here](../../wiki/Changelog).
