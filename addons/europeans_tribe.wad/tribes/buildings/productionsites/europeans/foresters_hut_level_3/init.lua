push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/empire/foresters_house/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_foresters_house_level_3",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Foresters Hut Level 3"),
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
    enhancement = {
        name = "europeans_foresters_house_level_4",
        enhancement_cost = {
            brick = 1,
            grout = 1,
            reed = 1
        },
        enhancement_return_on_dismantle = {
            brick = 1
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
                "sleep=duration:7s"
            }
        }
    },
}

pop_textdomain()
