push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_tree_nursery_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Tree Nursery"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 54, 56 },
      },
    },
   
    size = "small",
    
    aihints = {
        space_consumer = true,
        very_weak_ai_limit = 4,
        weak_ai_limit = 8,
        normal_ai_limit = 16,
    },

    working_positions = {
        europeans_forester_advanced = 1
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
                "sleep=duration:2s",
                "call=watering_trees",
                "sleep=duration:2s",
                "callworker=check_space",
                "call=plant_trees",
                "sleep=duration:2s",
                "call=watering_trees",
                "sleep=duration:2s",
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
                "callworker=plant_rubber_tree",
                "callworker=plant_tree",
                "callworker=plant_rubber_tree",
                "callworker=plant_tree",
                "consume=water",
                "callworker=plant_rubber_tree",
                "callworker=plant_tree",
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
        },
    },
}

pop_textdomain()
