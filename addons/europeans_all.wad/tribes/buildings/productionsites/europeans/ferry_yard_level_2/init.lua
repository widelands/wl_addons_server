push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/atlanteans/ferry_yard/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_ferry_yard_level_2",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Ferry Yard Level 2"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 56, 72 },
        }
    },
    spritesheets = {
        build= {
            frames = 5,
            columns = 5,
            rows = 1,
            hotspot = { 56, 72 },
        }
    },
    
    map_check = {"waterways"},
    size = "medium",
    enhancement = {
        name = "europeans_ferry_yard_level_3",
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
        prohibited_till = 7200,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1
    },

    working_positions = {
        atlanteans_shipwright = 1
    },

    inputs = {
        { name = "log", amount = 6 },
        { name = "spidercloth", amount = 3 },
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
                "consume=log:2 spidercloth",
                "callworker=buildferry",
            }
        },
    },
}

pop_textdomain()
