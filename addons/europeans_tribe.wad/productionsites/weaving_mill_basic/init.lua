push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_weaving_mill_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Weaving Mill"),
    icon = dirname .. "menu.png",
    size = "medium",

    enhancement = {
        name = "europeans_weaving_mill_normal",
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
            hotspot = { 36, 74 },
        },
        build = {
            pictures = path.list_files(dirname .. "build_??.png"),
            hotspot = { 36, 74 },
        },
        working = {
            pictures = path.list_files(dirname .. "working_??.png"),
            hotspot = { 36, 74 },
        },
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
        prohibited_till = 5400,
        forced_after = 7200
    },

    working_positions = {
        europeans_weaver_basic = 1
    },

    inputs = {
        { name = "reed", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_cloth",
                "call=produce_cloth_idle",
                "return=skipped"
            }
        },
        produce_cloth = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving cloth because ...
            descname = _"weaving cloth",
            actions = {
                "return=skipped when economy needs reed and not economy needs cloth",
                "consume=reed:3",
                "sleep=duration:10s",
                "playsound=sound/barbarians/weaver priority:90%",
                "animate=working duration:50s",
                "produce=cloth:3"
            }
        },
        produce_cloth_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs cloth",
                "return=skipped when economy needs reed and not workers need experience",
                "sleep=duration:90s",
                "consume=reed",
                "playsound=sound/barbarians/weaver priority:90%",
                "animate=working duration:60s",
                "produce=cloth"
            }
        }
    },
}

pop_textdomain()
