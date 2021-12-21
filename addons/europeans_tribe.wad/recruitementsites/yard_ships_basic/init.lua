push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_shipyard_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Shipyard"),
    icon = dirname .. "menu.png",
    size = "medium",
    map_check = {"seafaring"},
    
    enhancement = {
        name = "europeans_shipyard_normal",
        enhancement_cost = {
            blackwood = 2,
            cloth = 2,
            granite = 1
        },
        enhancement_return_on_dismantle = {
            blackwood = 1,
            granite = 1
        },
    },

    buildcost = {
        log = 3,
        blackwood = 2,
        planks = 2,
        reed = 3,
        granite = 2
    },
    return_on_dismantle = {
        log = 2,
        blackwood = 1,
        planks = 1,
        reed = 1,
        granite = 1
    },

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 62, 48 },
        },
        build = {
            hotspot = { 62, 48 },
        },
        unoccupied = {
            hotspot = { 62, 48 },
        },
        working = {
            hotspot = { 62, 48 },
        },
    },

    aihints = {
        needs_water = true,
        shipyard = true,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        normal_ai_limit = 2,
        prohibited_till = 9000
    },

    working_positions = {
        europeans_shipwright_basic = 1
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
                "construct=europeans_shipconstruction worker:buildship radius:5",
                "sleep=duration:15s",
            }
        },
        ship_preparation = {
            descname = _"working",
            actions = {
                "animate=working duration:50s",
            }
        },
    },
}

pop_textdomain()
