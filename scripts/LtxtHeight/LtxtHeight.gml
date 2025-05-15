// Feather disable all

/// @param ltxt

function LtxtHeight(_ltxt)
{
    if (is_undefined(_ltxt)) return 0;
    
    __LTXT_CONVERT
    
    return string_height(string(_ltxt));
}