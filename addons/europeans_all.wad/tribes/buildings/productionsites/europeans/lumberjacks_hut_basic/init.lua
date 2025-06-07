push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/barbarians/lumberjacks_hut/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_lumberjacks_house_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Lumberjack’s Hut"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 43, 45 },
      },
      unoccupied = {
         hotspot = { 43, 45 },
      },
    },
    spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 42, 44 }
      },
    },
    
    size = "small",
    enhancement = {
        name = "europeans_lumberjacks_house_level_1",
        enhancement_cost = {
            ironwood = 1,
            rope = 1
        },
        enhancement_return_on_dismantle = {
            ironwood = 1
        }
    },
    buildcost = {
        granite = 2,
        log = 2
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 1
    },

    aihints = {
        basic_amount = 2,
        very_weak_ai_limit = 4,
        weak_ai_limit = 8,
        normal_ai_limit = 16,
    },

    working_positions = {
        barbarians_lumberjack = 1
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
            descname = pgettext("europeans_building", "planting trees"),
            actions = {
                -- time of worker: 24.2-63.8 sec, min+max average 44 sec
                -- min. time total: 24.2 + 20 = 44.2 sec
                -- max. time total: 63.8 + 20 = 83.8 sec
                -- avg. time total: 44 + 20 = 64 sec
                "return=skipped when economy needs liana and not economy needs log",
                "return=skipped unless economy needs log or workers need experience",
                "callworker=harvest",
                "sleep=duration:20s"
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
