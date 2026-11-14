push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/amazons/jungle_preservers_hut/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_foresters_house_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Foresters Hut Level 1"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
        idle = {
            hotspot = {50, 46},
            fps = 4,
            frames = 4,
            columns = 2,
            rows = 2
        }
    },
    animations = {
        unoccupied = {
            hotspot = {39, 46}
        }
    },
   
    size = "small",
    enhancement = {
        name = "europeans_foresters_house_level_2",
        enhancement_cost = {
            planks = 1,
            granite = 1
        },
        enhancement_return_on_dismantle = {
            granite = 1
        }
    },
    
    aihints = {
        space_consumer = true,
        prohibited_till = 5400,
        very_weak_ai_limit = 4,
        weak_ai_limit = 8,
        normal_ai_limit = 16,
    },

    working_positions = {
        amazons_jungle_preserver = 1
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
                -- time of worker: 11.2-36.4 sec, mean 24.088 sec
                -- min. time total: 11.2 + 10 = 21.2 sec
                -- max. time total: 36.4 + 10 = 46.4 sec
                -- mean time total: 24.088 + 10 = 34.088 sec
                "callworker=plant",
                "sleep=duration:10s"
            }
        }
    },
}

pop_textdomain()
