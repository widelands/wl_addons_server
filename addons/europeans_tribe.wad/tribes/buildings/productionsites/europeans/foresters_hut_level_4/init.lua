push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/frisians/foresters_house/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_foresters_house_level_4",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Foresters Hut Level 4"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
        idle = {
            hotspot = {40, 73},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        }
    },
    animations = {
        unoccupied = {
            hotspot = {40, 56}
        }
    },
   
    size = "small",
    
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
