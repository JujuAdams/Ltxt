// Feather disable all

/// @param x
/// @param y
/// @param ltxt
/// @param sep
/// @param w

function DrawLtxtExt(_x, _y, _ltxt, _sep, _w)
{
    if (is_undefined(_ltxt)) return;
    
    __LTXT_CONVERT
    
    return draw_text_ext(_x, _y, string(_ltxt), _sep, _w);
}