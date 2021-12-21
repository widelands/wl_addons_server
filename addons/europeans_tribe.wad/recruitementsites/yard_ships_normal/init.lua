push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_shipyard_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Shipyard"),
    icon = dirname .. "menu.png",
    size = "medium",
    map_check = {"seafaring"},
    
    enhancement = {
        name = "europeans_shipyard_advanced",
        enhancement_cost = {
            planks = 2,
            brick = 2,
            grout = 2,
            marble_column = 2
        },
        enhancement_return_on_dismantle = {
            granite = 2,
            marble = 2,
            planks = 1
        }
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 53, 66 },
        },
        build = {
            pictures = path.list_files(dirname .. "build_??.png"),
            hotspot = { 53, 66 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
            hotspot = { 53, 66 },
        },
        unoccupied = {
            pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
            hotspot = { 53, 66 },
        }
    },

    aihints = {
        needs_water = true,
        shipyard = true
    },

    working_positions = {
        europeans_shipwright_normal = 1
    },

    inputs = {
        { name = "blackwood", amount = 2 },
        { name = "planks", amount = 10 },
        { name = "reed", amount = 2 },
        { name = "spidercloth", amount = 2 },
        { name = "quartz", amount = 1 },
        { name = "diamond", amount = 1 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=ship on failure fail",
                "call=ship_preparation",
                "return=completed"
            }
        },
        ship = {
            -- TRANSLATORS: Completed/Skipped/Did not start constructing a ship because ...
            descname = _"constructing a ship",
            actions = {
                "return=skipped when not site has blackwood",
                "return=skipped when not site has planks",
                "return=skipped when not site has spidercloth",
                "return=skipped when not site has quartz",
                "return=skipped when not site has diamond",
                "sleep=duration:15s",
                "construct=europeans_shipconstruction worker:buildship radius:6",
                "sleep=duration:15s",
            }
        },
        ship_preparation = {
            descname = _"working",
            actions = {
                "animate=working duration:40s",
            }
        },
    },
}

pop_textdomain()
