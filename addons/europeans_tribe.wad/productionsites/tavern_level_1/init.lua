push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_tavern_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Tavern Level 1"),
    icon = dirname .. "menu.png",
    size = "medium",

    enhancement = {
        name = "europeans_tavern_level_2",
        enhancement_cost = {
            blackwood = 2,
            cloth = 1
        },
        enhancement_return_on_dismantle = {
             blackwood = 1
        },
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 57, 88 },
        },
        build = {
            pictures = path.list_files(dirname .. "build_??.png"),
            hotspot = { 57, 88 },
        },
        working = {
            pictures = path.list_files(dirname .. "working_??.png"),
            hotspot = { 57, 88 },
        },
    },

    aihints = {},

    working_positions = {
        europeans_baker_normal = 1
    },

    inputs = {
        { name = "water", amount = 8 },
        { name = "flour", amount = 8 },
        { name = "fish", amount = 4 },
        { name = "meat", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_ration",
                "call=produce_snack",
                "call=produce_snack_idle",
                "return=skipped"
            }
        },
        produce_ration = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a ration because ...
            descname = _"preparing a ration",
            actions = {
                "return=skipped when economy needs water and not economy needs ration",
                "return=skipped unless economy needs ration or workers need experience",
                "return=skipped unless site has water:2",
                "consume=water:2 flour:2 fish,meat:2",
                "sleep=duration:10s",
                "animate=working duration:60s",
                "produce=ration:2"
            }
        },
        produce_snack = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a snack because ...
            descname = _"preparing a snack",
            actions = {
                "return=skipped when economy needs water and not economy needs snack",
                "return=skipped unless economy needs snack or workers need experience",
                "return=skipped unless site has water:4",
                "consume=water:4 flour:4 fish,meat:4",
                "sleep=duration:10s",
                "animate=working duration:60s",
                "produce=snack:3"
            }
        },
        produce_snack_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs ration",
                "return=skipped when economy needs snack",
                "return=skipped when economy needs water",
                "sleep=duration:90s",
                "consume=water:3 flour:3 fish,meat:3",
                "animate=working duration:30s",
                "produce=ration",
                "sleep=duration:90s",
                "animate=working duration:30s",
                "produce=snack"
            }
        }
    },
}

pop_textdomain()
