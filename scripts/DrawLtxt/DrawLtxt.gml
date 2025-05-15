// Feather disable all

/// @param x
/// @param y
/// @param ltxt

function DrawLtxt(_x, _y, _ltxt)
{
    if (is_undefined(_ltxt)) return;
    
    __LTXT_CONVERT
    
    return draw_text(_x, _y, string(_ltxt));
}