/// @description FMODGMS_Snd_TagTypeToString(tag_datatype_index)
/// @param tag_datatype_index
switch (argument[0])
{
case FMODGMS_TAGTYPE_ID3V1:
return "ID3v1 tag";
break;

case FMODGMS_TAGTYPE_ID3V2:
return "ID3v2 tag";
break;

case FMODGMS_TAGTYPE_VORBISCOMMENT:
return "Vorbis comment";
break;

case FMODGMS_TAGTYPE_SHOUTCAST:
return "Shoutcast tag";
break;

case FMODGMS_TAGTYPE_ICECAST:
return "Icecast tag";
break;

case FMODGMS_TAGTYPE_ASF:
return "ASF tag";
break;

case FMODGMS_TAGTYPE_MIDI:
return "MIDI tag";
break;

case FMODGMS_TAGTYPE_PLAYLIST:
return "Playlist tag";
break;

case FMODGMS_TAGTYPE_FMOD:
return "FMODGMS tag";
break;

case FMODGMS_TAGTYPE_USER:
return "User tag";
break;

case FMODGMS_TAGTYPE_MAX:
return "Max Number of Tag Types";
break;

default:
return "Unknown Tag Type";
}
