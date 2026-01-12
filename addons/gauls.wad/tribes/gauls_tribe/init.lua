-- This file contains the basic information for the gauls tribe that is
-- needed before a game is loaded or the editor has been started.

dirname = path.dirname(__file__)
push_textdomain("gauls.wad", true)

local init_gauls = {
    name = "gauls",
    author = _"OIPUN",
    -- TRANSLATORS: This is a tribe name
    descname = _"Gauls",
    tooltip = _"A Celtic tribe.",
    addon = "gauls.wad",
    icon = dirname .. "images/icon.png",
    script = dirname .. "units.lua",

    starting_conditions = {
        "addons/gauls.wad/scripting/starting_conditions/headquarters.lua";
        "addons/gauls.wad/scripting/starting_conditions/fortified_village.lua";
        "addons/gauls.wad/scripting/starting_conditions/trading_outpost.lua";
        "addons/gauls.wad/scripting/starting_conditions/village.lua";
        "addons/gauls.wad/scripting/starting_conditions/poor_hamlet.lua";
        "addons/gauls.wad/scripting/starting_conditions/struggling_outpost.lua";
        "addons/gauls.wad/scripting/starting_conditions/discovery.lua";
        "addons/gauls.wad/scripting/starting_conditions/new_world.lua";
        "addons/gauls.wad/scripting/starting_conditions/basic_outpost.lua";
        "addons/gauls.wad/scripting/starting_conditions/tidy_warehouses.lua";
        "addons/gauls.wad/scripting/starting_conditions/castaways.lua";
    }
}
pop_textdomain()
return init_gauls

