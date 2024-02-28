push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_foresters_house_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Forester’s House"),
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
    
    aihints = {},

    working_positions = {
        europeans_forester_advanced = 1
    },

    inputs = {
        { name = "water", amount = 10 },
    },
    
    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "callworker=check_space",
                "call=pausing_production_for_inputs",
                "call=plant_trees",
                "sleep=duration:10s",
                "callworker=check_land",
                "call=planting_land",
                "return=skipped"
            }
        },
        pausing_production_for_inputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for waiting for inputs"),
            actions = {
                "return=skipped when site has water:8",
                "sleep=duration:4m",
            }
        },
        plant_trees = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting trees because ...
            descname = pgettext("europeans_building", "planting trees"),
            actions = {
                "return=skipped when economy needs water and not economy needs log",
                "return=skipped unless site has water:4",
                "consume=water",
                "callworker=plant_rubber_tree",
                "consume=water",
                "callworker=plant_tree",
                "consume=water",
                "callworker=plant_rubber_tree",
                "consume=water",
                "callworker=plant_tree"
            }
        },
        planting_land = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting trees on terraformed land because ...
            descname = pgettext("europeans_building", "planting trees on terraformed land"),
            actions = {
                "return=skipped when economy needs water",
                "return=skipped unless site has water:2",
                "consume=water:2",
                "callworker=plant_terraformed_land",
            }
        },
    },
}

pop_textdomain()
