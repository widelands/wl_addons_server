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
        { name = "water", amount = 6 },
    },
    
    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=plant_trees",
                "call=plant_trees_idle",
                "callworker=check_terraform_land",
                "call=terraforming_land",
                "callworker=check_terraform_pond",
                "call=terraforming_pond",
                "return=skipped"
            }
        },
        plant_trees = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting trees because ...
            descname = pgettext("europeans_building", "planting trees"),
            actions = {
                "return=skipped when economy needs water and not economy needs log",
                "return=skipped unless site has water:2",
                "consume=water",
                "callworker=plant",
                "consume=water",
                "callworker=plant"
            }
        },
        terraforming_pond = {
            -- TRANSLATORS: Completed/Skipped/Did not start terraforming pond because ...
            descname = pgettext("europeans_building", "terraforming pond"),
            actions = {
                "callworker=terraform_pond"
            }
        },
        terraforming_land = {
            -- TRANSLATORS: Completed/Skipped/Did not start terraforming land because ...
            descname = pgettext("europeans_building", "terraforming land"),
            actions = {
                "return=skipped when economy needs water and not economy needs log",
                "return=skipped unless site has water:2",
                "consume=water:2",
                "callworker=terraform_land",
            }
        },
        plant_trees_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs log",
                "return=skipped when economy needs water",
                "consume=water",
                "callworker=plant",
                "sleep=duration:40s"
            }
        },
    },
}

pop_textdomain()
