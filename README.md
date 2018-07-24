# FMODGMS

<p align="center">
    <img src="https://github.com/mstop4/FMODGMS/blob/master/img/fmodgms2.PNG" width=75%>
    <img src="https://github.com/mstop4/FMODGMS/blob/master/img/fmodgms%20ubuntu.png" width=75%>
</p>

A ***GameMaker: Studio* and *GameMaker Studio 2* extension** that provides **GML bindings to the [FMOD](http://www.fmod.org) Studio low-level API.** Can be use in **Windows**, **macOS**, and **Linux** games.

---

## **Status**

### **Latest - [0.10.0](https://github.com/mstop4/FMODGMS/tree/v0100)**
* *Platform coverage:*

|              | Windows | macOS | Ubuntu |
| ------------ | ------- |------ | ------ |
<<<<<<< HEAD
| GM:S 1.4 VM  |✔️      |⚠️<sup>1</sup>    | ✔️     |
| GM:S 1.4 YYC |✔️      |🚧     | ✔️     |
| GMS 2.1 VM   |✔️      |⚠️<sup>1</sup>    | ✔️     |
=======
| GM:S 1.4 VM  |✔️      |🚧     | ✔️     |
| GM:S 1.4 YYC |✔️      |🚧     | ✔️     |
| GMS 2.1 VM   |✔️      |🚧     | ✔️     |
>>>>>>> 2e5ca99ebfd8ea291e0384e55770a707c415b3e2
| GMS 2.1 YYC |✔️      |✔️     | ✔️     |

<sub>1. Works with "Create Executable" only, not "Run" or "Debug"

* *FMOD Studio API:* 1.10.07
* *GMS 2 Runtime:* v.2.1.4.218
* *GM:S Runtime:* v.1.4.1804

### **Stable - [0.9.1](https://github.com/mstop4/FMODGMS/releases/tag/v0.9.1)**
* *Platform coverage*:

|              | Windows | macOS | Ubuntu |
| ------------ | ------- |------ | ------ |
| GM:S 1.4 VM  |✔️      |❌     | ✔️     |
| GM:S 1.4 YYC |✔️      |❌     | ✔️     |
| GMS 2.1 VM   |✔️      |❌     | ✔️     |
| GMS 2.1 YYC |✔️      |❌     | ✔️     |

* *FMOD Studio API:* 1.10.07
* *GMS 2 Runtime:* v.2.1.4.218
* *GM:S Runtime:* v.1.4.1804

Features
--------

- Load and play a wide variety of audio formats not natively supported by *GameMaker:Studio* (e.g. MP3, MIDI, MOD, S3M, XM, IT, etc.).
- Play MIDI files using DLS1 sound banks.
- Add custom loop points to sounds. This allows, for example, a music track to have an intro section that can seamlessly transition into an infinitely looping main section without having to break them up into two separate files.
- Dynamically change to volume, playback frequency and relative pitch of a sound.
- Analyze an audio stream using Fast Fourier Transform (FFT) and obtain its spectrum data.
- Support for DSP effects such as flange, reverb and filters.
- Extract tag information from audio files (e.g. ID3 tags from MP3s and Vorbis tags from OGGs).
- Supports various audio output modes (e.g. ASIO, WASAPI, ALSA).

What's inside
-------------

- **FMODGMS_x64.gmez** - FMODGMS GameMaker: Studio extension for GMS 2.
- **FMODGMS_x86.gmez** - FMODGMS GameMaker: Studio extension for GM:S 1.4. Contains a 32-bit build of the Linux library for compatibility.
- **FMODGMS_Demo_win.zip** - FMODGMS player demo for Windows
- **FMODGMS_Demo_linux.tar.gz** - FMODGMS player demo for Linux
- **FMODGMS_Starter.yyz** - A minimal FMODGMS project for GMS 2.
- **FMODGMS_Starter.gmz** - A minimal FMODGMS project for GM:S 1.4.
- **src** - library, player demo, and unpackage starter project source code
  - *gms/FMODGMS Test.gmx* - GM:S 1.4 project for player demo
  - *gms/FMODGMS Starter.gmx* - GM:S 1.4 starter project
  - *gms2/FMODGMS Test* - GMS 2 project for player demo
  - *gms2/FMODGMS Starter* - GMS 2 starter project
  - *linux* - FMODGMS source for Linux
  - *xcode* - Xcode project for macOS. Shares code with Linux.
  - *vc/FMODGMS* - FMODGMS source for Windows as a Visual Studio project

Possible Features in the Future
--------

- More options for FFT and spectrum data functionality.
- Android support.

For a list of changes and development history, [click here](../../wiki/Changelog).

Contributors
---------

* [M.S.T.O.P. (mstop4)](https://github.com/mstop4)
* [Gitle Mikkelsen (Grix)](https://github.com/Grix)
* [rissole](https://github.com/rissole)
