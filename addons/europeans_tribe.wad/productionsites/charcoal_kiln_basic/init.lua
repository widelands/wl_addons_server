push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_charcoal_kiln_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Charcoal Kiln"),
    icon = dirname .. "menu.png",
    size = "medium",

    enhancement = {
        name = "europeans_charcoal_kiln_normal",
        enhancement_cost = {
            blackwood = 2,
            cloth = 2
        },
        enhancement_return_on_dismantle = {
            blackwood = 1
        },
    },

    buildcost = {
        log = 3,
        reed = 3,
        granite = 3
    },
    return_on_dismantle = {
        log = 2,
        granite = 2
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 50, 71 },
        },
        build = {
            pictures = path.list_files(dirname .. "build_??.png"),
            hotspot = { 50, 71 },
        },
        working = {
            pictures = path.list_files(dirname .. "working_??.png"),
            hotspot = { 50, 71 },
        },
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 4,
        basic_amount = 1,
        prohibited_till = 900,
        forced_after = 1800
    },

    working_positions = {
        europeans_charcoal_burner_basic = 1
    },

    inputs = {
        { name = "log", amount = 12 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=burn_log",
                "call=burn_log_idle",
                "return=skipped"
            }
        },
        burn_log = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing coal because ...
            descname = _"producing coal",
            actions = {
                "return=skipped unless economy needs coal or workers need experience",
                "consume=log:6",
                "sleep=duration:10s",
                "animate=working duration:3m",
                "produce=coal:2",
            }
        },
        burn_log_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs coal",
                "return=skipped when economy needs log",
                "consume=log:3",
                "sleep=duration:60s",
                "animate=working duration:1m30s",
                "produce=coal"
            }
        }
    },
}

pop_textdomain()
