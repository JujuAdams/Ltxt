// Feather disable all

/// @param ltxt

function LtxtWidth(_ltxt)
{
    if (is_undefined(_ltxt)) return 0;
    
    __LTXT_CONVERT
    
    return string_width(string(_ltxt));
}