// Feather disable all

var _x = 10;
var _y = 10;

var _i = 0;
repeat(array_length(array))
{
    var _ltxt = array[_i];
    DrawLtxt(_x, _y, _ltxt);
    
    _y += LtxtHeight(_ltxt) + 20;
    ++_i;
}