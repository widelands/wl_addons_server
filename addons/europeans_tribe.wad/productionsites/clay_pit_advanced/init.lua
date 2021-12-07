push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_clay_pit_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Clay Pit"),
    icon = dirname .. "menu.png",
    size = "small",

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 37, 58 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 37, 58 },
        },
    },

    aihints = {},

    working_positions = {
        europeans_claydigger_advanced = 1
    },

    inputs = {
        { name = "water", amount = 4 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "callworker=check_dig",
                "call=digging_clay",
                "callworker=check_dig",
                "call=making_pond_idle",
                "return=skipped"
            }
        },
        digging_clay = {
            -- TRANSLATORS: Completed/Skipped/Did not start digging clay because ...
            descname = _"digging clay",
            actions = {
                "return=skipped unless economy needs clay or workers need experience",
                "return=skipped unless site has water:2",
                "callworker=dig",
                "consume=water",
                "sleep=duration:10s",
                "animate=working duration:15s",
                "sleep=duration:1s",
                "produce=clay"
            }
        },
        making_pond_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs clay",
                "return=skipped when economy needs water",
                "sleep=duration:90s",
                "callworker=dig",
                "consume=water",
                "sleep=duration:10s",
                "animate=working duration:15s",
            }
        }
    },
}

pop_textdomain()
