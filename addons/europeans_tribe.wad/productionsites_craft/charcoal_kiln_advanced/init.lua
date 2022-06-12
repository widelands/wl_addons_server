push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_charcoal_kiln_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Charcoal Kiln"),
    icon = dirname .. "menu.png",
    size = "medium",

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 51, 48 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
            hotspot = { 51, 48 },
        },
    },

    aihints = {},

    working_positions = {
        europeans_charcoal_burner_advanced = 1,
        europeans_charcoal_burner_basic = 1
    },

    inputs = {
        { name = "log", amount = 8 },
        { name = "blackwood", amount = 8 },
        { name = "planks", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=burn_log",
                "call=burn_blackwood",
                "call=burn_planks",
                "call=burn_log_idle",
                "return=skipped"
            }
        },
        burn_log = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing coal because ...
            descname = pgettext("europeans_building", "producing coal"),
            actions = {
                "return=skipped unless economy needs coal",
                "return=skipped unless site has log:8",
                "consume=log:8",
                "animate=working duration:1m30s",
                "produce=coal:5"
            }
        },
        burn_blackwood = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing coal because ...
            descname = pgettext("europeans_building", "producing coal"),
            actions = {
                "return=skipped unless economy needs coal",
                "return=skipped when economy needs blackwood",
                "return=skipped unless site has blackwood:8",
                "consume=blackwood:8",
                "animate=working duration:1m30s", -- Charcoal fires will burn for some days in real life
                "produce=coal:5"
            }
        },
        burn_planks = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing coal because ...
            descname = pgettext("europeans_building", "producing coal"),
            actions = {
                "return=skipped unless economy needs coal",
                "return=skipped when economy needs planks",
                "return=skipped unless site has planks:8",
                "consume=planks:8",
                "animate=working duration:1m30s", -- Charcoal fires will burn for some days in real life
                "produce=coal:6"
            }
        },
        burn_log_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs coal",
                "return=skipped when economy needs log",
                "consume=log:3",
                "animate=working duration:1m30s",
                "produce=coal",
                "sleep=duration:60s"
            }
        }
    },
}

pop_textdomain()
