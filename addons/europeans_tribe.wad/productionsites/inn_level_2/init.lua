push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
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
        europeans_baker_normal = 1,
        europeans_baker_advanced = 1
    },


    inputs = {
        { name = "water", amount = 12 },
        { name = "flour", amount = 12 },
        { name = "fish", amount = 6 },
        { name = "meat", amount = 6 }
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
            descname = _"preparing a ration",
            actions = {
                "return=skipped when economy needs water and not economy needs ration",
                "return=skipped unless economy needs ration",
                "return=skipped unless site has water:2",
                "consume=water:2 flour:2 fish,meat:2",
                "sleep=duration:10s",
                "animate=working duration:35s",
                "produce=ration:2"
            }
        },
        produce_snack = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a snack because ...
            descname = _"preparing a snack",
            actions = {
                "return=skipped when economy needs water and not economy needs snack",
                "return=skipped unless economy needs snack",
                "return=skipped unless site has water:4",
                "consume=water:4 flour:4 fish,meat:4",
                "sleep=duration:10s",
                "animate=working duration:35s",
                "produce=snack:3"
            }
        },
        produce_meal = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a meal because ...
            descname = _"preparing a meal",
            actions = {
                "return=skipped when economy needs water and not economy needs meal",
                "return=skipped unless economy needs meal",
                "return=skipped unless site has water:4",
                "consume=water:4 flour:4 fish,meat:4",
                "sleep=duration:10s",
                "animate=working duration:35s",
                "produce=meal:2"
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
                "sleep=duration:90s",
                "consume=water:6 flour:6 fish,meat:6",
                "animate=working duration:30s",
                "produce=ration",
                "sleep=duration:90s",
                "animate=working duration:30s",
                "produce=snack",
                "sleep=duration:90s",
                "animate=working duration:30s",
                "produce=meal"
            }
        }
    },
}

pop_textdomain()
