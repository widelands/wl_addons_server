push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/amazons/woodcutters_hut/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_lumberjacks_house_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Lumberjack’s Hut Level 1"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        idle = { hotspot = {41, 46}},
        unoccupied = { hotspot = {39, 46}}
    },
    
    size = "small",
    enhancement = {
        name = "europeans_lumberjacks_house_level_2",
        enhancement_cost = {
            granite = 1,
            planks = 1,
        },
        enhancement_return_on_dismantle = {
            granite = 1
        }
    },

    aihints = {
        very_weak_ai_limit = 4,
        weak_ai_limit = 8
    },

    working_positions = {
        europeans_lumberjack_basic = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=felling_trees",
                "return=skipped"
            }
        },
        felling_trees = {
            -- TRANSLATORS: Completed/Skipped/Did not start felling trees because ...
            descname = pgettext("europeans_building", "felling trees"),
            actions = {
                "return=skipped when economy needs balsa and not economy needs log",
                "return=skipped when economy needs ironwood and not economy needs log",
                "return=skipped when economy needs liana and not economy needs log",
                "return=skipped when economy needs rubber and not economy needs log",
                "return=skipped unless economy needs log or workers need experience",
                "callworker=harvest_tree",
                "sleep=duration:10s"
            }
        }
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
