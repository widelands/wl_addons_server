push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_ferry_yard_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Ferry Yard"),
    icon = dirname .. "menu.png",
    size = "medium",
    map_check = {"waterways"},

    -- TODO(Nordfriese): Make animations
    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 50, 63 },
        }
    },

    aihints = {},

    working_positions = {
        europeans_shipwright_advanced = 1
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
                "sleep=duration:15s",
                "callworker=buildferry_1",
                "consume=planks:2 spidercloth",
                "callworker=buildferry_2"
            }
        },
    },
}

pop_textdomain()
