push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/barbarians/shipyard/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_shipyard_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Shipyard"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 62, 48 },
        },
        unoccupied = {
            hotspot = { 62, 48 },
        },
        working = {
            hotspot = { 61, 47 },
        },
    },
    spritesheets = {
        build = {
            frames = 4,
            rows = 2,
            columns = 2,
            hotspot = { 61, 47 }
        },
    },

    map_check = {"seafaring"},
    size = "medium",
    enhancement = {
        name = "europeans_shipyard_level_1",
        enhancement_cost = {
            ironwood = 2,
            balsa = 2,
            rubber = 2,
            rope = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 4,
            rubber = 1,
            rope = 1
        }
    },
    buildcost = {
        blackwood = 3,
        granite = 3,
        reed = 2
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 2,
        reed = 1
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
        barbarians_shipwright = 1
    },

    inputs = {
        { name = "log", amount = 2 },
        { name = "blackwood", amount = 10 },
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
                -- (see data/tribes/immovables/shipconstruction_barbarians/init.lua)
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
                "construct=europeans_barbarians_shipconstruction worker:buildship radius:6",
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
