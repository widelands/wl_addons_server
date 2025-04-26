-- This file contains the basic information for the Lutas’ Atlanteans that is
-- needed before a game is loaded or the editor has been started.

dirname = path.dirname(__file__)
push_textdomain("lutas_atlanteans_tribe.wad", true)

local init_lutas_atlanteans = {
    name = "lutas_atlanteans",
    author = _"OIPUN",
    -- TRANSLATORS: This is a tribe name
    descname = _"Lutas’ Atlanteans",
    tooltip = _"This tribe is known from the oldest tales. The sons and daughters of Atlantis.",
    icon = dirname .. "images/icon.png",
    script = dirname .. "units.lua",

    starting_conditions = {
        "addons/lutas_atlanteans.wad/scripting/starting_conditions/headquarters.lua";
        "addons/lutas_atlanteans.wad/scripting/starting_conditions/fortified_village.lua";
        "addons/lutas_atlanteans.wad/scripting/starting_conditions/trading_outpost.lua";
        "addons/lutas_atlanteans.wad/scripting/starting_conditions/village.lua";
        "addons/lutas_atlanteans.wad/scripting/starting_conditions/poor_hamlet.lua";
        "addons/lutas_atlanteans.wad/scripting/starting_conditions/struggling_outpost.lua";
        "addons/lutas_atlanteans.wad/scripting/starting_conditions/discovery.lua";
        "addons/lutas_atlanteans.wad/scripting/starting_conditions/new_world.lua";
        "addons/lutas_atlanteans.wad/scripting/starting_conditions/basic_outpost.lua";
        "addons/lutas_atlanteans.wad/scripting/starting_conditions/tidy_warehouses.lua";
        "addons/lutas_atlanteans.wad/scripting/starting_conditions/castaways.lua";
    }
}
pop_textdomain()
return init_lutas_atlanteans

