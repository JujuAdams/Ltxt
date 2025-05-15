// Feather disable all

/// Creates an Ltxt struct made from a dynamic value returned by a method (or function). This
/// function returns an Ltxt struct. The method provided to this function must return a string or
/// the application will crash.
/// 
/// @param method

function LtxtFunc(_method)
{
    return new __LtxtClass(_method);
}