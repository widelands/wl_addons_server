push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/frisians/woodcutters_house/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_lumberjacks_house_level_4",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Lumberjack’s House Level 4"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = {40, 52}
        }
    },
    spritesheets = {
        idle = {
            hotspot = {40, 69},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        }
    },
    
    size = "small",

    aihints = {
        very_weak_ai_limit = 4,
        weak_ai_limit = 8,
        normal_ai_limit = 16,
    },

    working_positions = {
        frisians_woodcutter = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=felling_trees",
                "call=felling_trees_idle",
                "return=skipped"
            }
        },
        felling_trees = {
            -- TRANSLATORS: Completed/Skipped/Did not start felling trees because ...
            descname = pgettext("europeans_building", "felling trees"),
            actions = {
                -- time of worker: 29.2-68.8 sec, min+max average 49 sec
                -- min. time total: 29.2 + 20 = 49.2 sec
                -- max. time total: 68.8 + 20 = 88.8 sec
                -- avg. time total: 49 + 20 = 69 sec
                "return=skipped unless economy needs log or workers need experience",
                "callworker=harvest",
                "sleep=duration:20s"
            }
        },
        felling_trees_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start felling trees because ...
            descname = pgettext("europeans_building", "felling trees"),
            actions = {
                -- time of worker: 29.2-68.8 sec, min+max average 49 sec
                -- min. time total: 29.2 + 120 = 149.2 sec
                -- max. time total: 68.8 + 120 = 188.8 sec
                -- avg. time total: 49 + 120 = 169 sec
                "return=skipped when economy needs log",
                "callworker=harvest_tree",
                "sleep=duration:120s"
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
