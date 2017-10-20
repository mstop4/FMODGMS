{
    "id": "235efa4c-856d-4c2a-8958-a86521e68782",
    "modelName": "GMExtension",
    "mvc": "1.0",
    "name": "FMODGMS",
    "IncludedResources": [
        "Scripts\\FMODGMS\\FMODGMS_Util_BeatsToSamples",
        "Scripts\\FMODGMS\\FMODGMS_Util_SecondsToSamples",
        "Scripts\\FMODGMS\\FMODGMS_Util_SamplesToSeconds",
        "Scripts\\FMODGMS\\FMODGMS_Util_SamplesToBeats",
        "Scripts\\FMODGMS\\FMODGMS_Snd_TypeToString",
        "Scripts\\FMODGMS\\FMODGMS_Snd_TagDataTypeToString",
        "Scripts\\FMODGMS\\FMODGMS_Snd_TagTypeToString",
        "Scripts\\FMODGMS\\ReadMe_EffectParameters",
        "Scripts\\FMODGMS\\FMODGMS_Effect_TypeToString"
    ],
    "androidPermissions": [
        
    ],
    "androidProps": false,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": 70,
    "date": "2017-47-16 09:09:13",
    "description": "",
    "extensionName": "",
    "files": [
        {
            "id": "1dfd88d6-5c70-450f-a7ad-06944a8908ab",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                {
                    "id": "6e2e3ac6-185c-4fa5-968c-0bc42ecfc716",
                    "modelName": "GMProxyFile",
                    "mvc": "1.0",
                    "TargetMask": 1,
                    "proxyName": "libFMODGMS.dylib"
                },
                {
                    "id": "aa6069bc-1772-4654-8d2f-b245c8c4e627",
                    "modelName": "GMProxyFile",
                    "mvc": "1.0",
                    "TargetMask": 7,
                    "proxyName": "libfmodgms.so"
                }
            ],
            "constants": [
                {
                    "id": "04171199-ff44-47b5-b32d-3810ea121d8b",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_LOOPPOINT_START",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "1a467fa1-70f0-4da0-bcd8-ff349222f85a",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_LOOPPOINT_END",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "c783d199-64d9-4ece-9bd7-16f446045565",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_UNKNOWN",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "c2667e27-2a73-4471-8c63-1d49196530cd",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_AIFF",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "13162292-0fc0-4ffa-b766-66d67dcad228",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_ASF",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "b5f783a7-9116-4fde-a621-b20683caed97",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_DLS",
                    "hidden": false,
                    "value": "3"
                },
                {
                    "id": "1a23ff3b-c14d-44f7-891a-75d5728599c8",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_FLAC",
                    "hidden": false,
                    "value": "4"
                },
                {
                    "id": "2fe1b70b-04c3-4866-a03f-f60a906e592f",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_FSB",
                    "hidden": false,
                    "value": "5"
                },
                {
                    "id": "783b50ff-10e6-465f-a09d-59f4ea1af275",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_IT",
                    "hidden": false,
                    "value": "6"
                },
                {
                    "id": "4ac05ccb-d67e-4c74-ac05-bffb47b98b30",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_MIDI",
                    "hidden": false,
                    "value": "7"
                },
                {
                    "id": "85146fa7-c250-42f7-b4d6-4bf01395bf1e",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_MOD",
                    "hidden": false,
                    "value": "8"
                },
                {
                    "id": "5f7098e7-70ff-4c07-9a09-9908dda4edc6",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_MPEG",
                    "hidden": false,
                    "value": "9"
                },
                {
                    "id": "514a3edd-45cc-45d8-8870-ea31b3bbfa2e",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_OGGVORBIS",
                    "hidden": false,
                    "value": "10"
                },
                {
                    "id": "2337b75d-236d-4d34-8f79-ef5ae7189cc9",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_PLAYLIST",
                    "hidden": false,
                    "value": "11"
                },
                {
                    "id": "61c55901-ebae-40a4-a4d6-d50b5d268029",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_RAW",
                    "hidden": false,
                    "value": "12"
                },
                {
                    "id": "64653c05-c7f4-45b5-b678-86f260ca0ab3",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_S3M",
                    "hidden": false,
                    "value": "13"
                },
                {
                    "id": "7cf2e090-0afd-4d70-aac3-34fd9de9906d",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_USER",
                    "hidden": false,
                    "value": "14"
                },
                {
                    "id": "42078aef-77e3-43b0-9a6c-90ddfeacc71c",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_WAV",
                    "hidden": false,
                    "value": "15"
                },
                {
                    "id": "6dd1cb2b-c059-47ce-9adb-53e758a1bd56",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_XM",
                    "hidden": false,
                    "value": "16"
                },
                {
                    "id": "5bb5fc36-3f8a-4a41-a91d-a2c061f65335",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_XMA",
                    "hidden": false,
                    "value": "17"
                },
                {
                    "id": "c463e5fa-caaa-44f7-b4d1-128d07e3dece",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_AUDIOQUEUE",
                    "hidden": false,
                    "value": "18"
                },
                {
                    "id": "737337dc-5e8d-4bdd-a791-d3fffe28db07",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_AT9",
                    "hidden": false,
                    "value": "19"
                },
                {
                    "id": "54cfc52f-d4b4-4789-a6eb-cf6eb0503ca0",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_VORBIS",
                    "hidden": false,
                    "value": "20"
                },
                {
                    "id": "72891281-4656-46d4-8b11-565cee025b98",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_MEDIA_FOUNDATION",
                    "hidden": false,
                    "value": "21"
                },
                {
                    "id": "0e91268f-de8b-4589-9d5a-ab2f9fbc77d7",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_MEDIA_CODEC",
                    "hidden": false,
                    "value": "22"
                },
                {
                    "id": "377bb5d0-2d80-499b-a17d-90c1ef8e16de",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_FADPCM",
                    "hidden": false,
                    "value": "23"
                },
                {
                    "id": "8051f284-405c-4504-8439-0bae8fdf36a3",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_MAX",
                    "hidden": false,
                    "value": "24"
                },
                {
                    "id": "d43b20cc-a7b9-4b21-a9b9-6b0eb9b5931a",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGDATATYPE_BINARY",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "9231699e-3572-4817-987d-71788c8cf84e",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGDATATYPE_INT",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "7bb2f3e8-b0d6-4924-8464-c6e9c876c3ea",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGDATATYPE_FLOAT",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "5cd8a95c-2cf4-409c-97a6-9b0b6a3ae382",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGDATATYPE_STRING",
                    "hidden": false,
                    "value": "3"
                },
                {
                    "id": "b6855377-cc5e-4d1c-bd8a-f5ad397372a2",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGDATATYPE_STRING_UTF16",
                    "hidden": false,
                    "value": "4"
                },
                {
                    "id": "f52e66fb-667c-48cd-8db5-b994ba2b5df3",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGDATATYPE_STRING_UTF16BE",
                    "hidden": false,
                    "value": "5"
                },
                {
                    "id": "b4f592e4-ffaf-449a-86a0-c99b49eb8833",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGDATATYPE_STRING_UTF8",
                    "hidden": false,
                    "value": "6"
                },
                {
                    "id": "0e3c974a-47f7-4860-b306-8ab3cae9b975",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGDATATYPE_CDTOC",
                    "hidden": false,
                    "value": "7"
                },
                {
                    "id": "3f7e82a2-34f7-45e8-a77d-0d5d247f8e52",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGDATATYPE_MAX",
                    "hidden": false,
                    "value": "8"
                },
                {
                    "id": "633dfa8a-1d3c-449d-8d80-3ff29b865b8f",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGTYPE_ID3V1",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "739271f9-96e0-4112-a6b6-fbccf03348bb",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGTYPE_ID3V2",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "c082bc02-6161-43f3-8987-05490d3c849c",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGTYPE_VORBISCOMMENT",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "0d10bb2a-75e0-44df-80f8-a3a7ce4283c8",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGTYPE_SHOUTCAST",
                    "hidden": false,
                    "value": "3"
                },
                {
                    "id": "2087efa3-c5b1-4581-80f6-761f38c02927",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGTYPE_ICECAST",
                    "hidden": false,
                    "value": "4"
                },
                {
                    "id": "629538e8-86c3-4b82-9fab-2bebb7f87f3e",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGTYPE_ASF",
                    "hidden": false,
                    "value": "5"
                },
                {
                    "id": "40622cb8-88b8-4378-a36e-967b77464282",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGTYPE_MIDI",
                    "hidden": false,
                    "value": "6"
                },
                {
                    "id": "c3605e7e-8542-414a-86cc-8db573d1354c",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGTYPE_PLAYLIST",
                    "hidden": false,
                    "value": "7"
                },
                {
                    "id": "d5dfdf8a-32a2-4071-a892-085eaf6d5478",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGTYPE_FMOD",
                    "hidden": false,
                    "value": "8"
                },
                {
                    "id": "6e98cd1e-16c2-4cd4-86c7-b45f9ecb4f12",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGTYPE_USER",
                    "hidden": false,
                    "value": "9"
                },
                {
                    "id": "c1661591-6e50-4788-833e-cd61810ea32a",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGTYPE_MAX",
                    "hidden": false,
                    "value": "10"
                },
                {
                    "id": "cbe46a86-51ba-414c-a72d-b967469ca473",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_LOOPMODE_NONE",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "0d50bb04-6ad3-4c40-9ac5-46dfd05a8974",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_LOOPMODE_NORMAL",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "447b09b4-b2fd-43e7-8c3d-2a1e40e53307",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_LOOPMODE_BIDI",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "ac6822b2-0088-4d7d-913e-ef74e6b3e575",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_EFFECT_LOWPASS",
                    "hidden": false,
                    "value": "3"
                },
                {
                    "id": "aa732ee0-cce2-4818-887d-986981f897ad",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_EFFECT_HIGHPASS",
                    "hidden": false,
                    "value": "5"
                },
                {
                    "id": "7571faa4-f136-4bed-aa2f-93065efde20b",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_EFFECT_ECHO",
                    "hidden": false,
                    "value": "6"
                },
                {
                    "id": "08bd4712-0e1c-4e5c-b541-04e41902c9f4",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_EFFECT_FLANGE",
                    "hidden": false,
                    "value": "8"
                },
                {
                    "id": "330427f9-701f-49ce-a52c-d64112bb5bda",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_EFFECT_DISTORTION",
                    "hidden": false,
                    "value": "9"
                },
                {
                    "id": "61ed88bf-6016-4743-8c1a-29233ec83e8a",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_EFFECT_CHORUS",
                    "hidden": false,
                    "value": "14"
                },
                {
                    "id": "457456bf-dac6-47ac-967c-2f5dd774f453",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_EFFECT_REVERB",
                    "hidden": false,
                    "value": "19"
                },
                {
                    "id": "7edb2bc2-692b-42f2-a443-e81a087c08ae",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_EFFECT_TREMOLO",
                    "hidden": false,
                    "value": "22"
                },
                {
                    "id": "075e0824-e99b-41aa-bc57-ac27eb5a6444",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_EFFECT_PITCHSHIFT",
                    "hidden": false,
                    "value": "13"
                },
                {
                    "id": "589631b2-0dd6-49df-b111-76a240a03efd",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_AUTODETECT",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "8fbc3a8a-8a9b-4fc6-810b-629ccf7a01f7",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_UNKNOWN",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "099f58fa-eea6-4b7b-a41c-b15d99c20398",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_NOSOUND",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "03b45747-a0ef-49cc-85db-bac0ab5d79f7",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_WAVWRITER",
                    "hidden": false,
                    "value": "3"
                },
                {
                    "id": "b78dd60d-bca8-4c2b-bc15-b81af791e877",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_NOSOUND_NRT",
                    "hidden": false,
                    "value": "4"
                },
                {
                    "id": "2f81f9fe-6023-46d8-b407-137ba812620e",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_WAVWRITER_NRT",
                    "hidden": false,
                    "value": "5"
                },
                {
                    "id": "fc7674f5-5ce6-4a7c-b75b-63697725ebde",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_DSOUND",
                    "hidden": false,
                    "value": "6"
                },
                {
                    "id": "22788b16-f048-440e-a8ba-8719e1ff62f8",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_WINMM",
                    "hidden": false,
                    "value": "7"
                },
                {
                    "id": "0cbab0c4-4693-4664-ba6a-485dac45109a",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_WASAPI",
                    "hidden": false,
                    "value": "8"
                },
                {
                    "id": "aef4e5d3-fab2-47c5-afa2-ad30fb0a568d",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_ASIO",
                    "hidden": false,
                    "value": "9"
                },
                {
                    "id": "e28bffb7-b313-4cb8-a481-4307314f57ca",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_PULSEAUDIO",
                    "hidden": false,
                    "value": "10"
                },
                {
                    "id": "72ae3258-a869-4e55-b742-d22f7e540fed",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_ALSA",
                    "hidden": false,
                    "value": "11"
                },
                {
                    "id": "2cf20b3d-5d58-42fe-9b97-4a52310e19d4",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_COREAUDIO",
                    "hidden": false,
                    "value": "12"
                },
                {
                    "id": "87a15fb8-19cc-4bdb-a406-f7f95bdae14b",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_XAUDIO",
                    "hidden": false,
                    "value": "13"
                },
                {
                    "id": "be42b512-dc54-4515-87be-b4de8f49a902",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_PS3",
                    "hidden": false,
                    "value": "14"
                },
                {
                    "id": "e5a7eac0-a795-46a6-b378-3d697137c350",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_AUDIOTRACK",
                    "hidden": false,
                    "value": "15"
                },
                {
                    "id": "63d5452c-a285-4fe5-b56a-e504e88de0ea",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_OPENSL",
                    "hidden": false,
                    "value": "16"
                },
                {
                    "id": "bf9d9e5a-3ed5-4a9a-8cfb-24c0a29da878",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_WIIU",
                    "hidden": false,
                    "value": "17"
                },
                {
                    "id": "c106e334-4760-4f01-8d4e-c70d483e9b66",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_AUDIOOUT",
                    "hidden": false,
                    "value": "18"
                },
                {
                    "id": "f2b615f7-dffa-4f84-b83d-b96bcfb6fcee",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_AUDIO3D",
                    "hidden": false,
                    "value": "19"
                },
                {
                    "id": "adb78789-5ff7-4fa5-8c61-509717e0dd40",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_ATMOS",
                    "hidden": false,
                    "value": "20"
                },
                {
                    "id": "615fc17d-5314-4c77-a8a3-adfd8548a381",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_MAX",
                    "hidden": false,
                    "value": "21"
                },
                {
                    "id": "964682c5-c577-49d2-9531-a551efded234",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_DEFAULT",
                    "hidden": false,
                    "value": "$00000000"
                },
                {
                    "id": "368234cd-3cc5-4f73-944a-3a49ae97f365",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_LOOP_OFF",
                    "hidden": false,
                    "value": "$00000001"
                },
                {
                    "id": "e290a968-0fa2-4059-a378-51365483ce43",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_LOOP_NORMAL",
                    "hidden": false,
                    "value": "$00000002"
                },
                {
                    "id": "9480b38c-81be-412b-954f-f437aafefee2",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_LOOP_BIDI",
                    "hidden": false,
                    "value": "$00000004"
                },
                {
                    "id": "4e93c80a-3125-43b3-9608-0923fd8af06c",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_2D",
                    "hidden": false,
                    "value": "$00000008"
                },
                {
                    "id": "04505453-12f9-40d2-aba0-468ed0b9b65b",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_3D",
                    "hidden": false,
                    "value": "$00000010"
                },
                {
                    "id": "f9384f14-d6aa-493e-82de-feee222b2858",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_CREATESTREAM",
                    "hidden": false,
                    "value": "$00000080"
                },
                {
                    "id": "68a31f44-cfe8-455a-91fc-ead1d40d8db9",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_CREATESAMPLE",
                    "hidden": false,
                    "value": "$00000100"
                },
                {
                    "id": "a9ae5481-257b-48bd-b936-867c836faf3e",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_CREATECOMPRESSEDSAMPLE",
                    "hidden": false,
                    "value": "$00000200"
                },
                {
                    "id": "b638a9da-0704-474f-82c7-af7388d81232",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_OPENUSER",
                    "hidden": false,
                    "value": "$00000400"
                },
                {
                    "id": "6a5d0e57-5a3f-42cb-bd33-0406ec30c7b5",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_OPENMEMORY",
                    "hidden": false,
                    "value": "$00000800"
                },
                {
                    "id": "6e1003e7-18f5-41b2-bff8-739e594a8586",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_OPENMEMORY_POINT",
                    "hidden": false,
                    "value": "$10000000"
                },
                {
                    "id": "972594d0-421d-4443-8d9d-80e56ff7253c",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_OPENRAW",
                    "hidden": false,
                    "value": "$00001000"
                },
                {
                    "id": "3444f429-ea6a-41b1-b207-398f19380317",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_OPENONLY",
                    "hidden": false,
                    "value": "$00002000"
                },
                {
                    "id": "008c829b-3657-4f03-942a-f7e59c39137e",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_ACCURATETIME",
                    "hidden": false,
                    "value": "$00004000"
                },
                {
                    "id": "f0906ffe-0698-4b65-837b-c48ab8be2295",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_MPEGSEARCH",
                    "hidden": false,
                    "value": "$00008000"
                },
                {
                    "id": "3d279ba6-65b3-49c0-8e1f-7e1d84543f88",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_NONBLOCKING",
                    "hidden": false,
                    "value": "$00010000"
                },
                {
                    "id": "cc47192e-018d-443c-a4fb-9dcd0bb287f8",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_UNIQUE",
                    "hidden": false,
                    "value": "$00020000"
                },
                {
                    "id": "36781a82-76b3-4f8d-a4ea-af296f59c7b4",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_3D_HEADRELATIVE",
                    "hidden": false,
                    "value": "$00040000"
                },
                {
                    "id": "7c59e29b-83ea-4675-bc38-57ea19beff65",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_3D_WORLDRELATIVE",
                    "hidden": false,
                    "value": "$00080000"
                },
                {
                    "id": "c813f379-4500-46aa-a278-426d058dd813",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_3D_INVERSEROLLOFF",
                    "hidden": false,
                    "value": "$00100000"
                },
                {
                    "id": "a7a22b97-8aaa-407c-a69b-be409e569dd5",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_3D_LINEARSQUAREROLLOFF",
                    "hidden": false,
                    "value": "$00200000"
                },
                {
                    "id": "413adf79-47bd-430d-924a-942ff1af9505",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_3D_INVERSETAPEREDROLLOFF",
                    "hidden": false,
                    "value": "$00400000"
                },
                {
                    "id": "5bd8af47-9650-415d-986b-17fcbb1786da",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_3D_CUSTOMROLLOFF",
                    "hidden": false,
                    "value": "$04000000"
                },
                {
                    "id": "8c53d299-ea30-451d-9ef3-61fd8a065505",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_3D_IGNOREGEOMETRY",
                    "hidden": false,
                    "value": "$40000000"
                },
                {
                    "id": "d13c32d8-8cad-42f2-b9cf-3bf40a05eb62",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_IGNORETAGS",
                    "hidden": false,
                    "value": "$02000000"
                },
                {
                    "id": "3f3c273b-4ccb-49b8-9ac7-d126cb1f5e8f",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_LOWMEM",
                    "hidden": false,
                    "value": "$08000000"
                },
                {
                    "id": "4d731686-78dc-4fd6-9d4a-a08127ae886b",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_LOADSECONDARYRAM",
                    "hidden": false,
                    "value": "$20000000"
                },
                {
                    "id": "a46691e8-39ad-4287-bd12-72125a78b1c0",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_MODE_VIRTUAL_PLAYFROMSTART",
                    "hidden": false,
                    "value": "$80000000"
                }
            ],
            "copyToTargets": 202375362,
            "filename": "FMODGMS.dll",
            "final": "",
            "functions": [
                {
                    "id": "21d81fb3-d55e-42a2-961f-a4d9f6827d74",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "FMODGMS_Sys_Create",
                    "help": "FMODGMS_Sys_Create()",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Sys_Create",
                    "returnType": 2
                },
                {
                    "id": "8f96c13d-fc2d-471d-9178-2894a53afdf5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_Sys_Initialize",
                    "help": "FMODGMS_Sys_Initialize(maxChan)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Sys_Initialize",
                    "returnType": 2
                },
                {
                    "id": "fb062ac2-430e-4987-bd7b-bb2512e48f7d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "FMODGMS_Sys_Close",
                    "help": "FMODGMS_Sys_Close()",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Sys_Close",
                    "returnType": 2
                },
                {
                    "id": "0a975baf-7fae-44d6-a2f9-b91b9eaaccf1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "FMODGMS_Snd_LoadSound",
                    "help": "FMODGMS_Snd_LoadSound(filename)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Snd_LoadSound",
                    "returnType": 2
                },
                {
                    "id": "d50402ac-db65-4dcd-afb8-8f614f07af32",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "FMODGMS_Snd_LoadStream",
                    "help": "FMODGMS_Snd_LoadStream(filename)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Snd_LoadStream",
                    "returnType": 2
                },
                {
                    "id": "362b1172-9988-4514-a87d-5e1fbe7bb6ab",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_Snd_Unload",
                    "help": "FMODGMS_Snd_Unload(index)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Snd_Unload",
                    "returnType": 2
                },
                {
                    "id": "68befe7d-a6fa-4ca4-9ce0-872b13da17b8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "FMODGMS_Snd_PlaySound",
                    "help": "FMODGMS_Snd_PlaySound(index, channel)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Snd_PlaySound",
                    "returnType": 2
                },
                {
                    "id": "e51be4bc-749f-4fa6-9274-4809905e87ff",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        2,
                        2,
                        2
                    ],
                    "externalName": "FMODGMS_Snd_Set_LoopMode",
                    "help": "FMODGMS_Snd_Set_LoopMode(index, mode, times)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Snd_Set_LoopMode",
                    "returnType": 2
                },
                {
                    "id": "dbfdd8dc-3130-4376-9406-a0657de22234",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        2,
                        2,
                        2
                    ],
                    "externalName": "FMODGMS_Snd_Set_LoopPoints",
                    "help": "FMODGMS_Snd_Set_LoopPoints(index, startTimeInSamples, endTimeInSamples)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Snd_Set_LoopPoints",
                    "returnType": 2
                },
                {
                    "id": "ff2237c1-874f-46df-890c-1ae7da564112",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "FMODGMS_Snd_Get_LoopPoints",
                    "help": "FMODGMS_Snd_Get_LoopPoints(index, whichOne)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Snd_Get_LoopPoints",
                    "returnType": 2
                },
                {
                    "id": "27e855d3-bb1d-415f-bacc-27f4726f4e81",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "FMODGMS_Chan_CreateChannel",
                    "help": "FMODGMS_Chan_CreateChannel()",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Chan_CreateChannel",
                    "returnType": 2
                },
                {
                    "id": "0e1851be-f7d5-49b4-9a28-eeadb4d21df5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_Chan_RemoveChannel",
                    "help": "FMODGMS_Chan_RemoveChannel(channel)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Chan_RemoveChannel",
                    "returnType": 2
                },
                {
                    "id": "db028eef-33c6-463b-958a-1a8775e2600b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "FMODGMS_Util_GetErrorMessage",
                    "help": "FMODGMS_Util_GetErrorMessage()",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Util_GetErrorMessage",
                    "returnType": 1
                },
                {
                    "id": "9cd91dc7-25e4-4f6d-950d-c92d9f0c0125",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "FMODGMS_Sys_Get_CPUUsage",
                    "help": "FMODGMS_Sys_Get_CPUUsage()",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Sys_Get_CPUUsage",
                    "returnType": 2
                },
                {
                    "id": "06c30adf-055c-476e-8f0e-98c8d92b2882",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "FMODGMS_Sys_Get_MaxSoundIndex",
                    "help": "FMODGMS_Sys_Get_MaxSoundIndex()",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Sys_Get_MaxSoundIndex",
                    "returnType": 2
                },
                {
                    "id": "72b1d097-29c8-4bf9-99e7-b995dd031539",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "FMODGMS_Sys_Get_MaxChannelIndex",
                    "help": "FMODGMS_Sys_Get_MaxChannelIndex()",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Sys_Get_MaxChannelIndex",
                    "returnType": 2
                },
                {
                    "id": "97207f33-fbfe-4c1f-9b80-38f523561303",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_Snd_Get_NumTags",
                    "help": "FMODGMS_Snd_Get_NumTags(index)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Snd_Get_NumTags",
                    "returnType": 2
                },
                {
                    "id": "5a746e54-9a30-43ce-a4cd-264ee632fff5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "FMODGMS_Snd_Get_TagName",
                    "help": "FMODGMS_Snd_Get_TagName(soundIndex, tagIndex)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Snd_Get_TagName",
                    "returnType": 1
                },
                {
                    "id": "4a0938ad-9bcc-434a-b9f3-a6668bd3fed8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_Chan_StopChannel",
                    "help": "FMODGMS_Chan_StopChannel(channel)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Chan_StopChannel",
                    "returnType": 2
                },
                {
                    "id": "07bf5c3c-b097-4629-8755-6df2413dfc52",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_Chan_Get_ModOrder",
                    "help": "FMODGMS_Chan_Get_ModOrder(channel)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Chan_Get_ModOrder",
                    "returnType": 2
                },
                {
                    "id": "6c366640-49c3-4b50-85d2-4779ae4b3794",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_Chan_Get_ModPattern",
                    "help": "FMODGMS_Chan_Get_ModPattern(channel)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Chan_Get_ModPattern",
                    "returnType": 2
                },
                {
                    "id": "863e6aaf-96c2-4e69-9a54-94b7778254b0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_Chan_Get_ModRow",
                    "help": "FMODGMS_Chan_Get_ModRow(channel)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Chan_Get_ModRow",
                    "returnType": 2
                },
                {
                    "id": "437b6e34-c806-4e32-9f57-582f6a6f583b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_Snd_Get_Type",
                    "help": "FMODGMS_Snd_Get_Type(index)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Snd_Get_Type",
                    "returnType": 2
                },
                {
                    "id": "0ec7d967-81e6-4632-a639-fb6e51c5aaa6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_Chan_Get_Position",
                    "help": "FMODGMS_Chan_Get_Position(channel)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Chan_Get_Position",
                    "returnType": 2
                },
                {
                    "id": "7d9a8438-adb8-4a8e-a1a7-feee670839f1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_Chan_PauseChannel",
                    "help": "FMODGMS_Chan_PauseChannel(channel)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Chan_PauseChannel",
                    "returnType": 2
                },
                {
                    "id": "0eac28be-4cd4-47a7-8b24-8512e1470a8c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_Chan_ResumeChannel",
                    "help": "FMODGMS_Chan_ResumeChannel(channel)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Chan_ResumeChannel",
                    "returnType": 2
                },
                {
                    "id": "69f7edb6-d8df-4395-8786-2260599a7237",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "FMODGMS_Sys_Update",
                    "help": "FMODGMS_Sys_Update()",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Sys_Update",
                    "returnType": 2
                },
                {
                    "id": "d94c8db4-d068-4a27-ac7d-bc7bc295fa2f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "FMODGMS_Chan_Set_Position",
                    "help": "FMODGMS_Chan_Set_Position(channel,pos)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Chan_Set_Position",
                    "returnType": 2
                },
                {
                    "id": "79a3a833-6201-411d-a0e8-7edb548cf83e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "FMODGMS_Chan_Set_Volume",
                    "help": "FMODGMS_Chan_Set_Volume(channel,vol)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Chan_Set_Volume",
                    "returnType": 2
                },
                {
                    "id": "9b58c945-6d62-4c21-b062-35d9edd53c9f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "FMODGMS_Chan_Set_Frequency",
                    "help": "FMODGMS_Chan_Set_Frequency(channel,freq)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Chan_Set_Frequency",
                    "returnType": 2
                },
                {
                    "id": "520312cc-3772-40fd-a17a-b98745787c58",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "FMODGMS_Chan_Set_Pitch",
                    "help": "FMODGMS_Chan_Set_Pitch(channel,pitch)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Chan_Set_Pitch",
                    "returnType": 2
                },
                {
                    "id": "708c21d4-9bbd-4d8e-884d-f3c9aea08af9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "FMODGMS_Chan_Set_ModOrder",
                    "help": "FMODGMS_Chan_Set_ModOrder(channel,ord)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Chan_Set_ModOrder",
                    "returnType": 2
                },
                {
                    "id": "da755ca1-95fe-4239-a93e-5b4ad1ef0432",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "FMODGMS_Chan_Set_ModRow",
                    "help": "FMODGMS_Chan_Set_ModRow(channel,row)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Chan_Set_ModRow",
                    "returnType": 2
                },
                {
                    "id": "6315d5f4-349e-4a73-a0aa-e77e9aaff023",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_Chan_Get_Volume",
                    "help": "FMODGMS_Chan_Get_Volume(channel)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Chan_Get_Volume",
                    "returnType": 2
                },
                {
                    "id": "11b3b381-fe41-427b-bb1f-5fbc0169d311",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_Chan_Get_Frequency",
                    "help": "FMODGMS_Chan_Get_Frequency(channel)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Chan_Get_Frequency",
                    "returnType": 2
                },
                {
                    "id": "10f7cb4e-035f-4f58-b20b-6bb72d9328eb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_Chan_Get_Pitch",
                    "help": "FMODGMS_Chan_Get_Pitch(channel)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Chan_Get_Pitch",
                    "returnType": 2
                },
                {
                    "id": "19e2417e-c3c1-48c8-ae25-3d2919c5a5a9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "FMODGMS_Sys_Set_SoftwareFormat",
                    "help": "FMODGMS_Sys_Set_SoftwareFormat(sampleRate, speakerMode)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Sys_Set_SoftwareFormat",
                    "returnType": 2
                },
                {
                    "id": "1b1b8794-fbd9-406f-bceb-fb0735a370f3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "FMODGMS_Sys_Get_SampleRate",
                    "help": "FMODGMS_Sys_Get_SampleRate()",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Sys_Get_SampleRate",
                    "returnType": 2
                },
                {
                    "id": "39fc26bf-8724-4d97-95b3-260bfa6f35f7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "FMODGMS_FFT_Get_DominantFrequency",
                    "help": "FMODGMS_FFT_Get_DominantFrequency()",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_FFT_Get_DominantFrequency",
                    "returnType": 2
                },
                {
                    "id": "65158e29-721d-4ccf-b032-05f3b3e82e98",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_FFT_Get_BinValue",
                    "help": "FMODGMS_FFT_Get_BinValue(index)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_FFT_Get_BinValue",
                    "returnType": 2
                },
                {
                    "id": "7b3474f6-2647-4483-aa5f-8ce1e3d42f61",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "FMODGMS_FFT_Get_NumBins",
                    "help": "FMODGMS_FFT_Get_NumBins()",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_FFT_Get_NumBins",
                    "returnType": 2
                },
                {
                    "id": "1ffe9078-6a95-48ac-8005-8300aca15762",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_FFT_Set_WindowSize",
                    "help": "FMODGMS_FFT_Set_WindowSize(size)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_FFT_Set_WindowSize",
                    "returnType": 2
                },
                {
                    "id": "a2fddf59-e052-4304-9eb6-c9dcfd3da037",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "FMODGMS_Snd_Get_TagTypeFromIndex",
                    "help": "FMODGMS_Snd_Get_TagTypeFromIndex(soundIndex,tagIndex)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Snd_Get_TagTypeFromIndex",
                    "returnType": 2
                },
                {
                    "id": "55614641-908d-4c4c-8a20-41aa8ed65ccf",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "FMODGMS_Snd_Get_TagDataTypeFromIndex",
                    "help": "FMODGMS_Snd_Get_TagDataTypeFromIndex(soundIndex,tagIndex)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Snd_Get_TagDataTypeFromIndex",
                    "returnType": 2
                },
                {
                    "id": "9ab7d0ac-eb5b-4b8a-b97d-161cc6dd38fd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "FMODGMS_Snd_Get_TagRealFromIndex",
                    "help": "FMODGMS_Snd_Get_TagRealFromIndex(soundIndex,tagIndex)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Snd_Get_TagRealFromIndex",
                    "returnType": 2
                },
                {
                    "id": "1c24d1e4-f2a5-471d-a087-16e22ac82c3e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "FMODGMS_Snd_Get_TagStringFromIndex",
                    "help": "FMODGMS_Snd_Get_TagStringFromIndex(soundIndex,tagIndex)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Snd_Get_TagStringFromIndex",
                    "returnType": 1
                },
                {
                    "id": "6f45f2e0-009c-4f8f-8577-e8a2888d60a7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        1
                    ],
                    "externalName": "FMODGMS_Snd_Get_TagTypeFromName",
                    "help": "FMODGMS_Snd_Get_TagTypeFromName(soundIndex,tagName)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Snd_Get_TagTypeFromName",
                    "returnType": 2
                },
                {
                    "id": "fd26b08b-3ea7-4a5b-9882-152810514d6d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        1
                    ],
                    "externalName": "FMODGMS_Snd_Get_TagDataTypeFromName",
                    "help": "FMODGMS_Snd_Get_TagDataTypeFromName(soundIndex,tagName)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Snd_Get_TagDataTypeFromName",
                    "returnType": 2
                },
                {
                    "id": "9083c061-14a8-476a-96db-eb4b2b98b591",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        1
                    ],
                    "externalName": "FMODGMS_Snd_Get_TagRealFromName",
                    "help": "FMODGMS_Snd_Get_TagRealFromName(soundIndex,tagName)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Snd_Get_TagRealFromName",
                    "returnType": 2
                },
                {
                    "id": "fda1cf30-cca6-4cdd-ac33-8b3803ff9adb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        1
                    ],
                    "externalName": "FMODGMS_Snd_Get_TagStringFromName",
                    "help": "FMODGMS_Snd_Get_TagStringFromName(soundIndex,tagName)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Snd_Get_TagStringFromName",
                    "returnType": 1
                },
                {
                    "id": "51daf6d7-5d3d-4bfc-9c4c-5a691bba2538",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        2,
                        2,
                        2
                    ],
                    "externalName": "FMODGMS_Snd_Set_ModChannelVolume",
                    "help": "FMODGMS_Snd_Set_ModChannelVolume(index, modChannel, vol)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Snd_Set_ModChannelVolume",
                    "returnType": 2
                },
                {
                    "id": "20c6765f-3c25-4c6f-b338-82761107e17b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "FMODGMS_Snd_Get_ModChannelVolume",
                    "help": "FMODGMS_Snd_Get_ModChannelVolume(index, modChannel)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Snd_Get_ModChannelVolume",
                    "returnType": 2
                },
                {
                    "id": "e5b9cbe8-9b80-4034-b8ce-b8adfc8c50bf",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_Snd_Get_ModNumChannels",
                    "help": "FMODGMS_Snd_Get_ModNumChannels(index)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Snd_Get_ModNumChannels",
                    "returnType": 2
                },
                {
                    "id": "19421785-3feb-438f-8a72-7cedfee4d1b8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_Snd_Get_Length",
                    "help": "FMODGMS_Snd_Get_Length(index)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Snd_Get_Length",
                    "returnType": 2
                },
                {
                    "id": "221702b1-9831-48cb-beca-5b8ec4f40ef0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        2,
                        2,
                        2
                    ],
                    "externalName": "FMODGMS_Chan_Add_Effect",
                    "help": "FMODGMS_Chan_Add_Effect(channel, effect, index)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Chan_Add_Effect",
                    "returnType": 2
                },
                {
                    "id": "8c10240f-7004-4652-8c4e-1c613cf0f57e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "FMODGMS_Chan_Remove_Effect",
                    "help": "FMODGMS_Chan_Remove_Effect(channel, effect)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Chan_Remove_Effect",
                    "returnType": 2
                },
                {
                    "id": "43793169-f0b8-4129-bb0c-4fe6861773ea",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_Effect_Create",
                    "help": "FMODGMS_Effect_Create(type)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Effect_Create",
                    "returnType": 2
                },
                {
                    "id": "3e93f99f-baad-4d5a-ab51-13389416d60c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        2,
                        2,
                        2
                    ],
                    "externalName": "FMODGMS_Effect_Set_Parameter",
                    "help": "FMODGMS_Effect_Set_Parameter(effect, parameter, value)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Effect_Set_Parameter",
                    "returnType": 2
                },
                {
                    "id": "38f4e54d-dfaf-44b7-b406-f1956b6f7898",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_Effect_Remove",
                    "help": "FMODGMS_Effect_Remove(effect)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Effect_Remove",
                    "returnType": 2
                },
                {
                    "id": "236d6673-e66e-4cbc-9c80-392df8c47e99",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "FMODGMS_Effect_RemoveAll",
                    "help": "FMODGMS_Effect_RemoveAll()",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Effect_RemoveAll",
                    "returnType": 2
                },
                {
                    "id": "9e0ec69e-0165-4dce-9994-e25332c9f667",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "FMODGMS_FFT_Normalize",
                    "help": "FMODGMS_FFT_Normalize()",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_FFT_Normalize",
                    "returnType": 2
                },
                {
                    "id": "8db23a7c-d1d2-4b4c-8e36-72593b95a66a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_Chan_Get_Level",
                    "help": "FMODGMS_Chan_Get_Level(channel)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Chan_Get_Level",
                    "returnType": 2
                },
                {
                    "id": "63cced69-3ff2-4d06-bd22-1fc3624c6a1a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_Chan_Get_Mute",
                    "help": "FMODGMS_Chan_Get_Mute(channel)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Chan_Get_Mute",
                    "returnType": 2
                },
                {
                    "id": "4478f0d6-3867-46bf-bfdc-28d3a04f56ec",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "FMODGMS_Chan_Set_Mute",
                    "help": "FMODGMS_Chan_Set_Mute(channel, mute)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Chan_Set_Mute",
                    "returnType": 2
                },
                {
                    "id": "82079860-60e8-467e-96a5-033199b8e518",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_Sys_Set_OutputMode",
                    "help": "FMODGMS_Sys_Set_OutputMode(outputType)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Sys_Set_OutputMode",
                    "returnType": 2
                },
                {
                    "id": "64609d99-98a3-4e2a-afc4-fa9be65e484f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "FMODGMS_Sys_Get_OutputMode",
                    "help": "FMODGMS_Sys_Get_OutputMode()",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Sys_Get_OutputMode",
                    "returnType": 2
                },
                {
                    "id": "af3980a9-88f2-4331-86b2-09bddee31924",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "FMODGMS_Sys_Get_SpeakerMode",
                    "help": "FMODGMS_Sys_Get_SpeakerMode()",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Sys_Get_SpeakerMode",
                    "returnType": 2
                },
                {
                    "id": "a9131593-4043-43db-a4af-d86c98025293",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "FMODGMS_Util_Handshake",
                    "help": "FMODGMS_Util_Handshake()",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Util_Handshake",
                    "returnType": 1
                },
                {
                    "id": "e8b1eb86-06ce-4767-877e-81668e4d73ea",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_FFT_Init",
                    "help": "FMODGMS_FFT_Init(windowSize)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_FFT_Init",
                    "returnType": 2
                },
                {
                    "id": "397fdf04-3060-4149-b151-acbea8de65ba",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "FMODGMS_Sys_Set_DSPBufferSize",
                    "help": "FMODGMS_Sys_Set_DSPBufferSize(size, numBuffers)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Sys_Set_DSPBufferSize",
                    "returnType": 2
                },
                {
                    "id": "105a0fd0-55bc-4b1b-8c85-0953dd6faf8c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "FMODGMS_Sys_Get_DSPBufferSize",
                    "help": "FMODGMS_Sys_Get_DSPBufferSize()",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Sys_Get_DSPBufferSize",
                    "returnType": 2
                },
                {
                    "id": "45206c13-b07d-49c0-b606-2ec94f48ae93",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "FMODGMS_Sys_Get_NumDSPBuffers",
                    "help": "FMODGMS_Sys_Get_NumDSPBuffers()",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Sys_Get_NumDSPBuffers",
                    "returnType": 2
                },
                {
                    "id": "b0d6b537-18b3-42be-9d59-e9170154af76",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        2,
                        2,
                        1
                    ],
                    "externalName": "FMODGMS_Snd_ReadData",
                    "help": "FMODGMS_Snd_ReadData(index, position, length, buffer)",
                    "hidden": false,
                    "kind": 1,
                    "name": "FMODGMS_Snd_ReadData",
                    "returnType": 2
                },
                {
                    "id": "cec11b67-bca2-443b-b485-15a770d3c8d0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        2,
                        1
                    ],
                    "externalName": "FMODGMS_Snd_LoadSound_Ext",
                    "help": "FMODGMS_Snd_LoadSound_Ext(location, mode, exInfo)",
                    "hidden": false,
                    "kind": 1,
                    "name": "FMODGMS_Snd_LoadSound_Ext",
                    "returnType": 2
                },
                {
                    "id": "cbfaa3ea-04c6-41a5-8537-2292450029c9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_Snd_Get_BitsPerSample",
                    "help": "FMODGMS_Snd_Get_BitsPerSample(sound)",
                    "hidden": false,
                    "kind": 1,
                    "name": "FMODGMS_Snd_Get_BitsPerSample",
                    "returnType": 2
                },
                {
                    "id": "1d2a1564-ed47-4478-82af-9b847935da12",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_Snd_Get_DefaultFrequency",
                    "help": "FMODGMS_Snd_Get_DefaultFrequency(sound)",
                    "hidden": false,
                    "kind": 1,
                    "name": "FMODGMS_Snd_Get_DefaultFrequency",
                    "returnType": 2
                },
                {
                    "id": "f1c89c05-bffb-449b-9c2b-c1a8548255a3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "FMODGMS_Snd_Get_NumChannels",
                    "help": "FMODGMS_Snd_Get_NumChannels(sound)",
                    "hidden": false,
                    "kind": 1,
                    "name": "FMODGMS_Snd_Get_NumChannels",
                    "returnType": 2
                },
                {
                    "id": "f0a386b3-8099-4cb4-9c1c-986822098f11",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        1,
                        2,
                        2
                    ],
                    "externalName": "FMODGMS_Util_FFT",
                    "help": "FMODGMS_Util_FFT(bufferIn, bufferOut, numPoints, normalize)",
                    "hidden": false,
                    "kind": 1,
                    "name": "FMODGMS_Util_FFT",
                    "returnType": 2
                },
                {
                    "id": "04aeffbb-c5b1-4aa5-a81c-1213d5ae0aa9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "FMODGMS_Snd_Set_DLS",
                    "help": "FMODGMS_Snd_Set_DLS(filename)",
                    "hidden": false,
                    "kind": 1,
                    "name": "FMODGMS_Snd_Set_DLS",
                    "returnType": 2
                },
                {
                    "id": "6f8841ab-126b-4119-8a7f-c0b71364db96",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "FMODGMS_Snd_Remove_DLS",
                    "help": "FMODGMS_Snd_Remove_DLS()",
                    "hidden": false,
                    "kind": 1,
                    "name": "FMODGMS_Snd_Remove_DLS",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 1,
            "order": [
                "21d81fb3-d55e-42a2-961f-a4d9f6827d74",
                "8f96c13d-fc2d-471d-9178-2894a53afdf5",
                "fb062ac2-430e-4987-bd7b-bb2512e48f7d",
                "0a975baf-7fae-44d6-a2f9-b91b9eaaccf1",
                "d50402ac-db65-4dcd-afb8-8f614f07af32",
                "362b1172-9988-4514-a87d-5e1fbe7bb6ab",
                "68befe7d-a6fa-4ca4-9ce0-872b13da17b8",
                "e51be4bc-749f-4fa6-9274-4809905e87ff",
                "dbfdd8dc-3130-4376-9406-a0657de22234",
                "ff2237c1-874f-46df-890c-1ae7da564112",
                "27e855d3-bb1d-415f-bacc-27f4726f4e81",
                "0e1851be-f7d5-49b4-9a28-eeadb4d21df5",
                "db028eef-33c6-463b-958a-1a8775e2600b",
                "9cd91dc7-25e4-4f6d-950d-c92d9f0c0125",
                "06c30adf-055c-476e-8f0e-98c8d92b2882",
                "72b1d097-29c8-4bf9-99e7-b995dd031539",
                "97207f33-fbfe-4c1f-9b80-38f523561303",
                "5a746e54-9a30-43ce-a4cd-264ee632fff5",
                "4a0938ad-9bcc-434a-b9f3-a6668bd3fed8",
                "07bf5c3c-b097-4629-8755-6df2413dfc52",
                "6c366640-49c3-4b50-85d2-4779ae4b3794",
                "863e6aaf-96c2-4e69-9a54-94b7778254b0",
                "437b6e34-c806-4e32-9f57-582f6a6f583b",
                "0ec7d967-81e6-4632-a639-fb6e51c5aaa6",
                "7d9a8438-adb8-4a8e-a1a7-feee670839f1",
                "0eac28be-4cd4-47a7-8b24-8512e1470a8c",
                "69f7edb6-d8df-4395-8786-2260599a7237",
                "d94c8db4-d068-4a27-ac7d-bc7bc295fa2f",
                "79a3a833-6201-411d-a0e8-7edb548cf83e",
                "9b58c945-6d62-4c21-b062-35d9edd53c9f",
                "520312cc-3772-40fd-a17a-b98745787c58",
                "708c21d4-9bbd-4d8e-884d-f3c9aea08af9",
                "da755ca1-95fe-4239-a93e-5b4ad1ef0432",
                "6315d5f4-349e-4a73-a0aa-e77e9aaff023",
                "11b3b381-fe41-427b-bb1f-5fbc0169d311",
                "10f7cb4e-035f-4f58-b20b-6bb72d9328eb",
                "19e2417e-c3c1-48c8-ae25-3d2919c5a5a9",
                "1b1b8794-fbd9-406f-bceb-fb0735a370f3",
                "39fc26bf-8724-4d97-95b3-260bfa6f35f7",
                "65158e29-721d-4ccf-b032-05f3b3e82e98",
                "7b3474f6-2647-4483-aa5f-8ce1e3d42f61",
                "1ffe9078-6a95-48ac-8005-8300aca15762",
                "a2fddf59-e052-4304-9eb6-c9dcfd3da037",
                "55614641-908d-4c4c-8a20-41aa8ed65ccf",
                "9ab7d0ac-eb5b-4b8a-b97d-161cc6dd38fd",
                "1c24d1e4-f2a5-471d-a087-16e22ac82c3e",
                "6f45f2e0-009c-4f8f-8577-e8a2888d60a7",
                "fd26b08b-3ea7-4a5b-9882-152810514d6d",
                "9083c061-14a8-476a-96db-eb4b2b98b591",
                "fda1cf30-cca6-4cdd-ac33-8b3803ff9adb",
                "51daf6d7-5d3d-4bfc-9c4c-5a691bba2538",
                "20c6765f-3c25-4c6f-b338-82761107e17b",
                "e5b9cbe8-9b80-4034-b8ce-b8adfc8c50bf",
                "19421785-3feb-438f-8a72-7cedfee4d1b8",
                "221702b1-9831-48cb-beca-5b8ec4f40ef0",
                "8c10240f-7004-4652-8c4e-1c613cf0f57e",
                "43793169-f0b8-4129-bb0c-4fe6861773ea",
                "3e93f99f-baad-4d5a-ab51-13389416d60c",
                "38f4e54d-dfaf-44b7-b406-f1956b6f7898",
                "236d6673-e66e-4cbc-9c80-392df8c47e99",
                "9e0ec69e-0165-4dce-9994-e25332c9f667",
                "8db23a7c-d1d2-4b4c-8e36-72593b95a66a",
                "63cced69-3ff2-4d06-bd22-1fc3624c6a1a",
                "4478f0d6-3867-46bf-bfdc-28d3a04f56ec",
                "82079860-60e8-467e-96a5-033199b8e518",
                "64609d99-98a3-4e2a-afc4-fa9be65e484f",
                "af3980a9-88f2-4331-86b2-09bddee31924",
                "a9131593-4043-43db-a4af-d86c98025293",
                "e8b1eb86-06ce-4767-877e-81668e4d73ea",
                "397fdf04-3060-4149-b151-acbea8de65ba",
                "105a0fd0-55bc-4b1b-8c85-0953dd6faf8c",
                "45206c13-b07d-49c0-b606-2ec94f48ae93",
                "b0d6b537-18b3-42be-9d59-e9170154af76",
                "cec11b67-bca2-443b-b485-15a770d3c8d0",
                "cbfaa3ea-04c6-41a5-8537-2292450029c9",
                "1d2a1564-ed47-4478-82af-9b847935da12",
                "f1c89c05-bffb-449b-9c2b-c1a8548255a3",
                "f0a386b3-8099-4cb4-9c1c-986822098f11",
                "04aeffbb-c5b1-4aa5-a81c-1213d5ae0aa9",
                "6f8841ab-126b-4119-8a7f-c0b71364db96"
            ],
            "origname": "extensions\\FMODGMS.dll",
            "uncompress": false
        },
        {
            "id": "b4597348-18a9-430e-a567-82dc61709f63",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 1048640,
            "filename": "fmod.dll",
            "final": "",
            "functions": [
                
            ],
            "init": "",
            "kind": 1,
            "order": [
                
            ],
            "origname": "extensions\\fmod.dll",
            "uncompress": false
        },
        {
            "id": "e1758f92-3450-4465-a343-cefff847ee09",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 67108866,
            "filename": "libfmod.dylib",
            "final": "",
            "functions": [
                
            ],
            "init": "",
            "kind": 1,
            "order": [
                
            ],
            "origname": "extensions\\libfmod.dylib",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": false,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosplistinject": "",
    "license": "Free to use, also for commercial games.",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "packageID": "",
    "productID": "ACBD3CFF4E539AD869A0E8E3B4B022DD",
    "sourcedir": "",
    "version": "0.9.0"
}