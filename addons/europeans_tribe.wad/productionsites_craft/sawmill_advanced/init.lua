push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
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
        europeans_carpenter_advanced = 1,
        europeans_carpenter_basic = 1
    },

    inputs = {
        { name = "log", amount = 4 }
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
            descname = pgettext("europeans_building", "sawing logs"),
            actions = {
                "return=skipped unless economy needs planks",
                "return=skipped unless site has log:2",
                "consume=log:2",
                "playsound=sound/atlanteans/saw/benchsaw priority:50% allow_multiple",
                "animate=working duration:10s",
                "produce=planks"
            }
        },
        hardening_wood = {
            -- TRANSLATORS: Completed/Skipped/Did not start hardening wood because ...
            descname = pgettext("europeans_building", "hardening wood"),
            actions = {
                "return=skipped unless economy needs blackwood",
                "return=skipped unless site has log:2",
                "consume=log:2",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:10s",
                "produce=blackwood:2"
            }
        },
        saw_log_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs blackwood",
                "return=skipped when economy needs planks",
                "return=skipped when economy needs log",
                "consume=log:4",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:10s",
                "produce=blackwood",
                "sleep=duration:30s",
                "playsound=sound/atlanteans/saw/benchsaw priority:50% allow_multiple",
                "animate=working duration:10s", 
                "produce=planks",
                "sleep=duration:60s"
            }
        }
    },
}

pop_textdomain()
