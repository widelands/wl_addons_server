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
        "addons/europeans_tribe.wad/scripting/starting_conditions/headquarters.lua";
        "addons/europeans_tribe.wad/scripting/starting_conditions/village_basic.lua";
        "addons/europeans_tribe.wad/scripting/starting_conditions/village_normal.lua";
        "addons/europeans_tribe.wad/scripting/starting_conditions/village_advanced.lua";
        "addons/europeans_tribe.wad/scripting/starting_conditions/struggling_outpost.lua";
        "addons/europeans_tribe.wad/scripting/starting_conditions/trading_outpost.lua";
        "addons/europeans_tribe.wad/scripting/starting_conditions/harbors.lua";
        "addons/europeans_tribe.wad/scripting/starting_conditions/new_world.lua";
        "addons/europeans_tribe.wad/scripting/starting_conditions/discovery.lua";
    }
}
pop_textdomain()
return init_europeans

