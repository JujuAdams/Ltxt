// Feather disable all

function __LtxtOpKey(_key)
{
    return method({
        __key: _key,
    },
    function()
    {
        return Localize(__key);
    });
}

function __LtxtOpConst(_string)
{
    return method({
        __string: _string,
    },
    function()
    {
        return __string;
    });
}

function __LtxtOpReplaceAll(_string, _oldString, _newString)
{
    return method({
        __string:    _string,
        __oldString: _oldString,
        __newString: _newString,
    },
    function()
    {
        return string_replace_all(__string(), __oldString(), __newString());
    });
}

function __LtxtOpConcat2(_a, _b)
{
    return method({
        __a: _a,
        __b: _b,
    },
    function()
    {
        return __a() + __b();
    });
}

function __LtxtOpConcatArray(_array)
{
    return method({
        __array: _array,
    },
    function()
    {
        static _bufferStack = [];
        
        var _buffer = array_pop(_bufferStack);
        if (_buffer == undefined)
        {
            _buffer = buffer_create(1024, buffer_grow, 1);
        }
        
        buffer_seek(_buffer, buffer_seek_start, 0);
        
        var _array = __array;
        var _i = 0;
        repeat(array_length(_array))
        {
            buffer_write(_buffer, buffer_text, _array[_i]());
            ++_i;
        }
        
        buffer_write(_buffer, buffer_u8, 0x00);
        var _string = buffer_peek(_buffer, 0, buffer_string);
        
        array_push(_bufferStack, _buffer);
        
        return _string;
    });
}

function __LtxtOpStruct(_struct, _variableName)
{
    var _hash = variable_get_hash(_variableName);
    
    return method({
        __weakRef:  weak_ref_create(_struct),
        __hash:     _hash,
        __oldValue: struct_get_from_hash(_struct, _hash),
    },
    function()
    {
        if (weak_ref_alive(__weakRef))
        {
            __oldValue = string(struct_get_from_hash(__weakRef.ref, __hash));
        }
        
        return __oldValue;
    });
}

function __LtxtOpArray(_array, _index)
{
    return method({
        __weakRef:  weak_ref_create({ __array: _array }),
        __index:    _index,
        __oldValue: string(_array[_index]),
    },
    function()
    {
        if (weak_ref_alive(__weakRef))
        {
            __oldValue = string(__weakRef.ref.__array[__index]);
        }
        
        return __oldValue;
    });
}