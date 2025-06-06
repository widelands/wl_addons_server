-- This file contains the basic information for the sumatran tribe that is
-- needed before a game is loaded or the editor has been started.

dirname = path.dirname(__file__)
push_textdomain("sumatran_tribe.wad", true)

local init_sumatran = {
    name = "sumatrans",
    author = _"OIPUN",
    -- TRANSLATORS: This is a tribe name
    descname = _"Sumatrans",
    tooltip = _"A crocodiles hunting tribe living on a tropical island named Sumatra.",
    icon = dirname .. "images/icon.png",
    script = dirname .. "units.lua",

    starting_conditions = {
        "addons/sumatran_tribe.wad/scripting/starting_conditions/headquarters.lua";
        "addons/sumatran_tribe.wad/scripting/starting_conditions/fortified_village.lua";
        "addons/sumatran_tribe.wad/scripting/starting_conditions/trading_outpost.lua";
        "addons/sumatran_tribe.wad/scripting/starting_conditions/village.lua";
        "addons/sumatran_tribe.wad/scripting/starting_conditions/poor_hamlet.lua";
        "addons/sumatran_tribe.wad/scripting/starting_conditions/struggling_outpost.lua";
        "addons/sumatran_tribe.wad/scripting/starting_conditions/discovery.lua";
        "addons/sumatran_tribe.wad/scripting/starting_conditions/new_world.lua";
        "addons/sumatran_tribe.wad/scripting/starting_conditions/basic_outpost.lua";
        "addons/sumatran_tribe.wad/scripting/starting_conditions/tidy_warehouses.lua";
        "addons/sumatran_tribe.wad/scripting/starting_conditions/castaways.lua";
    }
}
pop_textdomain()
return init_sumatran

