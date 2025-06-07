push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/barbarians/rangers_hut/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_foresters_house_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Foresters Hut"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
      unoccupied = {
         hotspot = { 45, 49 },
      },
    },
    spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 45, 49 }
      },
      idle = {
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 45, 49 }
      },
      working = {
         basename = "idle",
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 45, 49 }
      },
    },
   
    size = "small",
    enhancement = {
        name = "europeans_foresters_house_level_1",
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
        space_consumer = true,
        prohibited_till = 5400,
        very_weak_ai_limit = 4,
        weak_ai_limit = 8,
        normal_ai_limit = 16,
    },

    working_positions = {
        barbarians_ranger = 1
    },

    inputs = {
        { name = "water", amount = 8 },
    },
    
    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "consume=water",
                "call=plant_trees",
                "return=skipped"
            }
        },
        plant_trees = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting trees because ...
            descname = pgettext("europeans_building", "planting trees"),
            actions = {
                -- time of worker: 16.7-38.3 sec, mean 27.284 sec
                -- min. time total: 16.7 + 11.5 = 28.2 sec
                -- max. time total: 38.3 + 11.5 = 49.8 sec
                -- mean time total: 27.284 + 11.5 = 38.784 sec
                "callworker=plant",
                "sleep=duration:11s500ms"
            }
        }
    },
}

pop_textdomain()
