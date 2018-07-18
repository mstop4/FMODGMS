/// @description FMODGMS_Snd_TagDataTypeToString(tag_datatype_index)
/// @param tag_datatype_index
switch (argument[0])
{
    case FMODGMS_TAGDATATYPE_BINARY:
    return "Binary";
    break;
    
    case FMODGMS_TAGDATATYPE_INT:
    return "Int";
    break;
    
    case FMODGMS_TAGDATATYPE_FLOAT:
    return "Float";
    break;
    
    case FMODGMS_TAGDATATYPE_STRING:
    return "String";
    break;
    
    case FMODGMS_TAGDATATYPE_STRING_UTF16:
    return "String UTF-16";
    break;
    
    case FMODGMS_TAGDATATYPE_STRING_UTF16BE:
    return "String UTF-16BE";
    break;
    
    case FMODGMS_TAGDATATYPE_STRING_UTF8:
    return "String UTF-8";
    break;
    
    case FMODGMS_TAGDATATYPE_CDTOC:
    return "CD Table of Contents";
    break;
    
    case FMODGMS_TAGDATATYPE_MAX:
    return "Max Number of Data Types";
    break;
    
    default:
    return "Unknown Data Type";
}
