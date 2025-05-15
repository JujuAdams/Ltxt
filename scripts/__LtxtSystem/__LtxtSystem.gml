// Feather disable all

#macro __LTXT_CONVERT  if (is_string(_ltxt))\
                       {\
                           if ((string_byte_at(_ltxt, 1) == LTXT_KEY_TAG_CHAR_1) && (string_byte_at(_ltxt, 2) == LTXT_KEY_TAG_CHAR_2))\
                           {\
                               if (LTXT_TRIM_KEY_TAG)\
                               {\
                                   _ltxt = string_delete(_ltxt, 1, 2);\
                               }\
                           }\
                           else\
                           {\
                               if (LTXT_STRICT_REQUIRE_TAG)\
                               {\
                                   __LtxtError("String passed to function wasn't a localization key");\
                               }\
                           }\
                           var _func = LTXT_LOCALIZE_FUNC;\
                           _ltxt = _func(_ltxt);\
                       }

__LtxtSystem();
function __LtxtSystem()
{
    if (not is_callable(LTXT_LOCALIZE_FUNC))
    {
        __LtxtError("Config macro `LTXT_LOCALIZE_FUNC` must be set to a callable function");
    }
}