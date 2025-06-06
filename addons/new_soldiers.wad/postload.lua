addon_dirname = path.dirname(__file__)
push_textdomain("new_soldiers.wad", true)

-- For formatting time strings
include "tribes/scripting/help/time_strings.lua"

-- For lore texts
-- TRANSLATORS: Format string for a latin quote and its translation
quote_with_translation_format = pgettext("empire_lore", "‘%1%’<br>(%2%)")
function latin_lore(latin, translation)
   return quote_with_translation_format:bformat(latin, translation)
end

-----------------------
-- Empire
-----------------------

wl.Descriptions():modify_unit("tribe", "empire", "add_ware", "shield_wooden", 4, 5, 1, { helptexts = { purpose =
                  _"This shield is used for defense training."
               }})

wl.Descriptions():modify_unit("productionsite", "empire_weaponsmithy", "programs", "set", "produce_shield_wooden", {
         -- TRANSLATORS: Completed/Skipped/Did not start making a wooden shield because ...
         descname = _("making a wooden shield"),
         actions = {
            -- time: 20.4 + 21 + 9 + 3.6 = 54 sec
            "return=skipped unless economy needs shield_wooden",
            "consume=planks",
            "sleep=duration:20s400ms",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:21s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=shield_wooden"
      }})


wl.Descriptions():modify_unit("productionsite", "empire_weaponsmithy", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- time total: 54 + 4 * 81 = 378 sec
            "call=produce_shield_wooden",
            "call=produce_spear_wooden",
            "call=produce_spear",
            "call=produce_spear_advanced",
            "call=produce_spear_heavy",
            "call=produce_spear_war",
      }})

-----------------------
-- Amazons
-----------------------

wl.Descriptions():modify_unit("productionsite", "amazons_dressmakery", "programs", "set", "produce_helmet_wooden", {
         -- TRANSLATORS: Completed/Skipped/Did not start making a wooden helmet because ...
         descname = _("making a wooden helmet"),
         actions = {
            -- time: 32.4 + 35 + 3.6 = 71 sec
            "return=skipped unless economy needs helmet_wooden",
            "consume=ironwood gold", -- one rubber replaced with gold
            "sleep=duration:32s400ms",
            "animate=working duration:35s",
            "produce=helmet_wooden"
      }})


pop_textdomain()
