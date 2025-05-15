// Feather disable all

/// Creates an Ltxt struct using a stringified constant value, and returns it.
/// 
/// @param value

function LtxtConst(_value)
{
    if (not LTXT_RELEASE_MODE)
    {
        if (is_struct(_value) && is_instanceof(_value, __LtxtClass))
        {
            __LtxtError("`LtxtConst()` must not be used with an Ltxt struct");
        }
    }
    
    return new __LtxtClass(__LtxtOpConst(_value));
}