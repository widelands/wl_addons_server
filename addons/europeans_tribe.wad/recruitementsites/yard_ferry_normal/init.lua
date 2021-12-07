push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_ferry_yard_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Ferry Yard"),
    icon = dirname .. "menu.png",
    size = "medium",
    map_check = {"waterways"},
    
    enhancement = {
        name = "europeans_ferry_yard_advanced",
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

    -- TODO(Nordfriese): Make animations
    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 53, 66 },
        }
    },

    aihints = {},

    working_positions = {
        europeans_shipwright_normal = 1
    },

    inputs = {
        { name = "planks", amount = 6 },
        { name = "spidercloth", amount = 3 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "sleep=duration:30s",
                "callworker=buildferry_1",
                "consume=planks:2 spidercloth",
                "callworker=buildferry_2"
            }
        },
    },
}

pop_textdomain()
