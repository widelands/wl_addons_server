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
        "addons/europeans_tribe.wad/scripting/starting_conditions/headquarters_ai.lua";
        "addons/europeans_craft_buildings.wad.wad/scripting/starting_conditions/headquarters_terraforming.lua";
        "addons/europeans_craft_buildings.wad.wad/scripting/starting_conditions/headquarters_seafaring.lua";
        "addons/europeans_craft_buildings.wad.wad/scripting/starting_conditions/discovery_ai.lua";
        "addons/europeans_craft_buildings.wad.wad/scripting/starting_conditions/discovery_human.lua";
        "addons/europeans_craft_buildings.wad.wad/scripting/starting_conditions/trading_outpost.lua";
    }
}
pop_textdomain()
return init_europeans

