push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_tree_nursery_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Tree Nursery"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 39, 47 },
      }
    },
    
    size = "small",
    enhancement = {
        name = "europeans_tree_nursery_advanced",
        enhancement_cost = {
            planks = 1,
            brick = 1,
            marble = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1,
            granite = 1,
            marble = 1
        },
    },

    aihints = {},

    working_positions = {
        europeans_forester_normal = 1
    },

    inputs = {
        { name = "water", amount = 6 },
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
                "sleep=duration:5s",
                "call=watering_trees",
                "sleep=duration:5s",
                "callworker=check_trees",
                "call=harvesting_rubber",
                "return=skipped"
            }
        },
        plant_trees = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting trees because ...
            descname = pgettext("europeans_building", "planting trees"),
            actions = {
                "return=skipped unless site has water:2",
                "consume=water",
                "callworker=plant_tree",
                "callworker=plant_rubber_tree",
                "consume=water",
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
        },
        harvesting_rubber = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting rubber because ...
            descname = pgettext("europeans_building", "harvesting rubber"),
            actions = {
                "callworker=harvest_rubber",
                "produce=rubber"
            }
        },
    },
}

pop_textdomain()
