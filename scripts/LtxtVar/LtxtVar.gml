// Feather disable all

/// Creates an Ltxt struct made from a reference to a dynamic value stored in either an instance
/// or struct, or an array. This function return the Ltxt struct that is made.
/// 
/// @param scope
/// @param variableOrIndex

function LtxtVar(_scope, _variableOrIndex)
{
    if (is_struct(_scope))
    {
        if (not is_string(_variableOrIndex))
        {
            __LtxtError($"`variableOrIndex` must be a string if the scope is an instance/struct (typeof = {typeof(_variableOrIndex)})");
        }
        
        return new __LtxtClass(__LtxtOpStruct(_scope, _variableOrIndex));
    }
    else if (instance_exists(_scope))
    {
        if (not is_string(_variableOrIndex))
        {
            __LtxtError($"`variableOrIndex` must be a string if the scope is an instance/struct (typeof = {typeof(_variableOrIndex)})");
        }
        
        return new __LtxtClass(__LtxtOpStruct(_scope, _variableOrIndex));
    }
    else if (is_array(_scope))
    {
        if (not is_numeric(_variableOrIndex))
        {
            __LtxtError($"`variableOrIndex` must be numeric if the scope is an array (typeof = {typeof(_variableOrIndex)})");
        }
        
        return new __LtxtClass(__LtxtOpArray(_scope, _variableOrIndex));
    }
    else
    {
        __LtxtError($"Scope must be a instance/struct or an array (typeof = {typeof(_scope)})");
    }
}