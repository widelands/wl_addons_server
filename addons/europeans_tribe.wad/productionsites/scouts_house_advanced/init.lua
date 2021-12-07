push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_scouts_house_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Scout’s House"),
    icon = dirname .. "menu.png",
    size = "small",

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 50, 53 },
            fps = 10
        },
        build = {
            pictures = path.list_files(dirname .. "build_??.png"),
            hotspot = { 50, 53 },
        },
    },

    aihints = {},

    working_positions = {
        europeans_scout_advanced = 1
    },

    inputs = {
        { name = "meal", amount = 2 },
        { name = "wine", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start scouting because ...
            descname = _"scouting",
            actions = {
                "consume=meal wine",
                "sleep=duration:30s",
                "callworker=scout"
            }
        },
        targeted_scouting = {
            descname = _"scouting",
            actions = {
                "consume=meal wine",
                "callworker=targeted_scouting"
            }
        },
    },
}

pop_textdomain()
