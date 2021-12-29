push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_well_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Well"),
    icon = dirname .. "menu.png",
    size = "small",
    
    enhancement = {
        name = "europeans_well_level_1",
        enhancement_cost = {
            log = 1,
            reed = 1,
            granite = 1
        },
        enhancement_return_on_dismantle = {
            granite = 1
        },
    },

    buildcost = {
        log = 2,
        reed = 2,
        granite = 2,
        buckets = 1
    },
    return_on_dismantle = {
        log = 1,
        granite = 1
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 19, 33 },
        },
        build = {
            pictures = path.list_files(dirname .. "build_??.png"),
            hotspot = { 19, 33 },
        },
        working = {
            pictures = path.list_files(dirname .. "working_??.png"),
            hotspot = { 19, 33 },
        },
    },

    aihints = {
        basic_amount = 5,
        forced_after = 900
    },

    working_positions = {
        europeans_carrier = 1
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
                "return=skipped unless economy needs water or workers need experience",
                "sleep=duration:5s",
                "animate=working duration:15s",
                "mine=resource_water radius:2 yield:50% when_empty:50%",
                "produce=water:2"
            }
        },
        mining_water_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs water",
                "sleep=duration:60s",
                "animate=working duration:20s",
                "mine=resource_water radius:2 yield:50% when_empty:50%",
                "produce=water"
            }
        }
    },

    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Water",
        heading = _"Out of Water",
        message = pgettext("europeans_building", "The carrier working at this well can’t find any water in his well."),
        productivity_threshold = 55
    },
}

pop_textdomain()
