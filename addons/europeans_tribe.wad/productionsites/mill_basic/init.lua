push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_mill_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Mill"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    size = "medium",
    
    enhancement = {
        name = "europeans_mill_normal",
        enhancement_cost = {
            blackwood = 2,
            cloth = 2,
            spidercloth = 2
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
        unoccupied = {
            basename = "unoccupied",
            hotspot = { 52, 64 },
        }
    },
    spritesheets = {
        idle = {
            basename = "idle",
            frames = 20,
            columns = 4,
            rows = 5,
            hotspot = { 50, 65 }
        },
        build = {
            basename = "build",
            frames = 4,
            columns = 2,
            rows = 2,
            hotspot = { 50, 61 }
        },
        working = {
            basename = "working",
            frames = 20,
            columns = 4,
            rows = 5,
            hotspot = { 53, 65 }
        }
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
        basic_amount = 1,
        prohibited_till = 1800,
        forced_after = 2700
    },

    working_positions = {
        europeans_miller_basic = 1
    },

    inputs = {
        { name = "rye", amount = 4 },
        { name = "wheat", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_mixed_flour",
                "call=produce_mixed_flour_idle",
                "return=skipped"
            }
        },
        produce_mixed_flour = {
            -- TRANSLATORS: Completed/Skipped/Did not start grinding rye and wheat because ...
            descname = _"grinding rye and wheat",
            actions = {
                "return=skipped unless economy needs flour or workers need experience",
                "sleep=duration:10s",
                "consume=wheat:2 rye:2",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:60s",
                "produce=flour:3"
            }
        },
        produce_mixed_flour_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs flour",
                "sleep=duration:90s",
                "consume=wheat rye",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:60s",
                "produce=flour"
            }
        }
    },
}

pop_textdomain()
