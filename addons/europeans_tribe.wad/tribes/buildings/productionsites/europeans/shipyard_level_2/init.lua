push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/atlanteans/shipyard/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_shipyard_level_2",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Shipyard Level 2"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 56, 72 },
        },
        working = {
            basename = "idle",
            hotspot = { 56, 72 },
        },
        unoccupied = {
            basename = "idle",
            hotspot = { 56, 72 },
        }
    },
    spritesheets = {
        build = {
            frames = 5,
            columns = 5,
            rows = 1,
            hotspot = { 56, 72 },
        },
    },

    map_check = {"seafaring"},
    size = "medium",   
    enhancement = {
        name = "europeans_shipyard_level_3",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            marble = 2
        },
        enhancement_return_on_dismantle = {
            brick = 1,
            marble = 1
        }
    },


    aihints = {
        needs_water = true,
        shipyard = true,
        prohibited_till = 7200,
        forced_after = 9000,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1
    },

    working_positions = {
        atlanteans_shipwright = 1
    },

    inputs = {
        { name = "log", amount = 2 },
        { name = "planks", amount = 10 },
        { name = "spidercloth", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                -- steps from building to ship: 2-9
                -- worker time: 5.5 sec
                -- number of wares to carry: 10 + 2 + 4 = 16
                -- (see data/tribes/immovables/shipconstruction_atlanteans/init.lua)
                -- min. time total: 16 * (2 * 2 * 1.8 + 5.5 + 20 + 35) = 1083.2 sec
                -- max. time total: 16 * (2 * 9 * 1.8 + 5.5 + 20 + 35) = 1486.4 sec
                "call=ship on failure fail",
                "call=ship_preparation",
            }
        },
        ship = {
            -- TRANSLATORS: Completed/Skipped/Did not start constructing a ship because ...
            descname = _("constructing a ship"),
            actions = {
                "construct=europeans_atlanteans_shipconstruction worker:buildship radius:6",
                "sleep=duration:20s",
            }
        },
        ship_preparation = {
            descname = _("working"),
            actions = {
                "animate=working duration:35s",
            }
        },
    },
}

pop_textdomain()
