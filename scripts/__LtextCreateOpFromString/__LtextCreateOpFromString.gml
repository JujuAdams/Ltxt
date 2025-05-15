// Feather disable all

/// @param value

function __LtxtCreateOpFromString(_value)
{
    if (is_string(_value))
    {
        if ((string_byte_at(_value, 1) == LTXT_KEY_TAG_CHAR_1) && (string_byte_at(_value, 2) == LTXT_KEY_TAG_CHAR_2))
        {
            if (LTXT_TRIM_KEY_TAG)
            {
                return __LtxtOpKey(string_delete(_value, 1, 2));
            }
            else
            {
                return __LtxtOpKey(_value);
            }
        }
        else
        {
            return __LtxtOpConst(_value);
        }
    }
    else
    {
        if (is_struct(_value) && is_instanceof(_value, Ltxt))
        {
            return variable_clone(_value.toString);
        }
        else
        {
            return __LtxtOpConst(string(_value));
        }
    }
}