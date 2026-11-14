push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/amazons/shipyard/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_shipyard_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext ("europeans_building", "Shipyard Level 1"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        idle = {hotspot = {43, 44}},
        unoccupied = {hotspot = {43, 44}}
    },

    map_check = {"seafaring"},
    size = "medium",
    enhancement = {
        name = "europeans_shipyard_level_2",
        enhancement_cost = {
            planks = 2,
            granite = 2,
            spidercloth = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 1,
            spidercloth = 1
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
        amazons_shipwright = 1
    },

    inputs = {
        { name = "log", amount = 5 },
        { name = "balsa", amount = 5 },
        { name = "rubber", amount = 3 },
        { name = "rope", amount = 3 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                -- steps from building to ship: 2-9
                -- worker time: 5.5 sec
                -- number of wares to carry: 5 + 5 + 3 + 3 = 16
                -- (see data/tribes/immovables/shipconstruction_amazons/init.lua)
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
                "construct=amazons_shipconstruction worker:buildship radius:6",
                "sleep=duration:20s",
            }
        },
        ship_preparation = {
            descname = _("working"),
            actions = {
                "sleep=duration:35s",
            }
        },
    },
}

pop_textdomain()
