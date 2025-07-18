push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/atlanteans/foresters_house/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_foresters_house_level_2",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Foresters Hut Level 2"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 39, 47 },
        }
    },
    
    size = "small",
    enhancement = {
        name = "europeans_foresters_house_level_3",
        enhancement_cost = {
            brick = 1,
            grout = 1,
            marble = 1
        },
        enhancement_return_on_dismantle = {
            brick = 1,
            marble = 1
        }
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
                "sleep=duration:8s"
            }
        }
    },
}

pop_textdomain()
