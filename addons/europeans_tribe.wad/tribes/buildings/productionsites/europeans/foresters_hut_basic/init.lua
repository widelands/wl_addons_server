push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/barbarians/rangers_hut/"

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
        prohibited_till = 1800,
        very_weak_ai_limit = 4,
        weak_ai_limit = 8
    },

    working_positions = {
        europeans_forester = 1
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
                "callworker=plant_tree",
                "sleep=duration:11s500ms"
            }
        }
    },
}

pop_textdomain()
