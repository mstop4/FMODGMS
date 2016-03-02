# FMODGMS
FMOD Studio low-level API wrapper for GameMaker:Studio's Windows and Linux modules

Lastest changes
---------

v.0.3.2
-------

- Built with FMOD Studio 1.07.07
- Fixed a bug where attempting to stop or remove a channel before it was first used would cause a crash.
- Added functions: FMODGMS_Chan_PauseChannel and FMODGMS_Chan_ResumeChannel.
- Changed all parameters named "index" to "channel" in Chan functions for consistency.
