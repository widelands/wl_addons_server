push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
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
        prohibited_till = 4200,
        forced_after = 5400,
        very_weak_ai_limit = 2,
        weak_ai_limit = 3,
        normal_ai_limit = 6
    },

    working_positions = {
        europeans_charcoal_burner_basic = 1
    },

    inputs = {
        { name = "log", amount = 4 }
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
            descname = pgettext("europeans_building", "producing coal"),
            actions = {
                "return=skipped unless economy needs coal or workers need experience",
                "return=skipped unless site has log:3",
                "consume=log:3",
                "animate=working duration:90s",
                "produce=coal"
            }
        },
        burn_log_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs coal",
                "return=skipped when economy needs log",
                "consume=log:3",
                "animate=working duration:90s",
                "produce=coal",
                "sleep=duration:60s"
            }
        }
    },
}

pop_textdomain()
