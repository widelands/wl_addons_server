push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_lime_kiln",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Lime Kiln"),
    icon = dirname .. "menu.png",
    size = "medium",
    
    enhancement = {
        name = "europeans_stonemasons_house",
        enhancement_cost = {
            blackwood = 2,
            planks = 2,
            cloth = 2,
            brick = 1,
            grout = 1,
            marble = 2
        },
        enhancement_return_on_dismantle = {
            blackwood = 1,
            planks = 1,
            granite = 1,
            marble = 2
        },
    },

    buildcost = {
        log = 3,
        reed = 3,
        granite = 2
    },
    return_on_dismantle = {
        log = 2,
        granite = 2
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 45, 53 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
            hotspot = { 45, 53 },
        },
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        normal_ai_limit = 1,
        basic_amount = 1,
        prohibited_till = 2700,
        forced_after = 3600
    },

    working_positions = {
        europeans_stonemason_basic = 2
    },

    inputs = {
        { name = "granite", amount = 6 },
        { name = "clay", amount = 6 },
        { name = "water", amount = 6 },
        { name = "coal", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=mixing_grout",
                "call=burning_bricks",
                "call=burning_bricks_idle",
                "return=skipped"
            }
        },
        mixing_grout = {
            -- TRANSLATORS: Completed/Skipped/Did not start mixing grout because ...
            descname = _"mixing grout",
            actions = {
                "return=skipped when economy needs granite",
                "return=skipped when economy needs water and not economy needs grout",
                "return=skipped when economy needs coal and not economy needs grout",
                "consume=coal:2 granite:3 water:3",
                "sleep=duration:10s",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:40s",
                "playsound=sound/barbarians/mortar priority:60%",
                "sleep=duration:3s",
                "produce=grout:3"
            }
        },
        burning_bricks = {
            -- TRANSLATORS: Completed/Skipped/Did not start burning bricks because ...
            descname = _"burning bricks",
            actions = {
                "return=skipped when economy needs granite",
                "return=skipped when economy needs coal and not economy needs brick",
                "return=skipped unless site has clay:3",
                "consume=coal:2 granite clay:3",
                "sleep=duration:10s",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:40s",
                "sleep=duration:3s",
                "produce=brick:3"
            }
        },
        burning_bricks_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs brick",
                "return=skipped when economy needs grout",
                "return=skipped when economy needs granite",
                "return=skipped when economy needs coal and not workers need experience",
                "return=skipped when economy needs water and not workers need experience",
                "sleep=duration:90s",
                "consume=coal:2 granite:2 water clay",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:20s",
                "sleep=duration:3s",
                "produce=brick",
                "sleep=duration:90s",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:20s",
                "playsound=sound/barbarians/mortar priority:60%",
                "sleep=duration:3s",
                "produce=grout"
            }
        }
    },
}

pop_textdomain()
