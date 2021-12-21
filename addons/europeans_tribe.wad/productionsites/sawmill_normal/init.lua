push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_sawmill_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Sawmill"),
    icon = dirname .. "menu.png",
    size = "medium",

    enhancement = {
        name = "europeans_sawmill_advanced",
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

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 53, 60 },
        },
        working = {
            pictures = path.list_files(dirname .. "working_??.png"),
            hotspot = { 53, 60 },
            fps = 25
        }
    },

    aihints = {},

    working_positions = {
        europeans_carpenter_normal = 1
    },

    inputs = {
        { name = "log", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=saw_log",
                "call=hardening_wood",
                "call=saw_log_idle",
                "return=skipped"
            }
        },
        saw_log = {
            -- TRANSLATORS: Completed/Skipped/Did not start sawing logs because ...
            descname = _"sawing logs",
            actions = {
                "return=skipped when economy needs log and not economy needs planks",
                "consume=log:4",
                "sleep=duration:10s",
                "playsound=sound/atlanteans/saw/benchsaw priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=planks:3"
            }
        },
        hardening_wood = {
            -- TRANSLATORS: Completed/Skipped/Did not start hardening wood because ...
            descname = _"hardening wood",
            actions = {
                "return=skipped when economy needs log and not economy needs blackwood",
                "consume=log:4",
                "sleep=duration:10s",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:20s",
                "produce=blackwood:3"
            }
        },
        saw_log_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs blackwood",
                "return=skipped when economy needs planks",
                "return=skipped when economy needs log",
                "sleep=duration:90s",
                "consume=log:2",
                "playsound=sound/atlanteans/saw/benchsaw priority:50% allow_multiple",
                "animate=working duration:30s", 
                "produce=planks"
            }
        },
    },
}

pop_textdomain()
