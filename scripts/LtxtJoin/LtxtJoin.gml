// Feather disable all

/// Creates an Ltxt struct made from the concatenated values passed into the function, and returns
/// the Ltxt struct. Values are separated by the `delimiter` value. Values are presumed to be
/// constants unless strings begin with a localization tag (by default, L@).
/// 
/// @param delim
/// @param arg0
/// @param arg1

function LtxtJoin(_delimiter)
{
    if (argument_count <= 1)
    {
        return new __LtxtClass(__LtxtOpConst(""));
    }
    else if (argument_count == 2)
    {
        return new __LtxtClass(__LtxtCreateOpFromString(argument[1]));
    }
    else
    {
        var _array = array_create(argument_count-1, undefined);
        var _i = 0;
        repeat(argument_count-1)
        {
            _array[@ _i] = __LtxtCreateOpFromString(argument[_i+1]);
            ++_i;
        }
        
        var _delimiterOp = __LtxtCreateOpFromString(_delimiter);
        
        var _i = argument_count-2;
        repeat(argument_count-2)
        {
            array_insert(_array, _i, _delimiterOp);
            --_i;
        }
        
        return new __LtxtClass(__LtxtOpConcatArray(_array));
    }
}