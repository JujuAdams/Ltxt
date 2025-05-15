// Feather disable all

/// Creates an Ltxt struct made from the concatenated values from the provided array, and returns
/// the Ltxt struct. Values are separated by the `delimiter` value. Values are presumed to be
/// constants unless strings begin with a localization tag (by default, L@).
/// 
/// @param delim
/// @param array
/// @param [destructive=false]

function LtxtJoinExt(_delimiter, _array, _destructive = false)
{
    if (_destructive)
    {
        array_map_ext(_array, __LtxtCreateOpFromString);
    }
    else
    {
        _array = array_map(_array, __LtxtCreateOpFromString);
    }
    
    var _delimiterOp = __LtxtCreateOpFromString(_delimiter);
    
    var _i = array_length(_array) - 1;
    repeat(array_length(_array) - 1)
    {
        array_insert(_array, _i, _delimiterOp);
        --_i;
    }
    
    return new __LtxtClass(__LtxtOpConcatArray(_array));
}