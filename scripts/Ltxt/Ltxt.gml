// Feather disable all

/// Creates an Ltxt struct using the contents of a localization key, and returns it.
/// 
/// @param locKey

function Ltxt(_key)
{
    if (not is_string(_key))
    {
        if (LTXT_RELEASE_MODE)
        {
             return new __LtxtClass(__LtxtOpConst(""));
        }
        else
        {
            __LtxtError($"Localization key must be a string (typeof = {typeof(_key)})");
        }
    }
    
    if ((not LTXT_RELEASE_MODE) && LTXT_STRICT_NO_SPACES)
    {
        if (string_pos(" ", _key) > 0)
        {
            __LtxtError($"Localization key must not contain spaces (key was \"{_key}\")");
        }
    }
    
    if ((string_byte_at(_key, 1) == LTXT_KEY_TAG_CHAR_1) && (string_byte_at(_key, 2) == LTXT_KEY_TAG_CHAR_2))
    {
        if (LTXT_TRIM_KEY_TAG)
        {
            _key = string_delete(_key, 1, 2);
        }
    }
    else
    {
        if (LTXT_STRICT_REQUIRE_TAG)
        {
            if (LTXT_RELEASE_MODE)
            {
                return new __LtxtClass(__LtxtOpConst(""));
            }
            else
            {
                __LtxtError($"Localization key must begin with {chr(LTXT_KEY_TAG_CHAR_1)}{chr(LTXT_KEY_TAG_CHAR_2)} (key was \"{_key}\")");
            }
        }
    }
    
    return new __LtxtClass(__LtxtOpKey(_key));
}