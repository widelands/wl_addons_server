push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/empire/shipyard/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_shipyard_level_3",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Shipyard Level 3"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
        idle = {
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 56, 58 },
        },
        build = {
            frames = 4,
            columns = 4,
            rows = 1,
            hotspot = { 56, 58 },
        },
        unoccupied = {
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 56, 58 },
        },
        working = {
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 56, 58 },
        },
    },

    map_check = {"seafaring"},
    size = "medium",
    enhancement = {
        name = "europeans_shipyard_level_4",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            reed = 2
        },
        enhancement_return_on_dismantle = {
            brick = 1,
            grout = 1
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
        empire_shipwright = 1
    },

    inputs = {
        { name = "log", amount = 2 },
        { name = "planks", amount = 10 },
        { name = "cloth", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                -- steps from building to ship: 2-9
                -- worker time: 5.5 sec
                -- number of wares to carry: 10 + 2 + 4 = 16
                -- (see data/tribes/immovables/shipconstruction_empire/init.lua)
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
                "construct=europeans_empire_shipconstruction worker:buildship radius:6",
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
