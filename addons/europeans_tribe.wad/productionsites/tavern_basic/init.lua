push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_tavern_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Tavern"),
    icon = dirname .. "menu.png",
    size = "medium",

    enhancement = {
        name = "europeans_tavern_level_1",
        enhancement_cost = {
            blackwood = 2,
            cloth = 1
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

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 4,
        basic_amount = 1,
        prohibited_till = 2400,
        forced_after = 3300
    },

    working_positions = {
        europeans_baker_basic = 1
    },

    inputs = {
        { name = "water", amount = 4 },
        { name = "flour", amount = 4 },
        { name = "fish", amount = 2 },
        { name = "meat", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_ration",
                "call=produce_ration_idle",
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
                "animate=working duration:70s",
                "produce=ration:2"
            }
        },
        produce_ration_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs ration",
                "return=skipped when economy needs water",
                "sleep=duration:90s",
                "consume=water flour fish,meat",
                "animate=working duration:30s",
                "produce=ration"
            }
        }
    },
}

pop_textdomain()
