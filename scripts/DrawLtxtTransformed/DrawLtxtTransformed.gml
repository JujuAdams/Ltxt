// Feather disable all

/// @param x
/// @param y
/// @param ltxt
/// @param xscale
/// @param yscale
/// @param angle

function DrawLtxtTransformed(_x, _y, _ltxt, _xScale, _yScale, _angle)
{
    if (is_undefined(_ltxt)) return;
    
    __LTXT_CONVERT
    
    return draw_text_transformed(_x, _y, string(_ltxt), _xScale, _yScale, _angle);
}