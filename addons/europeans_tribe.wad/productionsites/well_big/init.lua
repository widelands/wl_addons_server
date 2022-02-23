push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_well_big",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Big Well"),
    icon = dirname .. "menu.png",
    size = "big",
    
    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 64, 106 }
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 64, 106 }
        },
    },
    
    buildcost = {
        log = 4,
        reed = 4,
        blackwood = 2,
        cloth = 2,
        planks = 2,
        brick = 2,
        grout = 2
    },
    return_on_dismantle = {
        log = 2,
        blackwood = 2,
        planks = 2,
        granite = 2
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 4,
        prohibited_till = 900,
        forced_after = 1200
    },
    
    working_positions = {
        europeans_carrier = 3
    },
    
    inputs = {
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=mining_water",
                "call=mining_water_idle",
                "return=skipped"
            }
        },
        mining_water = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining water because ...
            descname = _"mining water",
            actions = {
                "return=skipped unless economy needs water",
                "sleep=duration:5s",
                "animate=working duration:10s",
                "mine=resource_water radius:16 yield:100% when_empty:99%",
                "produce=water:8"
            }
        },
        mining_water_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs water",
                "sleep=duration:60s",
                "animate=working duration:10s",
                "mine=resource_water radius:16 yield:100% when_empty:99%",
                "produce=water:2"
            }
        },
        dummy_program = {
            -- TRANSLATORS: Completed/Skipped/Did not start dummy program because ...
            descname = pgettext("europeans_building", "dummy program"),
            actions = {
                "sleep=duration:10s",
                "animate=working duration:10s",
                "produce=quartz"
            }
        },
    },
    
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Water",
        heading = _"Out of Water",
        message = pgettext("europeans_building", "The carrier working at this well can’t find any water in his well."),
        productivity_threshold = 1
    }
}

pop_textdomain()
