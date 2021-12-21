push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_sawmill_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Sawmill"),
    icon = dirname .. "menu.png",
    size = "medium",

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 54, 70 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
            hotspot = { 54, 70 },
        },
    },

    aihints = {},

    working_positions = {
        europeans_carpenter_advanced = 1
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
                "return=skipped unless economy needs planks",
                "consume=log:4",
                "sleep=duration:10s",
                "playsound=sound/atlanteans/saw/benchsaw priority:50% allow_multiple",
                "animate=working duration:15s",
                "produce=planks:3"
            }
        },
        hardening_wood = {
            -- TRANSLATORS: Completed/Skipped/Did not start hardening wood because ...
            descname = _"hardening wood",
            actions = {
                "return=skipped unless economy needs blackwood",
                "consume=log:4",
                "sleep=duration:10s",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:15s",
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
                "consume=log:4",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:15s",
                "produce=blackwood",
                "sleep=duration:90s",
                "playsound=sound/atlanteans/saw/benchsaw priority:50% allow_multiple",
                "animate=working duration:15s", 
                "produce=planks"
            }
        }
    },
}

pop_textdomain()
