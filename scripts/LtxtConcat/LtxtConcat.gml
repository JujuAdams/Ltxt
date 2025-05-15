// Feather disable all

/// Creates an Ltxt struct made from the concatenated values passed into the function, and returns
/// the Ltxt struct. Values are presumed to be constants unless strings begin with a localization
/// tag (by default, L@).
/// 
/// @param value
/// @param [value]
/// @param ...

function LtxtConcat()
{
    var _array = array_create(argument_count, undefined);
    
    var _i = 0;
    repeat(argument_count)
    {
        _array[@ _i] = __LtxtCreateOpFromString(argument[_i]);
        ++_i;
    }
    
    return new __LtxtClass(__LtxtOpConcatArray(_array));
}