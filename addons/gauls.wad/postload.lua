descriptions = wl.Descriptions()

push_textdomain("gauls.wad", true)

-- For formatting time strings
include "tribes/scripting/help/time_strings.lua"

-- For lore texts
-- TRANSLATORS: Format string for a latin quote and its translation
quote_with_translation_format = pgettext("empire_lore", "‘%1%’<br>(%2%)")
function latin_lore(latin, translation)
   return quote_with_translation_format:bformat(latin, translation)
end

-- ------ --
-- Market --
-- ------ --

if get_build_id():find("1.2", 1, true) == nil then

wl.Descriptions():modify_unit("tribe", "gauls", "add_building", "gauls_market", { helptexts = { 
                  -- TRANSLATORS: Purpose help text for a Gallic production site: Market
                  purpose = pgettext("gauls_building", "A market enables trading with other tribes."),
               }})


end

pop_textdomain()
