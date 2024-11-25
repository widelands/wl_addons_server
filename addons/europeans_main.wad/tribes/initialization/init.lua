-- This file contains the basic information for the Europeans tribe that is
-- needed before a game is loaded or the editor has been started.

dirname = path.dirname(__file__)
push_textdomain("europeans_tribe.wad", true)

local init_europeans = {
    -- Basic information for the Europeans tribe
    name = "europeans",
    author = _"Mark McWire",
    -- TRANSLATORS: This is a tribe name
    descname = _"Europeans",
    tooltip = _"This is the culture of the Europeans.",
    icon = dirname .. "images/icon.png",
    script = dirname .. "units.lua",

    starting_conditions = {
        "addons/europeans_main.wad/tribes/scripting/starting_conditions/headquarters_ai.lua";
        "addons/europeans_main.wad/tribes/scripting/starting_conditions/headquarters_human.lua";
        "addons/europeans_main.wad/tribes/scripting/starting_conditions/harbors_ai.lua";
        "addons/europeans_main.wad/tribes/scripting/starting_conditions/harbors_human.lua";
        "addons/europeans_main.wad/tribes/scripting/starting_conditions/discovery_ai.lua";
        "addons/europeans_main.wad/tribes/scripting/starting_conditions/discovery_human.lua";
    }
}
pop_textdomain()
return init_europeans

