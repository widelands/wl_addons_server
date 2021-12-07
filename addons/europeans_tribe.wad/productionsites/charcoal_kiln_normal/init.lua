push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_charcoal_kiln_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Charcoal Kiln"),
    icon = dirname .. "menu.png",
    size = "medium",

    enhancement = {
        name = "europeans_charcoal_kiln_advanced",
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
            hotspot = { 47, 57 },
        },
        working = {
            pictures = path.list_files(dirname .. "working_??.png"),
            hotspot = { 47, 60 },
        },
    },

    aihints = {},

    working_positions = {
        europeans_charcoal_burner_normal = 1
    },

    inputs = {
        { name = "log", amount = 18 },
        { name = "blackwood", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=burn_log",
                "call=burn_blackwood",
                "call=burn_log_idle",
                "return=skipped"
            }
        },
        burn_log = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing coal because ...
            descname = _"producing coal",
            actions = {
                "return=skipped unless economy needs coal or workers need experience",
                "consume=log:9",
                "sleep=duration:10s",
                "animate=working duration:2m30s",
                "produce=coal:4",
            }
        },
        burn_blackwood = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing coal because ...
            descname = _"producing coal",
            actions = {
                "return=skipped unless economy needs coal or workers need experience",
                "return=skipped when economy needs blackwood",
                "consume=blackwood:6",
                "sleep=duration:10s",
                "animate=working duration:2m30s", -- Charcoal fires will burn for some days in real life
                "produce=coal:3"
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
