push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_inn_level_2",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Inn Level 2"),
    icon = dirname .. "menu.png",
    size = "medium",

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 52, 75 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
            hotspot = { 52, 75 },
        },
    },

    aihints = {},

    working_positions = {
        europeans_baker_advanced = 1,
        europeans_baker_normal = 1
    },


    inputs = {
        { name = "water", amount = 8 },
        { name = "flour", amount = 8 },
        { name = "meat", amount = 6 },
        { name = "fish", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_ration",
                "call=produce_snack",
                "call=produce_meal",
                "call=produce_meal_idle",
                "return=skipped"
            }
        },
        produce_ration = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a ration because ...
            descname = pgettext("europeans_building", "preparing a ration"),
            actions = {
                "return=skipped when economy needs water and not economy needs ration",
                "return=skipped unless economy needs ration",
                "return=skipped unless site has water:2",
                "return=skipped unless site has flour:2",
                "consume=water:2 flour:2",
                "animate=working duration:10s",
                "consume=fish,meat",
                "animate=working duration:10s",
                "produce=ration:2"
            }
        },
        produce_snack = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a snack because ...
            descname = pgettext("europeans_building", "preparing a snack"),
            actions = {
                "return=skipped when economy needs water and not economy needs snack",
                "return=skipped unless economy needs snack",
                "return=skipped unless site has water:2",
                "return=skipped unless site has flour:2",
                "consume=water:2 flour:2",
                "animate=working duration:10s",
                "consume=fish,meat",
                "animate=working duration:10s",
                "produce=snack:2"
            }
        },
        produce_meal = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a meal because ...
            descname = pgettext("europeans_building", "preparing a meal"),
            actions = {
                "return=skipped when economy needs water and not economy needs meal",
                "return=skipped unless economy needs meal",
                "return=skipped unless site has water:2",
                "return=skipped unless site has flour:2",
                "consume=water:2 flour:2",
                "animate=working duration:10s",
                "consume=fish,meat",
                "animate=working duration:10s",
                "produce=meal"
            }
        },
        produce_meal_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs ration",
                "return=skipped when economy needs snack",
                "return=skipped when economy needs meal",
                "return=skipped when economy needs water",
                "consume=water:2 flour:2",
                "animate=working duration:10s",
                "consume=fish,meat",
                "animate=working duration:10s",
                "produce=ration",
                "sleep=duration:30s",
                "consume=water:2 flour:2",
                "animate=working duration:10s",
                "consume=fish,meat",
                "animate=working duration:10s",
                "produce=snack",
                "sleep=duration:30s",
                "consume=water:2 flour:2",
                "animate=working duration:10s",
                "consume=fish,meat",
                "animate=working duration:10s",
                "produce=meal",
                "sleep=duration:90s"
            }
        }
    },
}

pop_textdomain()
