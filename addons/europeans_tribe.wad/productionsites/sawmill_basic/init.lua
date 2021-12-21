push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_sawmill_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Sawmill"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    size = "medium",

    enhancement = {
        name = "europeans_sawmill_normal",
        enhancement_cost = {
            blackwood = 2,
            cloth = 2,
            spidercloth = 2
        },
        enhancement_return_on_dismantle = {
            blackwood = 2
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
        supports_seafaring = true,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 4,
        basic_amount = 1,
        prohibited_till = 600,
        forced_after = 1800
    },

    working_positions = {
        europeans_carpenter_basic = 1
    },

    inputs = {
        { name = "log", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=hardening_wood",
                "call=saw_log",
                "call=hardening_wood_idle",
                "return=skipped"
            }
        },
        saw_log = {
            -- TRANSLATORS: Completed/Skipped/Did not start sawing logs because ...
            descname = _"sawing logs",
            actions = {
                "return=skipped when economy needs log and not economy needs planks",
                "consume=log:4",
                "sleep=duration:10s",
                "playsound=sound/atlanteans/saw/benchsaw priority:50% allow_multiple",
                "animate=working duration:30s",
                "produce=planks:3"
            }
        },
        hardening_wood = {
            -- TRANSLATORS: Completed/Skipped/Did not start hardening wood because ...
            descname = _"hardening wood",
            actions = {
                "return=skipped when economy needs log and not economy needs blackwood",
                "consume=log:4",
                "sleep=duration:10s",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:30s",
                "produce=blackwood:3"
            }
        },
        hardening_wood_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs blackwood",
                "return=skipped when economy needs planks",
                "return=skipped when economy needs log",
                "sleep=duration:90s",
                "consume=log:2",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:30s",
                "produce=blackwood"
            }
        },
    },
}

pop_textdomain()
