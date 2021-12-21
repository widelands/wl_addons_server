push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_lumberjacks_house_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Lumberjacks House"),
    icon = dirname .. "menu.png",
    size = "small",
    
    enhancement = {
        name = "europeans_lumberjacks_house_advanced",
        enhancement_cost = {
            planks = 1,
            brick = 1,
            grout = 1,
            marble_column = 1
        },
        enhancement_return_on_dismantle = {
            granite = 1,
            marble = 1
        },
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 37, 44 },
        },
    },

    aihints = {},

    working_positions = {
        europeans_lumberjack_normal = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start felling trees because ...
            descname = _"felling trees",
            actions = {
                "callworker=harvest",
                "sleep=duration:10s",
                "produce=log"
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Trees",
        heading = _"Out of Trees",
        message = pgettext("europeans_building", "The woodcutter working at this woodcutter’s house can’t find any trees in his work area.  You should consider enhancing it to increase its working area or building a forester’s house."),
        productivity_threshold = 60
    },
}

pop_textdomain()
