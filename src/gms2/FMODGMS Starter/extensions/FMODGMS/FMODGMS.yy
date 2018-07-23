{
    "id": "d70d3d48-1a83-4551-8952-327538185edd",
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
    "androidProps": true,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": 202375362,
    "date": "2018-10-18 07:07:23",
    "description": "",
    "extensionName": "",
    "files": [
        {
            "id": "95c490f4-e0ee-4e12-9ed7-e06804ebdec8",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                {
                    "id": "54e4cb38-d564-4170-bbdf-6e40e98ef67b",
                    "modelName": "GMProxyFile",
                    "mvc": "1.0",
                    "TargetMask": 1,
                    "proxyName": "libFMODGMS.dylib"
                },
                {
                    "id": "3c3f20d1-01f6-4703-a09e-450eac6f53e0",
                    "modelName": "GMProxyFile",
                    "mvc": "1.0",
                    "TargetMask": 7,
                    "proxyName": "libfmodgms.so"
                }
            ],
            "constants": [
                {
                    "id": "b3ce2281-1e84-4d3f-a8da-804a583ca5fa",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_LOOPPOINT_START",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "bf67b5a1-9ff2-4952-820a-7516c3f7b59f",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_LOOPPOINT_END",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "8d261a9a-6843-4e90-8b2f-14bdf15a3ec6",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_UNKNOWN",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "cf45dbe2-511e-4177-bd1b-ad5cf914cd4b",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_AIFF",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "8eeff441-e3bf-4eab-bf8b-8468a8931b2f",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_ASF",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "b682d4a0-5b4f-4c70-aa3c-ec5653ace068",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_DLS",
                    "hidden": false,
                    "value": "3"
                },
                {
                    "id": "287e42bb-f66c-4160-80bf-dea3abb7af25",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_FLAC",
                    "hidden": false,
                    "value": "4"
                },
                {
                    "id": "66581f8b-abe7-4447-9e8f-0e24e4afc8c5",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_FSB",
                    "hidden": false,
                    "value": "5"
                },
                {
                    "id": "067bc785-ceb7-465a-bc1a-167acf8fdb48",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_IT",
                    "hidden": false,
                    "value": "6"
                },
                {
                    "id": "a7c3b590-11e3-45b1-9706-e79e35cbc1a2",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_MIDI",
                    "hidden": false,
                    "value": "7"
                },
                {
                    "id": "836fa573-a588-46c3-a7f4-a9ab51db35f3",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_MOD",
                    "hidden": false,
                    "value": "8"
                },
                {
                    "id": "a6df1aeb-e165-487e-9b25-cd1201785613",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_MPEG",
                    "hidden": false,
                    "value": "9"
                },
                {
                    "id": "0017387a-91b9-43d0-a9d3-f37e844dc6c3",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_OGGVORBIS",
                    "hidden": false,
                    "value": "10"
                },
                {
                    "id": "309e58bb-88b5-440a-b707-5943a88c5a6c",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_PLAYLIST",
                    "hidden": false,
                    "value": "11"
                },
                {
                    "id": "decc3bcb-f7fa-45e7-8870-6ae637f9e9e4",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_RAW",
                    "hidden": false,
                    "value": "12"
                },
                {
                    "id": "da3b4a4f-2687-4e52-b491-0d7a9f72d96d",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_S3M",
                    "hidden": false,
                    "value": "13"
                },
                {
                    "id": "fc158a67-63aa-4cdd-bd30-eb43e2587bd4",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_USER",
                    "hidden": false,
                    "value": "14"
                },
                {
                    "id": "74e611ba-b318-446b-ab25-2600090ba358",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_WAV",
                    "hidden": false,
                    "value": "15"
                },
                {
                    "id": "b8e52b7d-90ad-4d1b-952d-aea29f8b45ce",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_XM",
                    "hidden": false,
                    "value": "16"
                },
                {
                    "id": "4d0bad28-1536-44ec-8e6c-a8550bea04c2",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_XMA",
                    "hidden": false,
                    "value": "17"
                },
                {
                    "id": "8e57b561-542c-4551-87ac-2fdf3a6348e6",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_AUDIOQUEUE",
                    "hidden": false,
                    "value": "18"
                },
                {
                    "id": "6da69a36-cd76-4393-af42-f959803376ab",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_AT9",
                    "hidden": false,
                    "value": "19"
                },
                {
                    "id": "1f38f47c-31b6-43e0-9a3d-91a849a4d114",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_VORBIS",
                    "hidden": false,
                    "value": "20"
                },
                {
                    "id": "39a73357-2095-47f1-a106-bc5e0a27b95a",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_MEDIA_FOUNDATION",
                    "hidden": false,
                    "value": "21"
                },
                {
                    "id": "15c9219b-4870-48c5-a153-bcba43d62d2b",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_MEDIA_CODEC",
                    "hidden": false,
                    "value": "22"
                },
                {
                    "id": "d6b4ce1f-895d-462a-a8ac-853904c26eac",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_FADPCM",
                    "hidden": false,
                    "value": "23"
                },
                {
                    "id": "512f70f8-2aa5-4cbf-9691-ee49011d45d8",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_SOUND_TYPE_MAX",
                    "hidden": false,
                    "value": "24"
                },
                {
                    "id": "1c6e7d00-41d8-4fd2-8c5d-d28dc99c0a8d",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGDATATYPE_BINARY",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "acee449c-1546-4eaf-9d4a-79052baa4e29",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGDATATYPE_INT",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "4987c83a-3bb6-4ceb-adde-423a7a66c16a",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGDATATYPE_FLOAT",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "13bdf843-826c-4642-9fee-74874f2e87c8",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGDATATYPE_STRING",
                    "hidden": false,
                    "value": "3"
                },
                {
                    "id": "21ce67c9-b1ee-4b6b-b140-898a09b9f69f",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGDATATYPE_STRING_UTF16",
                    "hidden": false,
                    "value": "4"
                },
                {
                    "id": "0309ab33-0b77-4b68-b8a7-303ef8d18ef1",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGDATATYPE_STRING_UTF16BE",
                    "hidden": false,
                    "value": "5"
                },
                {
                    "id": "93c0bf99-0808-477a-b9f5-01c6ade8768b",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGDATATYPE_STRING_UTF8",
                    "hidden": false,
                    "value": "6"
                },
                {
                    "id": "19649b29-6686-443a-b971-3f6f13dbf14e",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGDATATYPE_CDTOC",
                    "hidden": false,
                    "value": "7"
                },
                {
                    "id": "8e551dc3-710f-45b2-adb8-9c8ddb806c18",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGDATATYPE_MAX",
                    "hidden": false,
                    "value": "8"
                },
                {
                    "id": "20e22fe2-195c-4726-bd4b-ffbecbc07c6c",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGTYPE_ID3V1",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "a225f942-913c-4e5d-a7f0-23e07a778e91",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGTYPE_ID3V2",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "ed348005-b7f7-4178-88ff-9255b890f5b7",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGTYPE_VORBISCOMMENT",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "475ee516-2e5a-4199-a35f-7b255bc53b43",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGTYPE_SHOUTCAST",
                    "hidden": false,
                    "value": "3"
                },
                {
                    "id": "063084f5-cdf3-4e76-a7b5-517c3714fa00",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGTYPE_ICECAST",
                    "hidden": false,
                    "value": "4"
                },
                {
                    "id": "d6e380c5-87fc-45ce-ad22-0c4b9a7c795c",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGTYPE_ASF",
                    "hidden": false,
                    "value": "5"
                },
                {
                    "id": "84866382-065a-4b87-865b-6b814c51ebac",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGTYPE_MIDI",
                    "hidden": false,
                    "value": "6"
                },
                {
                    "id": "1ef48449-fcb8-449e-9750-5a1c4e59c1e8",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGTYPE_PLAYLIST",
                    "hidden": false,
                    "value": "7"
                },
                {
                    "id": "ad826aaf-436b-4410-916c-21baba926267",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGTYPE_FMOD",
                    "hidden": false,
                    "value": "8"
                },
                {
                    "id": "12d06e7b-5cb2-4afd-8b6d-31ffefd0b7bb",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGTYPE_USER",
                    "hidden": false,
                    "value": "9"
                },
                {
                    "id": "9bdd02c8-35b9-4440-982a-efd8fa0a1503",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_TAGTYPE_MAX",
                    "hidden": false,
                    "value": "10"
                },
                {
                    "id": "a90604c7-0d1e-4dfe-9158-25fd3788e147",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_LOOPMODE_NONE",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "827191bd-ffe9-4b58-9865-85204487261f",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_LOOPMODE_NORMAL",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "70a88fc8-ef88-4375-ba81-e1028f0b52e1",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_LOOPMODE_BIDI",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "0000d275-1c71-487a-85f1-92adff1ab25a",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_EFFECT_LOWPASS",
                    "hidden": false,
                    "value": "3"
                },
                {
                    "id": "3bb518f0-d743-4ed5-99d8-d0942f515ff9",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_EFFECT_HIGHPASS",
                    "hidden": false,
                    "value": "5"
                },
                {
                    "id": "e87327e0-b9d7-4926-bd9f-1b3cb2c02f3a",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_EFFECT_ECHO",
                    "hidden": false,
                    "value": "6"
                },
                {
                    "id": "0d91a38d-ff96-4603-8252-329d7872fafc",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_EFFECT_FLANGE",
                    "hidden": false,
                    "value": "8"
                },
                {
                    "id": "2414f123-826a-44db-a960-02a40197bccb",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_EFFECT_DISTORTION",
                    "hidden": false,
                    "value": "9"
                },
                {
                    "id": "4ab5b09e-ab4c-40fc-bf55-411baa21f4bf",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_EFFECT_CHORUS",
                    "hidden": false,
                    "value": "14"
                },
                {
                    "id": "d4de1cc9-9e2b-4f4a-bd98-bbbebad46030",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_EFFECT_REVERB",
                    "hidden": false,
                    "value": "19"
                },
                {
                    "id": "9387a7f8-912f-4ab8-9b2d-7f1ff78be79c",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_EFFECT_TREMOLO",
                    "hidden": false,
                    "value": "22"
                },
                {
                    "id": "7cef887a-7c86-434d-a1f6-389bd74096b2",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_EFFECT_PITCHSHIFT",
                    "hidden": false,
                    "value": "13"
                },
                {
                    "id": "2d9aaec6-46b6-4b7f-8469-3dd59371a7a8",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_AUTODETECT",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "418a2968-2e94-4e0a-ae09-d559a1b36970",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_UNKNOWN",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "e89fa35f-c419-4b44-a138-cf0c3cfd33e6",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_NOSOUND",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "9f54a055-a141-4949-965f-ac72ac8e90d6",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_WAVWRITER",
                    "hidden": false,
                    "value": "3"
                },
                {
                    "id": "cf92dc04-eb66-469c-b624-ced77b1a1bb4",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_NOSOUND_NRT",
                    "hidden": false,
                    "value": "4"
                },
                {
                    "id": "af9cf4d9-8a07-454d-ab7d-d1106be789a9",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_WAVWRITER_NRT",
                    "hidden": false,
                    "value": "5"
                },
                {
                    "id": "ffa5fa0f-1294-494c-86fe-adad2fbdfafe",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_DSOUND",
                    "hidden": false,
                    "value": "6"
                },
                {
                    "id": "7f084b1d-733e-410d-bf9b-577f1340cbe9",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_WINMM",
                    "hidden": false,
                    "value": "7"
                },
                {
                    "id": "02c2d555-e3bf-462f-8335-16672e0c4350",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_WASAPI",
                    "hidden": false,
                    "value": "8"
                },
                {
                    "id": "31015a42-4c09-4a47-9d4f-09af7daabffe",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_ASIO",
                    "hidden": false,
                    "value": "9"
                },
                {
                    "id": "75c1fe30-ba67-4b7c-8c31-33a85f3fc16f",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_PULSEAUDIO",
                    "hidden": false,
                    "value": "10"
                },
                {
                    "id": "0d298b79-c657-46cd-82d9-7fa108a6bcbf",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_ALSA",
                    "hidden": false,
                    "value": "11"
                },
                {
                    "id": "32905b16-9a6f-42e4-bbdd-c005e17e8ed6",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_COREAUDIO",
                    "hidden": false,
                    "value": "12"
                },
                {
                    "id": "ceb8b0a0-0842-47da-a207-c5110f0df79e",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_XAUDIO",
                    "hidden": false,
                    "value": "13"
                },
                {
                    "id": "1a53ab41-a94e-40e0-9c7f-7664ad56f173",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_PS3",
                    "hidden": false,
                    "value": "14"
                },
                {
                    "id": "8ac1f5ce-0285-4457-972f-355bfe4148cc",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_AUDIOTRACK",
                    "hidden": false,
                    "value": "15"
                },
                {
                    "id": "c04c2f45-d497-4a75-ada8-5d587c0b87b6",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_OPENSL",
                    "hidden": false,
                    "value": "16"
                },
                {
                    "id": "5bfb1294-fd82-4f77-af00-5a5fc62894eb",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_WIIU",
                    "hidden": false,
                    "value": "17"
                },
                {
                    "id": "efb8baac-c213-4a7b-953e-7cbb71ef940f",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_AUDIOOUT",
                    "hidden": false,
                    "value": "18"
                },
                {
                    "id": "0c08727e-261d-4048-8fe9-aaab66249f2d",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_AUDIO3D",
                    "hidden": false,
                    "value": "19"
                },
                {
                    "id": "daecc6cc-28c3-45b4-96eb-a9ec49fdb69a",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_ATMOS",
                    "hidden": false,
                    "value": "20"
                },
                {
                    "id": "5a017481-1810-405c-b7af-471a0c22b2d2",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "FMODGMS_OUTPUTTYPE_MAX",
                    "hidden": false,
                    "value": "21"
                }
            ],
            "copyToTargets": 202375362,
            "filename": "FMODGMS.dll",
            "final": "",
            "functions": [
                {
                    "id": "f302400c-335c-4403-acc5-116c828653e3",
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
                    "id": "5127c556-ca14-48de-a14d-9b7080353093",
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
                    "id": "2b2b00ca-4a6d-4647-952e-e72dace07f99",
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
                    "id": "d6b798f7-2566-4b16-bb99-d57a41dde6a5",
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
                    "id": "3cdbc6e2-0905-4cbe-89f6-69f8bf9df8e3",
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
                    "id": "03cdb9ae-9ec0-4f4c-911e-069b26b7f140",
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
                    "id": "8542d640-eee9-45e7-ac9a-385db72949b4",
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
                    "id": "28f4513a-c36a-4e19-a1ee-7670664fa36f",
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
                    "id": "265f3aeb-5530-4687-8869-b91fca5a3c05",
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
                    "id": "ef07ec46-8162-46fc-9b5c-9cdf6108bb02",
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
                    "id": "5215430e-6407-46bd-8a56-4e532b7fac8a",
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
                    "id": "b150a8f3-abce-432a-a64b-6ffc62e04ba4",
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
                    "id": "838d3131-8b8b-4512-b5da-6a7e41d9419a",
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
                    "id": "0f45267b-647c-40a6-aeca-f2a120725b37",
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
                    "id": "ebd2ccf5-ba19-4f29-b531-8fdcdeddfe9e",
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
                    "id": "168a7959-1a1a-40d9-8876-2b2adce4fab2",
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
                    "id": "99a5e6f5-a981-4fe8-b3f1-fd3feaded796",
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
                    "id": "3c73a1ad-8207-42f2-a412-c261e3401818",
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
                    "id": "122aa20e-a195-4cca-964d-8c1999ce5621",
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
                    "id": "64a09e05-d6fe-41d9-a32b-73a77ec9b1d2",
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
                    "id": "bb42fb1f-42d1-4158-8478-dfa87393c78a",
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
                    "id": "682fa418-9d60-45d1-b857-3516fb1c77e5",
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
                    "id": "c9876d04-ed10-4e4b-a7f1-1c0637c9a63f",
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
                    "id": "cd81da21-8d2e-406e-aedc-16fd69f89ce4",
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
                    "id": "af0f4c14-8ad8-4eb8-b38e-18faba74f979",
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
                    "id": "70aa9e20-be1b-4e8e-8c8c-5d17c2d3d6ee",
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
                    "id": "ba077dd3-150a-48be-bf98-f6e2692c10e3",
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
                    "id": "9e83c3f8-92aa-4b28-8326-4890697195ec",
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
                    "id": "de50ce4e-2034-45ba-8d2a-9bf0de86281c",
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
                    "id": "0c90587a-bb88-4c7b-ba61-afb6c567458e",
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
                    "id": "e893e06b-418a-43e8-878c-b845631459a6",
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
                    "id": "afabc1f8-0c74-4706-918f-4712e29671b8",
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
                    "id": "4bfce83d-2d35-4adb-916b-e0649341f1ac",
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
                    "id": "03ac2bc4-a5b9-40a8-bf0c-42b87d109853",
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
                    "id": "4cc3b5b4-40bf-4ade-b800-1aebc86e082d",
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
                    "id": "9186c3d7-6526-4a42-8759-8265d3fd6396",
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
                    "id": "976d66c4-b963-46ad-bdec-96804c1e8ccc",
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
                    "id": "023dbbeb-5720-4da1-b302-6e195a0380f9",
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
                    "id": "b86284ff-dc66-472f-a40a-c2e989321a6c",
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
                    "id": "854f4aa5-cb47-407a-a875-24cb6335764e",
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
                    "id": "d746dcd5-8ebb-40d1-9377-bbe592e96eae",
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
                    "id": "c24bebf3-6dd1-44da-8f3a-f22eab7b20bd",
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
                    "id": "8e4249c2-d208-4c08-849c-42dddc1c9856",
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
                    "id": "a55e47dc-a6e9-40c1-8cef-aabd169ddc87",
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
                    "id": "5fe2e10b-0dd5-4fed-bdfc-af2da69e5059",
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
                    "id": "43d6b719-835c-469b-9833-b459ae660b98",
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
                    "id": "0460c7b8-dec6-4960-82d3-d567d6b76b9e",
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
                    "id": "efd13cab-6f97-4e14-b71d-dedaed682be5",
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
                    "id": "24682855-d02d-445b-be14-571b3c0bdcbd",
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
                    "id": "c696f205-5d92-4405-8458-738769466fd8",
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
                    "id": "11321747-cec6-46ba-b4d5-c269b1128183",
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
                    "id": "ec6dc973-fa36-4b04-940d-53188114fead",
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
                    "id": "8acd38d0-d93a-4245-b6c6-419ea3a59d11",
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
                    "id": "829cc23d-7c13-4389-b799-19d00799e80e",
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
                    "id": "537609c1-98f5-4938-b219-37ba5e6c09fc",
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
                    "id": "6467c5e5-a5ad-41c3-8fd6-cd4720e65b1a",
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
                    "id": "d0e0d97d-60a0-4171-92e8-146700cc1e62",
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
                    "id": "c97aec1b-7f28-429e-816a-8908b7926292",
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
                    "id": "67117eef-df50-4933-893b-8ae8965d62e3",
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
                    "id": "e42c1c3c-dbd3-4f7d-af5c-863e4dd24703",
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
                    "id": "7eaf6d7a-c5e3-429f-ac6d-56bedcd2e352",
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
                    "id": "04413ead-4879-490d-a5ce-8b0c44551a2c",
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
                    "id": "7607787e-5706-43c8-a17e-c91da0ba2b12",
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
                    "id": "4242796b-1103-4b71-9b2c-c0916220a00f",
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
                    "id": "e482b8f5-4d2c-4e64-b2df-50258b93c1ad",
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
                    "id": "23e4b156-dcb1-49d2-a104-2b1129fb3f9f",
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
                    "id": "cca17441-7d2d-45e9-85a3-1cafe0e9715a",
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
                    "id": "c40a62f4-fc37-4169-85de-a0a5b9ade554",
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
                    "id": "f3f127ee-8446-407d-84a3-963674209bae",
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
                    "id": "71c49393-9c49-494d-a3f7-9336e720400f",
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
                    "id": "87019c66-6eef-4264-bfe4-67c06a31239a",
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
                    "id": "742f5861-0bbd-4bbd-8864-0df3d9790a66",
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
                    "id": "3e5b1854-abc5-4ea7-ac3e-26f5dc5e5f51",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "FMODGMS_Snd_Set_DLS",
                    "help": "FMODGMS_Snd_Set_DLS(filename)",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Snd_Set_DLS",
                    "returnType": 2
                },
                {
                    "id": "a493d888-c235-4791-812b-754608781690",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "FMODGMS_Snd_Remove_DLS",
                    "help": "FMODGMS_Snd_Remove_DLS()",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Snd_Remove_DLS",
                    "returnType": 2
                },
                {
                    "id": "55c61bc5-8339-42ec-83fb-c37cad5ebc7f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "FMODGMS_Snd_Get_DLS",
                    "help": "FMODGMS_Snd_Get_DLS()",
                    "hidden": false,
                    "kind": 12,
                    "name": "FMODGMS_Snd_Get_DLS",
                    "returnType": 1
                }
            ],
            "init": "",
            "kind": 1,
            "order": [
                "f302400c-335c-4403-acc5-116c828653e3",
                "5127c556-ca14-48de-a14d-9b7080353093",
                "2b2b00ca-4a6d-4647-952e-e72dace07f99",
                "d6b798f7-2566-4b16-bb99-d57a41dde6a5",
                "3cdbc6e2-0905-4cbe-89f6-69f8bf9df8e3",
                "03cdb9ae-9ec0-4f4c-911e-069b26b7f140",
                "8542d640-eee9-45e7-ac9a-385db72949b4",
                "28f4513a-c36a-4e19-a1ee-7670664fa36f",
                "265f3aeb-5530-4687-8869-b91fca5a3c05",
                "ef07ec46-8162-46fc-9b5c-9cdf6108bb02",
                "5215430e-6407-46bd-8a56-4e532b7fac8a",
                "b150a8f3-abce-432a-a64b-6ffc62e04ba4",
                "838d3131-8b8b-4512-b5da-6a7e41d9419a",
                "0f45267b-647c-40a6-aeca-f2a120725b37",
                "ebd2ccf5-ba19-4f29-b531-8fdcdeddfe9e",
                "168a7959-1a1a-40d9-8876-2b2adce4fab2",
                "99a5e6f5-a981-4fe8-b3f1-fd3feaded796",
                "3c73a1ad-8207-42f2-a412-c261e3401818",
                "122aa20e-a195-4cca-964d-8c1999ce5621",
                "64a09e05-d6fe-41d9-a32b-73a77ec9b1d2",
                "bb42fb1f-42d1-4158-8478-dfa87393c78a",
                "682fa418-9d60-45d1-b857-3516fb1c77e5",
                "c9876d04-ed10-4e4b-a7f1-1c0637c9a63f",
                "cd81da21-8d2e-406e-aedc-16fd69f89ce4",
                "af0f4c14-8ad8-4eb8-b38e-18faba74f979",
                "70aa9e20-be1b-4e8e-8c8c-5d17c2d3d6ee",
                "ba077dd3-150a-48be-bf98-f6e2692c10e3",
                "9e83c3f8-92aa-4b28-8326-4890697195ec",
                "de50ce4e-2034-45ba-8d2a-9bf0de86281c",
                "0c90587a-bb88-4c7b-ba61-afb6c567458e",
                "e893e06b-418a-43e8-878c-b845631459a6",
                "afabc1f8-0c74-4706-918f-4712e29671b8",
                "4bfce83d-2d35-4adb-916b-e0649341f1ac",
                "03ac2bc4-a5b9-40a8-bf0c-42b87d109853",
                "4cc3b5b4-40bf-4ade-b800-1aebc86e082d",
                "9186c3d7-6526-4a42-8759-8265d3fd6396",
                "976d66c4-b963-46ad-bdec-96804c1e8ccc",
                "023dbbeb-5720-4da1-b302-6e195a0380f9",
                "b86284ff-dc66-472f-a40a-c2e989321a6c",
                "854f4aa5-cb47-407a-a875-24cb6335764e",
                "d746dcd5-8ebb-40d1-9377-bbe592e96eae",
                "c24bebf3-6dd1-44da-8f3a-f22eab7b20bd",
                "8e4249c2-d208-4c08-849c-42dddc1c9856",
                "a55e47dc-a6e9-40c1-8cef-aabd169ddc87",
                "5fe2e10b-0dd5-4fed-bdfc-af2da69e5059",
                "43d6b719-835c-469b-9833-b459ae660b98",
                "0460c7b8-dec6-4960-82d3-d567d6b76b9e",
                "efd13cab-6f97-4e14-b71d-dedaed682be5",
                "24682855-d02d-445b-be14-571b3c0bdcbd",
                "c696f205-5d92-4405-8458-738769466fd8",
                "11321747-cec6-46ba-b4d5-c269b1128183",
                "ec6dc973-fa36-4b04-940d-53188114fead",
                "8acd38d0-d93a-4245-b6c6-419ea3a59d11",
                "829cc23d-7c13-4389-b799-19d00799e80e",
                "537609c1-98f5-4938-b219-37ba5e6c09fc",
                "6467c5e5-a5ad-41c3-8fd6-cd4720e65b1a",
                "d0e0d97d-60a0-4171-92e8-146700cc1e62",
                "c97aec1b-7f28-429e-816a-8908b7926292",
                "67117eef-df50-4933-893b-8ae8965d62e3",
                "e42c1c3c-dbd3-4f7d-af5c-863e4dd24703",
                "7eaf6d7a-c5e3-429f-ac6d-56bedcd2e352",
                "04413ead-4879-490d-a5ce-8b0c44551a2c",
                "7607787e-5706-43c8-a17e-c91da0ba2b12",
                "4242796b-1103-4b71-9b2c-c0916220a00f",
                "e482b8f5-4d2c-4e64-b2df-50258b93c1ad",
                "23e4b156-dcb1-49d2-a104-2b1129fb3f9f",
                "cca17441-7d2d-45e9-85a3-1cafe0e9715a",
                "c40a62f4-fc37-4169-85de-a0a5b9ade554",
                "f3f127ee-8446-407d-84a3-963674209bae",
                "71c49393-9c49-494d-a3f7-9336e720400f",
                "87019c66-6eef-4264-bfe4-67c06a31239a",
                "742f5861-0bbd-4bbd-8864-0df3d9790a66",
                "3e5b1854-abc5-4ea7-ac3e-26f5dc5e5f51",
                "a493d888-c235-4791-812b-754608781690",
                "55c61bc5-8339-42ec-83fb-c37cad5ebc7f"
            ],
            "origname": "extensions\\FMODGMS.dll",
            "uncompress": false
        },
        {
            "id": "29dbd626-c802-4139-8162-8b6c6a2853e8",
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
            "id": "2921ec09-f48d-4a47-ab45-ae1ca462ae1c",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 128,
            "filename": "libfmod.so.10",
            "final": "",
            "functions": [
                
            ],
            "init": "",
            "kind": 4,
            "order": [
                
            ],
            "origname": "",
            "uncompress": false
        },
        {
            "id": "3cc408a4-0915-476c-883a-f1ebd30ced24",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": -1,
            "filename": "libfmod.dylib",
            "final": "",
            "functions": [
                
            ],
            "init": "",
            "kind": 1,
            "order": [
                
            ],
            "origname": "",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": true,
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
    "version": "0.10.0"
}