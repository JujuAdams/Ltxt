// Feather disable all

/// Creates an Ltxt struct using a specially formatted string.
/// 
/// @param string

function LtxtParse(_string)
{
    static _tag = chr(LTXT_KEY_TAG_CHAR_1) + chr(LTXT_KEY_TAG_CHAR_2);
    
    var _array = string_split(_string, _tag, false);
    _array[@ 0] = __LtxtOpConst(_array[0]);
    
    var _i = 1;
    repeat(array_length(_array)-1)
    {
        var _tagPrefixedString = _array[_i];
        
        var _pos = string_pos(" ", _tagPrefixedString);
        if (_pos > 0)
        {
            if (LTXT_TRIM_KEY_TAG)
            {
                _array[@ _i] = __LtxtOpKey(string_copy(_tagPrefixedString, 1, _pos-1));
            }
            else
            {
                _array[@ _i] = __LtxtOpKey(_tag + string_copy(_tagPrefixedString, 1, _pos-1));
            }
            
            ++_i;
            _array[@ _i] = __LtxtOpConst(string_delete(_tagPrefixedString, 1, _pos-1));
        }
        else
        {
            _array[@ _i] = __LtxtOpKey(_tagPrefixedString);
        }
        
        ++_i;
    }
    
    return new __LtxtClass(__LtxtOpConcatArray(_array));
}