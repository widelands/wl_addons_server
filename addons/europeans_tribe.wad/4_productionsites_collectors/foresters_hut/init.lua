push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/barbarians/rangers_hut/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_foresters_hut",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Foresters Hut"),
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
        name = "europeans_terraformers_house",
        enhancement_cost = {
            brick = 1,
            grout = 1
        },
        enhancement_return_on_dismantle = {
            granite = 1
        },
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
        basic_amount = 2,
        very_weak_ai_limit = 4,
        weak_ai_limit = 8,
        normal_ai_limit = 16,
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
                "callworker=check_space",
                "call=plant_trees",
                "sleep=duration:5s",
                "callworker=check_space",
                "call=plant_trees",
                "return=skipped"
            }
        },
        plant_trees = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting trees because ...
            descname = pgettext("europeans_building", "planting trees"),
            actions = {
                "return=skipped unless site has water:2",
                "consume=water",
                "callworker=plant_balsa_tree",
                "callworker=plant_ironwood_tree",
                "callworker=plant_rubber_tree",
                "callworker=plant_tree",
                "consume=water",
                "callworker=plant_balsa_tree",
                "callworker=plant_ironwood_tree",
                "callworker=plant_rubber_tree",
                "callworker=plant_tree"
            }
        }
    },
}

pop_textdomain()
