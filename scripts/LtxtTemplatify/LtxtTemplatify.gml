// Feather disable all

/// @param ltxt
/// @param [oldSubstring]
/// @param [newSubstring]
/// @param ...

function LtxtTemplatify(_ltxt)
{
    if (_ltxt == undefined) return "";
    
    __LTXT_CONVERT
    
    var _string = string(_ltxt);
    
    var _i = 1;
    repeat((argument_count-1) div 2)
    {
        _string = string_replace_all(_string, argument[_i], argument[_i+1]);
        _i += 2;
    }
    
    return _string;
}