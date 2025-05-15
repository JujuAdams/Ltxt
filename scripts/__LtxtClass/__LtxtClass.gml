// Feather disable all

function __LtxtClass(_method) constructor
{
    toString = _method;
    
    
    
    static AddL = function(_value)
    {
        toString = __LtxtOpConcat2(__LtxtCreateOpFromString(_value), toString);
        
        return self;
    }
    
    static AddR = function(_value)
    {
        toString = __LtxtOpConcat2(toString, __LtxtCreateOpFromString(_value));
        
        return self;
    }
    
    static ReplaceAll = function(_oldString, _newString)
    {
        toString = __LtxtOpReplaceAll(toString, __LtxtCreateOpFromString(_oldString), __LtxtCreateOpFromString(_newString));
        
        return self;
    }
}