push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/empire/foresters_house/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_terraformers_house",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Terraformer’s House"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 54, 56 },
      },
      working = {
         basename = "idle",
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 54, 56 },
      },
    },
    
    size = "small",

    aihints = {
        needs_water = true,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        europeans_terraformer = 1
    },

    inputs = {
        { name = "water", amount = 12 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "callworker=check_space",
                "call=plant_trees",
                "sleep=duration:5s",
                "call=watering_trees",
                "sleep=duration:5s",
                "callworker=check_space",
                "call=plant_trees",
                "sleep=duration:5s",
                "call=watering_trees",
                "sleep=duration:10s",
                "callworker=check_space",
                "call=plant_trees",
                "sleep=duration:5s",
                "call=watering_trees",
                "sleep=duration:5s",
                "callworker=check_space",
                "call=plant_trees",
                "sleep=duration:5s",
                "call=watering_trees",
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
        },
        watering_trees = {
            -- TRANSLATORS: Completed/Skipped/Did not start watering because ...
            descname = pgettext("europeans_building", "watering trees"),
            actions = {
                "sleep=duration:2s",
                "callworker=check_growable_trees",
                "return=skipped unless site has water:2",
                "consume=water",
                "callworker=watering",
                "consume=water",
                "callworker=watering"
            }
        }
    },
}

pop_textdomain()
