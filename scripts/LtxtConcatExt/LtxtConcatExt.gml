// Feather disable all

/// Creates an Ltxt struct made from the concatenated values from the provided array, and returns
/// the Ltxt struct. Values are presumed to be constants unless strings begin with a localization
/// tag (by default, L@).
/// 
/// @param array
/// @param [destructive=false]

function LtxtConcatExt(_array, _destructive = false)
{
    if (_destructive)
    {
        array_map_ext(_array, __LtxtCreateOpFromString);
    }
    else
    {
        _array = array_map(_array, __LtxtCreateOpFromString);
    }
    
    return new __LtxtClass(__LtxtOpConcatArray(_array));
}