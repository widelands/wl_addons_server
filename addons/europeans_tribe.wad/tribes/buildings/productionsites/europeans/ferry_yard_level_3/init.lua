push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/empire/ferry_yard/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_ferry_yard_level_3",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Ferry Yard Level 3"),
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

    map_check = {"waterways"},
    size = "medium",
    enhancement = {
        name = "europeans_ferry_yard_level_4",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            reed = 2
        },
        enhancement_return_on_dismantle = {
            brick = 1,
            reed = 1
        }
    },

    aihints = {
        needs_water = true,
        prohibited_till = 7200,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1
    },

    working_positions = {
        empire_shipwright = 1
    },

    inputs = {
        { name = "log", amount = 6 },
        { name = "cloth", amount = 3 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                -- time of worker: 17.2-38.8 sec
                -- min. time total: 20 + 17.2 = 37.2 sec
                -- max. time total: 20 + 38.8 = 58.8 sec
                "sleep=duration:20s",
                "return=skipped unless fleet needs ferry",
                "consume=log:2 cloth",
                "callworker=buildferry"
            }
        },
    },
}

pop_textdomain()
