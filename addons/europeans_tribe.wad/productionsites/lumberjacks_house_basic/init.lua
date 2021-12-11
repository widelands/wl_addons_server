push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_lumberjacks_house_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Lumberjack’s Hut"),
    icon = dirname .. "menu.png",
    size = "small",
    
    enhancement = {
        name = "europeans_lumberjacks_house_normal",
        enhancement_cost = {
            blackwood = 1,
            cloth = 1
        },
        enhancement_return_on_dismantle = {
        },
    },

    buildcost = {
        log = 2,
        reed = 2,
        granite = 2
    },
    return_on_dismantle = {
        log = 1,
        granite = 1
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 43, 45 },
        },
        build = {
            pictures = path.list_files(dirname .. "build_??.png"),
            hotspot = { 43, 45 },
        },
        unoccupied = {
            pictures = path.list_files(dirname .. "unoccupied_??.png"),
            hotspot = { 43, 45 },
        },
    },

    aihints = {
        basic_amount = 2,
        forced_after = 900
    },

    working_positions = {
        europeans_lumberjack_basic = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start felling trees because ...
            descname = _"felling trees",
            actions = {
                "callworker=harvest",
                "sleep=duration:20s",
                "produce=log"
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Trees",
        heading = _"Out of Trees",
        message = pgettext("europeans_building", "The lumberjack working at this lumberjack’s hut can’t find any trees in his work area. You should consider enhancing it to increase its working area or building a ranger’s hut."),
        productivity_threshold = 60
    },
}

pop_textdomain()
